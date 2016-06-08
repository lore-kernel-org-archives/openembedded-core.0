Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8706FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 12:52:14 +0000 (UTC)
Received: from nbhjo (111-250-192-53.dynamic.hinet.net [111.250.192.53])
	by msfrf2627.sfr.fr (SMTP Server) with ESMTP id 78AEE1C000CD1;
	Wed,  8 Jun 2016 14:52:12 +0200 (CEST)
Received: from nbhjo (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2627.sfr.fr (SMTP Server) with ESMTPSA;
	Wed,  8 Jun 2016 14:52:10 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: "'Klauer, Daniel'" <Daniel.Klauer@gin.de>,
	openembedded-core@lists.openembedded.org
References: <6411d38c0db541d7b6acf7736b005a31@Win2012-02.gin-domain.local>,
	<025101d1c0be$e4ffbea0$aeff3be0$@neuf.fr>
	<1465381435600.39214@gin.de>
In-Reply-To: <1465381435600.39214@gin.de>
Date: Wed, 8 Jun 2016 14:52:05 +0200
Message-ID: <02b101d1c184$93336d80$b99a4880$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQL3Mhlx+JmL95ZIth/pnIBiSVr45QGECYCgAbCpF+adevh6MA==
X-sfr-mailing: LEGIT
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 12:52:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi,

Yes, that's what I'm seeing... And setting the check with (len(probs)!=0) in
case of retry makes it go away (I tested that exact same thing yesterday),
provided another small modification is added.
You also need to add another check just before raising the error, or you
would end up getting an "unknown error" raised there.
I basically replaced:
-        if (probs is not None) and (not retry):
+       if (probs is not None) and ((len(probs) != 0) or not
sysconf.has("attempt-install", soft=True)) and (not retry):

BUT reflecting on the whole scheme, I'm wondering how it will work in case
of file found conflict, since the problem package gets removed from the
list, but the list is committed again, with most packages already
installed...
I therefore wonder that there could be the same error that I got in the end,
i.e failing with package already installed - which should not fail for
attempt only.

Regarding the "empty" probs list issue when in attempted mode, do you want
to issue the patch, or do you prefer I do it?

Herve

-----Original Message-----
From: Klauer, Daniel [mailto:Daniel.Klauer@gin.de] 
Sent: mercredi 8 juin 2016 12:24
To: Herve Jourdain <herve.jourdain@neuf.fr>;
openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] smartpm: Don't ignore error if RPM
transaction fails without problems

Hello,

I don't know the details of the attempt-install feature, but it looks like
my patch did change the retry behaviour, due to this change in
smart/backends/rpm/pm.py (in smart-attempt.patch):
-            if probs and sysconf.has("attempt-install", soft=True):
+            if (probs is not None) and sysconf.has("attempt-install",
soft=True):

Unlike before, this if block now sets retry = 1 if len(probs) == 0. It looks
to me like the attempt-install feature only wants to retry in case it found
file conflicts, and there aren't any other problems - but unfortunately
retry is only set back to 0 if it finds something other than file conflicts,
the case of len(probs) == 0 is not handled inside the if block.

Is this the problem you're seeing? I think it could be fixed by reverting
that one change, maybe like this:
-            if (probs is not None) and sysconf.has("attempt-install",
soft=True):
+            # If there are file conflicts, remove conflicting packages from
transaction and retry,
+            # unless there are other problems too.
+            if (probs is not None) and (len(probs) != 0) and
sysconf.has("attempt-install", soft=True):

Daniel

________________________________________
From: Herve Jourdain <herve.jourdain@neuf.fr>
Sent: Tuesday, June 7, 2016 15:17
To: Klauer, Daniel; openembedded-core@lists.openembedded.org
Subject: RE: [OE-core] [PATCH] smartpm: Don't ignore error if RPM
transaction fails without problems

Hi Daniel,

I've just met a problem linked to that patch...
Indeed, it appears that your modifications make the original patch work as
intended: check if there are problems like RPMPROB_NEW_FILE_CONFLICT or
RPMPROB_FILE_CONFLICT, then remove the packages from the list of packages to
apply (because it's attempt-install), then try the same transaction again...

The problem is: if not all the packages have problems, then the packages
that didn't have problems installing in the first place will now get an
error: "package already installed"!!!
And since it's not one of the problems that are handled in pm.py, it will
just fail...

What do you think would be the best way to solve this: add a check for all
the codes linked to package already installed in the "attempt-only" check in
pm.py?
Or try to cancel the whole previous transaction - and then keep on
committing the new one?

I can generate a new patch if you want, after your guidance, or let you fix
it, like you prefer.
I do have an environment where I can reproduce this problem easily enough.

Herve

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
Klauer, Daniel
Sent: mardi 17 mai 2016 14:58
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] smartpm: Don't ignore error if RPM transaction
fails without problems

SmartPM could misinterpret RPM transaction error as success, if ts.run()
(RPM Python API) returns an empty problems list.

This could happen for example if the RPM database is partially corrupted
such that the transaction does not have any problems like conflicts or
missing dependencies, but still can't be committed.

The added patch fixes the problem in the upstream sources; one of the
existing patches has to be adjusted to still apply.

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 .../python/python-smartpm/smart-attempt.patch      |  6 +--
 .../smart-rpm-transaction-failure-check.patch      | 57
++++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +
 3 files changed, 61 insertions(+), 3 deletions(-)  create mode 100644
meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-failure-ch
eck.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
index ec98e03..5aedc88 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
@@ -36,7 +36,7 @@ index 9bbd952..ba6405a 100644
          finally:
              del getTS.ts
              cb.grabOutput(False)
-+            if probs and sysconf.has("attempt-install", soft=True):
++            if (probs is not None) and sysconf.has("attempt-install",
soft=True):
 +                def remove_conflict(pkgNEVR):
 +                    for key in changeset.keys():
 +                        if pkgNEVR == str(key):
@@ -67,8 +67,8 @@ index 9bbd952..ba6405a 100644
 +                        retry = 0
 +
              prog.setDone()
--            if probs:
-+            if probs and (not retry):
+-            if probs is not None:
++            if (probs is not None) and (not retry):
                  raise Error, "\n".join([x[0] for x in probs])
              prog.stop()
 +            if retry and len(changeset):
diff --git
a/meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-failure-
check.patch
b/meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-failure-
check.patch
new file mode 100644
index 0000000..a740ddd
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-
+++ failure-check.patch
@@ -0,0 +1,57 @@
+From 0c55d7e18f40465e95e8e4bf22af01f5d4477d3c Mon Sep 17 00:00:00 2001
+From: Daniel Klauer <daniel.klauer@gin.de>
+Date: Wed, 11 May 2016 17:22:49 +0200
+Subject: [PATCH] rpm: Don't ignore transaction error with empty 
+problems list
+
+SmartPM could misinterpret RPM transaction error as success, if
+ts.run() (RPM Python API) returns an empty problems list, because of 
+incorrect check for None which treated empty list to be the same as 
+None when it has different meaning.
+
+ts.run() returns:
+* None in case of success
+* problems list in case of error, may be empty (look at rpmts_Run() in 
+rpm-5.4.14/python/rpmts-py.c [1])
+
+"if mylist" is not good enough to check for error here, because it will 
+treat an empty list as "false" because its len() == 0 [2].
+
+ts.check() seems to be different (it's ok for it to return an empty 
+list), but for consistency it should be made clear that it can return 
+either None, an empty list or a non-empty list.
+
+[1] http://rpm5.org/cvs/fileview?f=rpm/python/rpmts-py.c&v=1.111.2.3
+[2] https://docs.python.org/2/library/stdtypes.html#truth-value-testing
+
+Upstream-Status: Pending
+
+Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
+---
+ smart/backends/rpm/pm.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py index
+9bbd952..635f726 100644
+--- a/smart/backends/rpm/pm.py
++++ b/smart/backends/rpm/pm.py
+@@ -208,7 +208,7 @@ class RPMPackageManager(PackageManager):
+         force = sysconf.get("rpm-force", False)
+         if not force:
+             probs = ts.check()
+-            if probs:
++            if (probs is not None) and (len(probs) != 0):
+                 problines = []
+                 for prob in probs:
+                     name1 = "%s-%s-%s" % prob[0] @@ -247,7 +247,7 @@ 
+class RPMPackageManager(PackageManager):
+             del getTS.ts
+             cb.grabOutput(False)
+             prog.setDone()
+-            if probs:
++            if probs is not None:
+                 raise Error, "\n".join([x[0] for x in probs])
+             prog.stop()
+
+--
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb
b/meta/recipes-devtools/python/python-smartpm_git.bb
index d9a908d..0d7f88c 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "\
           file://smart-recommends.patch \
           file://smart-improve-error-reporting.patch \
           file://smart-channelsdir.patch \
+          file://smart-rpm-transaction-failure-check.patch \
           file://smart-attempt.patch \
           file://smart-attempt-fix.patch \
           file://smart-add-for-rpm-ignoresize-check.patch \
--
1.9.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core




=



Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B28FE6E38C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2014 23:25:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s19NPPJF014466; Sun, 9 Feb 2014 23:25:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YBS3C4zLr84F; Sun,  9 Feb 2014 23:25:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s19NPHox014462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 9 Feb 2014 23:25:19 GMT
Message-ID: <1391988311.7120.2.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Laurentiu Palcu
	<laurentiu.palcu@intel.com>
Date: Sun, 09 Feb 2014 23:25:11 +0000
In-Reply-To: <1391693941-25938-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1391693941-25938-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-smartpm: really ignore conflicts during install with --attempt
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
X-List-Received-Date: Sun, 09 Feb 2014 23:25:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-02-06 at 13:39 +0000, Paul Eggleton wrote:
> The original patch added in OE-Core commit
> bdf07b1698d228dc7ff555199a269b1ff8ceca19 was supposed to ignore
> conflicts, but it was unable to do so because it wasn't raising errors
> in the right place. When the --attempt option is used (as is done in
> complementary package installation for RPM), raise errors immediately
> on conflicts, catch errors at the right point so that requested packages
> and their dependencies can be ignored, and print appropriate warnings
> when doing so.
> 
> Fixes [YOCTO #5313].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../python/python-smartpm/smart-attempt.patch      | 134 +++++++++++++++++++--
>  1 file changed, 121 insertions(+), 13 deletions(-)

Could you take a look at:

http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/22

please?

I've not 100% confirmed it was this change, it could be something else
(e.g. Laurentiu's rootfs changes) but something in master-next broke
multilib :/

Cheers,

Richard


> diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> index 0d603d3..1136182 100644
> --- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> +++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> @@ -1,18 +1,27 @@
> -Add a mechanism to attempt the install operation, w/o failing.
> +From 7ee23804a06f81476cc2b31a6db11b52d7af764e Mon Sep 17 00:00:00 2001
> +From: Mark Hatle <mark.hatle@windriver.com>
> +Date: Mon, 20 Jan 2014 14:30:52 +0000
> +Subject: [PATCH] Add mechanism to attempt install without failing
>  
> -For complementary and 'attemptonly' packages, we need a way to instruct smart to
> -try to install, but ignore any failures.
> +In OpenEmbedded, for complementary and 'attemptonly' package processing,
> +we need a way to instruct smart to try to install, but ignore any
> +failures (usually conflicts).
>  
>  This option only works for the install operation.
>  
>  Upstream-Status: Pending
>  
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +---
> + smart/commands/install.py |  5 ++++
> + smart/transaction.py      | 65 +++++++++++++++++++++++++++++++++++------------
> + 2 files changed, 54 insertions(+), 16 deletions(-)
>  
> -Index: smart-1.4.1/smart/commands/install.py
> -===================================================================
> ---- smart-1.4.1.orig/smart/commands/install.py
> -+++ smart-1.4.1/smart/commands/install.py
> +diff --git a/smart/commands/install.py b/smart/commands/install.py
> +index 590222c..6ef9682 100644
> +--- a/smart/commands/install.py
> ++++ b/smart/commands/install.py
>  @@ -50,6 +50,8 @@ def option_parser():
>       parser = OptionParser(usage=USAGE,
>                             description=DESCRIPTION,
> @@ -32,11 +41,106 @@ Index: smart-1.4.1/smart/commands/install.py
>       if opts.explain:
>           sysconf.set("explain-changesets", True, soft=True)
>   
> -Index: smart-1.4.1/smart/transaction.py
> -===================================================================
> ---- smart-1.4.1.orig/smart/transaction.py
> -+++ smart-1.4.1/smart/transaction.py
> -@@ -1216,9 +1216,17 @@ class Transaction(object):
> +diff --git a/smart/transaction.py b/smart/transaction.py
> +index 5730a42..e3e61c6 100644
> +--- a/smart/transaction.py
> ++++ b/smart/transaction.py
> +@@ -555,6 +555,8 @@ class Transaction(object):
> +         changeset.set(pkg, INSTALL)
> +         isinst = changeset.installed
> + 
> ++        attempt = sysconf.has("attempt-install", soft=True)
> ++
> +         # Remove packages conflicted by this one.
> +         for cnf in pkg.conflicts:
> +             for prv in cnf.providedby:
> +@@ -564,11 +566,16 @@ class Transaction(object):
> +                     if not isinst(prvpkg):
> +                         locked[prvpkg] = (LOCKED_CONFLICT_BY, pkg)
> +                         continue
> +-                    if prvpkg in locked:
> +-                        raise Failed, _("Can't install %s: conflicted package "
> +-                                        "%s is locked") % (pkg, prvpkg)
> +-                    self._remove(prvpkg, changeset, locked, pending, depth)
> +-                    pending.append((PENDING_UPDOWN, prvpkg))
> ++                    if attempt:
> ++                        del changeset[pkg]
> ++                        raise Failed, _("Can't install %s: it conflicts with package "
> ++                                        "%s") % (pkg, prvpkg)
> ++                    else:
> ++                        if prvpkg in locked:
> ++                            raise Failed, _("Can't install %s: conflicted package "
> ++                                            "%s is locked") % (pkg, prvpkg)
> ++                        self._remove(prvpkg, changeset, locked, pending, depth)
> ++                        pending.append((PENDING_UPDOWN, prvpkg))
> + 
> +         # Remove packages conflicting with this one.
> +         for prv in pkg.provides:
> +@@ -579,12 +586,18 @@ class Transaction(object):
> +                     if not isinst(cnfpkg):
> +                         locked[cnfpkg] = (LOCKED_CONFLICT, pkg)
> +                         continue
> +-                    if cnfpkg in locked:
> ++                    if attempt:
> ++                        del changeset[pkg]
> +                         raise Failed, _("Can't install %s: it's conflicted by "
> +-                                        "the locked package %s") \
> +-                                      % (pkg, cnfpkg)
> +-                    self._remove(cnfpkg, changeset, locked, pending, depth)
> +-                    pending.append((PENDING_UPDOWN, cnfpkg))
> ++                                        "the package %s") \
> ++                                    % (pkg, cnfpkg)
> ++                    else:
> ++                        if cnfpkg in locked:
> ++                            raise Failed, _("Can't install %s: it's conflicted by "
> ++                                            "the locked package %s") \
> ++                                        % (pkg, cnfpkg)
> ++                        self._remove(cnfpkg, changeset, locked, pending, depth)
> ++                        pending.append((PENDING_UPDOWN, cnfpkg))
> + 
> +         # Remove packages with the same name that can't
> +         # coexist with this one.
> +@@ -594,10 +607,15 @@ class Transaction(object):
> +                 if not isinst(namepkg):
> +                     locked[namepkg] = (LOCKED_NO_COEXIST, pkg)
> +                     continue
> +-                if namepkg in locked:
> ++                if attempt:
> ++                    del changeset[pkg]
> +                     raise Failed, _("Can't install %s: it can't coexist "
> +                                     "with %s") % (pkg, namepkg)
> +-                self._remove(namepkg, changeset, locked, pending, depth)
> ++                else:
> ++                    if namepkg in locked:
> ++                        raise Failed, _("Can't install %s: it can't coexist "
> ++                                        "with %s") % (pkg, namepkg)
> ++                    self._remove(namepkg, changeset, locked, pending, depth)
> + 
> +         # Install packages required by this one.
> +         for req in pkg.requires + pkg.recommends:
> +@@ -1176,6 +1194,8 @@ class Transaction(object):
> + 
> +         self._policy.runStarting()
> + 
> ++        attempt = sysconf.has("attempt-install", soft=True)
> ++
> +         try:
> +             changeset = self._changeset.copy()
> +             isinst = changeset.installed
> +@@ -1190,7 +1210,11 @@ class Transaction(object):
> +                     locked[pkg] = (LOCKED_KEEP, None)
> +                 elif op is INSTALL:
> +                     if not isinst(pkg) and pkg in locked:
> +-                        raise Failed, _("Can't install %s: it's locked") % pkg
> ++                        if attempt:
> ++                            iface.warning(_("Can't install %s: it's locked") % pkg)
> ++                            del changeset[pkg]
> ++                        else:
> ++                            raise Failed, _("Can't install %s: it's locked") % pkg
> +                     changeset.set(pkg, INSTALL)
> +                     locked[pkg] = (LOCKED_INSTALL, None)
> +                 elif op is REMOVE:
> +@@ -1216,9 +1240,18 @@ class Transaction(object):
>                       else:
>                           op = REMOVE
>                   if op is INSTALL or op is REINSTALL:
> @@ -48,7 +152,8 @@ Index: smart-1.4.1/smart/transaction.py
>  +                        if pkg in changeset:
>  +                            changeset.setRequested(pkg, True)
>  +                    except Failed, e:
> -+                        if sysconf.has("attempt-install", soft=True):
> ++                        if attempt:
> ++                            iface.warning(_("Can't install %s: %s") % (pkg, e))
>  +                            if pkg in changeset:
>  +                                del changeset[pkg]
>  +                            continue
> @@ -57,3 +162,6 @@ Index: smart-1.4.1/smart/transaction.py
>                   elif op is REMOVE:
>                       self._remove(pkg, changeset, locked, pending)
>                   elif op is UPGRADE:
> +-- 
> +1.8.4.2
> +




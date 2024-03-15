Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E706C54ECF
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1279.1710522013451444990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RUF48bUM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C0SGgg4J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e430e9513-ed41870a-8050-4088-9819-56c5274f2a9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hzoSLCoPKiCcqxwmC/JMTMruEAfUeqYZsY1XkgxsXXA=;
	b=RUF48bUM/TxFrGVpwgMYudc1IDD4O5PSYIfXg6dMDEcQoruGq8Y64Z0OsuFrl71K
	vXNbKBW/Crj06nIOAXnei+vKgN2mE2FAUoXdYsyxwktzGvZOozGUi3ZhtC89bDaOz2S
	uJ9/OCW7uo+qLYP9dnpXhatMSn4dwgOfLmwJtJvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hzoSLCoPKiCcqxwmC/JMTMruEAfUeqYZsY1XkgxsXXA=;
	b=C0SGgg4JXoKYUjXauNO9Ll+WomZG8d65Fom6adr0RxPm3V/GQfvBghCC0GhxxYxy
	1Jh1IqKOenV0bnEpMxEHAFpTCUH6c3hUdNrb1UL/UClwjTE+9dTMRGP3qpRMWp67Xqr
	H16Teoq4jLJam276XKMdXxO+svXNqu9T4dDf/AjA=
Content-Type: multipart/mixed; boundary="===============3221831861524834847=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.15.0 FAILED
Message-ID: <0101018e430e9513-ed41870a-8050-4088-9819-56c5274f2a9e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197200

--===============3221831861524834847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.15.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.14.2-4.15.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 6a72e849228d38f541ff48f20766f835271eae27 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 10:49:35 +0000
Subject: [PATCH] shadow: upgrade 4.14.2 -> 4.15.0

---
 ...nexpected-open-failure-in-chroot-env.patch |  9 +--
 .../shadow/files/shadow-update-pam-conf.patch | 79 ++++++++++++-------
 meta/recipes-extended/shadow/shadow.inc       |  4 +-
 .../{shadow_4.14.2.bb => shadow_4.15.0.bb}    |  0
 4 files changed, 58 insertions(+), 34 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.14.2.bb => shadow_4.15.0.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 4a932d2dbb..6093e9979e 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From a773c6b240d27e23d6be41decef0edf24fcee523 Mon Sep 17 00:00:00 2001
+From 5a366db7a3f053f4e53c68d70178e51888d59e46 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 73fdb3a..d1231e9 100644
+index 01a26c9..82b2868 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -606,10 +606,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -601,10 +601,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
@@ -46,6 +46,3 @@ index 73fdb3a..d1231e9 100644
  	db->fp = NULL;
  	if (fd >= 0) {
  #ifdef WITH_TCB
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 3b61b75e5b..1b9dda587e 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,3 +1,8 @@
+From 8efaa9f22025379b41f5f9e09c3ff3358eb1e952 Mon Sep 17 00:00:00 2001
+From: Kang Kai <kai.kang@windriver.com>
+Date: Wed, 20 Jul 2011 19:18:14 +0800
+Subject: [PATCH] shadow: update pam related configure files
+
 The system-auth in the configure files is from Fedora which put all the 4 pam type rules
 in one file.
 In yocto it obey the way with Debian/Ubuntu, and the names are common-auth, common-account,
@@ -9,82 +14,102 @@ See meta/recipes-extended/pam/libpam/pam.d/common-password
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
+---
+ etc/pam.d/chage     | 2 +-
+ etc/pam.d/chgpasswd | 2 +-
+ etc/pam.d/groupadd  | 2 +-
+ etc/pam.d/groupdel  | 2 +-
+ etc/pam.d/groupmems | 2 +-
+ etc/pam.d/groupmod  | 2 +-
+ etc/pam.d/useradd   | 2 +-
+ etc/pam.d/userdel   | 2 +-
+ etc/pam.d/usermod   | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
 
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chage shadow-4.1.4.3/etc/pam.d/chage
---- shadow-4.1.4.3/etc/pam.d.orig/chage	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/chage	2011-07-20 19:03:08.964844958 +0800
+diff --git a/etc/pam.d/chage b/etc/pam.d/chage
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/chage
++++ b/etc/pam.d/chage
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chgpasswd shadow-4.1.4.3/etc/pam.d/chgpasswd
---- shadow-4.1.4.3/etc/pam.d.orig/chgpasswd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/chgpasswd	2011-07-20 19:03:26.544844958 +0800
+diff --git a/etc/pam.d/chgpasswd b/etc/pam.d/chgpasswd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/chgpasswd
++++ b/etc/pam.d/chgpasswd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupadd shadow-4.1.4.3/etc/pam.d/groupadd
---- shadow-4.1.4.3/etc/pam.d.orig/groupadd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupadd	2011-07-20 19:04:08.124844958 +0800
+diff --git a/etc/pam.d/groupadd b/etc/pam.d/groupadd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupadd
++++ b/etc/pam.d/groupadd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupdel shadow-4.1.4.3/etc/pam.d/groupdel
---- shadow-4.1.4.3/etc/pam.d.orig/groupdel	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupdel	2011-07-20 19:04:26.114844958 +0800
+diff --git a/etc/pam.d/groupdel b/etc/pam.d/groupdel
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupdel
++++ b/etc/pam.d/groupdel
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmems shadow-4.1.4.3/etc/pam.d/groupmems
---- shadow-4.1.4.3/etc/pam.d.orig/groupmems	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupmems	2011-07-20 19:04:35.074844958 +0800
+diff --git a/etc/pam.d/groupmems b/etc/pam.d/groupmems
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupmems
++++ b/etc/pam.d/groupmems
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmod shadow-4.1.4.3/etc/pam.d/groupmod
---- shadow-4.1.4.3/etc/pam.d.orig/groupmod	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupmod	2011-07-20 19:04:44.864844958 +0800
+diff --git a/etc/pam.d/groupmod b/etc/pam.d/groupmod
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupmod
++++ b/etc/pam.d/groupmod
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/useradd shadow-4.1.4.3/etc/pam.d/useradd
---- shadow-4.1.4.3/etc/pam.d.orig/useradd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/useradd	2011-07-20 19:07:26.244844958 +0800
+diff --git a/etc/pam.d/useradd b/etc/pam.d/useradd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/useradd
++++ b/etc/pam.d/useradd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/userdel shadow-4.1.4.3/etc/pam.d/userdel
---- shadow-4.1.4.3/etc/pam.d.orig/userdel	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/userdel	2011-07-20 19:07:35.734844958 +0800
+diff --git a/etc/pam.d/userdel b/etc/pam.d/userdel
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/userdel
++++ b/etc/pam.d/userdel
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/usermod shadow-4.1.4.3/etc/pam.d/usermod
---- shadow-4.1.4.3/etc/pam.d.orig/usermod	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/usermod	2011-07-20 19:07:42.024844958 +0800
+diff --git a/etc/pam.d/usermod b/etc/pam.d/usermod
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/usermod
++++ b/etc/pam.d/usermod
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 16b99a0b60..71a219b3dc 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,8 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "a305edf5d19bddbdf5e836d2d609fa8bff2d35458819de4d9f06306a1cf24342"
+SRC_URI[sha256sum] = "377fe0d7c1a0aa5e3514c08fdf5ddc70c9dcbb391678c2134445ed97326bcc26"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.14.2.bb b/meta/recipes-extended/shadow/shadow_4.15.0.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.14.2.bb
rename to meta/recipes-extended/shadow/shadow_4.15.0.bb
-- 
2.42.0


--===============3221831861524834847==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.14.2-4.15.0.patch"

RnJvbSA2YTcyZTg0OTIyOGQzOGY1NDFmZjQ4ZjIwNzY2ZjgzNTI3MWVhZTI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTA6NDk6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4xNC4yIC0+IDQuMTUuMAoKLS0tCiAuLi5uZXhwZWN0ZWQtb3Blbi1m
YWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggfCAgOSArLS0KIC4uLi9zaGFkb3cvZmlsZXMvc2hh
ZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCB8IDc5ICsrKysrKysrKysrKy0tLS0tLS0KIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyAgICAgICB8ICA0ICstCiAuLi4ve3No
YWRvd180LjE0LjIuYmIgPT4gc2hhZG93XzQuMTUuMC5iYn0gICAgfCAgMAogNCBmaWxlcyBjaGFu
Z2VkLCA1OCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc2hhZG93L3tzaGFkb3dfNC4xNC4yLmJiID0+IHNoYWRvd180LjE1LjAuYmJ9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMv
Y29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5l
eHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaAppbmRleCA0YTkzMmQyZGJi
Li42MDkzZTk5NzllIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2Zp
bGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5j
LWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhNzczYzZiMjQwZDI3ZTIzZDZiZTQxZGVjZWYwZWRmMjRmY2VlNTIzIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YTM2NmRiN2EzZjA1M2Y0ZTUzYzY4ZDcwMTc4
ZTUxODg4ZDU5ZTQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNyBKdWwgMjAxNCAxNTo1MzozNCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVy
ZS1pbi1jaHJvb3QtZW52CkBAIC0yMCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBR
aSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGliL2NvbW1vbmlvLmMgYi9saWIv
Y29tbW9uaW8uYwotaW5kZXggNzNmZGIzYS4uZDEyMzFlOSAxMDA2NDQKK2luZGV4IDAxYTI2Yzku
LjgyYjI4NjggMTAwNjQ0CiAtLS0gYS9saWIvY29tbW9uaW8uYwogKysrIGIvbGliL2NvbW1vbmlv
LmMKLUBAIC02MDYsMTAgKzYwNiwxOCBAQCBpbnQgY29tbW9uaW9fb3BlbiAoc3RydWN0IGNvbW1v
bmlvX2RiICpkYiwgaW50IG1vZGUpCitAQCAtNjAxLDEwICs2MDEsMTggQEAgaW50IGNvbW1vbmlv
X29wZW4gKHN0cnVjdCBjb21tb25pb19kYiAqZGIsIGludCBtb2RlKQogIAlkYi0+Y3Vyc29yID0g
TlVMTDsKICAJZGItPmNoYW5nZWQgPSBmYWxzZTsKICAKQEAgLTQ2LDYgKzQ2LDMgQEAgaW5kZXgg
NzNmZGIzYS4uZDEyMzFlOSAxMDA2NDQKICAJZGItPmZwID0gTlVMTDsKICAJaWYgKGZkID49IDAp
IHsKICAjaWZkZWYgV0lUSF9UQ0IKLS0tIAotMi4zMC4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29u
Zi5wYXRjaAppbmRleCAzYjYxYjc1ZTViLi4xYjlkZGE1ODdlIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBh
bS1jb25mLnBhdGNoCkBAIC0xLDMgKzEsOCBAQAorRnJvbSA4ZWZhYTlmMjIwMjUzNzliNDFmNWY5
ZTA5YzNmZjMzNThlYjFlOTUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogS2FuZyBL
YWkgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CitEYXRlOiBXZWQsIDIwIEp1bCAyMDExIDE5OjE4
OjE0ICswODAwCitTdWJqZWN0OiBbUEFUQ0hdIHNoYWRvdzogdXBkYXRlIHBhbSByZWxhdGVkIGNv
bmZpZ3VyZSBmaWxlcworCiBUaGUgc3lzdGVtLWF1dGggaW4gdGhlIGNvbmZpZ3VyZSBmaWxlcyBp
cyBmcm9tIEZlZG9yYSB3aGljaCBwdXQgYWxsIHRoZSA0IHBhbSB0eXBlIHJ1bGVzCiBpbiBvbmUg
ZmlsZS4KIEluIHlvY3RvIGl0IG9iZXkgdGhlIHdheSB3aXRoIERlYmlhbi9VYnVudHUsIGFuZCB0
aGUgbmFtZXMgYXJlIGNvbW1vbi1hdXRoLCBjb21tb24tYWNjb3VudCwKQEAgLTksODIgKzE0LDEw
MiBAQCBTZWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW0vcGFtLmQvY29tbW9uLXBh
c3N3b3JkCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNd
CiAKIFNpZ25lZC1vZmYtYnk6IEthbmcgS2FpIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgorLS0t
CisgZXRjL3BhbS5kL2NoYWdlICAgICB8IDIgKy0KKyBldGMvcGFtLmQvY2hncGFzc3dkIHwgMiAr
LQorIGV0Yy9wYW0uZC9ncm91cGFkZCAgfCAyICstCisgZXRjL3BhbS5kL2dyb3VwZGVsICB8IDIg
Ky0KKyBldGMvcGFtLmQvZ3JvdXBtZW1zIHwgMiArLQorIGV0Yy9wYW0uZC9ncm91cG1vZCAgfCAy
ICstCisgZXRjL3BhbS5kL3VzZXJhZGQgICB8IDIgKy0KKyBldGMvcGFtLmQvdXNlcmRlbCAgIHwg
MiArLQorIGV0Yy9wYW0uZC91c2VybW9kICAgfCAyICstCisgOSBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiAKLWRpZmYgLU51ciBzaGFkb3ctNC4xLjQuMy9l
dGMvcGFtLmQub3JpZy9jaGFnZSBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQvY2hhZ2UKLS0tLSBz
aGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQub3JpZy9jaGFnZQkyMDExLTA3LTIwIDE5OjAyOjI3LjM4
NDg0NDk1OCArMDgwMAotKysrIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC9jaGFnZQkyMDExLTA3
LTIwIDE5OjAzOjA4Ljk2NDg0NDk1OCArMDgwMAorZGlmZiAtLWdpdCBhL2V0Yy9wYW0uZC9jaGFn
ZSBiL2V0Yy9wYW0uZC9jaGFnZQoraW5kZXggOGY0OWY1Yy4uYjFmMzY1ZCAxMDA2NDQKKy0tLSBh
L2V0Yy9wYW0uZC9jaGFnZQorKysrIGIvZXRjL3BhbS5kL2NoYWdlCiBAQCAtMSw0ICsxLDQgQEAK
ICAjJVBBTS0xLjAKICBhdXRoCQlzdWZmaWNpZW50CXBhbV9yb290b2suc28KICBhY2NvdW50CQly
ZXF1aXJlZAlwYW1fcGVybWl0LnNvCiAtcGFzc3dvcmQJaW5jbHVkZQkJc3lzdGVtLWF1dGgKICtw
YXNzd29yZAlpbmNsdWRlCQljb21tb24tcGFzc3dvcmQKLWRpZmYgLU51ciBzaGFkb3ctNC4xLjQu
My9ldGMvcGFtLmQub3JpZy9jaGdwYXNzd2Qgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kL2NoZ3Bh
c3N3ZAotLS0tIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL2NoZ3Bhc3N3ZAkyMDExLTA3
LTIwIDE5OjAyOjI3LjM4NDg0NDk1OCArMDgwMAotKysrIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0u
ZC9jaGdwYXNzd2QJMjAxMS0wNy0yMCAxOTowMzoyNi41NDQ4NDQ5NTggKzA4MDAKK2RpZmYgLS1n
aXQgYS9ldGMvcGFtLmQvY2hncGFzc3dkIGIvZXRjL3BhbS5kL2NoZ3Bhc3N3ZAoraW5kZXggOGY0
OWY1Yy4uYjFmMzY1ZCAxMDA2NDQKKy0tLSBhL2V0Yy9wYW0uZC9jaGdwYXNzd2QKKysrKyBiL2V0
Yy9wYW0uZC9jaGdwYXNzd2QKIEBAIC0xLDQgKzEsNCBAQAogICMlUEFNLTEuMAogIGF1dGgJCXN1
ZmZpY2llbnQJcGFtX3Jvb3Rvay5zbwogIGFjY291bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28K
IC1wYXNzd29yZAlpbmNsdWRlCQlzeXN0ZW0tYXV0aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1v
bi1wYXNzd29yZAotZGlmZiAtTnVyIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL2dyb3Vw
YWRkIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC9ncm91cGFkZAotLS0tIHNoYWRvdy00LjEuNC4z
L2V0Yy9wYW0uZC5vcmlnL2dyb3VwYWRkCTIwMTEtMDctMjAgMTk6MDI6MjcuMzg0ODQ0OTU4ICsw
ODAwCi0rKysgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kL2dyb3VwYWRkCTIwMTEtMDctMjAgMTk6
MDQ6MDguMTI0ODQ0OTU4ICswODAwCitkaWZmIC0tZ2l0IGEvZXRjL3BhbS5kL2dyb3VwYWRkIGIv
ZXRjL3BhbS5kL2dyb3VwYWRkCitpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0NAorLS0tIGEv
ZXRjL3BhbS5kL2dyb3VwYWRkCisrKysgYi9ldGMvcGFtLmQvZ3JvdXBhZGQKIEBAIC0xLDQgKzEs
NCBAQAogICMlUEFNLTEuMAogIGF1dGgJCXN1ZmZpY2llbnQJcGFtX3Jvb3Rvay5zbwogIGFjY291
bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28KIC1wYXNzd29yZAlpbmNsdWRlCQlzeXN0ZW0tYXV0
aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1wYXNzd29yZAotZGlmZiAtTnVyIHNoYWRvdy00
LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL2dyb3VwZGVsIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC9n
cm91cGRlbAotLS0tIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL2dyb3VwZGVsCTIwMTEt
MDctMjAgMTk6MDI6MjcuMzg0ODQ0OTU4ICswODAwCi0rKysgc2hhZG93LTQuMS40LjMvZXRjL3Bh
bS5kL2dyb3VwZGVsCTIwMTEtMDctMjAgMTk6MDQ6MjYuMTE0ODQ0OTU4ICswODAwCitkaWZmIC0t
Z2l0IGEvZXRjL3BhbS5kL2dyb3VwZGVsIGIvZXRjL3BhbS5kL2dyb3VwZGVsCitpbmRleCA4ZjQ5
ZjVjLi5iMWYzNjVkIDEwMDY0NAorLS0tIGEvZXRjL3BhbS5kL2dyb3VwZGVsCisrKysgYi9ldGMv
cGFtLmQvZ3JvdXBkZWwKIEBAIC0xLDQgKzEsNCBAQAogICMlUEFNLTEuMAogIGF1dGgJCXN1ZmZp
Y2llbnQJcGFtX3Jvb3Rvay5zbwogIGFjY291bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28KIC1w
YXNzd29yZAlpbmNsdWRlCQlzeXN0ZW0tYXV0aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1w
YXNzd29yZAotZGlmZiAtTnVyIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL2dyb3VwbWVt
cyBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQvZ3JvdXBtZW1zCi0tLS0gc2hhZG93LTQuMS40LjMv
ZXRjL3BhbS5kLm9yaWcvZ3JvdXBtZW1zCTIwMTEtMDctMjAgMTk6MDI6MjcuMzg0ODQ0OTU4ICsw
ODAwCi0rKysgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kL2dyb3VwbWVtcwkyMDExLTA3LTIwIDE5
OjA0OjM1LjA3NDg0NDk1OCArMDgwMAorZGlmZiAtLWdpdCBhL2V0Yy9wYW0uZC9ncm91cG1lbXMg
Yi9ldGMvcGFtLmQvZ3JvdXBtZW1zCitpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0NAorLS0t
IGEvZXRjL3BhbS5kL2dyb3VwbWVtcworKysrIGIvZXRjL3BhbS5kL2dyb3VwbWVtcwogQEAgLTEs
NCArMSw0IEBACiAgIyVQQU0tMS4wCiAgYXV0aAkJc3VmZmljaWVudAlwYW1fcm9vdG9rLnNvCiAg
YWNjb3VudAkJcmVxdWlyZWQJcGFtX3Blcm1pdC5zbwogLXBhc3N3b3JkCWluY2x1ZGUJCXN5c3Rl
bS1hdXRoCiArcGFzc3dvcmQJaW5jbHVkZQkJY29tbW9uLXBhc3N3b3JkCi1kaWZmIC1OdXIgc2hh
ZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvZ3JvdXBtb2Qgc2hhZG93LTQuMS40LjMvZXRjL3Bh
bS5kL2dyb3VwbW9kCi0tLS0gc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvZ3JvdXBtb2QJ
MjAxMS0wNy0yMCAxOTowMjoyNy4zODQ4NDQ5NTggKzA4MDAKLSsrKyBzaGFkb3ctNC4xLjQuMy9l
dGMvcGFtLmQvZ3JvdXBtb2QJMjAxMS0wNy0yMCAxOTowNDo0NC44NjQ4NDQ5NTggKzA4MDAKK2Rp
ZmYgLS1naXQgYS9ldGMvcGFtLmQvZ3JvdXBtb2QgYi9ldGMvcGFtLmQvZ3JvdXBtb2QKK2luZGV4
IDhmNDlmNWMuLmIxZjM2NWQgMTAwNjQ0CistLS0gYS9ldGMvcGFtLmQvZ3JvdXBtb2QKKysrKyBi
L2V0Yy9wYW0uZC9ncm91cG1vZAogQEAgLTEsNCArMSw0IEBACiAgIyVQQU0tMS4wCiAgYXV0aAkJ
c3VmZmljaWVudAlwYW1fcm9vdG9rLnNvCiAgYWNjb3VudAkJcmVxdWlyZWQJcGFtX3Blcm1pdC5z
bwogLXBhc3N3b3JkCWluY2x1ZGUJCXN5c3RlbS1hdXRoCiArcGFzc3dvcmQJaW5jbHVkZQkJY29t
bW9uLXBhc3N3b3JkCi1kaWZmIC1OdXIgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvdXNl
cmFkZCBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQvdXNlcmFkZAotLS0tIHNoYWRvdy00LjEuNC4z
L2V0Yy9wYW0uZC5vcmlnL3VzZXJhZGQJMjAxMS0wNy0yMCAxOTowMjoyNy4zODQ4NDQ5NTggKzA4
MDAKLSsrKyBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQvdXNlcmFkZAkyMDExLTA3LTIwIDE5OjA3
OjI2LjI0NDg0NDk1OCArMDgwMAorZGlmZiAtLWdpdCBhL2V0Yy9wYW0uZC91c2VyYWRkIGIvZXRj
L3BhbS5kL3VzZXJhZGQKK2luZGV4IDhmNDlmNWMuLmIxZjM2NWQgMTAwNjQ0CistLS0gYS9ldGMv
cGFtLmQvdXNlcmFkZAorKysrIGIvZXRjL3BhbS5kL3VzZXJhZGQKIEBAIC0xLDQgKzEsNCBAQAog
ICMlUEFNLTEuMAogIGF1dGgJCXN1ZmZpY2llbnQJcGFtX3Jvb3Rvay5zbwogIGFjY291bnQJCXJl
cXVpcmVkCXBhbV9wZXJtaXQuc28KIC1wYXNzd29yZAlpbmNsdWRlCQlzeXN0ZW0tYXV0aAogK3Bh
c3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1wYXNzd29yZAotZGlmZiAtTnVyIHNoYWRvdy00LjEuNC4z
L2V0Yy9wYW0uZC5vcmlnL3VzZXJkZWwgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kL3VzZXJkZWwK
LS0tLSBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQub3JpZy91c2VyZGVsCTIwMTEtMDctMjAgMTk6
MDI6MjcuMzg0ODQ0OTU4ICswODAwCi0rKysgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kL3VzZXJk
ZWwJMjAxMS0wNy0yMCAxOTowNzozNS43MzQ4NDQ5NTggKzA4MDAKK2RpZmYgLS1naXQgYS9ldGMv
cGFtLmQvdXNlcmRlbCBiL2V0Yy9wYW0uZC91c2VyZGVsCitpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVk
IDEwMDY0NAorLS0tIGEvZXRjL3BhbS5kL3VzZXJkZWwKKysrKyBiL2V0Yy9wYW0uZC91c2VyZGVs
CiBAQCAtMSw0ICsxLDQgQEAKICAjJVBBTS0xLjAKICBhdXRoCQlzdWZmaWNpZW50CXBhbV9yb290
b2suc28KICBhY2NvdW50CQlyZXF1aXJlZAlwYW1fcGVybWl0LnNvCiAtcGFzc3dvcmQJaW5jbHVk
ZQkJc3lzdGVtLWF1dGgKICtwYXNzd29yZAlpbmNsdWRlCQljb21tb24tcGFzc3dvcmQKLWRpZmYg
LU51ciBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQub3JpZy91c2VybW9kIHNoYWRvdy00LjEuNC4z
L2V0Yy9wYW0uZC91c2VybW9kCi0tLS0gc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvdXNl
cm1vZAkyMDExLTA3LTIwIDE5OjAyOjI3LjM4NDg0NDk1OCArMDgwMAotKysrIHNoYWRvdy00LjEu
NC4zL2V0Yy9wYW0uZC91c2VybW9kCTIwMTEtMDctMjAgMTk6MDc6NDIuMDI0ODQ0OTU4ICswODAw
CitkaWZmIC0tZ2l0IGEvZXRjL3BhbS5kL3VzZXJtb2QgYi9ldGMvcGFtLmQvdXNlcm1vZAoraW5k
ZXggOGY0OWY1Yy4uYjFmMzY1ZCAxMDA2NDQKKy0tLSBhL2V0Yy9wYW0uZC91c2VybW9kCisrKysg
Yi9ldGMvcGFtLmQvdXNlcm1vZAogQEAgLTEsNCArMSw0IEBACiAgIyVQQU0tMS4wCiAgYXV0aAkJ
c3VmZmljaWVudAlwYW1fcm9vdG9rLnNvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc2hhZG93L3NoYWRvdy5pbmMgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRv
dy5pbmMKaW5kZXggMTZiOTlhMGI2MC4uNzFhMjE5YjNkYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvc2hhZG93LmluYwpAQCAtMTQsNiArMTQsOCBAQCBHSVRIVUJfQkFTRV9VUkkgPSAi
aHR0cHM6Ly9naXRodWIuY29tL3NoYWRvdy1tYWludC9zaGFkb3cvcmVsZWFzZXMiCiBTUkNfVVJJ
ID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3ogXAogICAg
ICAgICAgICAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdwYW0nLCAnJHtQ
QU1fU1JDX1VSSX0nLCAnJywgZCl9IFwKICAgICAgICAgICAgZmlsZTovL3VzZXJhZGQgXAorICAg
ICAgICAgICBmaWxlOi8vbG9naW5fZGVmc19wYW0uc2VkIFwKKyAgICAgICAgICAgZmlsZTovL2Nv
bW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gg
XAogICAgICAgICAgICAiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgXApAQCAt
MjQsNyArMjYsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIFwKIFNSQ19VUkk6
YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAogICAgICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1m
aXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMzA1ZWRmNWQxOWJkZGJkZjVlODM2ZDJkNjA5
ZmE4YmZmMmQzNTQ1ODgxOWRlNGQ5ZjA2MzA2YTFjZjI0MzQyIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjM3N2ZlMGQ3YzFhMGFhNWUzNTE0YzA4ZmRmNWRkYzcwYzlkY2JiMzkxNjc4YzIxMzQ0NDVl
ZDk3MzI2YmNjMjYiCiAKICMgQWRkaXRpb25hbCBQb2xpY3kgZmlsZXMgZm9yIFBBTQogUEFNX1NS
Q19VUkkgPSAiZmlsZTovL3BhbS5kL2NoZm4gXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xNC4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3No
YWRvdy9zaGFkb3dfNC4xNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE0LjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTUuMC5iYgotLSAKMi40Mi4wCgo=

--===============3221831861524834847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ed0546ef8f33181d46345a1cd205b91c8b16bf57"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ed0546ef8f33181d46345a1cd205b91c8b16bf57"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 455 Local 425 Mirrors 0 Missed 30 Current 357 (93% match, 96% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 384 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_setscene)
NOTE: Running setscene task 446 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package_setscene)
NOTE: Running setscene task 450 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 500 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 648 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 663 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 665 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 671 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 673 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 709 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 723 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 729 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 995 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_recipe_qa)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1057 of 2307 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_recipe_qa)
NOTE: Running task 1155 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1172 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1321 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe shadow-native-4.15.0-r0: task do_recipe_qa: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_recipe_qa unihash changed to 358e57ebfaecf52efdc70e06d959a0522b9833c2d22ade873d488d1658378c46
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_recipe_qa unihash changed to a6c3c0c9a266ca56ec15041a0d518309fcc8ac8d38b3ff10d08a2626c81bf24c
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 734 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e455ceb04bee1ac2b6b79e3200c1dee8107e4af3ab4bac932d9e8577748d08ab
NOTE: Running setscene task 735 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1370 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_fetch)
NOTE: Running task 1373 of 2307 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_fetch)
NOTE: Running task 1374 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_unpack)
NOTE: Running task 1375 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Started
NOTE: recipe shadow-4.15.0-r0: task do_fetch: Started
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.15.0-r0: task do_fetch: Started
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Started
NOTE: recipe shadow-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1380 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_unpack)
NOTE: Running task 1383 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe shadow-native-4.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1384 of 2307 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.15.0-r0: task do_unpack: Started
NOTE: recipe expat-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1395 of 2307 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 789 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_warn_musl)
NOTE: Running task 1463 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_write_config)
NOTE: Running task 1466 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1469 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: Running setscene task 795 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1559 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1560 of 2307 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_patch)
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Started
NOTE: recipe shadow-4.15.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Succeeded
NOTE: Running setscene task 796 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 800 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-native-4.15.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1592 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1593 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_populate_lic)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1594 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe shadow-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.15.0-r0: task do_populate_lic: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe shadow-4.15.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_populate_lic unihash changed to 624c65cb36a280a01875ffd8a4586c164bb4c1e0e843e71483344d504ad347cb
NOTE: recipe shadow-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_deploy_source_date_epoch unihash changed to ba1a1811bfb121a58be1af272bac0efc6c5235c88714c7a84cf14e4553a79cf0
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1600 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_patch)
NOTE: recipe systemd-1_255.4-r0: task do_patch: Started
NOTE: recipe systemd-1_255.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1965 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2246 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2265 of 2307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_configure)
NOTE: recipe shadow-4.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_configure: Started
NOTE: recipe shadow-native-4.15.0-r0: task do_patch: Failed
NOTE: recipe shadow-4.15.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2265 tasks of which 2239 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315104857.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315104857.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_patch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_configure
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: shadow-native-4.15.0-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.15.0/shadow-4.15.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.15.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.15.0/temp/log.do_patch.3979671
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_patch) failed with exit code '1'
ERROR: shadow-4.15.0-r0 do_configure: QA Issue: shadow: configure was passed unrecognised options: --without-libcrack [unknown-configure-option]
ERROR: shadow-4.15.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shadow/4.15.0/temp/log.do_configure.3980529
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_configure) failed with exit code '1'

--===============3221831861524834847==--


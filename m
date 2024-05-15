Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69792C2D0D1
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1267.1715794337107337817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NcBuvbEj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Pm11/zTQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fe1b5-ae0be27d-2260-487b-a1ef-7cc9046e8bc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UHEfbtT5oeMrPtoHdSyaJQKWxjil2CXUUjYu+hnJ9qA=;
	b=NcBuvbEjIzqIdelU4V1+2WSp+D+tj8VJqV01QiJD2wcAVmlDfgBg377TPp/VNIGg
	rGwftZ6jYYONA0ZdBPYhCuA2tixtOOoWb0feZ8qorG4uMHWRdde5X6WRsatiKJ1LhUn
	J1UPXjLhnXuFxSEMNgEYAyH1R5lR5tNM0hZOA9gw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UHEfbtT5oeMrPtoHdSyaJQKWxjil2CXUUjYu+hnJ9qA=;
	b=Pm11/zTQCgJgjCQPbRj4dDiDDbUObJs2wqoQyKkfaEYYGXnGygPg51w5nfJoe4rw
	Ebl4i13u0yP4bhfV5OE8evc1aYxo7V7Cs3EWClfIreT1GLvi0LzNQhvBVdad0tpN4xf
	+sj2egCJ0A/vKgbzKPaYqKtp1vJGMmQJ/yCd9qoc=
Content-Type: multipart/mixed; boundary="===============7190982578771148484=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.8 SUCCEEDED
Message-ID: <0101018f7d4fe1b5-ae0be27d-2260-487b-a1ef-7cc9046e8bc4-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199345

--===============7190982578771148484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cups* to *2.4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.7-2.4.8.patch
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
From 685bb1c904da2abdcb069bc5adf96228ec20f9c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 12:02:36 +0000
Subject: [PATCH] cups: upgrade 2.4.7 -> 2.4.8

---
 .../cups/cups/0001-use-echo-only-in-init.patch   | 11 ++++-------
 ...002-don-t-try-to-run-generated-binaries.patch | 16 ++++++----------
 ...ups-fix-multilib-install-file-conflicts.patch | 12 ++++--------
 meta/recipes-extended/cups/cups/libexecdir.patch |  5 ++---
 .../cups/{cups_2.4.7.bb => cups_2.4.8.bb}        |  2 +-
 5 files changed, 17 insertions(+), 29 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.8.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index 80bbad0a44..41648210c7 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,7 +1,7 @@
-From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00 2001
+From 5e6887460fb4f597a56ab746160a81ca43f93a71 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
-Subject: [PATCH 1/4] use echo only in init
+Subject: [PATCH] use echo only in init
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scheduler/cups.sh.in b/scheduler/cups.sh.in
-index 89ac36d..6618a0f 100644
+index 74cce18..c57f0db 100644
 --- a/scheduler/cups.sh.in
 +++ b/scheduler/cups.sh.in
-@@ -50,7 +50,7 @@ case "`uname`" in
+@@ -51,7 +51,7 @@ case "`uname`" in
  		ECHO_ERROR=:
  		;;
  
@@ -22,6 +22,3 @@ index 89ac36d..6618a0f 100644
  		IS_ON=/bin/true
  		if test -f /etc/init.d/functions; then
  			. /etc/init.d/functions
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 2bc26edbfc..2fb0825016 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,21 +1,20 @@
-From 3e9a965dcd65ab2d40b753b6f792a1a4559182aa Mon Sep 17 00:00:00 2001
+From b3f8b234709cc2754d95e6cbe80018b6a998ce49 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
-Subject: [PATCH 2/4] don't try to run generated binaries
+Subject: [PATCH] don't try to run generated binaries
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
 ---
- ppdc/Makefile | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
+ ppdc/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ppdc/Makefile b/ppdc/Makefile
-index 32e2e0b..f1478d4 100644
+index e36ed11..3fe97e1 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
-@@ -186,8 +186,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+@@ -187,8 +187,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
  	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
  		libcupsppdc.a $(LINKCUPSSTATIC)
  	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
@@ -26,6 +25,3 @@ index 32e2e0b..f1478d4 100644
  
  
  #
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index bc9260307c..f99cf03a90 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,7 +1,7 @@
-From 7dbda1887aa19ab720aff22312f4caff2d575f62 Mon Sep 17 00:00:00 2001
+From e574651a22fc51d79a489be4e6b374cc77910d4d Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
-Subject: [PATCH 4/4] cups: fix multilib install file conflicts
+Subject: [PATCH] cups: fix multilib install file conflicts
 
 @CUPS_SERVERBIN@ is ${libdir} related that causes multilib install file
 conflict. Remove @CUPS_SERVERBIN@ from the comment line of cups-files.conf to
@@ -10,16 +10,15 @@ avoid the conflict.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  conf/cups-files.conf.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index 4a78ba6..03c6582 100644
+index 93584a1..65b7052 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -73,7 +73,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
@@ -28,6 +27,3 @@ index 4a78ba6..03c6582 100644
  
  # SSL/TLS keychain for the scheduler...
  #ServerKeychain @CUPS_SERVERKEYCHAIN@
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 7ccad94f0f..4e991ee43b 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From 9aab34e6c5140d2bbe376e4c21eb75b90d327a6a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
@@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  config-scripts/cups-directories.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
-index 2033d47..230166e 100644
+index 069ee7b..2f67e5b 100644
 --- a/config-scripts/cups-directories.m4
 +++ b/config-scripts/cups-directories.m4
 @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
diff --git a/meta/recipes-extended/cups/cups_2.4.7.bb b/meta/recipes-extended/cups/cups_2.4.8.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.7.bb
rename to meta/recipes-extended/cups/cups_2.4.8.bb
index f4b0282e4c..c0cddf7e99 100644
--- a/meta/recipes-extended/cups/cups_2.4.7.bb
+++ b/meta/recipes-extended/cups/cups_2.4.8.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
+SRC_URI[sha256sum] = "75c326b4ba73975efcc9a25078c4b04cdb4ee333caaad0d0823dbd522c6479a0"
-- 
2.44.0


--===============7190982578771148484==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.7-2.4.8.patch"

RnJvbSA2ODViYjFjOTA0ZGEyYWJkY2IwNjliYzVhZGY5NjIyOGVjMjBmOWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTI6MDI6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC43IC0+IDIuNC44CgotLS0KIC4uLi9jdXBzL2N1cHMvMDAwMS11c2Ut
ZWNoby1vbmx5LWluLWluaXQucGF0Y2ggICB8IDExICsrKystLS0tLS0tCiAuLi4wMDItZG9uLXQt
dHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2ggfCAxNiArKysrKystLS0tLS0tLS0t
CiAuLi51cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2ggfCAxMiAr
KysrLS0tLS0tLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5w
YXRjaCB8ICA1ICsrLS0tCiAuLi4vY3Vwcy97Y3Vwc18yLjQuNy5iYiA9PiBjdXBzXzIuNC44LmJi
fSAgICAgICAgfCAgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyOSBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy97Y3Vwc18yLjQu
Ny5iYiA9PiBjdXBzXzIuNC44LmJifSAoNTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9jdXBzL2N1cHMvMDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBh
dGNoCmluZGV4IDgwYmJhZDBhNDQuLjQxNjQ4MjEwYzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4t
aW5pdC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gYTNmNGQ4YmE5N2Y0NjY5YTk1OTQzYTdl
NjVlYjYxYWE0NGNlNzk5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWU2ODg3NDYw
ZmI0ZjU5N2E1NmFiNzQ2MTYwYTgxY2E0M2Y5M2E3MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFNhdWwgV29sZCA8c2d3QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFRodSwgMTMgRGVj
IDIwMTIgMTk6MDM6NTIgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzRdIHVzZSBlY2hvIG9ubHkg
aW4gaW5pdAorU3ViamVjdDogW1BBVENIXSB1c2UgZWNobyBvbmx5IGluIGluaXQKIAogVXBzdHJl
YW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KIFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgpAQCAtMTAsMTAg
KzEwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogCiBkaWZmIC0tZ2l0IGEvc2NoZWR1bGVyL2N1cHMuc2guaW4gYi9zY2hlZHVsZXIvY3Vwcy5z
aC5pbgotaW5kZXggODlhYzM2ZC4uNjYxOGEwZiAxMDA2NDQKK2luZGV4IDc0Y2NlMTguLmM1N2Yw
ZGIgMTAwNjQ0CiAtLS0gYS9zY2hlZHVsZXIvY3Vwcy5zaC5pbgogKysrIGIvc2NoZWR1bGVyL2N1
cHMuc2guaW4KLUBAIC01MCw3ICs1MCw3IEBAIGNhc2UgImB1bmFtZWAiIGluCitAQCAtNTEsNyAr
NTEsNyBAQCBjYXNlICJgdW5hbWVgIiBpbgogIAkJRUNIT19FUlJPUj06CiAgCQk7OwogIApAQCAt
MjIsNiArMjIsMyBAQCBpbmRleCA4OWFjMzZkLi42NjE4YTBmIDEwMDY0NAogIAkJSVNfT049L2Jp
bi90cnVlCiAgCQlpZiB0ZXN0IC1mIC9ldGMvaW5pdC5kL2Z1bmN0aW9uczsgdGhlbgogIAkJCS4g
L2V0Yy9pbml0LmQvZnVuY3Rpb25zCi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQt
YmluYXJpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9u
LXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKaW5kZXggMmJjMjZlZGJmYy4u
MmZiMDgyNTAxNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8w
MDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRl
ZC1iaW5hcmllcy5wYXRjaApAQCAtMSwyMSArMSwyMCBAQAotRnJvbSAzZTlhOTY1ZGNkNjVhYjJk
NDBiNzUzYjZmNzkyYTFhNDU1OTE4MmFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBi
M2Y4YjIzNDcwOWNjMjc1NGQ5NWU2Y2JlODAwMThiNmE5OThjZTQ5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS29lbiBLb29pIDxrb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4KIERh
dGU6IFN1biwgMzAgSmFuIDIwMTEgMTY6Mzc6MjcgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSCAyLzRd
IGRvbid0IHRyeSB0byBydW4gZ2VuZXJhdGVkIGJpbmFyaWVzCitTdWJqZWN0OiBbUEFUQ0hdIGRv
bid0IHRyeSB0byBydW4gZ2VuZXJhdGVkIGJpbmFyaWVzCiAKIFVwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSBbZW1iZWRkZWQgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IEtvZW4gS29v
aSA8a29lbkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ+Ci0KIC0tLQotIHBwZGMvTWFrZWZpbGUgfCAz
MiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKKyBwcGRjL01ha2VmaWxlIHwgNCArKy0tCisg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3BwZGMvTWFrZWZpbGUgYi9wcGRjL01ha2VmaWxlCi1pbmRleCAzMmUyZTBiLi5mMTQ3
OGQ0IDEwMDY0NAoraW5kZXggZTM2ZWQxMS4uM2ZlOTdlMSAxMDA2NDQKIC0tLSBhL3BwZGMvTWFr
ZWZpbGUKICsrKyBiL3BwZGMvTWFrZWZpbGUKLUBAIC0xODYsOCArMTg2LDggQEAgZ2Vuc3RyaW5n
czoJCWdlbnN0cmluZ3MubyBsaWJjdXBzcHBkYy5hIC4uL2N1cHMvJChMSUJDVVBTU1RBVElDKSBc
CitAQCAtMTg3LDggKzE4Nyw4IEBAIGdlbnN0cmluZ3M6CQlnZW5zdHJpbmdzLm8gbGliY3Vwc3Bw
ZGMuYSAuLi9jdXBzLyQoTElCQ1VQU1NUQVRJQykgXAogIAkkKExEX0NYWCkgJChBUkNIRkxBR1Mp
ICQoQUxMX0xERkxBR1MpIC1vIGdlbnN0cmluZ3MgZ2Vuc3RyaW5ncy5vIFwKICAJCWxpYmN1cHNw
cGRjLmEgJChMSU5LQ1VQU1NUQVRJQykKICAJJChDT0RFX1NJR04pIC1zICIkKENPREVfU0lHTl9J
REVOVElUWSkiICRACkBAIC0yNiw2ICsyNSwzIEBAIGluZGV4IDMyZTJlMGIuLmYxNDc4ZDQgMTAw
NjQ0CiAgCiAgCiAgIwotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25m
bGljdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1m
aXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaAppbmRleCBiYzkyNjAzMDdj
Li5mOTljZjAzYTkwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
LzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWIt
aW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gN2RiZGEx
ODg3YWExOWFiNzIwYWZmMjIzMTJmNGNhZmYyZDU3NWY2MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZTU3NDY1MWEyMmZjNTFkNzlhNDg5YmU0ZTZiMzc0Y2M3NzkxMGQ0ZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29t
PgogRGF0ZTogV2VkLCAzIE9jdCAyMDE4IDAwOjI3OjExICswODAwCi1TdWJqZWN0OiBbUEFUQ0gg
NC80XSBjdXBzOiBmaXggbXVsdGlsaWIgaW5zdGFsbCBmaWxlIGNvbmZsaWN0cworU3ViamVjdDog
W1BBVENIXSBjdXBzOiBmaXggbXVsdGlsaWIgaW5zdGFsbCBmaWxlIGNvbmZsaWN0cwogCiBAQ1VQ
U19TRVJWRVJCSU5AIGlzICR7bGliZGlyfSByZWxhdGVkIHRoYXQgY2F1c2VzIG11bHRpbGliIGlu
c3RhbGwgZmlsZQogY29uZmxpY3QuIFJlbW92ZSBAQ1VQU19TRVJWRVJCSU5AIGZyb20gdGhlIGNv
bW1lbnQgbGluZSBvZiBjdXBzLWZpbGVzLmNvbmYgdG8KQEAgLTEwLDE2ICsxMCwxNSBAQCBhdm9p
ZCB0aGUgY29uZmxpY3QuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNp
ZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4K
LQogLS0tCiAgY29uZi9jdXBzLWZpbGVzLmNvbmYuaW4gfCAyICstCiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25mL2N1cHMt
ZmlsZXMuY29uZi5pbiBiL2NvbmYvY3Vwcy1maWxlcy5jb25mLmluCi1pbmRleCA0YTc4YmE2Li4w
M2M2NTgyIDEwMDY0NAoraW5kZXggOTM1ODRhMS4uNjViNzA1MiAxMDA2NDQKIC0tLSBhL2NvbmYv
Y3Vwcy1maWxlcy5jb25mLmluCiArKysgYi9jb25mL2N1cHMtZmlsZXMuY29uZi5pbgotQEAgLTcz
LDcgKzczLDcgQEAgUGFnZUxvZyBAQ1VQU19MT0dESVJAL3BhZ2VfbG9nCitAQCAtNjcsNyArNjcs
NyBAQCBQYWdlTG9nIEBDVVBTX0xPR0RJUkAvcGFnZV9sb2cKICAjUmVxdWVzdFJvb3QgQENVUFNf
UkVRVUVTVFNACiAgCiAgIyBMb2NhdGlvbiBvZiBoZWxwZXIgcHJvZ3JhbXMuLi4KQEAgLTI4LDYg
KzI3LDMgQEAgaW5kZXggNGE3OGJhNi4uMDNjNjU4MiAxMDA2NDQKICAKICAjIFNTTC9UTFMga2V5
Y2hhaW4gZm9yIHRoZSBzY2hlZHVsZXIuLi4KICAjU2VydmVyS2V5Y2hhaW4gQENVUFNfU0VSVkVS
S0VZQ0hBSU5ACi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vw
cy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gKaW5kZXggN2NjYWQ5NGYwZi4uNGU5OTFlZTQzYiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMTcyNGY3YmNkYmNmZGI0NDU3NzhmOGEyZTUzMGM1YzA5NGMx
OGMxMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWFhYjM0ZTZjNTE0MGQyYmJlMzc2
ZTRjMjFlYjc1YjkwZDMyN2E2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVHVlLCAxMyBKdWwgMjAyMSAxMjo1
NjozMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBVc2UgJGxpYmV4ZWNkaXIgaW5zdGVhZCBvZiBo
YXJkY29kaW5nICRwcmVmaXgvbGliIGFzIHRoaXMKQEAgLTYsMTMgKzYsMTIgQEAgU3ViamVjdDog
W1BBVENIXSBVc2UgJGxpYmV4ZWNkaXIgaW5zdGVhZCBvZiBoYXJkY29kaW5nICRwcmVmaXgvbGli
IGFzIHRoaXMKIAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLQogLS0tCiAgY29uZmlnLXNjcmlwdHMvY3Vw
cy1kaXJlY3Rvcmllcy5tNCB8IDQgKystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWctc2NyaXB0cy9jdXBzLWRp
cmVjdG9yaWVzLm00IGIvY29uZmlnLXNjcmlwdHMvY3Vwcy1kaXJlY3Rvcmllcy5tNAotaW5kZXgg
MjAzM2Q0Ny4uMjMwMTY2ZSAxMDA2NDQKK2luZGV4IDA2OWVlN2IuLjJmNjdlNWIgMTAwNjQ0CiAt
LS0gYS9jb25maWctc2NyaXB0cy9jdXBzLWRpcmVjdG9yaWVzLm00CiArKysgYi9jb25maWctc2Ny
aXB0cy9jdXBzLWRpcmVjdG9yaWVzLm00CiBAQCAtMjM5LDcgKzIzOSw3IEBAIEFDX1NVQlNUKFtD
VVBTX1JFUVVFU1RTXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1
cHNfMi40LjcuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC44LmJiCnNp
bWlsYXJpdHkgaW5kZXggNTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHNfMi40LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNf
Mi40LjguYmIKaW5kZXggZjRiMDI4MmU0Yy4uYzBjZGRmN2U5OSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvY3Vwcy9jdXBzXzIuNC44LmJiCkBAIC0yLDQgKzIsNCBAQCByZXF1aXJlIGN1cHMuaW5j
CiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0
NjU1ZmM4NTRkZGMzYzZiZDU3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGQ1NDIyOGRkOTAz
NTI2NDI4Y2U3ZTM3OTYxYWZhZWQyMzBhZDMxMDc4ODE0MWRhNzVjZWJhYTA4MzYyY2Y2YyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI3NWMzMjZiNGJhNzM5NzVlZmNjOWEyNTA3OGM0YjA0Y2RiNGVl
MzMzY2FhYWQwZDA4MjNkYmQ1MjJjNjQ3OWEwIgotLSAKMi40NC4wCgo=

--===============7190982578771148484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cups/cups-dbg: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-dbg: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-dbg: PKGSIZE changed from 8283088 to 8303648 (+0%)
packages/core2-64-poky-linux/cups/cups-dev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-dev: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-dev: PKGSIZE changed from 188141 to 188704 (+0%)
packages/core2-64-poky-linux/cups/cups-doc: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-doc: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-doc: PKGSIZE changed from 225888 to 226027 (+0%)
packages/core2-64-poky-linux/cups/cups-lib: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-lib: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-libimage: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-libimage: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-ca: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGSIZE changed from 340323 to 340366 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-cs: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGSIZE changed from 299550 to 299593 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-da: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-da: PKGSIZE changed from 478891 to 478934 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-de: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-de: PKGSIZE changed from 424560 to 424603 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-en: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-en: PKGSIZE changed from 387387 to 387430 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-es: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-es: PKGSIZE changed from 395602 to 395645 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-fr: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGSIZE changed from 359727 to 359770 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-it: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-it: PKGSIZE changed from 342273 to 342316 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-ja: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGSIZE changed from 407685 to 407728 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGSIZE changed from 394220 to 394263 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-ru: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGSIZE changed from 343945 to 343988 (+0%)
packages/core2-64-poky-linux/cups/cups-src: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-src: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-src: PKGSIZE changed from 5944699 to 5969837 (+0%)
packages/core2-64-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-staticdev: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-webif: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-webif: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-webif: PKGSIZE changed from 1565612 to 1566146 (+0%)
packages/core2-64-poky-linux/cups/cups: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups: PKGSIZE changed from 7306827 to 7315729 (+0%)
packages/core2-64-poky-linux/cups: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.7/cups-2.4.7-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.8/cups-2.4.8-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/core2-64-poky-linux/cups: PV changed from "2.4.7" to "2.4.8"

--===============7190982578771148484==--


Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5333.1793687199635678658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LDVv9CXL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=34yqUT3M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1a016b43d-ff73c4f7-4df7-4774-96e6-1ff9d2cdb739-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687205;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5/yhbq8CP+DmoCw//BeDr/6UU54APmUdq54miT4kGr4=;
	b=LDVv9CXLvsWpZODpA4Uq0druLmQVqM+kcIPglNfdrrTtOKusCVFk+8yRdDupHNVP
	sA/vJEpki4mWJ/wNf6Og7xgUvn4JjqjNKrtR1VB4ISIOZp1nFwqyR9f4dXE8v2y3qwq
	5opVLHqtNAmwO2aOslAir1m6/8wQhOedbSqGMtVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687205;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5/yhbq8CP+DmoCw//BeDr/6UU54APmUdq54miT4kGr4=;
	b=34yqUT3MvCzPvJKqAav0buk4y8NRzGNNJgRXp2SauNOOdcyNxJex71oxGxPIfgHf
	lESV8vhjc4yeeyHRYpm3zPge9G/V06RsKjYWcjyxbdnkqkSNfjhoBZYCdtW10sLQvqF
	PonB//IKvEvQTeqjXCC/V+epPzms20zzmERkXS90=
Content-Type: multipart/mixed; boundary="===============6083678173577647081=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Enoch Ng <enoch.ng@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr-util: upgrading to 1.6.6 SUCCEEDED
Message-ID: <010101a1a016b43d-ff73c4f7-4df7-4774-96e6-1ff9d2cdb739-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249242

--===============6083678173577647081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apr-util* to *1.6.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apr-util-upgrade-1.6.5-1.6.6.patch
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
From 26aa6e6f2d0b0f4a01fd1d4afb7978453ce7f5df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 06:20:35 +0000
Subject: [PATCH] apr-util: upgrade 1.6.5 -> 1.6.6

Changes with APR-util 1.6.6
  *) Fix crypto/apr_passwd.c compilation errors on older systems. PR 70283.

  *) Fix crashes in apr_crypto_get_block_key_types() with default cmake builds
  on
     Windows. PR 70260.
---
 .../recipes-support/apr/apr-util/configfix.patch | 16 ++++++++++++----
 .../apr/{apr-util_1.6.5.bb => apr-util_1.6.6.bb} |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.6.5.bb => apr-util_1.6.6.bb} (97%)

diff --git a/meta/recipes-support/apr/apr-util/configfix.patch b/meta/recipes-support/apr/apr-util/configfix.patch
index 4cc0ad79ae..5322e73d29 100644
--- a/meta/recipes-support/apr/apr-util/configfix.patch
+++ b/meta/recipes-support/apr/apr-util/configfix.patch
@@ -1,9 +1,17 @@
+From f05a53c7e957b215743359ff787eff3040f51e89 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <rpurdie@linux.intel.com>
+Date: Mon, 12 Jan 2009 17:34:52 +0000
+Subject: [PATCH] apr/apr-util: Fix some other config path gremlins breaking
+
 Upstream-Status: Inappropriate [configuration]
+---
+ apu-config.in | 27 +--------------------------
+ 1 file changed, 1 insertion(+), 26 deletions(-)
 
-Index: apr-util-1.3.4/apu-config.in
-===================================================================
---- apr-util-1.3.4.orig/apu-config.in	2009-01-12 17:08:06.000000000 +0000
-+++ apr-util-1.3.4/apu-config.in	2009-01-12 17:09:00.000000000 +0000
+diff --git a/apu-config.in b/apu-config.in
+index 82109e5..12d9fca 100644
+--- a/apu-config.in
++++ b/apu-config.in
 @@ -139,14 +139,7 @@ while test $# -gt 0; do
      exit 0
      ;;
diff --git a/meta/recipes-support/apr/apr-util_1.6.5.bb b/meta/recipes-support/apr/apr-util_1.6.6.bb
similarity index 97%
rename from meta/recipes-support/apr/apr-util_1.6.5.bb
rename to meta/recipes-support/apr/apr-util_1.6.6.bb
index ba1e3359ff..ebefffcd0d 100644
--- a/meta/recipes-support/apr/apr-util_1.6.5.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.6.bb
@@ -14,7 +14,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "f43a1c8c79eef497a022ec6c99dddbdf57e42001da6ccbfae259631ed5aa2805"
+SRC_URI[sha256sum] = "acd5f38440eda830e40c4fe35c2a6b8119493cfdba9c9d73d985c317beb4e4f8"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
-- 
2.47.1


--===============6083678173577647081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="apr-util-changelog.txt"

Changes with APR-util 1.6.6
  *) Fix crypto/apr_passwd.c compilation errors on older systems. PR 70283.

  *) Fix crashes in apr_crypto_get_block_key_types() with default cmake builds
  on
     Windows. PR 70260.

--===============6083678173577647081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/apr-util/apr-util-bin: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-bin: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util-dbg: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-dbg: FILELIST: removed "/usr/lib/.debug/libaprutil-1.so.0.6.5", added "/usr/lib/.debug/libaprutil-1.so.0.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-dbg: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util-dbg: PKGSIZE changed from 893648 to 894848 (+0%)
packages/x86-64-v3-poky-linux/apr-util/apr-util-dev: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-dev: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util-dev: PKGSIZE changed from 320845 to 320889 (+0%)
packages/x86-64-v3-poky-linux/apr-util/apr-util-doc: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-doc: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util-locale: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-locale: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util-ptest: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-ptest: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util-src: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-src: FILELIST: directory renamed /usr/src/debug/apr-util/1.6.5/memcache -> /usr/src/debug/apr-util/1.6.6/memcache, directory renamed /usr/src/debug/apr-util/1.6.5/crypto -> /usr/src/debug/apr-util/1.6.6/crypto, directory renamed /usr/src/debug/apr-util/1.6.5/buckets -> /usr/src/debug/apr-util/1.6.6/buckets, directory renamed /usr/src/debug/apr-util/1.6.5/test -> /usr/src/debug/apr-util/1.6.6/test, directory renamed /usr/src/debug/apr-util/1.6.5/redis -> /usr/src/debug/apr-util/1.6.6/redis, directory renamed /usr/src/debug/apr-util/1.6.5/hooks -> /usr/src/debug/apr-util/1.6.6/hooks, directory renamed /usr/src/debug/apr-util/1.6.5/include/private -> /usr/src/debug/apr-util/1.6.6/include/private, directory renamed /usr/src/debug/apr-util/1.6.5/dbm/sdbm -> /usr/src/debug/apr-util/1.6.6/dbm/sdbm, directory renamed /usr/src/debug/apr-util/1.6.5/encoding -> /usr/src/debug/apr-util/1.6.6/encoding, directory renamed /usr/src/debug/apr-util/1.6.5
 /uri -> /usr/src/debug/apr-util/1.6.6/uri, directory renamed /usr/src/debug/apr-util/1.6.5/xlate -> /usr/src/debug/apr-util/1.6.6/xlate, directory renamed /usr/src/debug/apr-util/1.6.5/xml -> /usr/src/debug/apr-util/1.6.6/xml, directory renamed /usr/src/debug/apr-util/1.6.5/dbm -> /usr/src/debug/apr-util/1.6.6/dbm, directory renamed /usr/src/debug/apr-util/1.6.5/include -> /usr/src/debug/apr-util/1.6.6/include, directory renamed /usr/src/debug/apr-util/1.6.5/strmatch -> /usr/src/debug/apr-util/1.6.6/strmatch, directory renamed /usr/src/debug/apr-util/1.6.5/ldap -> /usr/src/debug/apr-util/1.6.6/ldap, directory renamed /usr/src/debug/apr-util/1.6.5/dbd -> /usr/src/debug/apr-util/1.6.6/dbd, directory renamed /usr/src/debug/apr-util/1.6.5/misc -> /usr/src/debug/apr-util/1.6.6/misc
packages/x86-64-v3-poky-linux/apr-util/apr-util-src: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util-src: PKGSIZE changed from 1153495 to 1154698 (+0%)
packages/x86-64-v3-poky-linux/apr-util/apr-util-staticdev: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util-staticdev: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util/apr-util: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util: FILELIST: removed "/usr/lib/libaprutil-1.so.0.6.5", added "/usr/lib/libaprutil-1.so.0.6.6"
packages/x86-64-v3-poky-linux/apr-util/apr-util: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util: PV changed from "1.6.5" to "1.6.6"
packages/x86-64-v3-poky-linux/apr-util: PKGV changed from 1.6.5 [default] to 1.6.6 [default]
packages/x86-64-v3-poky-linux/apr-util: SRC_URI changed from "https://archive.apache.org/dist/apr/apr-util-1.6.5.tar.gz file://configfix.patch file://run-ptest" to "https://archive.apache.org/dist/apr/apr-util-1.6.6.tar.gz file://configfix.patch file://run-ptest"
Changes to packages/x86-64-v3-poky-linux/apr-util (sysroot):
  /usr/lib/libaprutil-1.so.0 changed symlink target from libaprutil-1.so.0.6.5 to libaprutil-1.so.0.6.6
  /usr/lib/libaprutil-1.so changed symlink target from libaprutil-1.so.0.6.5 to libaprutil-1.so.0.6.6
  /usr/lib/libaprutil-1.so.0.6.5 moved to /usr/lib/libaprutil-1.so.0.6.6

--===============6083678173577647081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/apr-util/apr-util: FILELIST: removed "/usr/lib/libaprutil-1.so.0.6.5", added "/usr/lib/libaprutil-1.so.0.6.6"
Changes to packages/x86-64-v3-poky-linux/apr-util (sysroot):
  /usr/lib/libaprutil-1.so.0 changed symlink target from libaprutil-1.so.0.6.5 to libaprutil-1.so.0.6.6
  /usr/lib/libaprutil-1.so changed symlink target from libaprutil-1.so.0.6.5 to libaprutil-1.so.0.6.6
  /usr/lib/libaprutil-1.so.0.6.5 moved to /usr/lib/libaprutil-1.so.0.6.6

--===============6083678173577647081==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-apr-util-upgrade-1.6.5-1.6.6.patch"

RnJvbSAyNmFhNmU2ZjJkMGIwZjRhMDFmZDFkNGFmYjc5Nzg0NTNjZTdmNWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNjoyMDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
ci11dGlsOiB1cGdyYWRlIDEuNi41IC0+IDEuNi42CgpDaGFuZ2VzIHdpdGggQVBSLXV0aWwgMS42
LjYKICAqKSBGaXggY3J5cHRvL2Fwcl9wYXNzd2QuYyBjb21waWxhdGlvbiBlcnJvcnMgb24gb2xk
ZXIgc3lzdGVtcy4gUFIgNzAyODMuCgogICopIEZpeCBjcmFzaGVzIGluIGFwcl9jcnlwdG9fZ2V0
X2Jsb2NrX2tleV90eXBlcygpIHdpdGggZGVmYXVsdCBjbWFrZSBidWlsZHMKICBvbgogICAgIFdp
bmRvd3MuIFBSIDcwMjYwLgotLS0KIC4uLi9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci11dGlsL2Nv
bmZpZ2ZpeC5wYXRjaCB8IDE2ICsrKysrKysrKysrKy0tLS0KIC4uLi9hcHIve2Fwci11dGlsXzEu
Ni41LmJiID0+IGFwci11dGlsXzEuNi42LmJifSB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBv
cnQvYXByL3thcHItdXRpbF8xLjYuNS5iYiA9PiBhcHItdXRpbF8xLjYuNi5iYn0gKDk3JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByLXV0aWwvY29uZmlnZml4LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci11dGlsL2NvbmZpZ2ZpeC5wYXRjaApp
bmRleCA0Y2MwYWQ3OWFlLi41MzIyZTczZDI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9hcHIvYXByLXV0aWwvY29uZmlnZml4LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2Fwci9hcHItdXRpbC9jb25maWdmaXgucGF0Y2gKQEAgLTEsOSArMSwxNyBAQAorRnJvbSBm
MDVhNTNjN2U5NTdiMjE1NzQzMzU5ZmY3ODdlZmYzMDQwZjUxZTg5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJwdXJkaWVAbGludXguaW50ZWwuY29tPgor
RGF0ZTogTW9uLCAxMiBKYW4gMjAwOSAxNzozNDo1MiArMDAwMAorU3ViamVjdDogW1BBVENIXSBh
cHIvYXByLXV0aWw6IEZpeCBzb21lIG90aGVyIGNvbmZpZyBwYXRoIGdyZW1saW5zIGJyZWFraW5n
CisKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmlndXJhdGlvbl0KKy0tLQor
IGFwdS1jb25maWcuaW4gfCAyNyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDI2IGRlbGV0aW9ucygtKQogCi1JbmRleDogYXByLXV0
aWwtMS4zLjQvYXB1LWNvbmZpZy5pbgotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGFwci11dGlsLTEuMy40Lm9y
aWcvYXB1LWNvbmZpZy5pbgkyMDA5LTAxLTEyIDE3OjA4OjA2LjAwMDAwMDAwMCArMDAwMAotKysr
IGFwci11dGlsLTEuMy40L2FwdS1jb25maWcuaW4JMjAwOS0wMS0xMiAxNzowOTowMC4wMDAwMDAw
MDAgKzAwMDAKK2RpZmYgLS1naXQgYS9hcHUtY29uZmlnLmluIGIvYXB1LWNvbmZpZy5pbgoraW5k
ZXggODIxMDllNS4uMTJkOWZjYSAxMDA2NDQKKy0tLSBhL2FwdS1jb25maWcuaW4KKysrKyBiL2Fw
dS1jb25maWcuaW4KIEBAIC0xMzksMTQgKzEzOSw3IEBAIHdoaWxlIHRlc3QgJCMgLWd0IDA7IGRv
CiAgICAgIGV4aXQgMAogICAgICA7OwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXByL2Fwci11dGlsXzEuNi41LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwci11dGls
XzEuNi42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2Fwci9hcHItdXRpbF8xLjYuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvYXByL2Fwci11dGlsXzEuNi42LmJiCmluZGV4IGJhMWUzMzU5ZmYuLmViZWZmZmNkMGQgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHItdXRpbF8xLjYuNS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByLXV0aWxfMS42LjYuYmIKQEAgLTE0LDcgKzE0
LDcgQEAgU1JDX1VSSSA9ICIke0FQQUNIRV9NSVJST1J9L2Fwci8ke0JQTn0tJHtQVn0udGFyLmd6
IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImY0M2ExYzhjNzllZWY0OTdhMDIyZWM2Yzk5ZGRkYmRmNTdlNDIwMDFk
YTZjY2JmYWUyNTk2MzFlZDVhYTI4MDUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWNkNWYzODQ0
MGVkYTgzMGU0MGM0ZmUzNWMyYTZiODExOTQ5M2NmZGJhOWM5ZDczZDk4NWMzMTdiZWI0ZTRmOCIK
IAogRVhUUkFfT0VDT05GID0gIi0td2l0aC1hcHI9JHtTVEFHSU5HX0JJTkRJUl9DUk9TU30vYXBy
LTEtY29uZmlnIFwKIAkJLS13aXRob3V0LW9kYmMgXAotLSAKMi40Ny4xCgo=

--===============6083678173577647081==--

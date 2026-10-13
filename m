Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F7ECC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 07:08:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1772.1791875291604398772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 00:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ROvAgKZm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oPSTeVgu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a134171643-5ec4bffd-83a0-42e9-8843-794de6d31094-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791875290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BAuVld43I6F4cyFfbgghECRicDLud7iZNmeWwQPx5J4=;
	b=ROvAgKZmjMupHeA6MIz19RnC3Wrw3o5yACZTjeCegiqmozzvJGDpCPY91lFPk3uf
	uac8ZtBgdSwlBpQvpKWgMksT/vKZbfsoGFus5GxeTm2smcQusTvDZ57V4mbPEDtB8oT
	ER5hqWooSA2ZyEJq00qTdiIDR8sEdAg7pZfO2RaA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791875290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BAuVld43I6F4cyFfbgghECRicDLud7iZNmeWwQPx5J4=;
	b=oPSTeVgu9t7GXV3waGFeNNVLg+j5SEWxIo+JQNitT28L6A1BNdI/yUc9xPAKIfzV
	cFzpt2DwXXq8W8V1nce1RIngOzfAKUgZMRCEnBFa61EOahcQ1R4LSorPhAY/H0oy7CN
	/d+xhH+0uXQ6k2of/hiTpxPH5kSTDOkV/V5yKuyk=
Content-Type: multipart/mixed; boundary="===============3622149745262128473=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-installer: upgrading to 1.1.0 SUCCEEDED
Message-ID: <010101a134171643-5ec4bffd-83a0-42e9-8843-794de6d31094-000000@us-west-2.amazonses.com>
Date: Tue, 13 Oct 2026 07:08:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.13-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 07:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247700

--===============3622149745262128473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-installer* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-installer-upgrade-1.0.1-1.1.0.patch
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
From b14724cd3f984c1c0303e830baa10963893aa932 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 13 Oct 2026 06:22:09 +0000
Subject: [PATCH] python3-installer: upgrade 1.0.1 -> 1.1.0

## v1.1.0 (Oct 12, 2026)
- Add early return when there are no optimization levels to compile bytecode for
- Avoid building a `pathlib.Path` object for each record entry
- Declare support for Python 3.15
- Use `os.path.commonpath` instead of `os.path.commonprefix` to address
  deprecation warnings on Python 3.15
---
 .../python/python3-installer/interpreter.patch       | 12 +++++-------
 ...installer_1.0.1.bb => python3-installer_1.1.0.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-installer_1.0.1.bb => python3-installer_1.1.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-installer/interpreter.patch b/meta/recipes-devtools/python/python3-installer/interpreter.patch
index 0a5d34a349..aa9cb6f6c3 100644
--- a/meta/recipes-devtools/python/python3-installer/interpreter.patch
+++ b/meta/recipes-devtools/python/python3-installer/interpreter.patch
@@ -1,7 +1,7 @@
-From 22fa800b4cbcfddd57fa262fd7f2aeb06a15a711 Mon Sep 17 00:00:00 2001
+From 23e4f2d9c47de7c4b855e72691217e98c1a504ba Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 14 Mar 2022 14:39:22 +0000
-Subject: [PATCH 1/2] installer: add --interpreter option
+Subject: [PATCH] installer: add --interpreter option
 
 The currently running Python might not be the right one for the installed
 wheels, so add an option to allow the interpreter to be overridden.
@@ -14,8 +14,9 @@ host might not be the right path for the scripts to use on the target.
 Upstream-Status: Submitted [https://github.com/pypa/installer/pull/332]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- src/installer/__main__.py | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
+ src/installer/__main__.py |  9 ++++++++-
+ src/installer/scripts.py  | 15 +--------------
+ 2 files changed, 9 insertions(+), 15 deletions(-)
 
 diff --git a/src/installer/__main__.py b/src/installer/__main__.py
 index b7a7445..25415ea 100644
@@ -67,6 +68,3 @@ index b21a72e..551941f 100644
 -        # I don't understand a lick what this is trying to do.
 -        return b"#!/bin/sh\n'''exec' " + quoted + b' "$0" "$@"\n' + b"' '''"
 +        return b"#!" + executable_bytes
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-installer_1.0.1.bb b/meta/recipes-devtools/python/python3-installer_1.1.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-installer_1.0.1.bb
rename to meta/recipes-devtools/python/python3-installer_1.1.0.bb
index 6727f8e21e..83e53f6a0c 100644
--- a/meta/recipes-devtools/python/python3-installer_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-installer_1.1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5038641aec7a77451e31da828ebfae00"
 
 SRC_URI += "file://interpreter.patch"
 
-SRC_URI[sha256sum] = "052c7fc3721d54c696e2dea019be67539d7b144e924f559f54beb3121831c364"
+SRC_URI[sha256sum] = "5adc0c01ce62d809989e246987cd68944fe5df8af562d0358f65b2ab15cb5de7"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============3622149745262128473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-installer-changelog.txt"

## v1.1.0 (Oct 12, 2026)
- Add early return when there are no optimization levels to compile bytecode for
- Avoid building a `pathlib.Path` object for each record entry
- Declare support for Python 3.15
- Use `os.path.commonpath` instead of `os.path.commonprefix` to address
  deprecation warnings on Python 3.15

--===============3622149745262128473==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-installer-upgrade-1.0.1-1.1.0.patch"

RnJvbSBiMTQ3MjRjZDNmOTg0YzFjMDMwM2U4MzBiYWExMDk2Mzg5M2FhOTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTMgT2N0IDIwMjYgMDY6MjI6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWluc3RhbGxlcjogdXBncmFkZSAxLjAuMSAtPiAxLjEuMAoKIyMgdjEuMS4wIChPY3Qg
MTIsIDIwMjYpCi0gQWRkIGVhcmx5IHJldHVybiB3aGVuIHRoZXJlIGFyZSBubyBvcHRpbWl6YXRp
b24gbGV2ZWxzIHRvIGNvbXBpbGUgYnl0ZWNvZGUgZm9yCi0gQXZvaWQgYnVpbGRpbmcgYSBgcGF0
aGxpYi5QYXRoYCBvYmplY3QgZm9yIGVhY2ggcmVjb3JkIGVudHJ5Ci0gRGVjbGFyZSBzdXBwb3J0
IGZvciBQeXRob24gMy4xNQotIFVzZSBgb3MucGF0aC5jb21tb25wYXRoYCBpbnN0ZWFkIG9mIGBv
cy5wYXRoLmNvbW1vbnByZWZpeGAgdG8gYWRkcmVzcwogIGRlcHJlY2F0aW9uIHdhcm5pbmdzIG9u
IFB5dGhvbiAzLjE1Ci0tLQogLi4uL3B5dGhvbi9weXRob24zLWluc3RhbGxlci9pbnRlcnByZXRl
ci5wYXRjaCAgICAgICB8IDEyICsrKysrLS0tLS0tLQogLi4uaW5zdGFsbGVyXzEuMC4xLmJiID0+
IHB5dGhvbjMtaW5zdGFsbGVyXzEuMS4wLmJifSB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3tweXRob24zLWluc3RhbGxlcl8xLjAuMS5iYiA9PiBweXRob24zLWluc3RhbGxl
cl8xLjEuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaW5zdGFsbGVyL2ludGVycHJldGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWluc3RhbGxlci9pbnRlcnByZXRlci5wYXRjaAppbmRleCAw
YTVkMzRhMzQ5Li5hYTljYjZmNmMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaW5zdGFsbGVyL2ludGVycHJldGVyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbnN0YWxsZXIvaW50ZXJwcmV0ZXIucGF0Y2gK
QEAgLTEsNyArMSw3IEBACi1Gcm9tIDIyZmE4MDBiNGNiY2ZkZGQ1N2ZhMjYyZmQ3ZjJhZWIwNmEx
NWE3MTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIzZTRmMmQ5YzQ3ZGU3YzRiODU1
ZTcyNjkxMjE3ZTk4YzFhNTA0YmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1vbiwgMTQgTWFyIDIwMjIgMTQ6
Mzk6MjIgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIGluc3RhbGxlcjogYWRkIC0taW50ZXJw
cmV0ZXIgb3B0aW9uCitTdWJqZWN0OiBbUEFUQ0hdIGluc3RhbGxlcjogYWRkIC0taW50ZXJwcmV0
ZXIgb3B0aW9uCiAKIFRoZSBjdXJyZW50bHkgcnVubmluZyBQeXRob24gbWlnaHQgbm90IGJlIHRo
ZSByaWdodCBvbmUgZm9yIHRoZSBpbnN0YWxsZWQKIHdoZWVscywgc28gYWRkIGFuIG9wdGlvbiB0
byBhbGxvdyB0aGUgaW50ZXJwcmV0ZXIgdG8gYmUgb3ZlcnJpZGRlbi4KQEAgLTE0LDggKzE0LDkg
QEAgaG9zdCBtaWdodCBub3QgYmUgdGhlIHJpZ2h0IHBhdGggZm9yIHRoZSBzY3JpcHRzIHRvIHVz
ZSBvbiB0aGUgdGFyZ2V0LgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9weXBhL2luc3RhbGxlci9wdWxsLzMzMl0KIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVy
dG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogLS0tCi0gc3JjL2luc3RhbGxlci9fX21haW5fXy5w
eSB8IDkgKysrKysrKystCi0gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQorIHNyYy9pbnN0YWxsZXIvX19tYWluX18ucHkgfCAgOSArKysrKysrKy0KKyBzcmMv
aW5zdGFsbGVyL3NjcmlwdHMucHkgIHwgMTUgKy0tLS0tLS0tLS0tLS0tCisgMiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3Jj
L2luc3RhbGxlci9fX21haW5fXy5weSBiL3NyYy9pbnN0YWxsZXIvX19tYWluX18ucHkKIGluZGV4
IGI3YTc0NDUuLjI1NDE1ZWEgMTAwNjQ0CkBAIC02Nyw2ICs2OCwzIEBAIGluZGV4IGIyMWE3MmUu
LjU1MTk0MWYgMTAwNjQ0CiAtICAgICAgICAjIEkgZG9uJ3QgdW5kZXJzdGFuZCBhIGxpY2sgd2hh
dCB0aGlzIGlzIHRyeWluZyB0byBkby4KIC0gICAgICAgIHJldHVybiBiIiMhL2Jpbi9zaFxuJycn
ZXhlYycgIiArIHF1b3RlZCArIGInICIkMCIgIiRAIlxuJyArIGIiJyAnJyciCiArICAgICAgICBy
ZXR1cm4gYiIjISIgKyBleGVjdXRhYmxlX2J5dGVzCi0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5zdGFsbGVyXzEuMC4xLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWluc3RhbGxlcl8xLjEuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaW5zdGFsbGVyXzEuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5zdGFsbGVyXzEuMS4wLmJiCmluZGV4IDY3MjdmOGUy
MWUuLjgzZTUzZjZhMGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbnN0YWxsZXJfMS4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWluc3RhbGxlcl8xLjEuMC5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NTAzODY0MWFlYzdhNzc0NTFlMzFkYTgyOGVi
ZmFlMDAiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9pbnRlcnByZXRlci5wYXRjaCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjA1MmM3ZmMzNzIxZDU0YzY5NmUyZGVhMDE5YmU2NzUzOWQ3YjE0NGU5
MjRmNTU5ZjU0YmViMzEyMTgzMWMzNjQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWFkYzBjMDFj
ZTYyZDgwOTk4OWUyNDY5ODdjZDY4OTQ0ZmU1ZGY4YWY1NjJkMDM1OGY2NWIyYWIxNWNiNWRlNyIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUKIAotLSAKMi40Ny4xCgo=

--===============3622149745262128473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-installer: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-installer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/installer/installer-1.0.1.tar.gz file://interpreter.patch" to "https://files.pythonhosted.org/packages/source/i/installer/installer-1.1.0.tar.gz file://interpreter.patch"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-dbg: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-dbg: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-dev: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-dev: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-doc: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-doc: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-locale: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-locale: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-src: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-src: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-staticdev: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer-staticdev: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-installer/python3-installer: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-installer/python3-installer: PKGSIZE changed from 1054252 to 1054352 (+0%)
packages/x86-64-v3-poky-linux/python3-installer/python3-installer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/installer-1.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/installer-1.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/installer-1.0.1.dist-info -> /usr/lib/python3.14/site-packages/installer-1.1.0.dist-info
packages/x86-64-v3-poky-linux/python3-installer/python3-installer: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-installer (sysroot):
  /usr/lib/python3.14/site-packages/installer-1.0.1.dist-info moved to /usr/lib/python3.14/site-packages/installer-1.1.0.dist-info

--===============3622149745262128473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-installer/python3-installer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/installer-1.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/installer-1.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/installer-1.0.1.dist-info -> /usr/lib/python3.14/site-packages/installer-1.1.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-installer (sysroot):
  /usr/lib/python3.14/site-packages/installer-1.0.1.dist-info moved to /usr/lib/python3.14/site-packages/installer-1.1.0.dist-info

--===============3622149745262128473==--


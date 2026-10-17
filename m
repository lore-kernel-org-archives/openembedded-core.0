Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E543CCF2C6
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 05:59:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1663.1792216782235338257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 22:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kEQ1XKQW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3A6lNXx1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a14871d113-ee4f03ad-186a-4cc4-9496-f58629c4cf98-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792216781;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GppCs5fltoTj5/RypRO9lE3S8TtdHm8e/vQJcUo/BtU=;
	b=kEQ1XKQW3tCnW3/05/i72RUiWdV1JLtWYW7fU9eJNB/bIFzNrSLOikG5PeGBirnu
	Oh1Ha3QX4poz/bZW5XcdwU6UE1nqxq+C3W/NwjQ7NP7vnsyM/dL1alw4sY95mbhhQOD
	xUogVi/rBFkETBFuk+nnGESJhWUuRI6jQnXRUnJM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792216781;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GppCs5fltoTj5/RypRO9lE3S8TtdHm8e/vQJcUo/BtU=;
	b=3A6lNXx1DleeL/qlYrnKCFR7sMlj5hvJFyllhKew+LdV7os7aLjwcLZpZb7bsSUK
	SG43Fi8v2gLlbbAP+t9VnGWD0tMVgpOF8VdudmVsiEh6cREPp2RvzS+ZgFtCrqvrCG7
	O6NhQpnrguLgkaTrlLiA8KtDFSXz+egIJKFD1CUg=
Content-Type: multipart/mixed; boundary="===============4295607374225377463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Stefano Babic <sbabic@nabladev.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libubootenv: upgrading to 0.3.8 SUCCEEDED
Message-ID: <010101a14871d113-ee4f03ad-186a-4cc4-9496-f58629c4cf98-000000@us-west-2.amazonses.com>
Date: Sat, 17 Oct 2026 05:59:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.17-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 05:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248069

--===============4295607374225377463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libubootenv* to *0.3.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libubootenv-upgrade-0.3.7-0.3.8.patch
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
From b3332e5de612f131f5ad44fc659e23b5b4ffe0be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 17 Oct 2026 05:26:34 +0000
Subject: [PATCH] libubootenv: upgrade 0.3.7 -> 0.3.8

Prepare 0.3.8
change default location of lock file to /run/fw_printenv.lock
do not create lock file with access for others
extended_config: Reject YAML configs with more than two devices
uboot_env: Handle snprintf() truncation case in .flags serialization
uboot_env: Reject too small configured environment sizes
uboot_env: Fix environment read bounds check on missing NUL terminator
uboot_env: Add comment for missing MAC / IP validation
uboot_env: Fix libuboot_validate_flags() boolean type validation
uboot_env: Reject empty strings in validate_int()
uboot_env: Handle environment cannot be locked
uboot_env: Add default FreeBSD lock file path
uboot_env: Fix Wswitch compiler warnings
extended_config: Remove unused STATE_NKEY
extended_config: Fix switch-case STATE_STOP indendation
Add ENODATA #define on FreeBSD
libubootenv: fix UBI sysfs parsing
---
 .../u-boot/{libubootenv_0.3.7.bb => libubootenv_0.3.8.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.7.bb => libubootenv_0.3.8.bb} (94%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.8.bb
similarity index 94%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.8.bb
index 854814139e..f1a77d8f8c 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "1e3511ed77f794ee5decc0974d54c8e5af26f64c"
+SRCREV = "cee53dc417462b5ec20a328e55cd860aef70fd25"
 
 inherit cmake lib_package
 
-- 
2.47.1


--===============4295607374225377463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libubootenv/libubootenv: FILELIST: removed "/usr/lib/libubootenv.so.0.3.7", added "/usr/lib/libubootenv.so.0.3.8"
Changes to packages/x86-64-v3-poky-linux/libubootenv (sysroot):
  /usr/lib/libubootenv.so.0 changed symlink target from libubootenv.so.0.3.7 to libubootenv.so.0.3.8
  /usr/lib/libubootenv.so.0.3.7 moved to /usr/lib/libubootenv.so.0.3.8

--===============4295607374225377463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libubootenv-changelog.txt"

Prepare 0.3.8
change default location of lock file to /run/fw_printenv.lock
do not create lock file with access for others
extended_config: Reject YAML configs with more than two devices
uboot_env: Handle snprintf() truncation case in .flags serialization
uboot_env: Reject too small configured environment sizes
uboot_env: Fix environment read bounds check on missing NUL terminator
uboot_env: Add comment for missing MAC / IP validation
uboot_env: Fix libuboot_validate_flags() boolean type validation
uboot_env: Reject empty strings in validate_int()
uboot_env: Handle environment cannot be locked
uboot_env: Add default FreeBSD lock file path
uboot_env: Fix Wswitch compiler warnings
extended_config: Remove unused STATE_NKEY
extended_config: Fix switch-case STATE_STOP indendation
Add ENODATA #define on FreeBSD
libubootenv: fix UBI sysfs parsing

--===============4295607374225377463==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libubootenv-upgrade-0.3.7-0.3.8.patch"

RnJvbSBiMzMzMmU1ZGU2MTJmMTMxZjVhZDQ0ZmM2NTllMjNiNWI0ZmZlMGJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTcgT2N0IDIwMjYgMDU6MjY6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1Ym9vdGVudjogdXBncmFkZSAwLjMuNyAtPiAwLjMuOAoKUHJlcGFyZSAwLjMuOApjaGFuZ2Ug
ZGVmYXVsdCBsb2NhdGlvbiBvZiBsb2NrIGZpbGUgdG8gL3J1bi9md19wcmludGVudi5sb2NrCmRv
IG5vdCBjcmVhdGUgbG9jayBmaWxlIHdpdGggYWNjZXNzIGZvciBvdGhlcnMKZXh0ZW5kZWRfY29u
ZmlnOiBSZWplY3QgWUFNTCBjb25maWdzIHdpdGggbW9yZSB0aGFuIHR3byBkZXZpY2VzCnVib290
X2VudjogSGFuZGxlIHNucHJpbnRmKCkgdHJ1bmNhdGlvbiBjYXNlIGluIC5mbGFncyBzZXJpYWxp
emF0aW9uCnVib290X2VudjogUmVqZWN0IHRvbyBzbWFsbCBjb25maWd1cmVkIGVudmlyb25tZW50
IHNpemVzCnVib290X2VudjogRml4IGVudmlyb25tZW50IHJlYWQgYm91bmRzIGNoZWNrIG9uIG1p
c3NpbmcgTlVMIHRlcm1pbmF0b3IKdWJvb3RfZW52OiBBZGQgY29tbWVudCBmb3IgbWlzc2luZyBN
QUMgLyBJUCB2YWxpZGF0aW9uCnVib290X2VudjogRml4IGxpYnVib290X3ZhbGlkYXRlX2ZsYWdz
KCkgYm9vbGVhbiB0eXBlIHZhbGlkYXRpb24KdWJvb3RfZW52OiBSZWplY3QgZW1wdHkgc3RyaW5n
cyBpbiB2YWxpZGF0ZV9pbnQoKQp1Ym9vdF9lbnY6IEhhbmRsZSBlbnZpcm9ubWVudCBjYW5ub3Qg
YmUgbG9ja2VkCnVib290X2VudjogQWRkIGRlZmF1bHQgRnJlZUJTRCBsb2NrIGZpbGUgcGF0aAp1
Ym9vdF9lbnY6IEZpeCBXc3dpdGNoIGNvbXBpbGVyIHdhcm5pbmdzCmV4dGVuZGVkX2NvbmZpZzog
UmVtb3ZlIHVudXNlZCBTVEFURV9OS0VZCmV4dGVuZGVkX2NvbmZpZzogRml4IHN3aXRjaC1jYXNl
IFNUQVRFX1NUT1AgaW5kZW5kYXRpb24KQWRkIEVOT0RBVEEgI2RlZmluZSBvbiBGcmVlQlNECmxp
YnVib290ZW52OiBmaXggVUJJIHN5c2ZzIHBhcnNpbmcKLS0tCiAuLi4vdS1ib290L3tsaWJ1Ym9v
dGVudl8wLjMuNy5iYiA9PiBsaWJ1Ym9vdGVudl8wLjMuOC5iYn0gICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtYnNwL3UtYm9vdC97bGlidWJvb3RlbnZfMC4zLjcuYmIgPT4gbGlidWJvb3RlbnZfMC4z
LjguYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJv
b3RlbnZfMC4zLjcuYmIgYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMu
OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL3Ut
Ym9vdC9saWJ1Ym9vdGVudl8wLjMuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWJzcC91LWJv
b3QvbGlidWJvb3RlbnZfMC4zLjguYmIKaW5kZXggODU0ODE0MTM5ZS4uZjFhNzdkOGY4YyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4zLjcuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4zLjguYmIKQEAgLTExLDcg
KzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjEtb3It
bGF0ZXIudHh0O21kNT00ZmJkNjUzODBjZGQyNTU5NTEKIFNFQ1RJT04gPSAibGlicyIKIAogU1JD
X1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3NiYWJpYy9saWJ1Ym9vdGVudjtwcm90b2NvbD1odHRw
czticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiMWUzNTExZWQ3N2Y3OTRlZTVk
ZWNjMDk3NGQ1NGM4ZTVhZjI2ZjY0YyIKK1NSQ1JFViA9ICJjZWU1M2RjNDE3NDYyYjVlYzIwYTMy
OGU1NWNkODYwYWVmNzBmZDI1IgogCiBpbmhlcml0IGNtYWtlIGxpYl9wYWNrYWdlCiAKLS0gCjIu
NDcuMQoK

--===============4295607374225377463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libubootenv: SRC_URI changed from "git://github.com/sbabic/libubootenv;protocol=https;branch=master;tag=v0.3.7" to "git://github.com/sbabic/libubootenv;protocol=https;branch=master;tag=v0.3.8"
packages/x86-64-v3-poky-linux/libubootenv: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-bin: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-bin: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-dbg: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-dbg: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-dbg: FILELIST: removed "/usr/lib/.debug/libubootenv.so.0.3.7", added "/usr/lib/.debug/libubootenv.so.0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-dbg: PKGSIZE changed from 116544 to 120824 (+4%)
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-dev: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-dev: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-doc: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-doc: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-locale: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-locale: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-src: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-src: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-src: FILELIST: directory renamed /usr/src/debug/libubootenv/0.3.7/src -> /usr/src/debug/libubootenv/0.3.8/src
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-src: PKGSIZE changed from 64685 to 66309 (+3%)
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-staticdev: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-staticdev: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv-staticdev: PKGSIZE changed from 148660 to 154276 (+4%)
packages/x86-64-v3-poky-linux/libubootenv/libubootenv: PV changed from "0.3.7" to "0.3.8"
packages/x86-64-v3-poky-linux/libubootenv/libubootenv: PKGV changed from 0.3.7 [default] to 0.3.8 [default]
packages/x86-64-v3-poky-linux/libubootenv/libubootenv: FILELIST: removed "/usr/lib/libubootenv.so.0.3.7", added "/usr/lib/libubootenv.so.0.3.8"
Changes to packages/x86-64-v3-poky-linux/libubootenv (sysroot):
  /usr/lib/libubootenv.so.0 changed symlink target from libubootenv.so.0.3.7 to libubootenv.so.0.3.8
  /usr/lib/libubootenv.so.0.3.7 moved to /usr/lib/libubootenv.so.0.3.8

--===============4295607374225377463==--


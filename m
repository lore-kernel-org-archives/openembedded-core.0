Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCEDC44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:50:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41714.1784699397863444881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FGYA3YOS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4ZO3LsN5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f885fa293-08d512d2-2cd5-42c7-8632-8af083602dcc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784699396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V9Sky3zRM3fnvUNvhav42u8khf2ZKSEo2YpvzxlzU7k=;
	b=FGYA3YOS8xwqFcDoh8HORH6nbBheBOF/+L2zU28LNddXnXzLdhVjK174TX/wFs1O
	MP3INr64qx3aGpi3jcvw7pjvBnQt6WRDZ+/wg0rk/+GN/RM9ihrmzYbB4rs7YhXcZgI
	3eWUE/RcEpKC8+ZFwa9RrB9WSUEAyOCf8KFpM9uo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784699396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V9Sky3zRM3fnvUNvhav42u8khf2ZKSEo2YpvzxlzU7k=;
	b=4ZO3LsN5CVcclh4wJ0CXAbxMMoilBt1QDRN1y72K6zlrhtJjT8q2ZzvmhqnYVhDS
	cOvnUC9pRBwKD5EYy6lA5nccs8q1PNZHw+GNaDsRMKOpxjp/VgJT78gbZDdl4sfJ+FV
	/94a2LRXK2DwT5dIoIS4qDZnjNrjlNd0bxga8KFg=
Content-Type: multipart/mixed; boundary="===============7284458003797839837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.4 SUCCEEDED
Message-ID: <0101019f885fa293-08d512d2-2cd5-42c7-8632-8af083602dcc-000000@us-west-2.amazonses.com>
Date: Wed, 22 Jul 2026 05:49:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.22-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241586

--===============7284458003797839837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.3-3.0.4.patch
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
From 99ed1c7dfff4ceac977e7add0e07abc84d7557cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 22 Jul 2026 05:28:33 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.3 -> 3.0.4

Source: NEWS

Changes from 3.0.3 to 3.0.4:
----------------------------

* Fix a crash (stack overflow) triggered by a crafted .pc file containing a
  self-referential fragment variable, such as `x=$${x}` referenced from Cflags.
  Fragment variables are now evaluated only once while re-splitting.  Found
  through fuzzing.

* Fix over-escaping of variable values containing backslash-escaped whitespace,
  such as paths quoted with `printf %q`.  Such a value was stored with its
  escapes intact and then escaped a second time when rendered into a fragment,
  producing output like `-L/a\\\ dir`.  This broke meson's test suite, which
  uses paths with spaces to stay Windows-safe.

* Fix mangled and duplicated -L/-I paths on Windows when PKG_CONFIG_SYSROOT_DIR
  and PKG_CONFIG_LIBDIR are set.  Path separators are now normalized to forward
  slashes for all runtime-injected paths (sysroot, build root, search paths and
  pcfiledir), so that sysroot matching and injection operate on a consistent
  basis.

* Fix `--define-prefix` dropping a path separator when the redefined prefix ends
  with a trailing slash, and only rewrite a package's directories when they match
  the original prefix on a path component boundary.

* Fix single-package queries returning results drawn from more than the requested
  module, by restoring the package limit that was lost during a refactor of the
  query builder.
---
 .../pkgconf/{pkgconf_3.0.3.bb => pkgconf_3.0.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.3.bb => pkgconf_3.0.4.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
index dfb6919ff7..0abd0fa923 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "aa033abb2b777ba4e66635495a931e53c49d86e4e4e38af68c0f76d666cbd8cf"
+SRC_URI[sha256sum] = "91ce346b47f46b87d680c6928e6c43240b9cdc7a31afbea19f2298de4dbe266d"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============7284458003797839837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.4.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 767168 to 767992 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 42032 to 42096 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.3/libpkgconf -> /usr/src/debug/pkgconf/3.0.4/libpkgconf, directory renamed /usr/src/debug/pkgconf/3.0.3/cli -> /usr/src/debug/pkgconf/3.0.4/cli, directory renamed /usr/src/debug/pkgconf/3.0.3/cli/pccritic -> /usr/src/debug/pkgconf/3.0.4/cli/pccritic, directory renamed /usr/src/debug/pkgconf/3.0.3/cli/bomtool -> /usr/src/debug/pkgconf/3.0.4/cli/bomtool, directory renamed /usr/src/debug/pkgconf/3.0.3/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.4/cli/spdxtool
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 552262 to 556853 (+1%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.3 [default] to 3.0.4 [default]

--===============7284458003797839837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.3-3.0.4.patch"

RnJvbSA5OWVkMWM3ZGZmZjRjZWFjOTc3ZTdhZGQwZTA3YWJjODRkNzU1N2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjIgSnVsIDIwMjYgMDU6Mjg6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDMuMC4zIC0+IDMuMC40CgpTb3VyY2U6IE5FV1MKCkNoYW5nZXMgZnJv
bSAzLjAuMyB0byAzLjAuNDoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKKiBGaXggYSBj
cmFzaCAoc3RhY2sgb3ZlcmZsb3cpIHRyaWdnZXJlZCBieSBhIGNyYWZ0ZWQgLnBjIGZpbGUgY29u
dGFpbmluZyBhCiAgc2VsZi1yZWZlcmVudGlhbCBmcmFnbWVudCB2YXJpYWJsZSwgc3VjaCBhcyBg
eD0kJHt4fWAgcmVmZXJlbmNlZCBmcm9tIENmbGFncy4KICBGcmFnbWVudCB2YXJpYWJsZXMgYXJl
IG5vdyBldmFsdWF0ZWQgb25seSBvbmNlIHdoaWxlIHJlLXNwbGl0dGluZy4gIEZvdW5kCiAgdGhy
b3VnaCBmdXp6aW5nLgoKKiBGaXggb3Zlci1lc2NhcGluZyBvZiB2YXJpYWJsZSB2YWx1ZXMgY29u
dGFpbmluZyBiYWNrc2xhc2gtZXNjYXBlZCB3aGl0ZXNwYWNlLAogIHN1Y2ggYXMgcGF0aHMgcXVv
dGVkIHdpdGggYHByaW50ZiAlcWAuICBTdWNoIGEgdmFsdWUgd2FzIHN0b3JlZCB3aXRoIGl0cwog
IGVzY2FwZXMgaW50YWN0IGFuZCB0aGVuIGVzY2FwZWQgYSBzZWNvbmQgdGltZSB3aGVuIHJlbmRl
cmVkIGludG8gYSBmcmFnbWVudCwKICBwcm9kdWNpbmcgb3V0cHV0IGxpa2UgYC1ML2FcXFwgZGly
YC4gIFRoaXMgYnJva2UgbWVzb24ncyB0ZXN0IHN1aXRlLCB3aGljaAogIHVzZXMgcGF0aHMgd2l0
aCBzcGFjZXMgdG8gc3RheSBXaW5kb3dzLXNhZmUuCgoqIEZpeCBtYW5nbGVkIGFuZCBkdXBsaWNh
dGVkIC1MLy1JIHBhdGhzIG9uIFdpbmRvd3Mgd2hlbiBQS0dfQ09ORklHX1NZU1JPT1RfRElSCiAg
YW5kIFBLR19DT05GSUdfTElCRElSIGFyZSBzZXQuICBQYXRoIHNlcGFyYXRvcnMgYXJlIG5vdyBu
b3JtYWxpemVkIHRvIGZvcndhcmQKICBzbGFzaGVzIGZvciBhbGwgcnVudGltZS1pbmplY3RlZCBw
YXRocyAoc3lzcm9vdCwgYnVpbGQgcm9vdCwgc2VhcmNoIHBhdGhzIGFuZAogIHBjZmlsZWRpciks
IHNvIHRoYXQgc3lzcm9vdCBtYXRjaGluZyBhbmQgaW5qZWN0aW9uIG9wZXJhdGUgb24gYSBjb25z
aXN0ZW50CiAgYmFzaXMuCgoqIEZpeCBgLS1kZWZpbmUtcHJlZml4YCBkcm9wcGluZyBhIHBhdGgg
c2VwYXJhdG9yIHdoZW4gdGhlIHJlZGVmaW5lZCBwcmVmaXggZW5kcwogIHdpdGggYSB0cmFpbGlu
ZyBzbGFzaCwgYW5kIG9ubHkgcmV3cml0ZSBhIHBhY2thZ2UncyBkaXJlY3RvcmllcyB3aGVuIHRo
ZXkgbWF0Y2gKICB0aGUgb3JpZ2luYWwgcHJlZml4IG9uIGEgcGF0aCBjb21wb25lbnQgYm91bmRh
cnkuCgoqIEZpeCBzaW5nbGUtcGFja2FnZSBxdWVyaWVzIHJldHVybmluZyByZXN1bHRzIGRyYXdu
IGZyb20gbW9yZSB0aGFuIHRoZSByZXF1ZXN0ZWQKICBtb2R1bGUsIGJ5IHJlc3RvcmluZyB0aGUg
cGFja2FnZSBsaW1pdCB0aGF0IHdhcyBsb3N0IGR1cmluZyBhIHJlZmFjdG9yIG9mIHRoZQogIHF1
ZXJ5IGJ1aWxkZXIuCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZfMy4wLjMuYmIgPT4gcGtnY29u
Zl8zLjAuNC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2Nv
bmYve3BrZ2NvbmZfMy4wLjMuYmIgPT4gcGtnY29uZl8zLjAuNC5iYn0gKDk3JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC4zLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuNC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25m
XzMuMC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25m
XzMuMC40LmJiCmluZGV4IGRmYjY5MTlmZjcuLjBhYmQwZmE5MjMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjMuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuNC5iYgpAQCAtMjAsNyArMjAsNyBAQCBT
UkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRpdmUuaW4gXAogICAgIGZpbGU6
Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFhMDMzYWJi
MmI3NzdiYTRlNjY2MzU0OTVhOTMxZTUzYzQ5ZDg2ZTRlNGUzOGFmNjhjMGY3NmQ2NjZjYmQ4Y2Yi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTFjZTM0NmI0N2Y0NmI4N2Q2ODBjNjkyOGU2YzQzMjQw
YjljZGM3YTMxYWZiZWExOWYyMjk4ZGU0ZGJlMjY2ZCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
InBrZ2NvbmYtKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKVwudGFyIgogCiBpbmhlcml0
IGF1dG90b29scyBwa2djb25maWcKLS0gCjIuNDcuMQoK

--===============7284458003797839837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changelog for pkgconf: 3.0.3 -> 3.0.4
Source: NEWS

Changes from 3.0.3 to 3.0.4:
----------------------------

* Fix a crash (stack overflow) triggered by a crafted .pc file containing a
  self-referential fragment variable, such as `x=$${x}` referenced from Cflags.
  Fragment variables are now evaluated only once while re-splitting.  Found
  through fuzzing.

* Fix over-escaping of variable values containing backslash-escaped whitespace,
  such as paths quoted with `printf %q`.  Such a value was stored with its
  escapes intact and then escaped a second time when rendered into a fragment,
  producing output like `-L/a\\\ dir`.  This broke meson's test suite, which
  uses paths with spaces to stay Windows-safe.

* Fix mangled and duplicated -L/-I paths on Windows when PKG_CONFIG_SYSROOT_DIR
  and PKG_CONFIG_LIBDIR are set.  Path separators are now normalized to forward
  slashes for all runtime-injected paths (sysroot, build root, search paths and
  pcfiledir), so that sysroot matching and injection operate on a consistent
  basis.

* Fix `--define-prefix` dropping a path separator when the redefined prefix ends
  with a trailing slash, and only rewrite a package's directories when they match
  the original prefix on a path component boundary.

* Fix single-package queries returning results drawn from more than the requested
  module, by restoring the package limit that was lost during a refactor of the
  query builder.

--===============7284458003797839837==--


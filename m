Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.488.1793944899596367584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ucb/lO4E;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CJLUVcA8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1af72cd24-bb0ab83c-bbf7-4fda-a262-8bcd01ce4825-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h4T2nOxKVz500yEWPSBxi++dWeHBaAK7/fp5CmRipwc=;
	b=Ucb/lO4E4CbONKEZf+uI4dlMq67QmoY6Ikc+aWONnAb3oqpb8ZXHj4g+v8fGLdzw
	TQdCegsZflQXjQ8u/OU2jjiAjceUVzSFygxOgoH7ugnC3kNTj+Q1uLXPvLZXU4NlVko
	MdYFE/nzXqtBAleiLKaVGR0OVsOrG9DuhR96xFKk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h4T2nOxKVz500yEWPSBxi++dWeHBaAK7/fp5CmRipwc=;
	b=CJLUVcA8GZFM0cX2M3m3UvpTS9nOPZtFqiHVoWxGoa132M1zoaxC3OcYx1pxoRp0
	L8eGTPRAodl1I/CvCuyEDLvOvOqmrvFFgPAMaUi6ck1S5K+m7U1lxqUGEV8N/zepWmQ
	/YayhSJG+YAQ5EsOnNbKFom+JuPFDkXxQNxtsaJQ=
Content-Type: multipart/mixed; boundary="===============6549744756560120857=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zlib: upgrading to 1.4 SUCCEEDED
Message-ID: <010101a1af72cd24-bb0ab83c-bbf7-4fda-a262-8bcd01ce4825-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249589

--===============6549744756560120857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *zlib* to *1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-zlib-upgrade-1.3.2-1.4.patch
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
From 844704596437d179c03d3e4706d3ff45f00ac06d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 6 Nov 2026 05:37:36 +0000
Subject: [PATCH] zlib: upgrade 1.3.2 -> 1.4

Changes in 1.4 (4 Nov 2026)
- Change CMake library names on MSVC
- Return z_off_t default to long for portability
- Fail gzopen() with "x" if O_EXCL not available
- Deliver all gzip data before reporting error
- Fix gzwrite() buffer overflow (CVE-2026-85091)
- Fix inflateGetDictionary() write past buffer on invalid window size
- Fix window write overrun after inflateSync()
- Fix read before provided data after repeated inflatePrime()'s
- Fix write past pending buffer after repeated deflatePrime()'s
- Fix copy of uninitialized memory by inflateBack() on invalid data
- Fix copy of uninitialized memory after gzseek() as first write action
- Fix read outside window after a deflateResetKeep() mid-stream
- Avoid out-of-bounds pointer arithmetic in infback9() (CVE-2026-4738)
- Fix several vulnerabilities in contrib/minizip
- Fix truncated stream detection in gzread()
- Fix pending skip handling in gzread()
- Fix loss of zero fill on repeated gzseek()'s when writing
- Fix inaccurate total_in after Z_NEED_DICT returned
- Detect and report bad deflateSetDictionary() calls
- Avoid undefined behaviors in C language usage
- Fix minizip extra field overflows when almost full and need Zip64
- Don't assume NULL is defined in compress.c and uncompr.c
- Use the generated zconf.h when building test programs out of tree
- Improve portability and functionality of CMake builds
- Provide 64-bit file offsets on Windows with #defines as on Linux
- Improve portability to Android, AIX, PowerPC, s390x, and Windows
- Use a PCG random number generator instead of rand() in minizip
- Clarify documentation
- (See https://github.com/madler/zlib for all 195 commits)
---
 meta/recipes-core/zlib/{zlib_1.3.2.bb => zlib_1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/zlib/{zlib_1.3.2.bb => zlib_1.4.bb} (94%)

diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-core/zlib/zlib_1.4.bb
similarity index 94%
rename from meta/recipes-core/zlib/zlib_1.3.2.bb
rename to meta/recipes-core/zlib/zlib_1.4.bb
index 8a23d98cd3..89f952ce7f 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://zlib.net/${BP}.tar.gz \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16"
+SRC_URI[sha256sum] = "02dd159783677a749c04adbdd02b55b8a2bcc7e054f51b76b549199a916ad584"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
-- 
2.47.1


--===============6549744756560120857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/zlib: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib: SRC_URI changed from "https://zlib.net/zlib-1.3.2.tar.gz file://run-ptest" to "https://zlib.net/zlib-1.4.tar.gz file://run-ptest"
Changes to packages/x86-64-v3-poky-linux/zlib (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so.1.4 was added
  /usr/lib/libz.so.1.3.2 was removed
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: FILELIST: removed "/usr/lib/.debug/libz.so.1.3.2", added "/usr/lib/.debug/libz.so.1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: PKGSIZE changed from 278576 to 281680 (+1%)
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-dev: PKGSIZE changed from 121028 to 122406 (+1%)
packages/x86-64-v3-poky-linux/zlib/zlib-dev: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-dev: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-doc: PKGSIZE changed from 4482 to 4479 (-0%)
packages/x86-64-v3-poky-linux/zlib/zlib-doc: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-doc: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-locale: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-locale: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-ptest: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-ptest: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-src: FILELIST: directory renamed /usr/src/debug/zlib/1.3.2 -> /usr/src/debug/zlib/1.4, directory renamed /usr/src/debug/zlib/1.3.2/test -> /usr/src/debug/zlib/1.4/test
packages/x86-64-v3-poky-linux/zlib/zlib-src: PKGSIZE changed from 1123110 to 1131587 (+1%)
packages/x86-64-v3-poky-linux/zlib/zlib-src: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-src: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-staticdev: PKGSIZE changed from 384150 to 388142 (+1%)
packages/x86-64-v3-poky-linux/zlib/zlib-staticdev: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib-staticdev: PKGV changed from 1.3.2 [default] to 1.4 [default]
packages/x86-64-v3-poky-linux/zlib/zlib: FILELIST: removed "/usr/lib/libz.so.1.3.2", added "/usr/lib/libz.so.1.4"
packages/x86-64-v3-poky-linux/zlib/zlib: PKGSIZE changed from 108605 to 108595 (-0%)
packages/x86-64-v3-poky-linux/zlib/zlib: PV changed from "1.3.2" to "1.4"
packages/x86-64-v3-poky-linux/zlib/zlib: PKGV changed from 1.3.2 [default] to 1.4 [default]
Changes to packages/x86_64-linux/zlib-native (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so.1.4 was added
  /usr/lib/libz.so.1.3.2 was removed

--===============6549744756560120857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="zlib-changelog.txt"

Changes in 1.4 (4 Nov 2026)
- Change CMake library names on MSVC
- Return z_off_t default to long for portability
- Fail gzopen() with "x" if O_EXCL not available
- Deliver all gzip data before reporting error
- Fix gzwrite() buffer overflow (CVE-2026-85091)
- Fix inflateGetDictionary() write past buffer on invalid window size
- Fix window write overrun after inflateSync()
- Fix read before provided data after repeated inflatePrime()'s
- Fix write past pending buffer after repeated deflatePrime()'s
- Fix copy of uninitialized memory by inflateBack() on invalid data
- Fix copy of uninitialized memory after gzseek() as first write action
- Fix read outside window after a deflateResetKeep() mid-stream
- Avoid out-of-bounds pointer arithmetic in infback9() (CVE-2026-4738)
- Fix several vulnerabilities in contrib/minizip
- Fix truncated stream detection in gzread()
- Fix pending skip handling in gzread()
- Fix loss of zero fill on repeated gzseek()'s when writing
- Fix inaccurate total_in after Z_NEED_DICT returned
- Detect and report bad deflateSetDictionary() calls
- Avoid undefined behaviors in C language usage
- Fix minizip extra field overflows when almost full and need Zip64
- Don't assume NULL is defined in compress.c and uncompr.c
- Use the generated zconf.h when building test programs out of tree
- Improve portability and functionality of CMake builds
- Provide 64-bit file offsets on Windows with #defines as on Linux
- Improve portability to Android, AIX, PowerPC, s390x, and Windows
- Use a PCG random number generator instead of rand() in minizip
- Clarify documentation
- (See https://github.com/madler/zlib for all 195 commits)

--===============6549744756560120857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/zlib (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so.1.4 was added
  /usr/lib/libz.so.1.3.2 was removed
packages/x86-64-v3-poky-linux/zlib/zlib: FILELIST: removed "/usr/lib/libz.so.1.3.2", added "/usr/lib/libz.so.1.4"
Changes to packages/x86_64-linux/zlib-native (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so changed symlink target from libz.so.1.3.2 to libz.so.1.4
  /usr/lib/libz.so.1.4 was added
  /usr/lib/libz.so.1.3.2 was removed

--===============6549744756560120857==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-zlib-upgrade-1.3.2-1.4.patch"

RnJvbSA4NDQ3MDQ1OTY0MzdkMTc5YzAzZDNlNDcwNmQzZmY0NWYwMGFjMDZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNiBOb3YgMjAyNiAwNTozNzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHps
aWI6IHVwZ3JhZGUgMS4zLjIgLT4gMS40CgpDaGFuZ2VzIGluIDEuNCAoNCBOb3YgMjAyNikKLSBD
aGFuZ2UgQ01ha2UgbGlicmFyeSBuYW1lcyBvbiBNU1ZDCi0gUmV0dXJuIHpfb2ZmX3QgZGVmYXVs
dCB0byBsb25nIGZvciBwb3J0YWJpbGl0eQotIEZhaWwgZ3pvcGVuKCkgd2l0aCAieCIgaWYgT19F
WENMIG5vdCBhdmFpbGFibGUKLSBEZWxpdmVyIGFsbCBnemlwIGRhdGEgYmVmb3JlIHJlcG9ydGlu
ZyBlcnJvcgotIEZpeCBnendyaXRlKCkgYnVmZmVyIG92ZXJmbG93IChDVkUtMjAyNi04NTA5MSkK
LSBGaXggaW5mbGF0ZUdldERpY3Rpb25hcnkoKSB3cml0ZSBwYXN0IGJ1ZmZlciBvbiBpbnZhbGlk
IHdpbmRvdyBzaXplCi0gRml4IHdpbmRvdyB3cml0ZSBvdmVycnVuIGFmdGVyIGluZmxhdGVTeW5j
KCkKLSBGaXggcmVhZCBiZWZvcmUgcHJvdmlkZWQgZGF0YSBhZnRlciByZXBlYXRlZCBpbmZsYXRl
UHJpbWUoKSdzCi0gRml4IHdyaXRlIHBhc3QgcGVuZGluZyBidWZmZXIgYWZ0ZXIgcmVwZWF0ZWQg
ZGVmbGF0ZVByaW1lKCkncwotIEZpeCBjb3B5IG9mIHVuaW5pdGlhbGl6ZWQgbWVtb3J5IGJ5IGlu
ZmxhdGVCYWNrKCkgb24gaW52YWxpZCBkYXRhCi0gRml4IGNvcHkgb2YgdW5pbml0aWFsaXplZCBt
ZW1vcnkgYWZ0ZXIgZ3pzZWVrKCkgYXMgZmlyc3Qgd3JpdGUgYWN0aW9uCi0gRml4IHJlYWQgb3V0
c2lkZSB3aW5kb3cgYWZ0ZXIgYSBkZWZsYXRlUmVzZXRLZWVwKCkgbWlkLXN0cmVhbQotIEF2b2lk
IG91dC1vZi1ib3VuZHMgcG9pbnRlciBhcml0aG1ldGljIGluIGluZmJhY2s5KCkgKENWRS0yMDI2
LTQ3MzgpCi0gRml4IHNldmVyYWwgdnVsbmVyYWJpbGl0aWVzIGluIGNvbnRyaWIvbWluaXppcAot
IEZpeCB0cnVuY2F0ZWQgc3RyZWFtIGRldGVjdGlvbiBpbiBnenJlYWQoKQotIEZpeCBwZW5kaW5n
IHNraXAgaGFuZGxpbmcgaW4gZ3pyZWFkKCkKLSBGaXggbG9zcyBvZiB6ZXJvIGZpbGwgb24gcmVw
ZWF0ZWQgZ3pzZWVrKCkncyB3aGVuIHdyaXRpbmcKLSBGaXggaW5hY2N1cmF0ZSB0b3RhbF9pbiBh
ZnRlciBaX05FRURfRElDVCByZXR1cm5lZAotIERldGVjdCBhbmQgcmVwb3J0IGJhZCBkZWZsYXRl
U2V0RGljdGlvbmFyeSgpIGNhbGxzCi0gQXZvaWQgdW5kZWZpbmVkIGJlaGF2aW9ycyBpbiBDIGxh
bmd1YWdlIHVzYWdlCi0gRml4IG1pbml6aXAgZXh0cmEgZmllbGQgb3ZlcmZsb3dzIHdoZW4gYWxt
b3N0IGZ1bGwgYW5kIG5lZWQgWmlwNjQKLSBEb24ndCBhc3N1bWUgTlVMTCBpcyBkZWZpbmVkIGlu
IGNvbXByZXNzLmMgYW5kIHVuY29tcHIuYwotIFVzZSB0aGUgZ2VuZXJhdGVkIHpjb25mLmggd2hl
biBidWlsZGluZyB0ZXN0IHByb2dyYW1zIG91dCBvZiB0cmVlCi0gSW1wcm92ZSBwb3J0YWJpbGl0
eSBhbmQgZnVuY3Rpb25hbGl0eSBvZiBDTWFrZSBidWlsZHMKLSBQcm92aWRlIDY0LWJpdCBmaWxl
IG9mZnNldHMgb24gV2luZG93cyB3aXRoICNkZWZpbmVzIGFzIG9uIExpbnV4Ci0gSW1wcm92ZSBw
b3J0YWJpbGl0eSB0byBBbmRyb2lkLCBBSVgsIFBvd2VyUEMsIHMzOTB4LCBhbmQgV2luZG93cwot
IFVzZSBhIFBDRyByYW5kb20gbnVtYmVyIGdlbmVyYXRvciBpbnN0ZWFkIG9mIHJhbmQoKSBpbiBt
aW5pemlwCi0gQ2xhcmlmeSBkb2N1bWVudGF0aW9uCi0gKFNlZSBodHRwczovL2dpdGh1Yi5jb20v
bWFkbGVyL3psaWIgZm9yIGFsbCAxOTUgY29tbWl0cykKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS96
bGliL3t6bGliXzEuMy4yLmJiID0+IHpsaWJfMS40LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3Jl
L3psaWIve3psaWJfMS4zLjIuYmIgPT4gemxpYl8xLjQuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvemxpYi96bGliXzEuMy4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUv
emxpYi96bGliXzEuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29yZS96bGliL3psaWJfMS4zLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3Jl
L3psaWIvemxpYl8xLjQuYmIKaW5kZXggOGEyM2Q5OGNkMy4uODlmOTUyY2U3ZiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvemxpYi96bGliXzEuMy4yLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL3psaWIvemxpYl8xLjQuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJodHRw
czovL3psaWIubmV0LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNL
X1VSSSA9ICJodHRwOi8vemxpYi5uZXQvIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmIzMjlh
MGEyY2QwMjc0ZDA1NTE5ZDYxYzY2N2MwNjJlMDY5OTBkNzJlMTI1ZWUyZGZhOGRlNjRmMDExOWQx
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMmRkMTU5NzgzNjc3YTc0OWMwNGFkYmRkMDJiNTVi
OGEyYmNjN2UwNTRmNTFiNzZiNTQ5MTk5YTkxNmFkNTg0IgogCiAjIFdoZW4gYSBuZXcgcmVsZWFz
ZSBpcyBtYWRlIHRoZSBwcmV2aW91cyByZWxlYXNlIGlzIG1vdmVkIHRvIGZvc3NpbHMvLCBzbyBh
ZGQgdGhpcwogIyB0byBQUkVNSVJST1JTIHNvIGl0IGlzIGFsc28gc2VhcmNoZWQgYXV0b21hdGlj
YWxseS4KLS0gCjIuNDcuMQoK

--===============6549744756560120857==--

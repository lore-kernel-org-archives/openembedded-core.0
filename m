Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12060.1795238992692618429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eCejG3Y6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NEM7j+L+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1fc951827-bd792985-0fc4-4560-b470-7f2d84b5f5c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795238992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Laayhl/M189ZxlZz0Ch9ZqB91k6709tQpct8gTUuENA=;
	b=eCejG3Y6R7drdMG7yod/62UX2RtlOwgpCC5SF7RgUXyCymgz910N9ArR0hNtcaPL
	CoqyF8SLTyjcFcM1JmsTxu9DkejZCLrIcF7A+ysBHVnNvI/DZzXvxHfrCJI0UfMDS4Z
	NGmqWu2ix3sW/JSr4PAmz8o7lEFTnW6PVcvGTNbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795238992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Laayhl/M189ZxlZz0Ch9ZqB91k6709tQpct8gTUuENA=;
	b=NEM7j+L+GUn4SQaXv4xQa9N2zQYxJ1irbhoNMNprJJ5T98/s+/XT/VOhJlN5GHUk
	4X53i7FuEi38oAMoyW6uU847kcIB8alXoj5+woibzl4jDKaLtNs2tKA3c8jZyC0mBPr
	079rWLy0Edn+dzRyIQwdhL/KCiGuGj5Oo5NXw+oo=
Content-Type: multipart/mixed; boundary="===============0532532552744561591=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Kusuma Dirisala <kusuma.dirisala@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 2.3.1 SUCCEEDED
Message-ID: <010101a1fc951827-bd792985-0fc4-4560-b470-7f2d84b5f5c1-000000@us-west-2.amazonses.com>
Date: Sat, 21 Nov 2026 05:29:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.21-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250834

--===============0532532552744561591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gpgme* to *2.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-2.2.0-2.3.1.patch
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
From 7e1b7501718cb2f96e6a503b3c89bbbc46e97a5d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 21 Nov 2026 05:22:36 +0000
Subject: [PATCH] gpgme: upgrade 2.2.0 -> 2.3.1

Release 2.3.1.
Fix a stupid regression.
Release 2.3.0.
Prepare for Dilithium support in gpg.
Improve code in engine-gpg for easier debugging.
Fix a double free in the status line read code.
tests:gpgsm: Fix for fallback hash algorithm change in gpgsm.
Add the Kyber variant GPGME_PK_MLKEM and MLDSA from RFC9980.
build: Adjust online target for the new server.
---
 ...Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 2 +-
 .../gpgme/0001-autogen.sh-remove-unknown-in-version.patch     | 2 +-
 meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch         | 4 ++--
 .../gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch  | 2 +-
 .../gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch    | 2 +-
 ...gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch | 2 +-
 meta/recipes-support/gpgme/{gpgme_2.2.0.bb => gpgme_2.3.1.bb} | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.2.0.bb => gpgme_2.3.1.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 2a1cccea1a..0bec1d26c2 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 1f5bb22e9ef35e18649ed35097be46279ed843c1 Mon Sep 17 00:00:00 2001
+From 180eb4402864beca0e922f73d7de673595ac1a6f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 14 Oct 2025 14:12:55 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 2fb0960feb..5843427257 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 7be35847fae645873aa65aafccc5d45a110c6ecc Mon Sep 17 00:00:00 2001
+From 2740a15121a666c9382aa82bd0a5ec4f02f2af38 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 25e9ed4307..d01309f28a 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 36e642f39cc607a5e2132915c633ad6bedd1128d Mon Sep 17 00:00:00 2001
+From 75083127e0a5940e862b6636f03684b62c62741f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
@@ -29,7 +29,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index ee56d99..51c0598 100644
+index 584af47..2db4588 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -845,6 +845,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index 7f05987a12..9a9c90db15 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From 83f407dc19254d87a8df570d5d8a7232182b6e8f Mon Sep 17 00:00:00 2001
+From 513acc97eb5da26b518819eb937f8fef799eff93 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index 868596fb83..13b0835ab3 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From 30c085ee02dfb819c07f0b6ec06730b7fa0c8ff4 Mon Sep 17 00:00:00 2001
+From f811725aca49f8197ef10284af6234fb41367792 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 3427b37f16..d49e88b062 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 59bb7404bc594a6a724eafa38322b57422a66ab8 Mon Sep 17 00:00:00 2001
+From 670188464d4d787cff0b3319ba15254b76c660f2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme_2.2.0.bb b/meta/recipes-support/gpgme/gpgme_2.3.1.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_2.2.0.bb
rename to meta/recipes-support/gpgme/gpgme_2.3.1.bb
index bffa0b40e4..739313073f 100644
--- a/meta/recipes-support/gpgme/gpgme_2.2.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.3.1.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "7160e80e84dafd00d956c84891c533bb7ab16a6a54fbe1574b2f3acf0496977b"
+SRC_URI[sha256sum] = "2bf94e0e677e5a8fc31f79dd323f91c5416b36fb851058bc1e8bce39f2642434"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 
-- 
2.47.1


--===============0532532552744561591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.2.0", added "/usr/lib/libgpgme.so.45.3.1"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.2.0 to libgpgme.so.45.3.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.2.0 to libgpgme.so.45.3.1
  /usr/lib/libgpgme.so.45.2.0 moved to /usr/lib/libgpgme.so.45.3.1

--===============0532532552744561591==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-2.2.0-2.3.1.patch"

RnJvbSA3ZTFiNzUwMTcxOGNiMmY5NmU2YTUwM2IzYzg5YmJiYzQ2ZTk3YTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjEgTm92IDIwMjYgMDU6MjI6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cGdtZTogdXBncmFkZSAyLjIuMCAtPiAyLjMuMQoKUmVsZWFzZSAyLjMuMS4KRml4IGEgc3R1cGlk
IHJlZ3Jlc3Npb24uClJlbGVhc2UgMi4zLjAuClByZXBhcmUgZm9yIERpbGl0aGl1bSBzdXBwb3J0
IGluIGdwZy4KSW1wcm92ZSBjb2RlIGluIGVuZ2luZS1ncGcgZm9yIGVhc2llciBkZWJ1Z2dpbmcu
CkZpeCBhIGRvdWJsZSBmcmVlIGluIHRoZSBzdGF0dXMgbGluZSByZWFkIGNvZGUuCnRlc3RzOmdw
Z3NtOiBGaXggZm9yIGZhbGxiYWNrIGhhc2ggYWxnb3JpdGhtIGNoYW5nZSBpbiBncGdzbS4KQWRk
IHRoZSBLeWJlciB2YXJpYW50IEdQR01FX1BLX01MS0VNIGFuZCBNTERTQSBmcm9tIFJGQzk5ODAu
CmJ1aWxkOiBBZGp1c3Qgb25saW5lIHRhcmdldCBmb3IgdGhlIG5ldyBzZXJ2ZXIuCi0tLQogLi4u
UmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5wYXRj
aCB8IDIgKy0KIC4uLi9ncGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVy
c2lvbi5wYXRjaCAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8w
MDAxLXBrZ2NvbmZpZy5wYXRjaCAgICAgICAgIHwgNCArKy0tCiAuLi4vZ3BnbWUvMDAwMS1wb3Np
eC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0X3QucGF0Y2ggIHwgMiArLQogLi4uL2dw
Z21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaCAgICB8
IDIgKy0KIC4uLmdwZ21lLWNvbmZpZy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmll
cy1pbi0ucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS97Z3BnbWVfMi4y
LjAuYmIgPT4gZ3BnbWVfMi4zLjEuYmJ9IHwgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3Bn
bWUve2dwZ21lXzIuMi4wLmJiID0+IGdwZ21lXzIuMy4xLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtUmV2ZXJ0LWJ1aWxkLU1ha2Ut
Z3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtUmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdw
Z3J0LWNvbmZpZy13aXRoLS5wYy5wYXRjaAppbmRleCAyYTFjY2NlYTFhLi4wYmVjMWQyNmMyIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLVJldmVydC1i
dWlsZC1NYWtlLWdwZ21lLm00LXVzZS1ncGdydC1jb25maWctd2l0aC0ucGMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1SZXZlcnQtYnVpbGQtTWFrZS1n
cGdtZS5tNC11c2UtZ3BncnQtY29uZmlnLXdpdGgtLnBjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAxZjViYjIyZTllZjM1ZTE4NjQ5ZWQzNTA5N2JlNDYyNzllZDg0M2MxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAxODBlYjQ0MDI4NjRiZWNhMGU5MjJmNzNkN2RlNjczNTk1YWMx
YTZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNCBPY3QgMjAyNSAxNDoxMjo1NSArMDgwMAog
U3ViamVjdDogW1BBVENIXSBSZXZlcnQgImJ1aWxkOiBNYWtlIGdwZ21lLm00IHVzZSBncGdydC1j
b25maWcgd2l0aCAqLnBjLiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21l
L2dwZ21lLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5rbm93bi1pbi12ZXJzaW9uLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11
bmtub3duLWluLXZlcnNpb24ucGF0Y2gKaW5kZXggMmZiMDk2MGZlYi4uNTg0MzQyNzI1NyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1hdXRvZ2VuLnNo
LXJlbW92ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ3BnbWUvZ3BnbWUvMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdiZTM1ODQ3ZmFlNjQ1ODczYWE2NWFhZmNjYzVk
NDVhMTEwYzZlY2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI3NDBhMTUxMjFhNjY2
YzkzODJhYTgyYmQwYTVlYzRmMDJmMmFmMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDI2IE5v
diAyMDI0IDIzOjIzOjQyIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF1dG9nZW4uc2g6IHJlbW92
ZSAnLXVua25vd24nIGluIHZlcnNpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0Y2gKaW5kZXggMjVlOWVkNDMwNy4uZDAxMzA5
ZjI4YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1w
a2djb25maWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAw
MS1wa2djb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM2ZTY0MmYzOWNjNjA3YTVl
MjEzMjkxNWM2MzNhZDZiZWRkMTEyOGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc1
MDgzMTI3ZTBhNTk0MGU4NjJiNjYzNmYwMzY4NGI2MmM2Mjc0MWYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBNb24sIDIxIEp1bCAyMDI1IDEyOjQzOjI5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBrZ2Nv
bmZpZwpAQCAtMjksNyArMjksNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNyYy9ncGdtZS1wdGhyZWFk
LnBjLmluCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4
IGVlNTZkOTkuLjUxYzA1OTggMTAwNjQ0CitpbmRleCA1ODRhZjQ3Li4yZGI0NTg4IDEwMDY0NAog
LS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04NDUsNiArODQ1LDcg
QEAgQUNfQ09ORklHX0ZJTEVTKE1ha2VmaWxlIHNyYy9NYWtlZmlsZQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wb3NpeC1pby5jLVVzZS1vZmZfdC1p
bnN0ZWFkLW9mLW9mZjY0X3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdt
ZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaAppbmRl
eCA3ZjA1OTg3YTEyLi45YTljOTBkYjE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRf
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4
LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gODNmNDA3ZGMxOTI1NGQ4N2E4ZGY1NzBkNWQ4YTcyMzIxODJiNmU4ZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTEzYWNjOTdlYjVkYTI2YjUxODgxOWViOTM3ZjhmZWY3OTll
ZmY5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1IERlYyAyMDIyIDA4OjQ0OjEzIC0wODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHBvc2l4LWlvLmM6IFVzZSBvZmZfdCBpbnN0ZWFkIG9mIG9mZjY0X3QKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJv
bS1vbi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dw
Z21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRj
aAppbmRleCA4Njg1OTZmYjgzLi4xM2IwODM1YWIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXVzZS1jbG9zZWZyb20tb24tbGludXgtYW5kLWdsaWJj
LTIuMzQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS11
c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1nbGliYy0yLjM0LnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAzMGMwODVlZTAyZGZiODE5YzA3ZjBiNmVjMDY3MzBiN2ZhMGM4ZmY0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmODExNzI1YWNhNDlmODE5N2VmMTAyODRhZjYyMzRmYjQx
MzY3NzkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTUgSnVsIDIwMjEgMTI6MzM6MTMgLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gdXNlIGNsb3NlZnJvbSgpIG9uIGxpbnV4IGFuZCBnbGliYyAyLjM0KwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1ncGdtZS1jb25m
aWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1ncGdtZS1jb25maWctc2tpcC1hbGwtbGli
LW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNoCmluZGV4IDM0MjdiMzdmMTYuLmQ0OWU4
OGIwNjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDUt
Z3BnbWUtY29uZmlnLXNraXAtYWxsLWxpYi1vci11c3ItbGliLWRpcmVjdG9yaWVzLWluLS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNvbmZp
Zy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDU5YmI3NDA0YmM1OTRhNmE3MjRlYWZhMzgzMjJiNTc0MjJhNjZhYjggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY3MDE4ODQ2NGQ0ZDc4N2NmZjBiMzMxOWJhMTUy
NTRiNzZjNjYwZjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTMgQXByIDIwMTcgMTY6
NDA6MjcgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ3BnbWUtY29uZmlnOiBza2lwIGFsbCAvbGli
KiBvciAvdXNyL2xpYiogZGlyZWN0b3JpZXMgaW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lXzIuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUv
Z3BnbWVfMi4zLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lXzIuMy4xLmJiCmluZGV4IGJmZmEwYjQwZTQuLjczOTMxMzA3M2Yg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMi4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMy4xLmJiCkBAIC0yNCw3ICsy
NCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2dwZ21lLyR7QlB9LnRhci5iejIgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNp
b24ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MTYwZTgw
ZTg0ZGFmZDAwZDk1NmM4NDg5MWM1MzNiYjdhYjE2YTZhNTRmYmUxNTc0YjJmM2FjZjA0OTY5Nzdi
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiZjk0ZTBlNjc3ZTVhOGZjMzFmNzlkZDMyM2Y5MWM1
NDE2YjM2ZmI4NTEwNThiYzFlOGJjZTM5ZjI2NDI0MzQiCiAKIERFUEVORFMgPSAibGliZ3BnLWVy
cm9yLW5hdGl2ZSBsaWJncGctZXJyb3IgbGliYXNzdWFuIgogCi0tIAoyLjQ3LjEKCg==

--===============0532532552744561591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.45.2.0", added "/usr/lib/.debug/libgpgme.so.45.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 2278976 to 2280720 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 107596 to 107733 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: FILELIST: directory renamed /usr/src/debug/gpgme/2.2.0/src -> /usr/src/debug/gpgme/2.3.1/src, directory renamed /usr/src/debug/gpgme/2.2.0/tools -> /usr/src/debug/gpgme/2.3.1/tools
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 1346859 to 1348348 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.2.0", added "/usr/lib/libgpgme.so.45.3.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PV changed from "2.2.0" to "2.3.1"
packages/x86-64-v3-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.2.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.3.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/x86-64-v3-poky-linux/gpgme: PKGV changed from 2.2.0 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/gpgme: PV changed from "2.2.0" to "2.3.1"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.2.0 to libgpgme.so.45.3.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.2.0 to libgpgme.so.45.3.1
  /usr/lib/libgpgme.so.45.2.0 moved to /usr/lib/libgpgme.so.45.3.1

--===============0532532552744561591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gpgme-changelog.txt"

Release 2.3.1.
Fix a stupid regression.
Release 2.3.0.
Prepare for Dilithium support in gpg.
Improve code in engine-gpg for easier debugging.
Fix a double free in the status line read code.
tests:gpgsm: Fix for fallback hash algorithm change in gpgsm.
Add the Kyber variant GPGME_PK_MLKEM and MLDSA from RFC9980.
build: Adjust online target for the new server.

--===============0532532552744561591==--

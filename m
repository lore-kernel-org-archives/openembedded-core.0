Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E246C2BA18
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1118.1714579215531497306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R7WB0Jja;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PxxI3kwQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f34e29644-d40d73de-57d7-442a-bf3c-b586fe0d98f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B+t5CTRHc8KLBAGW72/aqSTAhOBl1TFai9aBCWRCO8M=;
	b=R7WB0JjaB3dwFtCZCjTZ0trSjRw0O7htdWt9/FfqGf4Y9WEzY7cncY8rvlepwRy2
	0JcNJsaP8G2gRRs5KIE/mdg4LhPm5K67HrgFvsILa7z6O78cnFfQZu+yYwvUZSYWyT1
	BVPT+1vJaLjwAc8BQt5beER7DTp6BQuV26iFF5+Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B+t5CTRHc8KLBAGW72/aqSTAhOBl1TFai9aBCWRCO8M=;
	b=PxxI3kwQP4V+guj25bNbS53ZaN7NSnwXzLsPj/01SY/plgIJTiJi71aAjRROz8U9
	NklzhH3kcv5M+kK+1gJWD321yX8vsbI+pRoEoKZpoQyWk73RRjp309lEOuQ8MW9WKha
	GyCR1DeNMpPGET9dRiONrbCvGdA/fhh/THvz5sRM=
Content-Type: multipart/mixed; boundary="===============8312383809475758953=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.0.6 SUCCEEDED
Message-ID: <0101018f34e29644-d40d73de-57d7-442a-bf3c-b586fe0d98f0-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198836

--===============8312383809475758953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *24.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-24.0.5-24.0.6.patch
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
From 805320a62efe76edfd608955b0821f23a55e4039 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 11:37:15 +0000
Subject: [PATCH] mesa: upgrade 24.0.5 -> 24.0.6

---
 ...1-Revert-meson-do-not-pull-in-clc-for-clover.patch |  4 ++--
 .../files/0001-drisw-fix-build-without-dri3.patch     | 11 ++++-------
 ...meson-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...ild-check-for-all-linux-host_os-combinations.patch |  4 ++--
 ...glxext-don-t-try-zink-if-not-enabled-in-mesa.patch |  9 +++------
 meta/recipes-graphics/mesa/mesa.inc                   |  2 +-
 .../mesa/{mesa_24.0.5.bb => mesa_24.0.6.bb}           |  0
 7 files changed, 13 insertions(+), 19 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.6.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
index 1711e22585..efd8a6702b 100644
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
@@ -1,4 +1,4 @@
-From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
+From a1aad6583e073523139e1edc7116dcd14ea88edd Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 8 Mar 2024 15:53:11 +0100
 Subject: [PATCH] Revert "meson: do not pull in clc for clover"
@@ -18,7 +18,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 2db6185..741b5d1 100644
+index d0d9c5a..277093a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -813,6 +813,7 @@ if _opencl != 'disabled'
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
index ab16152090..bb1da96485 100644
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
@@ -1,7 +1,7 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
+From ae2d8a262faa51019de3a3e58edf72399888f308 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
+Subject: [PATCH] drisw: fix build without dri3
 
 commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
 added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
+index cbba547..6f07709 100644
 --- a/src/glx/drisw_glx.c
 +++ b/src/glx/drisw_glx.c
 @@ -32,7 +32,9 @@
@@ -45,7 +45,7 @@ index 3d3f752..4b19e2d 100644
     if (pdpyp->zink) {
        bool err;
        psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+@@ -1007,6 +1010,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
           goto handle_error;
        }
     }
@@ -53,6 +53,3 @@ index 3d3f752..4b19e2d 100644
  
     glx_config_destroy_list(psc->base.configs);
     psc->base.configs = configs;
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46..336ffb1dd4 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From a18a10d65871fa039c16e46a6f397faec3f6b03a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 7be7d81eeb..c7a2a7036f 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From e8ec6b1cc5e401ba719095722d8b317d755ae613 Mon Sep 17 00:00:00 2001
+From 54309a782d3e06e5b890576786cdf902bc30fd69 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -19,7 +19,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 133fd9a..817861e 100644
+index 8963b31..d0d9c5a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -128,7 +128,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
index 036a0b4945..863ff2ae14 100644
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -1,7 +1,7 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
+From 8fd3b8a45317b7c4f2cabc260c5c911f5403126d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
+Subject: [PATCH] glxext: don't try zink if not enabled in mesa
 
 Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
 added an automatic zink fallback even when the zink gallium is not
@@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
+index fd53e00..31e8511 100644
 --- a/src/glx/glxext.c
 +++ b/src/glx/glxext.c
 @@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
@@ -37,6 +37,3 @@ index 05c825a..7a06aa9 100644
     }
  #endif /* GLX_USE_DRM */
     if (glx_direct)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 77e9c80fcb..0110c4e837 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
+SRC_URI[sha256sum] = "8b7a92dbe6468c18f2383700135b5fe9de836cdf0cc8fd7dbae3c7110237d604"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.5.bb b/meta/recipes-graphics/mesa/mesa_24.0.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.5.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.6.bb
-- 
2.44.0


--===============8312383809475758953==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-24.0.5-24.0.6.patch"

RnJvbSA4MDUzMjBhNjJlZmU3NmVkZmQ2MDg5NTViMDgyMWYyM2E1NWU0MDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMTozNzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2E6IHVwZ3JhZGUgMjQuMC41IC0+IDI0LjAuNgoKLS0tCiAuLi4xLVJldmVydC1tZXNvbi1kby1u
b3QtcHVsbC1pbi1jbGMtZm9yLWNsb3Zlci5wYXRjaCB8ICA0ICsrLS0KIC4uLi9maWxlcy8wMDAx
LWRyaXN3LWZpeC1idWlsZC13aXRob3V0LWRyaTMucGF0Y2ggICAgIHwgMTEgKysrKy0tLS0tLS0K
IC4uLm1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoIHwg
IDIgKy0KIC4uLmlsZC1jaGVjay1mb3ItYWxsLWxpbnV4LWhvc3Rfb3MtY29tYmluYXRpb25zLnBh
dGNoIHwgIDQgKystLQogLi4uZ2x4ZXh0LWRvbi10LXRyeS16aW5rLWlmLW5vdC1lbmFibGVkLWlu
LW1lc2EucGF0Y2ggfCAgOSArKystLS0tLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9tZXNhL3ttZXNhXzI0LjAuNS5i
YiA9PiBtZXNhXzI0LjAuNi5iYn0gICAgICAgICAgIHwgIDAKIDcgZmlsZXMgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2Eve21lc2FfMjQuMC41LmJiID0+IG1lc2FfMjQuMC42LmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLVJldmVydC1tZXNv
bi1kby1ub3QtcHVsbC1pbi1jbGMtZm9yLWNsb3Zlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9tZXNhL2ZpbGVzLzAwMDEtUmV2ZXJ0LW1lc29uLWRvLW5vdC1wdWxsLWluLWNsYy1mb3It
Y2xvdmVyLnBhdGNoCmluZGV4IDE3MTFlMjI1ODUuLmVmZDhhNjcwMmIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtUmV2ZXJ0LW1lc29uLWRvLW5vdC1w
dWxsLWluLWNsYy1mb3ItY2xvdmVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL2ZpbGVzLzAwMDEtUmV2ZXJ0LW1lc29uLWRvLW5vdC1wdWxsLWluLWNsYy1mb3ItY2xvdmVy
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwNTFmNDFiZWRhNTQwZjBhZTc3YjM0MWRiMDFh
NmRlODNjOWU5MzhhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMWFhZDY1ODNlMDcz
NTIzMTM5ZTFlZGM3MTE2ZGNkMTRlYTg4ZWRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTogRnJpLCA4IE1hciAyMDI0
IDE1OjUzOjExICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAibWVzb246IGRvIG5vdCBw
dWxsIGluIGNsYyBmb3IgY2xvdmVyIgpAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBN
YXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCi1pbmRleCAyZGI2MTg1Li43NDFiNWQxIDEwMDY0NAoraW5kZXggZDBkOWM1YS4u
Mjc3MDkzYSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAg
LTgxMyw2ICs4MTMsNyBAQCBpZiBfb3BlbmNsICE9ICdkaXNhYmxlZCcKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZHJpc3ctZml4LWJ1aWxkLXdpdGhv
dXQtZHJpMy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZHJp
c3ctZml4LWJ1aWxkLXdpdGhvdXQtZHJpMy5wYXRjaAppbmRleCBhYjE2MTUyMDkwLi5iYjFkYTk2
NDg1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWRy
aXN3LWZpeC1idWlsZC13aXRob3V0LWRyaTMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvZmlsZXMvMDAwMS1kcmlzdy1maXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoCkBA
IC0xLDcgKzEsNyBAQAotRnJvbSA0YmQxNWE0MTllODkyZGE4NDM0ODljMzc0YzU4YzViMjljNDBi
NWQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZTJkOGEyNjJmYWE1MTAxOWRlM2Ez
ZTU4ZWRmNzIzOTk4ODhmMzA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CiBEYXRlOiBUdWUsIDYgRmViIDIwMjQgMDk6
NDc6MDkgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIGRyaXN3OiBmaXggYnVpbGQgd2l0aG91
dCBkcmkzCitTdWJqZWN0OiBbUEFUQ0hdIGRyaXN3OiBmaXggYnVpbGQgd2l0aG91dCBkcmkzCiAK
IGNvbW1pdCAxODg3MzY4ZGY0MSAoImdseC9zdzogY2hlY2sgZm9yIG1vZGlmaWVyIHN1cHBvcnQg
aW4gdGhlIGtvcHBlciBwYXRoIikKIGFkZGVkIGRyaTNfcHJpdi5oIGhlYWRlciBhbmQgZHJpM19j
aGVja19tdWx0aWJ1ZmZlcigpIGZ1bmN0aW9uIGluIGRyaXN3IHRoYXQKQEAgLTI0LDcgKzI0LDcg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvZ2x4L2RyaXN3X2ds
eC5jIGIvc3JjL2dseC9kcmlzd19nbHguYwotaW5kZXggM2QzZjc1Mi4uNGIxOWUyZCAxMDA2NDQK
K2luZGV4IGNiYmE1NDcuLjZmMDc3MDkgMTAwNjQ0CiAtLS0gYS9zcmMvZ2x4L2RyaXN3X2dseC5j
CiArKysgYi9zcmMvZ2x4L2RyaXN3X2dseC5jCiBAQCAtMzIsNyArMzIsOSBAQApAQCAtNDUsNyAr
NDUsNyBAQCBpbmRleCAzZDNmNzUyLi40YjE5ZTJkIDEwMDY0NAogICAgIGlmIChwZHB5cC0+emlu
aykgewogICAgICAgIGJvb2wgZXJyOwogICAgICAgIHBzYy0+aGFzX211bHRpYnVmZmVyID0gZHJp
M19jaGVja19tdWx0aWJ1ZmZlcihwcml2LT5kcHksICZlcnIpOwotQEAgLTEwMDUsNiArMTAwOCw3
IEBAIGRyaXN3Q3JlYXRlU2NyZWVuRHJpdmVyKGludCBzY3JlZW4sIHN0cnVjdCBnbHhfZGlzcGxh
eSAqcHJpdiwKK0BAIC0xMDA3LDYgKzEwMTAsNyBAQCBkcmlzd0NyZWF0ZVNjcmVlbkRyaXZlcihp
bnQgc2NyZWVuLCBzdHJ1Y3QgZ2x4X2Rpc3BsYXkgKnByaXYsCiAgICAgICAgICAgZ290byBoYW5k
bGVfZXJyb3I7CiAgICAgICAgfQogICAgIH0KQEAgLTUzLDYgKzUzLDMgQEAgaW5kZXggM2QzZjc1
Mi4uNGIxOWUyZCAxMDA2NDQKICAKICAgICBnbHhfY29uZmlnX2Rlc3Ryb3lfbGlzdChwc2MtPmJh
c2UuY29uZmlncyk7CiAgICAgcHNjLT5iYXNlLmNvbmZpZ3MgPSBjb25maWdzOwotLS0gCi0yLjQ0
LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1t
ZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1h
dG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKaW5kZXggYmFhOThhMGQ0Ni4uMzM2ZmZiMWRkNCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1t
aXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRv
bWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMmNjMjE4MDBm
ZTI5ZjU2NmFkZDUyNWU2M2Y2MTljMDUzNmQ2ZTdiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBhMThhMTBkNjU4NzFmYTAzOWMxNmU0NmE2ZjM5N2ZhZWMzZjZiMDNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6
IE1vbiwgMTMgSmFuIDIwMjAgMTU6MjM6NDcgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24g
bWlzZGV0ZWN0cyA2NGJpdCBhdG9taWNzIG9uIG1pcHMvY2xhbmcKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtY2hlY2stZm9yLWFs
bC1saW51eC1ob3N0X29zLWNvbWJpbmF0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtY2hlY2stZm9yLWFsbC1saW51eC1ob3N0X29z
LWNvbWJpbmF0aW9ucy5wYXRjaAppbmRleCA3YmU3ZDgxZWViLi5jN2EyYTcwMzZmIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNo
ZWNrLWZvci1hbGwtbGludXgtaG9zdF9vcy1jb21iaW5hdGlvbnMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1jaGVjay1mb3ItYWxs
LWxpbnV4LWhvc3Rfb3MtY29tYmluYXRpb25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBl
OGVjNmIxY2M1ZTQwMWJhNzE5MDk1NzIyZDhiMzE3ZDc1NWFlNjEzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA1NDMwOWE3ODJkM2UwNmU1Yjg5MDU3Njc4NmNkZjkwMmJjMzBmZDY5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJA
YWxpc3RhaXIyMy5tZT4KIERhdGU6IFRodSwgMTQgTm92IDIwMTkgMTM6MDQ6NDkgLTA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IGNoZWNrIGZvciBhbGwgbGludXggaG9zdF9vcyBj
b21iaW5hdGlvbnMKQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJh
bmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNv
bi5idWlsZAotaW5kZXggMTMzZmQ5YS4uODE3ODYxZSAxMDA2NDQKK2luZGV4IDg5NjNiMzEuLmQw
ZDljNWEgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0x
MjgsNyArMTI4LDcgQEAgd2l0aF9hbnlfb3BlbmdsID0gd2l0aF9vcGVuZ2wgb3Igd2l0aF9nbGVz
MSBvciB3aXRoX2dsZXMyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9m
aWxlcy8wMDAyLWdseGV4dC1kb24tdC10cnktemluay1pZi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMi1nbHhleHQtZG9uLXQt
dHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVzYS5wYXRjaAppbmRleCAwMzZhMGI0OTQ1Li44
NjNmZjJhZTE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8w
MDAyLWdseGV4dC1kb24tdC10cnktemluay1pZi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItZ2x4ZXh0LWRvbi10LXRy
eS16aW5rLWlmLW5vdC1lbmFibGVkLWluLW1lc2EucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9t
IDYyNDk1ZWJiOTc3ODY2YzUyZDViZWQ4NDk5YTU0N2M0OWYwZDliYzEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDhmZDNiOGE0NTMxN2I3YzRmMmNhYmMyNjBjNWM5MTFmNTQwMzEyNmQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KIERhdGU6IFR1ZSwgNiBGZWIgMjAyNCAwOTo0NzoxMCArMDEwMAotU3ViamVj
dDogW1BBVENIIDIvMl0gZ2x4ZXh0OiBkb24ndCB0cnkgemluayBpZiBub3QgZW5hYmxlZCBpbiBt
ZXNhCitTdWJqZWN0OiBbUEFUQ0hdIGdseGV4dDogZG9uJ3QgdHJ5IHppbmsgaWYgbm90IGVuYWJs
ZWQgaW4gbWVzYQogCiBDb21taXQgN2Q5ZWE3N2I0NTkgKCJnbHg6IGFkZCBhdXRvbWF0aWMgemlu
ayBmYWxsYmFjayBsb2FkaW5nIGJldHdlZW4gaHcgYW5kIHN3IGRyaXZlcnMiKQogYWRkZWQgYW4g
YXV0b21hdGljIHppbmsgZmFsbGJhY2sgZXZlbiB3aGVuIHRoZSB6aW5rIGdhbGxpdW0gaXMgbm90
CkBAIC0yMiw3ICsyMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEv
c3JjL2dseC9nbHhleHQuYyBiL3NyYy9nbHgvZ2x4ZXh0LmMKLWluZGV4IDA1YzgyNWEuLjdhMDZh
YTkgMTAwNjQ0CitpbmRleCBmZDUzZTAwLi4zMWU4NTExIDEwMDY0NAogLS0tIGEvc3JjL2dseC9n
bHhleHQuYwogKysrIGIvc3JjL2dseC9nbHhleHQuYwogQEAgLTkwOCw5ICs5MDgsMTEgQEAgX19n
bFhJbml0aWFsaXplKERpc3BsYXkgKiBkcHkpCkBAIC0zNyw2ICszNywzIEBAIGluZGV4IDA1Yzgy
NWEuLjdhMDZhYTkgMTAwNjQ0CiAgICAgfQogICNlbmRpZiAvKiBHTFhfVVNFX0RSTSAqLwogICAg
IGlmIChnbHhfZGlyZWN0KQotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNh
LmluYwppbmRleCA3N2U5YzgwZmNiLi4wMTEwYzRlODM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9tZXNhLmluYwpAQCAtMjIsNyArMjIsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vbWVzYS5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZS9tZXNhLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLVJldmVydC1tZXNvbi1kby1ub3QtcHVsbC1pbi1jbGMtZm9yLWNsb3Zlci5wYXRjaCBc
CiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOGNjMjQ1Y2E4ZmFhM2M2OWRhNmQyNjg3Zjg5
MDYzNzcwMDFmNjMzNjUzNDhhNjJjYzZmN2ZhZmIxZThjMDE4IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjhiN2E5MmRiZTY0NjhjMThmMjM4MzcwMDEzNWI1ZmU5ZGU4MzZjZGYwY2M4ZmQ3ZGJhZTNj
NzExMDIzN2Q2MDQiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2
ZXI+XGQrKFwuXGQrKSspIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9tZXNhXzI0LjAuNS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2FfMjQuMC42
LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9tZXNhXzI0LjAuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvbWVzYV8yNC4wLjYuYmIKLS0gCjIuNDQuMAoK

--===============8312383809475758953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-24.0.5.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch" to "https://mesa.freedesktop.org/archive/mesa-24.0.6.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch"
packages/core2-64-poky-linux/mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libegl-mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgbm-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgbm-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgbm: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgbm: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgl-mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libglapi-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libglapi-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libglapi: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libglapi: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgles1-mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgles2-mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libgles3-mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libglx-mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libopencl-mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libosmesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libosmesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libosmesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libosmesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libxatracker-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libxatracker-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/libxatracker: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/libxatracker: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 253480752 to 253490536 (+0%)
packages/core2-64-poky-linux/mesa/mesa-dbg: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-dev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-doc: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-doc: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-locale: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-locale: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 22995287 to 22999383 (+0%)
packages/core2-64-poky-linux/mesa/mesa-megadriver: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-src: PKGSIZE changed from 153682856 to 153687941 (+0%)
packages/core2-64-poky-linux/mesa/mesa-src: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-src: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-staticdev: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-staticdev: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-tools: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-tools: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 26324869 to 26328965 (+0%)
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 24.0.5 [default] to 24.0.6 [default]
packages/core2-64-poky-linux/mesa/mesa: PV changed from "24.0.5" to "24.0.6"
packages/core2-64-poky-linux/mesa/mesa: PKGV changed from 24.0.5 [default] to 24.0.6 [default]

--===============8312383809475758953==--


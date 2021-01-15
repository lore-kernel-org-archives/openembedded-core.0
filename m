Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.722.1610713822881228403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6C6C838C13CF
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.0.14 FAILED
Message-ID: <MADEUP.165A67B09303AAF5.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146799
Content-Type: multipart/mixed; boundary="===============5563643679065297307=="

--===============5563643679065297307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.0.14* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.0.12-2.0.14.patch
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

--===============5563643679065297307==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.0.12-2.0.14.patch"

From c39fd032aadee593ee0d0391d4127c664370cae0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 07:55:48 +0000
Subject: [PATCH] libsdl2: upgrade 2.0.12 -> 2.0.14

---
 .../libsdl2/directfb-renderfillrect-fix.patch | 33 -------------
 ...ectfb-spurious-curly-brace-missing-e.patch | 49 -------------------
 .../{libsdl2_2.0.12.bb => libsdl2_2.0.14.bb}  |  7 +--
 3 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.12.bb => libsdl2_2.0.14.bb} (93%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
deleted file mode 100644
index 83d4f4b1ec..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-# HG changeset patch
-# User Sam Lantinga <slouken@libsdl.org>
-# Date 1590793369 25200
-# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
-# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
-Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
-
-Lacky
-
-It looks like refactoring of SDL2 internal API has broken SDL_RenderFillRect for DirectFB. In new version function SDL_RenderFillRect returns 0, but rectangle is not visible.
-
-Replacing "count" with "len" in the argument list for SDL_memcpy in DirectFB_QueueFillRects fixes problem.
-
---
-
-The patch was imported from the libsdl Mercurial repository
-(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
-
-Upstream-Status: Backport
-
-Signed-off-by: Mark Jonas <toertel@gmail.com>
-
-diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_render.c
---- a/src/video/directfb/SDL_DirectFB_render.c	Thu May 21 00:06:09 2020 -0400
-+++ b/src/video/directfb/SDL_DirectFB_render.c	Fri May 29 16:02:49 2020 -0700
-@@ -626,7 +626,7 @@
-     }
-
-     cmd->data.draw.count = count;
--    SDL_memcpy(verts, rects, count);
-+    SDL_memcpy(verts, rects, len);
-     return 0;
- }
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
deleted file mode 100644
index aa351a89ba..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-# HG changeset patch
-# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
-# Date 1585069551 25200
-# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
-# Parent  63387e8920f58f608288f247824ec5f4c286691f
-src/video/directfb/SDL_DirectFB_render.c: fix build
-Build with directfb is broken due to a spurious '}' and a missing 'E'
-since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
-
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a switch statement
-  202 |         case SDL_BLENDMODE_MUL:
-      |         ^~~~
-
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
-  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
-      |                                                                   ^~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
---
-
-The patch was imported from the libsdl Mercurial repository
-(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
-
-Upstream-Status: Backport
-
-Signed-off-by: Mark Jonas <toertel@gmail.com>
-
-
-diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_render.c
---- a/src/video/directfb/SDL_DirectFB_render.c	Mon Mar 23 14:10:25 2020 -0700
-+++ b/src/video/directfb/SDL_DirectFB_render.c	Tue Mar 24 10:05:51 2020 -0700
-@@ -198,11 +198,10 @@
-             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));
-
-             break;
--        }
-         case SDL_BLENDMODE_MUL:
-             data->blitFlags = DSBLIT_BLEND_ALPHACHANNEL;
-             data->drawFlags = DSDRAW_BLEND;
--            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
-+            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));
-             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));
-
-             break;
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
similarity index 93%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
index 5fa99821c4..4cba35aec2 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
@@ -18,14 +18,11 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
-           file://directfb-spurious-curly-brace-missing-e.patch \
-           file://directfb-renderfillrect-fix.patch \
-"
+           "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "783b6f2df8ff02b19bb5ce492b99c8ff"
-SRC_URI[sha256sum] = "349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863"
+SRC_URI[sha256sum] = "d8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
-- 
2.27.0


--===============5563643679065297307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1420 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1420 targets, 33 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2786d4fb6a2f075cbab15b5baaffdf4c9255f1e8"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2786d4fb6a2f075cbab15b5baaffdf4c9255f1e8"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 201 Found 193 Missed 8 Current 875 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2453 of 3362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_fetch)
NOTE: recipe libsdl2-2.0.14-r0: task do_fetch: Started
NOTE: recipe libsdl2-2.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2823 of 3362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_unpack)
NOTE: Running task 2824 of 3362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.0.14-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsdl2-2.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 3351 of 3362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_patch)
NOTE: recipe libsdl2-2.0.14-r0: task do_patch: Started
NOTE: recipe libsdl2-2.0.14-r0: task do_patch: Succeeded
NOTE: Running task 3352 of 3362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 3353 of 3362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_populate_lic)
NOTE: recipe libsdl2-2.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsdl2-2.0.14-r0: task do_populate_lic: Started
NOTE: recipe libsdl2-2.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsdl2-2.0.14-r0: task do_populate_lic: Succeeded
NOTE: recipe libsdl2-2.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3354 of 3362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_configure)
NOTE: recipe libsdl2-2.0.14-r0: task do_configure: Started
ERROR: libsdl2-2.0.14-r0 do_configure: QA Issue: libsdl2: configure was passed unrecognised options: --disable-input-tslib [unknown-configure-option]
ERROR: libsdl2-2.0.14-r0 do_configure: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsdl2/2.0.14-r0/temp/log.do_configure.2334414
NOTE: recipe libsdl2-2.0.14-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3354 tasks of which 3347 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============5563643679065297307==--

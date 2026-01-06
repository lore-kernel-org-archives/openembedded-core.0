Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DA3CEFD0D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:54:52 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100470.1767732884833116963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JJOAPigk;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ba3ffd54dbso179009585a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767732883; x=1768337683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFE8P/+cRoD/CEEChNNYPWozIGFSho3dtuE9LQPbGso=;
        b=JJOAPigkvridtSaib1kykTE1iry2A+CL3WW2DDNGgufWJFxsHAmvtgrDHP6xzfejaE
         5N3xXRpd5rxuBgfjDpvmmaqj+1hqADh6uG8QK+rfEx3qsK2cgkvxdPM/2YRdffZBjGWr
         KmEewGUIXDlEM4tCtp3WxqtTaQYf72McqtthuPElpbKDx7ns1sUST8V6J7urjDWyMmM9
         lwMViu1OJOr4uXBlMMPcgrOsnRdx/erE8cV4E/dSBT6tZHTFwG9suDshLM7DDRI6F6ot
         7mRx6NLPFKIhouI+r3qYaxpLXaCU9rrfKlkqETgGes7Le+0bmGp2WA/f3gkskn1kPT+E
         RgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732883; x=1768337683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFE8P/+cRoD/CEEChNNYPWozIGFSho3dtuE9LQPbGso=;
        b=ptKpA/cH2NnY3DOV2/y+UWo15SZNuNkOy1wfyRULOXHdFhTvPNQR96LIsSZjtME1ti
         x5alfHGFXbSCIbBsuvUDPqxb1ZQqIj3SUdeNnc0Qg0OVfC9jYObR9ZzWAO/gk0vUttSZ
         X7ItvEVyAPRc5+gmCiekwGydSEPOhDkv6wnFdykIT60yJ4REHH7U8kyGaYnppdGVGjBK
         CAp/ZsQqVZ5PuXcbLaj2qC/q4KQ/TaAPg8dI4aZb7aaxfClWCoxL1BbcDssp2vPp9R0X
         VxyIoDz8GpGsRh9buIlF6dT/fJGLJGruI+jeJO7QSugKb/Atlv0OcRzPakma8gpTczGO
         iQsw==
X-Gm-Message-State: AOJu0YxV/FAUkifEwF27h4AyQYu3GR5DNRlLAiGtLF61L/CqfCys39FT
	IPjCBBOeP/bObu+VPAR3hURgf1o4A54QBxO8g3RyvJ/H4Lr/LNqdc5HcWhCGvC6IvCr19YOfmWq
	LHx8pneI=
X-Gm-Gg: AY/fxX617t7ixPCtB/2fYb+n5UDsNB6cpaSQlCVMtqYWUVthbZW5UHudW+/MRQbFBR2
	trJW17rWWIYFPPj1O9JXU3iTF9Q4CjRLTF5ooL3IwEMwZ9iGtQ7mUNsww9FPHG9oVNPxMEYggCz
	v/uPz0/YliIG3sI+Twdfh1y/edJN0uYwDnUyfeI++JZH1iLQgpzxHDve53uHUcqg7T0+zn2L6wE
	p2VlMZygzh8LAHIseERDKPSWG96NmtkMHLts7mZ+HvVrzgwqKAR0FxCtJL15HWO5xxW+Ik1IpIm
	tEAw1UXGvUcpTFQskAUr1I8Tl66zrhw8IdMtN7861h4XeNUilG30knx6gF0jmk5NmLxcME/rV+d
	KN/bgbO9npIRg+nC44z252J6XP+VkPZ3akM24sy22KWcIgsC2cpRYydKJMvgwTKrSQq6fKpy6zQ
	IxLpCrSwix0m404sg=
X-Google-Smtp-Source: AGHT+IHPHEO3Tfu5fwFS/4yEZQ4vhZnMAjUE3wd7c+MVdeSLILsVL3I9VLys7uC43njNYRXg3CqIFw==
X-Received: by 2002:a05:622a:4c83:b0:4f1:b3cc:2d04 with SMTP id d75a77b69052e-4ffb49f713dmr3047011cf.44.1767732883031;
        Tue, 06 Jan 2026 12:54:43 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234405sm21809546d6.30.2026.01.06.12.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:54:42 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH 2/2] piglit: fix numpy 2.4.x compatibility
Date: Tue,  6 Jan 2026 15:54:38 -0500
Message-ID: <20260106205438.994413-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106205438.994413-1-tgamblin@baylibre.com>
References: <20260106205438.994413-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228931

numpy has removed the deprecated 'newshape' parameter from its reshape()
function, which is causing piglit build failures like:

|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 536, in _simulate_function
|     expected_output = python_equivalent(*inputs)
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 311, in _divide
|     if any(y_element == 0 for y_element in column_major_values(y)):
|                                            ~~~~~~~~~~~~~~~~~~~^^^
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 257, in column_major_values
|     return list(np.reshape(value, newshape=-1, order='F'))
|                 ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| TypeError: reshape() got an unexpected keyword argument 'newshape'

Backport a patch (submitted upstream) to replace that keyword with
'shape' as per numpy guidelines.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...tests-use-shape-in-place-of-newshape.patch | 64 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape.patch
new file mode 100644
index 0000000000..1e7c8a6394
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape.patch
@@ -0,0 +1,64 @@
+From 461d9d60b0713fdacdb2f4c8756b7fb5f0389ee8 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 6 Jan 2026 15:25:26 -0500
+Subject: [PATCH] generated_tests: use 'shape' in place of 'newshape'
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1063]
+
+The 'newshape' parameter was deprecated upstream but kept for backwards
+compatibility reasons. It was finally removed as of numpy 2.4.0, so
+transition to using 'shape' in its place.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ generated_tests/builtin_function.py      | 4 ++--
+ generated_tests/builtin_function_fp64.py | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/generated_tests/builtin_function.py b/generated_tests/builtin_function.py
+index 093c4167f..0a740f603 100644
+--- a/generated_tests/builtin_function.py
++++ b/generated_tests/builtin_function.py
+@@ -293,7 +293,7 @@ def column_major_values(value):
+     """Given a native numpy value, return a list of the scalar values
+     comprising it, in column-major order."""
+     if isinstance(value, np.ndarray):
+-        return list(np.reshape(value, newshape=-1, order='F'))
++        return list(np.reshape(value, shape=-1, order='F'))
+     else:
+         return [value]
+ 
+@@ -301,7 +301,7 @@ def column_major_values(value):
+ def glsl_constant(value):
+     """Given a native numpy value, return GLSL code that constructs
+     it."""
+-    column_major = np.reshape(np.array(value), newshape=-1, order='F')
++    column_major = np.reshape(np.array(value), shape=-1, order='F')
+     if column_major.dtype == bool:
+         values = ['true' if x else 'false' for x in column_major]
+     elif column_major.dtype == np.int64:
+diff --git a/generated_tests/builtin_function_fp64.py b/generated_tests/builtin_function_fp64.py
+index 84d939c11..65a7b4468 100644
+--- a/generated_tests/builtin_function_fp64.py
++++ b/generated_tests/builtin_function_fp64.py
+@@ -254,7 +254,7 @@ def column_major_values(value):
+     """Given a native numpy value, return a list of the scalar values
+     comprising it, in column-major order."""
+     if isinstance(value, np.ndarray):
+-        return list(np.reshape(value, newshape=-1, order='F'))
++        return list(np.reshape(value, shape=-1, order='F'))
+     else:
+         return [value]
+ 
+@@ -262,7 +262,7 @@ def column_major_values(value):
+ def glsl_constant(value):
+     """Given a native numpy value, return GLSL code that constructs
+     it."""
+-    column_major = np.reshape(np.array(value), newshape=-1, order='F')
++    column_major = np.reshape(np.array(value), shape=-1, order='F')
+     if column_major.dtype == bool:
+         values = ['true' if x else 'false' for x in column_major]
+     else:
+-- 
+2.52.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index f8cf7aa889..7096a38a4a 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
+	   file://0001-generated_tests-use-shape-in-place-of-newshape.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.52.0



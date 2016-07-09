Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 35270605BA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 08:01:01 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t190so9900680pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S3zhMfhrOgOO9mBDrv5MFs3QckD+xAELp82U7NWRhtM=;
	b=kkDHIcy2KTzChNiWJtWeyV0KHwIbC4kc4u+vG5gxK/Xn001pqE7HnNFciizo0IlkAI
	mUYu4YByPRmlQhFFkXhry9dWWkJfNTUjXcWP1xEKTg4OxfhdjODhps9Tw/HnZAKL/jHG
	MtoVP1KWSZJV3R/e6VT5Jsnu3NAo72x8m6MvTjfeSxh3pC4ISocTjCEk0Vupi6LxFKzp
	2zzJDTtKTGgRqZzlP5DWdlITdQzO+nRxxwrsT0RZAumJYCQTolKRnEoM2zP/bTHwkLfQ
	Oqw9FUffZcqp24W6lKXP766e/Te6bVVoFLqReGbi1FcKJRGuuwil55/XxxBN1xjLQxxY
	wo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S3zhMfhrOgOO9mBDrv5MFs3QckD+xAELp82U7NWRhtM=;
	b=B5YyY8+/51JNbO+bU1hhe51MZ4dr87sd4jh2xSrT7OASknVUoGhNFMhjy6YJlGiptl
	f8kfsaaeT6bMeqK/Ya4O8jfjvBKwUffSd989OaaoohOjHSjb7g4hLxE2wZPV2+Jwvq3f
	HRxUp6qVfHTQ4TUb0Cz+YNGWktEZpVTranPhKfd/5nmHFTQP+n3lFhQRUvMq7au97FDb
	4QWAyv8I4Gar3z0B6opXlPBUYJJdbQkR6aMgewwFY4qbgqemByXfmFrUBpja0Dpt1d4k
	sVs1+11GIR5IKMif+CLQcRH6PVUni8l58iW8uMBcViGXfGfhnQaGDId9i5NVaxkBIVcR
	nPWw==
X-Gm-Message-State: ALyK8tJ9AQZHawX3wQeunQpOskJUJ28JYeQtJfS4lPdE0/iJmEm14jHTqLWl71rZgFOg4A==
X-Received: by 10.98.3.3 with SMTP id 3mr16796514pfd.8.1468051261984;
	Sat, 09 Jul 2016 01:01:01 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id m78sm785822pfj.66.2016.07.09.01.01.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jul 2016 01:01:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2016 01:00:52 -0700
Message-Id: <20160709080054.21811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 1/3] webkitgtk: Fix build on ppc with musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jul 2016 08:01:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/files/ppc-musl-fix.patch | 26 +++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/ppc-musl-fix.patch

diff --git a/meta/recipes-sato/webkit/files/ppc-musl-fix.patch b/meta/recipes-sato/webkit/files/ppc-musl-fix.patch
new file mode 100644
index 0000000..5f58e49
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/ppc-musl-fix.patch
@@ -0,0 +1,26 @@
+ucontext structure is different between musl and glibc for ppc
+therefore its not enough just to check for arch alone, we also
+need to check for libc type.
+
+Fixes errors like
+
+Source/JavaScriptCore/heap/MachineStackMarker.cpp:90:65: error: 'struct mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?
+     thread->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+===================================================================
+--- webkitgtk-2.12.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
++++ webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+@@ -86,7 +86,7 @@ static void pthreadSignalHandlerSuspendR
+     }
+ 
+     ucontext_t* userContext = static_cast<ucontext_t*>(ucontext);
+-#if CPU(PPC)
++#if CPU(PPC) && defined(__GLIBC__)
+     thread->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
+ #else
+     thread->suspendedMachineContext = userContext->uc_mcontext;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index c5e5432..28517c4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "\
   file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
   file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
   file://musl-fixes.patch \
+  file://ppc-musl-fix.patch \
   "
 SRC_URI[md5sum] = "aebb4029c09dd81664aa830e4a584c85"
 SRC_URI[sha256sum] = "173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307"
-- 
2.9.0



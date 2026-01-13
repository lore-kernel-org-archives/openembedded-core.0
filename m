Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156B3D30CDB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 23:26:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72728.1768346782281576657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 15:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CqJ2yDJD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4262570f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 15:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768346780; x=1768951580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhfogREh3kuX4XgKT6+XhnMnJdPRgzqdY7ODMeadmiI=;
        b=CqJ2yDJDg3yY09OfEGajjANDXDjqFRpNAl3AOpwIfOgVZiNRcnQ4ULGi16qxsECghI
         tywtqjWwJc7A84Iq/EV/t/ulNGh9BnSr2U92Jv+Z0lbJFb43vzl2mxEhnGC3uiBebuaq
         5ZriZohM5c3UAzfVVV9b35eXzlaldBY/Tjt+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768346780; x=1768951580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhfogREh3kuX4XgKT6+XhnMnJdPRgzqdY7ODMeadmiI=;
        b=v6Rn1yO67D6UtODGQVnVk2TMM9t0HzJFWTWQa+4UYmYUqJUpLUrQ/raW3LSUtVkgTE
         MoPUNllchJq+/uyutXliYPw3mOl6i4FAQaml2In8MA6T9Wb3YBk2ezQ/gIOJ6LK85TDF
         VfynrD66GTJ2kO2C6ak5I4jYotlHOkhJQ2Js339CObQYL8j/x3OeAqNNAsM81s1yTLnK
         EI14sHqAFMn8lSHWdRGJuIh8fapGuWU3aBH0yYvtPWzLDhWBhdTcqgk6oKThkfSK+47V
         N2J+oG+RCQUuY831FNdqeDME71xxlWTVcoWjK0avAxFVGRtIahgVtHQsHicWUXE4/Hxe
         Kglw==
X-Gm-Message-State: AOJu0YzY2dFCZ/C20O818DDLhCYerTi+CS3mgcUK8i+q+eJ13AfRRFb1
	oeUCr+HB+fJCKJD/mTHzi8pOcPxTyLwhZTJvKvXCP4Yb4ON2T0KFxvNehMQFW3fHTjiAlftEQoG
	yRmGgjXs=
X-Gm-Gg: AY/fxX4k6Ej1r/Q2X9RYXNuLXAyp9wYMTz0Hn/ckEzLv/J3/LkA59skn1bpEjMEEb0p
	Ecu5EQnNiuKTHcKkIIR+p4SknnPyMIK1YUOPhstP6wbM4pGl/hmyDuTTVymD8XzfwXK/1B3D3fC
	29WtLzkH4Q4ZS5bgX6MP1P5fsO3aeUWAwhs1kMCuGsNdhbOfWC/GRUQNEXaBCZFvRGFzu3FShzo
	xvGyF4zjzXXqhxKSOBGqumOMkfQRtX/46N5L0Fxvk7g19bzxiuSpCWbz2wabiTEfJZ0gdrgmqBc
	0dcQt9EZqQBIPQjnZDXptqOO27PU7qALLJEUdZRFdA9fcKxAyDqiGwHyeXI5z7bXtDvQsBzIeKQ
	icEmA5YZfH6iZDGydNsL+ZPaFdeHUqBBiPq+vC6lmJw/tMbnfRoY++i8RLkPqdp4RbQRcHwARlD
	3G+bOE4ZKU9T0ZEj6qSr8Rh9UMkTe+ApHoP3lVMA7uKfBg7Rk3
X-Received: by 2002:a5d:5f52:0:b0:431:8f8:7f17 with SMTP id ffacd0b85a97d-4342d59bf78mr172111f8f.10.1768346780226;
        Tue, 13 Jan 2026 15:26:20 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:143:ebd4:ccef:c4b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e180csm45423770f8f.10.2026.01.13.15.26.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 15:26:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] unfs3: Fix race issue causing a glibc test hang
Date: Tue, 13 Jan 2026 23:26:18 +0000
Message-ID: <20260113232618.2701009-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 23:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229295

When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
hang was traced to unfsd exitting with a buffer overflow being detected.

This was traced down to mksocket() where we'd see:

socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108

There is a length check in mknod_args() but obj may not be setup at this point by
cat_name() since the functions can be executed out of order according to C.

To avoid this, make the order explict. This means the length is checked and we
avoid the buffer overflow. This will likely cause the glibc test to fail however
it won't hang, which is a win.

[YOCTO #16113]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../unfs3/unfs3/fixrace.patch                 | 35 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_0.11.0.bb   |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fixrace.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/fixrace.patch b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
new file mode 100644
index 00000000000..b41ec4b3d27
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
@@ -0,0 +1,35 @@
+When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
+hang was traced to unfsd exitting with a buffer overflow being detected.
+
+This was traced down to mksocket() where we'd see:
+
+socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108
+
+There is a length check in mknod_args() but obj may not be setup at this point by
+cat_name() since the functions can be executed out of order according to C.
+
+To avoid this, make the order explict. This means the length is checked and we
+avoid the buffer overflow. This will likely cause the glibc test to fail however
+it won't hang, which is a win.
+
+Upstream-Status: Pending
+
+Index: unfs3-0.11.0/nfs.c
+===================================================================
+--- unfs3-0.11.0.orig/nfs.c
++++ unfs3-0.11.0/nfs.c
+@@ -776,9 +776,11 @@ MKNOD3res *nfsproc3_mknod_3_svc(MKNOD3ar
+ 
+     PREP(path, argp->where.dir);
+     pre = get_pre_cached();
+-    result.status =
+-        join3(cat_name(path, argp->where.name, obj),
+-              mknod_args(argp->what, obj, &new_mode, &dev), exports_rw());
++    result.status = cat_name(path, argp->where.name, obj);
++    if (result.status == NFS3_OK)
++        result.status = mknod_args(argp->what, obj, &new_mode, &dev);
++    if (result.status == NFS3_OK)
++        result.status = exports_rw();
+ 
+     cluster_create(obj, rqstp, &result.status);
+ 
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb b/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
index b8c235fb7cd..793f5c83ce5 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c621cd2786a3a1344a60a0d608c910"
 
 DEPENDS = "bison-native flex-native libtirpc"
 
-SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master;tag=${BP}"
+SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master;tag=${BP} \
+           file://fixrace.patch"
 SRCREV = "ec1660ba33c80d5c67131e163e68834c1a10e243"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
 


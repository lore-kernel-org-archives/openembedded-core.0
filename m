Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 95D1460D49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 00:00:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s10so742235wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 16:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LNtytRfEwTy1C/diSIl4bdflOpRb5iN3RNS4LNXgEvk=;
	b=dr5k+T7sD43y0OrWIPW0ZZJcb87bITtBndGK9t5VRC+TJer3j25B3B68u9cQ77OUmT
	L+An9/4H/iG209HK6/5s2hVoNSWrHbns3AOeWDX7BDLiIx0rbu5gIYL1KKPXjdToCIy6
	Fny0vt9guhLyyluAuQ5IzCtNKbYh+Tpv9Gzeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LNtytRfEwTy1C/diSIl4bdflOpRb5iN3RNS4LNXgEvk=;
	b=NipLrmr8RbM/q90VRXiv3kOmptVbxu5tupLbskI/VgSjWAsQx9uKSZvbZJERUg7XwC
	ml/QpU2mNJ+jVegme7hxpO6Mg1kNnTzuGk1Zk8q4DDTGlGt6hmPzzHLWzRguhZvbqYX5
	1fbjUNsHEgVJzrUcdz3DXMD/c0slhsZHUkheZwTngLI/LDx5N1kCO48T7eJV+6+8qGYF
	/gLweYloZiiQszxgUSUv4hzuXmfRRy9dRDiJq9jLywajQHy4w79/L/GHKPIiXW34qiVf
	sQbtpHIQsTf9Onitm9QcZYVNgM6dDsrj/Q6RRsD9mHIss5xyFsD/mNib3mcqGcVxIk/P
	n7PQ==
X-Gm-Message-State: APjAAAUqIwKAgTZnXCqqPO7BAWRunP5Yy5DBm1/zWHnH/myL5AlBXVEu
	DvDg3/wgr/Tk09KKKH3aICqpdIyb4JU=
X-Google-Smtp-Source: APXvYqz1jrH4WPTbfNQBOMMVuLOP7KFjNK7xlomzqpjZ8vF9WxmJmJZOv6brzEhTCT/YHU98Hu2JLQ==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr367092wma.134.1581033646693;
	Thu, 06 Feb 2020 16:00:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d13sm1115398wrc.3.2020.02.06.16.00.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 16:00:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 00:00:40 +0000
Message-Id: <20200207000041.19304-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207000041.19304-1-richard.purdie@linuxfoundation.org>
References: <20200207000041.19304-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] libinput: Fix determinism issue
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
X-List-Received-Date: Fri, 07 Feb 2020 00:00:46 -0000
Content-Transfer-Encoding: 8bit

The build was injection git information from the wrong git tree, stop this
to allow reproducible builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/libinput/determinism.patch        | 21 +++++++++++++++++++
 .../wayland/libinput_1.14.3.bb                |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/determinism.patch

diff --git a/meta/recipes-graphics/wayland/libinput/determinism.patch b/meta/recipes-graphics/wayland/libinput/determinism.patch
new file mode 100644
index 00000000000..cb554030cf3
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/determinism.patch
@@ -0,0 +1,21 @@
+This finds our outer git tree and that version information breaks
+determinism of this recipe. Disable it.
+
+RP 2020/2/6
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: libinput-1.14.3/meson.build
+===================================================================
+--- libinput-1.14.3.orig/meson.build
++++ libinput-1.14.3/meson.build
+@@ -387,7 +387,7 @@ pkgconfig.generate(
+ 	libraries : lib_libinput
+ )
+ 
+-git_version_h = vcs_tag(command : ['git', 'describe'],
++git_version_h = vcs_tag(command : ['false'],
+ 			fallback : 'unknown',
+ 			input : 'src/libinput-git-version.h.in',
+ 			output :'libinput-git-version.h')
diff --git a/meta/recipes-graphics/wayland/libinput_1.14.3.bb b/meta/recipes-graphics/wayland/libinput_1.14.3.bb
index 46d46c54eeb..bc5a76dc9af 100644
--- a/meta/recipes-graphics/wayland/libinput_1.14.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.14.3.bb
@@ -14,6 +14,7 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://0001-adjust-for-64bit-time_t-for-32bit-architectures.patch \
+           file://determinism.patch \
 "
 SRC_URI[md5sum] = "d052faa64eb6d2e649e582cc0fcf6e32"
 SRC_URI[sha256sum] = "0feb3a0589709cc1032893bfaf4c49150d5360bd9782bec888f9e4dd9044c5b7"
-- 
2.20.1



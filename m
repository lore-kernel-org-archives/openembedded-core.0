Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 59D9C7C3D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 06:50:40 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q1so1053662pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7MctKDTeuRaWzc4A1Wuo85zIHGiNdFeBzldwAAv1SPI=;
	b=P0SsP5dsl9lWuL8mNP8p7m1rPBbcGWjmklKdnJVgt+2piMOtysDhnM1yWVzv+0IrE4
	iTQj/rg1tc7w6c6+4hkkxvDhj78MZJjHwmdkidyGafq1X/5+uKZtabe5B5xELa/5zrK/
	0tsrWUeC2HKltJ+jPClUvKdgldA+TZ6EODocpUF942CpNCfRAP69s0SG5c8xDP8Sbz3O
	W56CLdMAT2x90WEoJnmxxvMILiT9MXbPvs8JWGnE+sMPsCEYJLJD8mLBblRrGfg76BWk
	gQtVqkJNAEi5EtvYhNwmUY47e0++fb7FxJmRsUYTen2iXtgHpyxxpeENaStRkVd1CLde
	C17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7MctKDTeuRaWzc4A1Wuo85zIHGiNdFeBzldwAAv1SPI=;
	b=IIZokn8GwxZiCSvzkAo+vxtHGOT6P+deV8hGxLmSW/MtWUAwzL1DpRgFc6FRjbvDYM
	xEaCZH5w+E5U124bTuNE1ypUO1NAYz+YKuYsUm2fobeDUZ62C5NBRtKp4JF+IuUA2t6A
	VroAxQB6ZXy0VXu5x+tlC1g8+aV39Hf7fwW4YxX4zFFhiKzjYdxdzN09sLcM3yokx9+6
	UWK0KFcIVRWg7xQCbC8VGxx7rfaXQLgmzqCp0HSDx2B67SsxiTg+7Ph5Gj70T7J+E1vY
	I/cO2OGdgMSn3W5fh1qA5Ac2/UEDVz3bVURXt4I4xLsS/XxW288saWEloWri+S4Pr9xJ
	2auw==
X-Gm-Message-State: AJcUukdFKgwokpFP7gBXKMF29ezO/4sHwbHoVTUaD2xbLI04yAOen7dP
	pfnCAypwaXdHpo2AIrZ6eCFrcAc4
X-Google-Smtp-Source: ALg8bN72fsa/ZwqdiYdRZbCgwOKpFAURD2e+YBOG0EXsJ6O6NSD4rg5cNlZlZ7G2iPB3AhfQqLUJhQ==
X-Received: by 2002:a63:ed42:: with SMTP id m2mr30503169pgk.147.1548917440939; 
	Wed, 30 Jan 2019 22:50:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	o85sm1080044pfi.105.2019.01.30.22.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 22:50:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:50:15 -0800
Message-Id: <20190131065016.21887-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131065016.21887-1-raj.khem@gmail.com>
References: <20190131065016.21887-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] webkitgtk: Fix build with clang/libc++ >= 7.0.0
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
X-List-Received-Date: Thu, 31 Jan 2019 06:50:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/bad_optional_access.patch       | 35 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.22.5.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch b/meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch
new file mode 100644
index 0000000000..9d0d50b79e
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch
@@ -0,0 +1,35 @@
+unbreak build with libc++ 7
+
+based on
+https://svnweb.freebsd.org/ports/head/www/webkit2-gtk3/files/patch-Source_WTF_wtf_Optional.h?view=markup&pathrev=477812
+
+Fixes
+
+/usr/include/c++/v1/optional:171:29: error: redefinition of 'bad_optional_access'
+class _LIBCPP_EXCEPTION_ABI bad_optional_access
+                            ^
+DerivedSources/ForwardingHeaders/wtf/Optional.h:295:7: note: previous definition is here
+class bad_optional_access : public std::logic_error {
+      ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WTF/wtf/Optional.h
++++ b/Source/WTF/wtf/Optional.h
+@@ -276,14 +276,14 @@ struct nullopt_t
+ };
+ constexpr nullopt_t nullopt{nullopt_t::init()};
+ 
+-
++# if !defined(_LIBCPP_VERSION) || _LIBCPP_VERSION < 7000
+ // 20.5.8, class bad_optional_access
+ class bad_optional_access : public std::logic_error {
+ public:
+   explicit bad_optional_access(const std::string& what_arg) : std::logic_error{what_arg} {}
+   explicit bad_optional_access(const char* what_arg) : std::logic_error{what_arg} {}
+ };
+-
++# endif // _LIBCPP_VERSION < 7000
+ 
+ template <class T>
+ union storage_t
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
index e3579e472b..3d8c0338c7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
            file://detect-gstreamer-gl.patch \
+           file://bad_optional_access.patch \
            "
 
 SRC_URI[md5sum] = "96a731522b800f38e70f85c22f8de477"
-- 
2.20.1



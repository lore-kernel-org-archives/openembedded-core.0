Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id B75D360649
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 05:19:31 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id d5so354614pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 21:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oyxhuaXfpLaShKshHRFL285npQLHIPEbxgRsIK5+Ag0=;
	b=TBdYRM0mdSvF0BjF8uEX7ts2KesvGDxvw1t1nGbhRfVZS5TbV9DOoMvZjjtDUMVtgn
	J19ejZYxH0yzznOkpeXeoLs4IvpP3QrZe6TIppU58FDpAH8lQ9kcEYpys54iT542pNYr
	MaFd5sB/nm/PbgIlfcS0gau87Drsi4mR0wH+chjo2KDQ7wlE4jsv0IJ3/F+QYOqiCQ8L
	wK/PxCwlTKewJfPLmEhn2ZGJnDDksyn7yZwnXR5Y4nCSOTXKamvmp4uYIE7z4Hk6inRY
	OL7GbN6op3XUspFo9845+HHtke5X/KIHYliVq4iCrCoXA+ZmaapDYzJlTEyB8Flssdmi
	eiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oyxhuaXfpLaShKshHRFL285npQLHIPEbxgRsIK5+Ag0=;
	b=BuyrHXQiFXYcHLN8xwvnPNrBNKHOwKh05gds1YQ5Ms9uxs7pDoq7Fc4rvJZ0Jo8OHp
	cGwP2bhLLml4jko2YwKjfF4sT/trX9MI5rsf0uh7kyGnQy0AeQc/oYkfCBAXx52mDy5H
	b2O11cCMvkUPt2v86+nQmpwGMm62T7rSB1ivuckqecGGbYFBjk2QFWjA5yq+zBOyNqk1
	cUMGERAPv5FbPDZ2x3qJkDsOzSPBDCbFPQFTzSirqnPpE3bYV0SmA1PhoRW6bfYqiaCe
	TkLHBsihIX4iRIL9sZve024dPOi+AuIoSTwzBR6zBPcvaQXaJd8clJdMoBES1ITTI9zO
	RFyw==
X-Gm-Message-State: APjAAAU19isUZTjnp7CprJMewdo2NQwGbpBeNSC2qZR8si8lOcbzyuGd
	cZ1aYCQjr4yGJXSg5XLb5hBFaQX4jF8=
X-Google-Smtp-Source: APXvYqy+AIq6DnKqmPiQaTVFtuRXsCbCkEaGYYqwXBKLOhevZNJmFFbQaVowWyXC4UflgWJpRGLyuA==
X-Received: by 2002:a17:90a:8b82:: with SMTP id
	z2mr8175945pjn.59.1581484772097; 
	Tue, 11 Feb 2020 21:19:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	m187sm2945989pga.65.2020.02.11.21.19.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 21:19:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 21:19:36 -0800
Message-Id: <20200212051936.1610922-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 05:19:31 -0000
Content-Transfer-Encoding: 8bit

dnf does not work with opkg or dpkg/apt anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 8 ++++++++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f38167f1ad..9e6d5741af 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+python () {
+    pkgb = d.getVar("PACKAGE_CLASSES")
+    pkgn = d.getVar("PN")
+    pkgv = d.getVar("PV")
+    if "package_rpm" not in pkgb:
+        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in libsolv" % (pkgn, pkgv))
+}
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 882c435b32..5c9326ca64 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
+python () {
+    pkgb = d.getVar("PACKAGE_CLASSES")
+    pkgn = d.getVar("PN")
+    pkgv = d.getVar("PV")
+    if "package_rpm" not in pkgb:
+        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in libsolv" % (pkgn, pkgv))
+}
-- 
2.25.0



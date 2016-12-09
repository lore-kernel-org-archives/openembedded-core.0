Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92F0F71C9E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:11 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 3so672508pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F9urwCVceg5JQP6DT4xbSEcbddEj886JMj2HrBZzI3E=;
	b=pfEBbcLFR3NGn6LD665s1pVPVtVuWHSXaT4Ctwd1TUke6ut9Fw2g+W+54Ah1K/ZIAJ
	ynuDnlyJ9PZ+HbA36FQuBQ2ZLpiZBNIvA+U27Kqya/oV6BM/dDAjBBSXCDbmLMM9usEz
	dJ2I4O3sL76xTcJovzgKEVwXV2404gVE7xq7nnXiZTv4fG8euEa9H+4BDat+W+JiQb2e
	hWkf2FH6cno+aEMFXcQQMe37VDqNWHZc4p18zJeE4PeX+vHnUtvzMFTVJPAZ5rSt/J9x
	Lcdg0iagv1g7Ni1T6hmvJRgMsvukJM4e59mw4l7eiIXRg9a66hiSZPCINq+URWhNgM0F
	KmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F9urwCVceg5JQP6DT4xbSEcbddEj886JMj2HrBZzI3E=;
	b=IwT0LtqpRRMoAku0V6BG8nP9X0l/v6djmxIrf+Lta0Yft5njPWnanOHe8uN48I43Dq
	Xt8EWe0drAdH8qe75djKjQZegjMnWhHz8kKm+gvM+fnemDlB+4mruloKQKkm0pBzh9Vi
	ehgI0VqDhC9y/+0fk3t1a+vjmlHpnIdBGWiX7uYnsNuwiyBM5NV1WarlYdeZ3CtyORuq
	Peiq37WKOs6RElZrQtk/VXpfms3ARQbtK5o7By/gnTUMOwbV3XQShPVlzm7yznf38EL4
	G7k9kwlgP+DdtJTwLZf2k6otA/0nze10lKhrbmetnGq3vWGxOEbukhq0twhxjHl08hKH
	dj1w==
X-Gm-Message-State: AKaTC02xKRzZZXJdiFQapWcDh0XkIi3lusgho30mbgOiuRvQTOd7fT0UU8OMjGWJqQG71w==
X-Received: by 10.99.44.84 with SMTP id s81mr138265828pgs.153.1481252292808;
	Thu, 08 Dec 2016 18:58:12 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:58:00 -0800
Message-Id: <20161209025801.20775-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209025801.20775-1-raj.khem@gmail.com>
References: <20161209025801.20775-1-raj.khem@gmail.com>
Subject: [PATCH 7/8] libva: check for "opengl" feature
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:11 -0000

From: Ismo Puustinen <ismo.puustinen@intel.com>

In case "opengl" is missing from DISTRO_FEATURES, libva fails to satisfy
its dependencies. The dependency check is done by BitBake when
meta-world-pkgdata gathers information about all available packages
during image builds, even if libva isn't included in the build. This
patch makes libva recipe be skipped if the "opengl" DISTRO_FEATURE isn't
found.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/libva/libva_1.7.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libva/libva_1.7.3.bb b/meta/recipes-graphics/libva/libva_1.7.3.bb
index 9994158..a6e5889 100644
--- a/meta/recipes-graphics/libva/libva_1.7.3.bb
+++ b/meta/recipes-graphics/libva/libva_1.7.3.bb
@@ -23,7 +23,9 @@ SRC_URI[sha256sum] = "22bc139498065a7950d966dbdb000cad04905cbd3dc8f3541f80d36c46
 
 DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtual/egl"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 EXTRA_OECONF = "--disable-dummy-driver"
 
-- 
2.10.2



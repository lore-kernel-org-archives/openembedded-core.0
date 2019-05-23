Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0727E43F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 13:27:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so5790667wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Un0rUssYa2Ko4cpG6Z/tu48qe+s64kecE/OaID0WLI0=;
	b=Ehc4c4GzoC4xXRb0J2IfWUlToakExCIVl2w7n4KPAIQmFN7u4R/FCFRwTnebdF02mQ
	9/yNhf18/UvMfOrWlJla40C3kyZimJLUT432pmUk76va5hz55bfD4Wj/16AFvFNnEy/L
	gFkrob5H0AHrh2JCv4rycosFsMg1qNf6EZBsF1G84eFjfrUrXfzbx92VCvDAuraBWQm3
	0L9STPA/+/rDAuLPEfAiJReVaNbxAmKled6HoREhWwwk3cwKc4zVvFAQTWt1IJeWa4Sr
	KNfJobvKkYsusy2maYdgFLpYPG4RPAcxx3IAbW+ki+T+Onn+5nJ0UHVIWSnoLev5nemY
	1VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Un0rUssYa2Ko4cpG6Z/tu48qe+s64kecE/OaID0WLI0=;
	b=d8bxSeTq5cGTx9PMk/GuZBhEoGor7Dut1TMrkwlH4D9PWoKBYZIyGmtzRTo2GHqe8o
	Ai2tCcKdKNf2JzcWIb1vTyaVxhTifnaiw35MR6J+kGSbIPRtzr71J+3IkLYu4Cc0bepg
	n1AxGRacqCRHNgcxLp9/+6qrDSeL8viouAiPAe23xYkTLChkkzn/g9GJocavpFD95iJw
	vvVFXZE8F8OfmX8F7vCDWMcPkOlQhELz+/rYOMvPgbagebvHDYeSTGErg59en5Q3PmED
	ExG/IyjELAJzmWdYsBfZ3F6ZelGFDYFGrEs0OHSRrQM158cAT2aNwtDWMzlB8Dzy61XD
	/atw==
X-Gm-Message-State: APjAAAX+7PMJe32B3NIEK7+4O7324vn55r3+vQbkVNJrlDt5QZBDcJcT
	8m5yU85iJk0t9Jr/KoYqZ2kZY4NA9FU=
X-Google-Smtp-Source: APXvYqzhlSyaraZZwgs3VI7zWAvBcwf6zmePixKMBCiUzluV01i89sL7vAItv/mu98YS6vjEclF2iw==
X-Received: by 2002:a7b:c458:: with SMTP id l24mr11632341wmi.53.1558618052842; 
	Thu, 23 May 2019 06:27:32 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k63sm10405386wmf.35.2019.05.23.06.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 06:27:32 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 14:26:15 +0100
Message-Id: <20190523132614.32213-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] connman: fix segfault with musl >v1.1.21
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
X-List-Received-Date: Thu, 23 May 2019 13:27:32 -0000
Content-Transfer-Encoding: 8bit

musl > v1.1.21 changed the implementation of the freeaddrinfo() function
not allowing anymore to pass null pointers to it.
This was causing a segmentation fault in connman.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 +++++++++++++++++++
 .../connman/connman_1.37.bb                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch b/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
new file mode 100644
index 0000000000..43b43bc9f8
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
@@ -0,0 +1,34 @@
+From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nick83ola@gmail.com>
+Date: Thu, 23 May 2019 07:55:25 +0100
+Subject: [PATCH] gweb: fix segfault with musl v1.1.21
+
+In musl > v1.1.21 freeaddrinfo() implementation changed and
+was causing a segmentation fault on recent Yocto using musl.
+
+See this commit:
+
+ https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c?id=d1395c43c019aec6b855cf3c656bf47c8a719e7f
+
+Upstream-Status: Submitted
+---
+ gweb/gweb.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gweb/gweb.c b/gweb/gweb.c
+index 393afe0a..12fcb1d8 100644
+--- a/gweb/gweb.c
++++ b/gweb/gweb.c
+@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
+ 	addr = NULL;
+ 
+ 	result = getaddrinfo(host, NULL, &hints, &addr);
+-	freeaddrinfo(addr);
++	if(!result)
++		freeaddrinfo(addr);
+ 
+ 	return result == 0;
+ }
+-- 
+2.19.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index 2cf904cd85..12650329c5 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -3,6 +3,7 @@ require connman.inc
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
+            file://0001-gweb-fix-segfault-with-musl-v1.1.21.patch \
             file://connman \
             file://no-version-scripts.patch \
 "
-- 
2.20.1



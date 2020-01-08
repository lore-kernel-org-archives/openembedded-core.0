Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4BA7FE94
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so3422504wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FJpf7DqKYuBUVbtDLsWuObyolkzHpNZnK0i7C5hcNQA=;
	b=S6AKxVTnTQXuj9lukLA2rtZvYEje1d6L9BwdYqaEEvrDRiZwuEngzvmYbK/Q8hmBjj
	PreuNNVA9/CAZq8jycdYC0Tc6N7lLDtD0KMchhapO4+pk8sip0Df8Ss2XhWz+OBmCatR
	U8dFlpVTJxYQuULF+55TtyMtsLWV4n8r7tcaKIMlD28XnFDozU6tujDGGq0Zsg1owoJH
	aYkAV7Gc0ArVIYh7i/KrG7Hm9dqol8YndZ4etLco4mPGlywaMjuX1KggoH85pEia92NG
	nKiL+B3j2SHQfNVVnBL7N0A+7mkvC4sys7yF3sWfYP+2ZslFmYBQe6ZbBDAyJ4fl2THO
	aRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FJpf7DqKYuBUVbtDLsWuObyolkzHpNZnK0i7C5hcNQA=;
	b=fV54bbLXu5Mtf6OtOFYvWLpwapFAvN+qD0ZGb7X0ZuvWv42cv2d3+wkPesnHlmGp6a
	aF+Cz0vnKnr3VhTY2SzziaNCkgopcD0507qoO121ZpDgpPau03Aqw1qnPSCaT7vmZDaZ
	5bfLOfvJt7pffZyZrKXCtiU5Rni0S96qdPY9s3KK0jMYcRIyp2OLocZZuQAuuXI+nBB9
	RWVx/ezGu9fHYO7qoPJfFrawOcgAWevw8ReUQEEsd0UTTbN3aD8xHY4lFBUTN0LZOr1k
	Ta/xP8ImOAtxutyfDUpypbsNE2dVMHH6V6BCeWOjpjvaaJK9O2elqSYcN7yec+iAc6xL
	2ECw==
X-Gm-Message-State: APjAAAUb/7OViUrr6LgM0/5rgFUX0D0oWTq/VOfSxG7y+AdgiWbdAC1r
	oCswR2W3N5bs2RSa3AqLqQnzzKrzyyw=
X-Google-Smtp-Source: APXvYqw9PSn8bmr1gDK4twheOWxlui+DrCL4pD9cNmju/wrPyAdZTHkg1y/ihq8xnDScJ7HD2l2fWA==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr4373069wrp.12.1578490086626; 
	Wed, 08 Jan 2020 05:28:06 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:33 +0100
Message-Id: <20200108132759.95603-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/28] rpm: switch to openssl from nss
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:06 -0000

nss is a problematic library in many ways, but openssl
seems to work just fine.

rpm was the only user of nss in oe-core, which opens
the possibility of moving it out.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.15.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 5896e78e734..0a6d412a1b8 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -45,7 +45,7 @@ SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
+DEPENDS = "openssl libarchive db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
 inherit autotools gettext pkgconfig python3native
@@ -54,7 +54,7 @@ export PYTHON_ABI
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
 
-EXTRA_OECONF_append = " --without-lua --enable-python"
+EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=openssl"
 EXTRA_OECONF_append_libc-musl = " --disable-nls --disable-openmp"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.17.1



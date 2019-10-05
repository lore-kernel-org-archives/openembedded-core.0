Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id C40607C131
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2019 06:12:28 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id e1so4988582pgj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Oct 2019 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hflOWZTDs8kYZju3uQTsGGZV11DUiLOM4Ht4RSklpCg=;
	b=vQksyWg+vM8CML+sBXFYLPBcV1vIjE0ua7sBHsLfnYcPxU8bQGhqo9AQiyl6lw7Uqz
	V/7JGdFNqw3VxQeVvJenDs3r2s8igR9uHwq+KuTHs+/lVXSKGs33EubPxJ/0XNG4i3y1
	4RdyFNpzmyTL6dqDcbkWQ4dp8mMgKRqtbPVvSDiTk++rp06qeKQQf2fBxo2ZozfiIprK
	UaRkq9oxAjbD5NbaedmvqcH0ZbrFoAJA/Kl5Nm6NlKlxWx6BBoYsyJkBkDC5z5aSpfmu
	Tjnvlnz15wmWYC3cykH80pgkqf7rnqpjCTjA7LLa8oVNMJuX40woGsIPf5AYzs043Xid
	/eSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hflOWZTDs8kYZju3uQTsGGZV11DUiLOM4Ht4RSklpCg=;
	b=EirFd7EUFNeGiUBW+bQcRk0SuXHCv5Njsf8I5VEFl3D79Dnhf5qRncJ6RjpKVN5ymw
	wo+8Rguh88ToZpEDIHi+szXmlV29szggSeNmLw4YA7FIl0HyaRI8GtVXM62RDjD5StsK
	xLLK8R8C1Tc/LwQBUzSAr53q1ckkyciMz+abOQNgMm3Ogw46UGFAiztGt7KSWGrs0Loz
	78uxO5jGxdrccfNwi7LsRBgUIGdj1KTP5ps+R2L7TNMROseeaK1K72b+D51QttJk3Ad2
	m8xQBQQN8g+ysSF98N6uYbvPsiLrWqOoLaMytOcfHyZlco9ZHIFUQq3MjWbmjpTQMvwa
	+YTA==
X-Gm-Message-State: APjAAAXqCAg6hAMxfOnTSABC+umCh4fSPtgSsAnA5AGNmEZNPcgvzXCf
	H5lpVuwQNWVbxT84wfltEc5nlGHy7VU=
X-Google-Smtp-Source: APXvYqyZFd2Qep0s8ebeudKZsXosHL5KNHTxgVIP9681K3QBwPWUFo69IbPngVV59cjPfkpp+djL6Q==
X-Received: by 2002:a17:90a:33a2:: with SMTP id
	n31mr21802434pjb.28.1570255948955; 
	Fri, 04 Oct 2019 23:12:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	b20sm9557768pff.158.2019.10.04.23.12.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Oct 2019 23:12:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2019 23:12:20 -0700
Message-Id: <20191005061220.2279910-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] ghostscript: Disable libpaper
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
X-List-Received-Date: Sat, 05 Oct 2019 06:12:28 -0000
Content-Transfer-Encoding: 8bit

OE does not provide libpaper recipe, and the configure check looks for
libpaper if not disabled, this causes problems especially when shared
state is built on a machine which has libpaper installed on host but the
consumer machine although running same OS, but does not have libpaper
installed, the artifact from sstate are re-used but then native binary
./obj/aux/packps fails to execute

./obj/aux/packps: error while loading shared libraries: libpaper.so.1: cannot open shared object file: No such file or directory

So either we need to provide libpaper in OE or we disable it, disabling
is best for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.27.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
index 349c0c2e8b..9e1f3e2f49 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
@@ -59,7 +59,7 @@ PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${ST
                       --without-x, virtual/libx11 libxext libxt gtk+3\
                       "
 
-EXTRA_OECONF = "--with-system-libtiff --without-jbig2dec \
+EXTRA_OECONF = "--without-libpaper --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
                 --with-cups-datadir=${datadir}/cups \
@@ -71,7 +71,7 @@ EXTRA_OECONF_append_mipsarcho32 = " --with-large_color_index=0"
 # Explicity disable libtiff, fontconfig,
 # freetype, cups for ghostscript-native
 EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
-                             --without-jbig2dec \
+                             --without-jbig2dec --without-libpaper \
                              --with-fontpath=${datadir}/fonts \
                              --without-libidn --disable-fontconfig \
                              --disable-freetype --disable-cups"
-- 
2.23.0



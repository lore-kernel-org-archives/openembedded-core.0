Return-Path: <dev@codyps.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id D21506FFC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 19:38:06 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id c20so6432869itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=9B1htopsXL/bsyuM4krpzaJMXj2q4h2QEKsLWWMB94w=;
	b=Yfk8oEQMix4oOpwp1xZdkBWn9jbMLu3Q9KuL8kxMoo9e4Uv4vET4EjGyOe+cHBEObC
	O17P/EAIHJ4gHuiEHwyvEmO1++ZpKN+G3y35GyhrunB0q3QgCAjjjOVEAe4qbLIk9Fnl
	SRjj4GBYlX79p/uY561PEPkucrIkHWbvMY33g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9B1htopsXL/bsyuM4krpzaJMXj2q4h2QEKsLWWMB94w=;
	b=KsI0ANkgC7Dr3xFUtxwDcZHdropRz72IZCYj6HfPYq16E57Ucjw2+jS75SXALMxvkw
	KUv19rEYxUZWceRR4RjFAu0TtNCdn/QdUvUz/LirZeVFxOChgV/I043Rn1YQAhCT4yvF
	fCTAEcfepL5wj8U8cZG0z6UJvjllNP076jd21lIVSOzldYJZfe6MP0T11yzZI1C9SqZ4
	6aFKTrGFs37j8tAxheXzCy4AMwaLds5HWcHQ2oRn5NYror8KCygA0vbF6Up58jGzwpcU
	mV25hNXEHqc1ELVX8vbJCaKOTzEZ4kKD7q0XuUcq/agFO1YG+wEXZwp+j+OdnO7QtJ2c
	uuRQ==
X-Gm-Message-State: AKaTC02C34zXphI5UAPKcCErtn5tmvrrMzFPv9tyCwF6+sI1a5fin80dpj6Uo+HvlCym5w==
X-Received: by 10.107.140.65 with SMTP id o62mr1310198iod.17.1479497886766;
	Fri, 18 Nov 2016 11:38:06 -0800 (PST)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52])
	by smtp.gmail.com with ESMTPSA id l3sm3442472ioa.7.2016.11.18.11.38.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 11:38:06 -0800 (PST)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2016 14:37:48 -0500
Message-Id: <20161118193748.4850-1-dev@codyps.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] cantarell-fonts: add inherit pkgconfig to get pkgconfig dependency
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
X-List-Received-Date: Fri, 18 Nov 2016 19:38:09 -0000

Without this, do_configure can fail with:

	| ../git/configure: line 2381: syntax error near unexpected token `0.19'
	| ../git/configure: line 2381: `PKG_PROG_PKG_CONFIG(0.19)'

If pkgconfig-native happens to be added to the sysroot too late.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index e3e4cde..c71ab11 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-inherit autotools allarch fontcache
+inherit autotools allarch fontcache pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fontforge] = "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
-- 
2.10.2



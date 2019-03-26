Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 15A0F6D5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 10:29:37 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y7so9543821wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y7GtPF+uVpnOD9oV1F16QOQQ3gBTEHPcVTHn+MXBcEQ=;
	b=Puo34LCOsJ54Owu0saHbUI2bftwQFtUQYU10lmyx+9mmYHDDJO410KtzOc2NErdSc7
	qcLeVPhNV4jhCdz8HeizwKGSQDa0nZk/QWf51qYFQ57sHbWifXXQARlHMjlvrC4HSZiW
	dImrgFaq56jmQr4DOMCjIt6e6VKn4tij8jxj4U4ERgWE4DGiFyPDxDb74lMIlp7fPmun
	H83C8w5LsZvfo/USVUDALLXAZB+dbhOyGMa3niZKgRpQ7+S3vs1zvRDHlCktizGciQz5
	AxbydUTkOUqrz0/+1L7z784ldHDTFZoGkT0UOD5c3X1kzcOgoKh7stinLe86vx8hyIKK
	0fWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y7GtPF+uVpnOD9oV1F16QOQQ3gBTEHPcVTHn+MXBcEQ=;
	b=a3OfTwUqLufb7R1VDuRyd88O1dRISqFR7lZX/7+OPuU7UdPA2bFysMhgl1Ue9yHlDO
	sgh/ScphPxR5NJ3lwXbK0A8nWIHzmpCUIRAcCSFT016jUKBNnAVz2SUtqlBPe2cW7ATW
	Ze8jtHXsiio3q93K4ATtiNn152PKKu5xdzSu+oT5w8P3JBmCrPVcrAmBbU2vUie0PoFu
	i45EjLznRm+7+rJXVf3/VKxRxvaPfNfyh5O0DmHdByIiS9TRPwlrwjYD1QJhn24H33lo
	pY/kLnXPNMJcKFMZq93VjcP9nh9Sb5yrFgnN65bdJIYmwI8Qvap2pU64WciNLV1nCWMt
	Yygw==
X-Gm-Message-State: APjAAAVjzZ1lFAZrsscRknXFBVIYM7vl3v8INk2bty2237wlyIBqTNZF
	bMt1MwXS4W3zlMPHj0DRZH6ggj4M
X-Google-Smtp-Source: APXvYqygRznIBzppKWVO73LUyqGixCVXuThM7pnQd1Q9KveOxe4jvMAm6mMmK5BeFM5NVZ+Qe2r1Hg==
X-Received: by 2002:adf:e506:: with SMTP id j6mr11421430wrm.41.1553596178321; 
	Tue, 26 Mar 2019 03:29:38 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id b9sm25912593wmc.9.2019.03.26.03.29.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 03:29:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 11:29:19 +0100
Message-Id: <20190326102919.7348-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Tue, 26 Mar 2019 10:29:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

adwaita-icon-themes failes to create symbolic icons. In log.do_install when
calling gtk-encode-symbolic-svg there many complaints

| Can't load file: Unrecognized image file format

We fail her now due to:

commit 7f6c57635ff4e1edf7a46c49af34846ad0a4bf73
Author: Alexander Kanavin <alex.kanavin@gmail.com>
Date:   Wed Jan 30 11:59:25 2019 +0100

gtk+3: remove the gtk-icon-utils-native recipe

gtk-icon-utils-native had librsvg in its DEPENDS. We do not add librsvg-native
because same issue would occure for gtk-encode-symbolic-svg on target.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 77b6c31536..b58641a470 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
+DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf librsvg \
            gdk-pixbuf-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-- 
2.20.1



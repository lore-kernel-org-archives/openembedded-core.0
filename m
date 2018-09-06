Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C66A7964D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:16:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t25-v6so10791467wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JWtaV1ejrbgSuwS1CWTu/1R84vGNHr704OVugpdTipo=;
	b=WISjA7h/WdsLQbU+OIfvB3RMv7Si7C8GcsCHCvMAKwS98xRBkDPX8+uum+IeKCDQSn
	IWCUiVCNY7GN20pVSniNeALb/gp1lUH1ChqwHAYACTJyqyS1+uVFTNm9GZjBM4DqsMj3
	HFDiWMjP0Y9u8npYhC0B9ZhpfE1dO3EaMO6im9RZ1FVFWoWz2zI3eioV3kwkezwHR0Wb
	zHwiR67z+qARsuxna5HPqK9fvDMPkCPEj94zK/pE4sARY4gXp67VKJIogeKa9DAWy6zQ
	u4ponslzKdaaHcZfWdNRCDFkGzvCCMOvdN2MjPagEUj4xq0rQpnd4tNn7rPaYz4A0/Mt
	RdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JWtaV1ejrbgSuwS1CWTu/1R84vGNHr704OVugpdTipo=;
	b=ma+bhIeokXJeOYJ5gjhXm8uLXAP11+XtPbf9Wy+6meBSgLKFcTx271wlOk9vZexldB
	V/6txum7Wn9Tsv5I+2yeZNR4AdDVQerXKUM4PhwxhvRcENj87jhLzTK51/MrSooHJVbF
	wPIlxQNhdL66cjaQeqJZorapHNgYQPakGclBWxo3xtGGc0CfFh+ydJdS4VTq7/ZX75t4
	ljRUtXiMhNMpxpeNZgpm5JosiL5+shzZC3DINyiKGCDtV/ykJQm/NPInoadNORbSqvw+
	GF9ULqXX4lQ7YAMU11i1FPygrFfDT5hD3gzcO7p4eiCUn2UtqRFCLVctYL6DVZ0lx4BP
	7bMw==
X-Gm-Message-State: APzg51A7t0OGn4KEruZD37Py95f6hG5RxombGQ/sa82AL4WPvSH3fNO4
	sfD3TxuiHe3Ilyh/T6b87tiKjU94AfI=
X-Google-Smtp-Source: ANB0VdZeFfxT2L8CCDSCue8Cda2vp4dsQUDsj2MTigdsaqVLvXafUV3j3j9TGFuZqUQ9ygLwOkWr0g==
X-Received: by 2002:a1c:a745:: with SMTP id
	q66-v6mr1768176wme.49.1536232619046; 
	Thu, 06 Sep 2018 04:16:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j2-v6sm6951066wmj.5.2018.09.06.04.16.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:16:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:16:56 +0100
Message-Id: <20180906111656.22987-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gstreamer1.0-libav: use nasm instead of yasm
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
X-List-Received-Date: Thu, 06 Sep 2018 11:16:58 -0000

The options are still called yasm and there's some cleanup to be done, but as
libav can use both yasm and nasm let's unify on nasm (last release six months
ago, fifteen RCs since) instead of yasm (last release 2014).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
index 57f03e8d47a..718db17d0d3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
@@ -36,7 +36,7 @@ PACKAGECONFIG ??= "orc yasm"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl,"
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,yasm-native"
+PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,nasm-native"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-- 
2.11.0



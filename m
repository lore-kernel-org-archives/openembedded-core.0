Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.9762.1629636672796186599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pO1HUcec;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso12132074wmc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUFo58t4n0IB5GPyOZM7+eTdGROZOqpprMbUHT9OHW0=;
        b=pO1HUcecWf6xdlfgDyCD1OTpDmkcvj3LgIpAJgGCkLYTX+rVEuVem/YTpoDk869lob
         IoX/iWGxWTmsjoeVLchVzpngyZO9dCD85u9Hv+ePdgX5+FtBbnQENEMcLfcIuXbWOaRp
         feiK5GNEgXYb13zF9bmBvXUy2PAbFVIa/a9JsJjaFotSuBfym8Goqn/lBphjHftt8kp5
         zj6gAXm9ASpt4Jjs1jVvuw5/p5gxNq24sJh6OjtOBc47yd8QkIVQDjpFe+JPiITm+gcY
         uj98lqESB3WbgiAhkkQdpQc74b7U78+HPz8zDwAglBnCtzHB6WtES+yGyIXYVj10cp18
         rzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUFo58t4n0IB5GPyOZM7+eTdGROZOqpprMbUHT9OHW0=;
        b=PakC/8hmbSuHBbCmqtGWaMiT22fa6hI01ksVjerCxP9Oi+YeBDfyN9xP2r28g0BHkt
         iMUkmh9/vFjnCYaj+XKcrmjgaZnoNoIxM65rpnYwkVX0o4KW4/DI1g4dW/TtPi08fQyp
         EmZzHAMw0yH5VUmIiPCkiW1/E/HMPwMVy+4Im9lBXB0bu2MiT6pNexFf66mlZgLGkEKN
         SEtcOwfFolZbE6zrNK47PGf8n4jBNrev/qQ72owj/Kp2gEA1Q1iVrziPhJys3x5ZaHD2
         rLxDt2hb/9W/7cnhTiiP15LBAWu1ZirRk+gTjhToHhaN8WntH50ZHltt3hymw0Y8jRoC
         4J/g==
X-Gm-Message-State: AOAM532ldUu7nESDqZcYm8QMRjuEQKyg1YJc9vLRdkD7LOADacunpYf8
	joFApHdCTr9cvx7GS3s+kwM8tMZQoyzFEQ==
X-Google-Smtp-Source: ABdhPJwceRc7vPXwhFJ0aIz3u97p+a4beOfAuJGfaIoUDBe8yw3cWeFrspR1m5ZavPp7ttwy1SljtQ==
X-Received: by 2002:a7b:c106:: with SMTP id w6mr12288270wmi.152.1629636671296;
        Sun, 22 Aug 2021 05:51:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/55] binutils: do not build-depend on target flex/bison/zlib.
Date: Sun, 22 Aug 2021 14:50:10 +0200
Message-Id: <20210822125103.310416-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This lengthens dependency chains unnecessarily, and -native
versions are already included in DEPENDS.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.37.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.37.bb b/meta/recipes-devtools/binutils/binutils_2.37.bb
index ff9377049b..e0fea913a3 100644
--- a/meta/recipes-devtools/binutils/binutils_2.37.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.37.bb
@@ -1,8 +1,6 @@
 require binutils.inc
 require binutils-${PV}.inc
 
-DEPENDS += "flex bison zlib"
-
 EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-install-libbfd \
                 --enable-install-libiberty \
-- 
2.31.1


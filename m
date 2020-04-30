Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.155.1588286245251762566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GEwpIKsN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id d3so3631399pgj.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hhvwThaXn+iMoCnrzQm+xAMZIh29CRSCnGDSkNn2NoU=;
        b=GEwpIKsN2Y9LyJpHIX8ut1w+Q4tHlOf64S6c+4pe42TBliyAe9/v5mF0YrLXYcx6w8
         XXoYyRSGui1ELFfxbIcUSSbI5FDyJ9AEBZyfEssNT8WsB3/LBZrixE7IeBLWEQBdlDVU
         7XEsbKvnqjCmi6zxFSLtRnHf8oU8BTQRZZfPMVs/xukX9+HS4gwgQgaM2xVNNLLoUqJd
         eywRn4fWgTFheOjDdlcRQKxeeCIxFSiockO7UIz8abEO2N9lN/9GQPPnRGPRfq11Rpin
         uFamNkYcZTLXI3kRi1UyEE1mGsqS5tNxJOSkvLECW/I/yyz+mmN8RejMVyLW/8hhiyl8
         pVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hhvwThaXn+iMoCnrzQm+xAMZIh29CRSCnGDSkNn2NoU=;
        b=PDDr/l5cDdINRh2amdb3hrukkrt5/fcXAXAGR3wnl/0KmYVJ4UmJx0v4zmDCEPoYkV
         aStWAB+OrUN5dNVKkvbyBgxM1xxQNyjLZb2FQsRU8SOrvzDttL2dqgmbFe9xxd7fDq9E
         hB7XsgMQdTg1dFDCUSXV/oqzQ4EJ2SgHx5LZR+kQeqbQGX1SgbzL7MpomGcPk2PjM+4N
         H2RW4Eq2DizHghMPQkurLdEhFk3o2AJPLH7oD2MbPwK11XldlOVaW8UzBXSuQ2yeAtrF
         AGYJedv271VZrHKadiIHuLYSbgR2KJnzOfQZ6hCYUd3Cc07+IbTgPJCbZUk1+OdTf3xj
         NYig==
X-Gm-Message-State: AGi0PuYwSZAZTLUhDoZCKLsd6QkT566s8VAumw5duRD1VuBZoA5vLxyG
	flhxBDHh/l7gxE0wLW8ZFcxPcaTI0LWHlA==
X-Google-Smtp-Source: APiQypKU/9vhnbf00S0qPTnYlqR4LkuaEyW05V7jsvPz8IfQv4O7xXYoh4B1C5ve+xccdqxVXvDFBQ==
X-Received: by 2002:a17:902:f:: with SMTP id 15mr1333650pla.169.1588285876207;
        Thu, 30 Apr 2020 15:31:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 12/14] alsa-state: ignore 'No soundcards found' error in pkg_postinst
Date: Thu, 30 Apr 2020 12:30:17 -1000
Message-Id: <b2a3cf79cf564a76727bd7dbb21ba9b3d20cf5d4.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Yi Zhao <yi.zhao@windriver.com>

If there is no soundcards on the target (e.g. qemu), the pkp_postinst
function will report an error:
  alsactl: load_state:1735: No soundcards found...
  pkg_run_script: package "alsa-state" postinst script returned status 19.
  opkg_configure: alsa-state.postinst returned 19.

Pass '-g' option to alsactl to ignore this error.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 0670556999..cec2272c80 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -62,7 +62,7 @@ pkg_postinst_${PN}() {
 	then
 		if test -x ${sbindir}/alsactl
 		then
-			${sbindir}/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
+			${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state restore
 		fi
 	fi
 }
-- 
2.17.1


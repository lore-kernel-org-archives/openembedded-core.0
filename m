Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.4534.1588176718749210005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jujnCyXI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id x77so1300265pfc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hhvwThaXn+iMoCnrzQm+xAMZIh29CRSCnGDSkNn2NoU=;
        b=jujnCyXI+RDIDRekHRE4RwWEhnTHrpMBBwqgzlFalRpBJkULetE36zj5vGTHWTnEtg
         OIkC8DLaihZZvtMIUkCye2TKRihRsyzd7p3AzVEt3t7K5i64hXUukeD7VGajXm2f4zSb
         BkUWP40a2FpVPzt0+MWcTnulFSZR04HtgBpkGFzA0grBXwdhwvmqp+ExasGaJ1V7XZps
         J2SfHAYH9ydzuoqF/1AMsCE5Fn/1SHI36dQxqTRSmEVM7WFm48Zk7oSZpmeq0ozOJ32q
         jq0oTu1t/7vozK2Zbz14FAGpW87h/tMU9FWOnyC+GfOuk1j6ZiuVoIGxFkhGHAfgseqZ
         70Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hhvwThaXn+iMoCnrzQm+xAMZIh29CRSCnGDSkNn2NoU=;
        b=GWRPduF4G8Bk/jfykw5SKVLqe9ptEmbxac9TUZtMSSoeo6scXHBnTGISLmqkTrQWFc
         kh2axni0fOmB5/HTKoPLLZ91+7hLyak2848F/t7K29ewqlqudYpsZj0n5VhAUbNX2xLP
         MmoCPduxMCsYDZbvHKG5eZJU+hV8xoGc1vowdxl8Q4jtwo2uKMhUVi40dzor+knSWguQ
         1XYCMwSyaEArdbhx4HVNv93EwDXajVm05SYYp86Au7XdutlcYVWLVTeEa5COfOfzo2TT
         WNfUzc0TE425rGWJss5WEDcHMk+pqoF/8+Jgult4jnlnF7m8thexnLI2Zt/2tLjxDqyR
         ElqA==
X-Gm-Message-State: AGi0PuaDUOZP0LO6GAZU8wi8ZPW6iq16Iv8kkHJXVzFVzgV1rsmg0gpJ
	7giwB9zvMphNUf8d92vgUhrUsbEmGLo0ug==
X-Google-Smtp-Source: APiQypL99V/3w7JnNZ+nTJsJpAmRCuhgsBYMjI6XMFfB0373PlBv0j7Bt75h+Up7+wb0+JC8QS9Azg==
X-Received: by 2002:a63:3d05:: with SMTP id k5mr21266567pga.302.1588176717770;
        Wed, 29 Apr 2020 09:11:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/16] alsa-state: ignore 'No soundcards found' error in pkg_postinst
Date: Wed, 29 Apr 2020 06:10:58 -1000
Message-Id: <aab681c263357b3e832e72b8910599bf3b51b3b6.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

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


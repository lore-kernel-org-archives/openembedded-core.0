Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.32978.1585212877956228704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jjU6E8AE;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id g62so6058779wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uYAirlvHi3XcnqgdHO4cNT6b1TvEMEDB4m0M++71jSs=;
        b=jjU6E8AEys4Zdv5tcmkXpbAtmvPSMDuTCv++LUobg7efrZeJuY5OsR1aGxLqQixtSE
         FwixS7AuSHQUyAVsuGZ4q6nQocHJK4yem0pNwjY1fB4aNlgw9i4tKq0K90Ywclgw2OmA
         aCMhcRwyDMq1jHProzGSTJ4ajUYQnoRJwlGXW2w8iVGOpQXJYKy0jnmbY8qKWQDtECUJ
         aYiLQrq/wyGZj5h3Gk+0L+0xythudVE6iHKR+PkX0B4T9+YMHc90WtkQdmsSA1bCds74
         KaLCenTYLuRQTOF9rXU0NWcJQTlimzVczFGMHdE6P3oEyQxI5n9jjR5N2+Uz0F2hEQYX
         N08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uYAirlvHi3XcnqgdHO4cNT6b1TvEMEDB4m0M++71jSs=;
        b=hNKXlmyiU3mK/EFmjCLwI2Ejsy7O7toeSNZTHQKe5ETUoQpTE87p7+N2PAMZBZ+FM1
         IhfgXFFWLRaKiglvGnbSsAx0FtpTs3GwvWbll5f54xgUAJpMG9u8/yRjv/MT3nxEnyZo
         MO0CDR2bVZGB8niDhmqSR6+Qs6UfzJ+Uy/P8A9cuHWxEIBOMnfV3KRkuvo1GhwacJhME
         KVUIqeN+WD49bNg97lAbm8+zL9Ey4ruy47eD9PwUy/Y2N2IBytrR05SWk24AO4mPTbrS
         cfUH0sRCddbzWVApZU0AbphoC7RcMzeK16ne4cnOAx1A+ABlKQUyEoSt38ZIrTij/k9l
         8C6w==
X-Gm-Message-State: ANhLgQ3KQL9XZ3oJCu8v0/8xSzqqwns/rJuyWRrR5Z3ddsAYRDB/Rktp
	bt1+eW5o6MxucsZvggI4Hh5tf5Rr
X-Google-Smtp-Source: ADFU+vsD2pCKkhf7+lgicbHUzyzYaotRMwIUzILD9D73B83/CSQRFuNr+mJXPgjmtjZGV2/ooKBPUw==
X-Received: by 2002:a1c:2d8a:: with SMTP id t132mr2138647wmt.83.1585212876379;
        Thu, 26 Mar 2020 01:54:36 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:35 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 07/13] systemd: Remove X11 related files when disabled
Date: Thu, 26 Mar 2020 08:54:20 +0000
Message-Id: <20200326085426.117209-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

When X11 isn't in DISTRO_FEATURES, remove X11 related files.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 79794322ba08..db41791cdf24 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -274,6 +274,10 @@ do_install() {
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
+		rm ${D}${exec_prefix}/lib/tmpfiles.d/x11.conf
+		rm -r ${D}${sysconfdir}/X11
+	fi
 
 	# If polkit is setup fixup permissions and ownership
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
-- 
2.17.1


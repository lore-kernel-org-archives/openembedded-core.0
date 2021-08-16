Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.21517.1629103978248142393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 01:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PKrrrU6M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id w24so3290295wmi.5
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 01:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8SxoskI9dFxfb2XjMl4NDzY9SPc2nk8kocIO4xEoW7k=;
        b=PKrrrU6MCXv5ysF45NKvwsd/PFlK/HkjeVW6KYejBIgt5TVWGct7MPYwUKhq1C4w8z
         ntZbkklxF7D5+eiNfli1US7tFxtmx2E071mMrvE1UAtR5gDAs5Veypjy5rdVhxne/Oej
         lq682uyh0hwo6RSCNaeJzuOEqrfgO4KE3mKcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8SxoskI9dFxfb2XjMl4NDzY9SPc2nk8kocIO4xEoW7k=;
        b=e8e95GhgaoLXEDVG9NPHQfYeAhh8MNsb3k4XF9/lt3FipgfsT0aKcfjlAfrZB405du
         4GSl/bfnmMNaZTXgiXN1YFYXs4/1H3u0/aNM/APYjoO27uJ7GE+0wZkHH+4l0xi9RcI9
         3oLVIKdPnDbE01YOP4PgQX/OHnzvMVXCPKPfBTdURa2wKLS/BwZ1To0C4tobJHlneNRy
         weyJXwd7zEXOAwX53euKZPqwMx8DW/2UHU5PzuoqG/6ksPTUOArhyW96bRnxzXEo5ZlB
         2FEtDbmlmu0BLsPK6Y/oe4EHPPpE9plfPJUyIAqhpMkzFA4vIlYeP+QxkYvINY6IxtHd
         u2tA==
X-Gm-Message-State: AOAM533W6o+kPNwQhLdDM4a5tVgnJY9+e5w52pTI2pK3WC1Y33s/NcmC
	sA9RDCkaW/STnE/cKQZkN9VMKOxmkEYgPA==
X-Google-Smtp-Source: ABdhPJy5sSO3Ehi69wIX8fwmjiI07gdSQozXhoTh0zp6RdHF32n1ug5V9d+Ws2zcMhKHAuEYdDn03w==
X-Received: by 2002:a1c:a7c2:: with SMTP id q185mr14086887wme.91.1629103976583;
        Mon, 16 Aug 2021 01:52:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.. ([148.252.128.117])
        by smtp.gmail.com with ESMTPSA id w11sm9646057wrr.48.2021.08.16.01.52.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 01:52:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] man-db: Add compression PACKAGECONFIG entries
Date: Mon, 16 Aug 2021 09:52:53 +0100
Message-Id: <20210816085253.3843644-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816085253.3843644-1-richard.purdie@linuxfoundation.org>
References: <20210816085253.3843644-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PACKAGECONFIG entries for various compression algorithms to ensure
builds are deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/man-db/man-db_2.9.4.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.4.bb b/meta/recipes-extended/man-db/man-db_2.9.4.bb
index c4cdbcc3b49..2b530fb8a6a 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.4.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.4.bb
@@ -22,6 +22,13 @@ inherit gettext pkgconfig autotools systemd
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,gzip"
+PACKAGECONFIG[lzip] = "--with-lzip,--without-lzip,lzip"
+PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
+
 do_install() {
 	autotools_do_install
 
-- 
2.30.2


Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.11324.1608643189000632704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 05:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rVkEefAy;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id a12so31900585lfl.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 05:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBpctCABcb2vIvF8JVX8gJCeF6OHIQq39FdreBxSNlo=;
        b=rVkEefAy4qKvKP9DFFhmQqAU2hPAlAkKJGvXDBzbASKrdZZpBoy0WioqF0YVdAmUwX
         foB/t1uveWYj2qGln2/jojlc8kiaL0UOxat9WvMCuGHuDr5YJZMU4U0NWMks2nPdNB9X
         muJoKmLiEbBllg5qozS/Jb/w4NBT0pRBGG5/XuLesH7B3SGaDpLkarx+wi4MVzk/ymGa
         MTWOcnS0gpMoRB855NxORADlSHkJhMOoaqm6YgkpwsXfI3LPrCOJ/zW+IF311HfApPuq
         rsIHOmtGqduL0Evl5vfTHEyQo/BDo/s+JjxO5Kg01Ye+bKXFQ7Yspq/uyZpFsLbk3m2u
         S5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBpctCABcb2vIvF8JVX8gJCeF6OHIQq39FdreBxSNlo=;
        b=fGjtsh+s6OfK8yTq3r0VZGgpB10HvVfxqwMhXE6/U/j8Ua2btsjPcgfztlnrLiSQey
         sC39upP7Mhy1i5VNXU8KdPPCCQuCxmXwJFO+QYuhI+txcFHthtWdePJQEY+tUp4ED/Wq
         OLjv+6Jyx1K3EuXs3sdDaGulLLBl+mnxQL9/n6w54p6xSbqcef/ukFXxS5EtKfQlWOAS
         UmJoyJMXrOis32Tv1FbGCbdtBqtO4cRm3Z1H3qpZOzhvIhXVh5e0NMg6cqlPUsohS5br
         +mwNyxFgI9IoEmbKliPsZ436C0HZXRYJMZJzAsd9WyEAWOYcdNfV3HVWpdoqUdrsEO5+
         Rmaw==
X-Gm-Message-State: AOAM533nHa261Sho9P5N+a04XrTfivdLhfTZEphXJT6UpX2MbS2AhQZU
	t2RGfpFNVF8BubLwLP5kgf8E99AUCTkPZGNF
X-Google-Smtp-Source: ABdhPJzLyZEd43WxPqvZDyxv+yVnbE9lzErpZKp1tn2x3dDqwaN1rfLqt/ucLcvq+6jZsMwSzwI7Gg==
X-Received: by 2002:a2e:a584:: with SMTP id m4mr9365806ljp.247.1608643186830;
        Tue, 22 Dec 2020 05:19:46 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id v7sm2618276lfg.9.2020.12.22.05.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 05:19:45 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] populate_sdk_base: Fix condition syntax if SDK_RELOCATE_AFTER_INSTALL is disabled
Date: Tue, 22 Dec 2020 14:21:54 +0100
Message-Id: <20201222132154.3033-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If variable is set to empty string the comparison is "if [ -eq 1 ]"
which fails with "[: -eq: unary operator expected".

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 49b1833265..4db0511dba 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -263,7 +263,7 @@ fakeroot create_shar() {
 
 	rm -f ${T}/pre_install_command ${T}/post_install_command
 
-	if [ ${SDK_RELOCATE_AFTER_INSTALL} -eq 1 ] ; then
+	if [ "${SDK_RELOCATE_AFTER_INSTALL}" = "1" ] ; then
 		cp ${TOOLCHAIN_SHAR_REL_TMPL} ${T}/post_install_command
 	fi
 	cat << "EOF" >> ${T}/pre_install_command
-- 
2.29.2


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F362CC4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.52959.1699714993960498332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q0J+GTmM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc1e1e74beso27053075ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699714992; x=1700319792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNOpgxyGx/G0HaosL/4bSriIk0If/lLzri6xdNhq09c=;
        b=q0J+GTmMxZh+vuloz2RVPHLNsiA6nistAaroz1IMjniHoXrhQjxtJq0z17Xss/zLyP
         huLTRdx0AmsQ179E2ZC5EoZNReaGWRcgKsUUR5EwS4s5NTYvTVa7ZzJs5bizWtrBD9Mj
         soBDvsXS4+9DrDjqnJSkNqpMfsmERpoZdn3Yh9LkiEqI1Ki3WEdS69POXJ3n23dkTAVh
         xf8egzmXBV4h1tngc5ODnQ6w+SgelVPn2gpjOPCy9RjpOsmLuFi1Y/O9AJUDzZ1J/nRB
         8/h59RvxhcMVmTR4m+td/QhmOpBQe2U9q9EaefRYz0k1qEI8jJ1JX1x09kMNiYz2YasT
         gtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699714992; x=1700319792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNOpgxyGx/G0HaosL/4bSriIk0If/lLzri6xdNhq09c=;
        b=EwIk+X61AwnDnvFynsSDqD/eP1Np8KgNyMM1wJP8CFPLXTNc1dQbyjGltEs5Vs/cwB
         CEZD8So6XpHCgNf8cgQUfq1ZyKIwsCKDte5WyagQpnWxutK2QQ7ozWUlnWGLi6+33C7K
         RA2+NM6JLVXmzmYzDtduXtfhJ1no+BVDV2qtpgqSrv+naQhmws0TA8+WO7cL9eWqyOZF
         t6yAbxlQzzyooBUSAim3QHxb+bKZRvLPg+gfqJes8B0xhv2iFaiGBVN3Pm1NUQK9+Ll5
         qyv3eWQNa+kSz4fr/pzJpz+3Or7Y1x0D85lfF28nLa0JZULMz6NlTy+i6DkMrRoYK4tQ
         4dAA==
X-Gm-Message-State: AOJu0YzX3I1REpZdz/VDgVoxk09ET0PGw/iRzPkG/EpSSiwAp9gRbtKM
	d5qq8WLhP8fkKw+wbt5i4n2+s/+UT4QOTs7ChiA6mw==
X-Google-Smtp-Source: AGHT+IGz4ofFjpUrII/0+B4xYqcO2u4vO4sPn4prgQT/VlS4wW/ixz1GFGHAPjVSvB2QudtBTklW8A==
X-Received: by 2002:a17:902:ceca:b0:1cc:5691:5113 with SMTP id d10-20020a170902ceca00b001cc56915113mr2948934plg.26.1699714992446;
        Sat, 11 Nov 2023 07:03:12 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/15] kexec-tools: Ignore Fedora/RedHat specific CVE-2021-20269
Date: Sat, 11 Nov 2023 05:02:50 -1000
Message-Id: <d34567be6e87afdec55973f8f75be8d44b4acd1b.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190416

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
index 871b36440f..206c6ccae7 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
@@ -30,6 +30,9 @@ inherit autotools update-rc.d systemd
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
+# affects kexec-tools shipped by Fedora versions prior to 2.0.21-8 and RHEL versions prior to 2.0.20-47.
+CVE_CHECK_WHITELIST += "CVE-2021-20269"
+
 do_compile_prepend() {
     # Remove the prepackaged config.h from the source tree as it overrides
     # the same file generated by configure and placed in the build tree
-- 
2.34.1



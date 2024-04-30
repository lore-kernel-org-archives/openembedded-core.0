Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDCAC19F4F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:48 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.269.1714512278825045499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ticHLZTV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so205085a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512278; x=1715117078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVSrnn1bpuO305L3lwXZuxPQyIg0jHBtPzrX5CacdOE=;
        b=ticHLZTV+UbGLCUkKClr7kxgIcJdijOeZw3zwIxY5M3X37QMhCYswIDMWOQ4Cvs2mQ
         FadNEIKmeKnKEFsam5aqDVVNvcWToR5oVhmTtZLU79NCZMI4loHQWfbhZJx9w5Oy+5sO
         ijufDtoHyZo6b8W/8A4BHGSpWjBK3Rzr+cJOPEyD/ncYzLmm2XtK5Xz0xj4ME5AyMolr
         Tiy0mgITutiLLdw0nDvc5Hit3gsCymmhXIsT0IrdT/OzeD07/Vhq+akN2HEu7x5IEHGP
         58r29aNCjW+Kh7X+73jnCVIShSxFUdTdNUxMDICZX6fRSg34Fk4U7wBHlZ4Yt7bvrwbC
         llXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512278; x=1715117078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVSrnn1bpuO305L3lwXZuxPQyIg0jHBtPzrX5CacdOE=;
        b=vFp3uDDFvTzZ5ttQ4ikAyr5M1Dnly/vvbeJqPnhKJyxqCIpm0LqUObXNg4Ax0lQdvR
         WNf2+JdJdpCh+1/NWi02uvcsnp6k3/j6nvM4MHznKvp0apxh2eMZJgeFqHWCyhLBOIIu
         lSv8vl0ykrRVwOK0tBWHdkMI0flagmuyt4T59s62nF/U1RSiw0Mp6m5ig84WLtjQqD8T
         Nq8gSBoRUkzbzMnmG1SrW3Ghfx/c6cdaCcqBowXmhuf3zngVauk0NIwYp1Hdr52D/iSg
         GsaiO6HD1HMis/flf2z75uwrgvPamsibtZsRCZ7Fsa74Lp0FDTTIaNlrjgX7DQ2CL9A3
         NzFg==
X-Gm-Message-State: AOJu0YxphwNinZMwt/qRf+GPMMW3eQpGSCr1dupEjqVs1OcaIr4hvuEx
	ZRpdXcP9HK3lZ+sWqDRehv9trJsKE/FhSHR6gNmu9dEG+MP/i6gt/uQrPAYPZGrUGIzacKqUG4j
	CE4I=
X-Google-Smtp-Source: AGHT+IF9kY8WNuxBmosgNE80Dde+PLWxZ01f+Xeb0xxC1ne38htjEM8qTs7djpGedkvqtWkM+Lcw1Q==
X-Received: by 2002:a17:902:c40e:b0:1eb:527e:a89e with SMTP id k14-20020a170902c40e00b001eb527ea89emr5818348plk.26.1714512278104;
        Tue, 30 Apr 2024 14:24:38 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/17] libdnf: upgrade 0.73.0 -> 0.73.1
Date: Tue, 30 Apr 2024 14:23:58 -0700
Message-Id: <7acb8c84269b2ac1adf0a623d226867ed050d29e.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198777

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Fix https://issues.redhat.com/browse/RHEL-27657
-subject-py: Fix memory leak

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f16b16e1b6c60f0a1c9bc8d5492195fc66f33a19)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libdnf/{libdnf_0.73.0.bb => libdnf_0.73.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.0.bb => libdnf_0.73.1.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
index dc2ddf9492..3ab840b1b0 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "1f30b3479528e8b62754f9047195c8e5a31f07ed"
+SRCREV = "0120e70747dcf05e716792e2e846c62eccd44319"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1



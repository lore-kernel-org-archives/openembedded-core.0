Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF1EC46CA2
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:27:52 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.2912.1702391271548268368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Gq+TG5fj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ce939ecfc2so4996728b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391270; x=1702996070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6VWFm2pV8rvXaFujrgcr1SwAq/uEyMCZolch9yDK28=;
        b=Gq+TG5fj2ldRPLuEwAg1ZT/8qaeIupgtxw4cO0sF3mVFEVMIlY5DCEjB8RJpe4Nmcr
         2ZF4VijaYZpx5scERUNkZhMSpsAdQhaF03IcoHHKft9VDeeO/fYIh9MZdD6n9iOu/0S6
         9nEH+P/BpopuWF/0UpPfbbbOQkbg7LTvIjTx6qua0utMvTLLMGUb6GUZ7D5+zQqLbAMX
         ow2ffU/G9HF6vSPrm9uTaKGKphT6W3E5aTF130UQabPqyPegOJzDBCq2JnC/Xz5U3fO9
         5m+BVLU8eo1E9q2ruVo1ViEKZmdpX7sYi4xmWQ8vUAHQIBFmrz8rJ1X2jCK4nHl3yCyg
         IJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391270; x=1702996070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6VWFm2pV8rvXaFujrgcr1SwAq/uEyMCZolch9yDK28=;
        b=jK/zrrnJGdlEMuJUUda8z7w5CL3s4xRpefIrxG21+KYePhxkx5n88n6VCcghtdA5LA
         qugT3vTEt617XTHMChccXftCBQyaGN0de7fTzzJdw8CLvy5oizuo44qiH7TGXVrQd5ql
         SngH7YZ1Ecmx5w8ZqwB5XDYKUWYlMWU65YRfeli1AvUeCDNCuzE/e+87JAAy4Mcddg11
         aUs6VpthWUacHkx64vljsq5Fy8KM5FBOuRMG09Bi2RIW4Twc84XWgFqcg6m/lSHdSsJq
         /8P9XD35pRHLMr6K+Kud/g51I1WeX3HMurqG5XiqDmSVAXU1AyAMYcj+UE6qPbbztIFQ
         WFJw==
X-Gm-Message-State: AOJu0YxZKDMlOtADFGRTcXPSJl0PQH+Hl1hTyStYXYLS70ajqSrJ1g8N
	FKK8hz24/8xYpMs3kkHAh1gOBV5SNTvwlE/d2I4=
X-Google-Smtp-Source: AGHT+IGL4ClhP3y0t4QMlzVJKIt98oX9qtgaDBy4KlMllREctLly67iqf0Jfw4cD43cgVNFEH3VDXg==
X-Received: by 2002:a05:6a00:1889:b0:6c6:2885:82c7 with SMTP id x9-20020a056a00188900b006c6288582c7mr6024028pfh.25.1702391269865;
        Tue, 12 Dec 2023 06:27:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/29] msmtp: upgrade 1.8.24 -> 1.8.25
Date: Tue, 12 Dec 2023 04:27:10 -1000
Message-Id: <8eeee56a576dffb7f9bac9131563b555d30ada42.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192208

From: Wang Mingyu <wangmy@fujitsu.com>

This is a bug fix release:

Generation of Message-ID headers was improved to avoid problems with rspamd assigning SPAM points
Documentation of ignored options was fixed
The combination of envelope from addresses with wildcards and automatic account selection was fixed (thanks to Jonathan Wakely)
Translations were updated, including a new Romanian translation (thanks again to everyone at translationproject.org)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 58fe8184f7ea475ad1be754e0de9a76cd4cd7c2e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.24.bb => msmtp_1.8.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.24.bb => msmtp_1.8.25.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.24.bb b/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.24.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.25.bb
index b8c867161b..b575fad5e1 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59"
+SRC_URI[sha256sum] = "2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.34.1



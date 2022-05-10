Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF00C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 22:00:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.3455.1652220040060764727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 15:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GqhTEfTV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso2118174wmh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 15:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2pbguNLNsbhZP0VMs3MkJZmPRDQOdiAydUBgGyt1HUE=;
        b=GqhTEfTVwoUyNsR+mLr/ZuddiyEjWB02DzFPSVlPr8euQxAXbLM3YGCZTruGocnAXI
         I5GemIoQI1gOsncVLzsaalJTfHNp/RKB36PW9DcModk2MqZSzm4Li9QJ7vx6Ad2+Y6XB
         yB8m4B6IcX1MXZYnxq3PHNNj81RPKU0vdPXkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2pbguNLNsbhZP0VMs3MkJZmPRDQOdiAydUBgGyt1HUE=;
        b=0Q22q5dE8BRClENm247Db+KFgK4eqXjq+3da9fq0BNxjKQJsRJsxQYwXMOIGjWA6O5
         noGRPtgXqJTxsFdeo2LjOF/EHnTC6uW6DH5lNtsNXmfa+TwR7mDD+kjKF0xKeAtrEQFG
         7LfVinKwnXYtsuGF1hPk+73ODhduZ6XXVSflGCgMfEFO0uSXHbdN8pl32kb7EQ41pxG4
         Dn3c8ZR5RXcxryR/UExTNJMB/rTLe35UIP0XJHMQQhxjw1ZNU/LrvaYLEg+YyHU/vsnl
         /MhqpwUVwc/y2gTwEssMgltKuMxwBGSixjrLrwq6fpK/SbLwMDBia8QJISZ6DCcPCGu7
         MB2g==
X-Gm-Message-State: AOAM53311hCq40LMph75MozEsGEIHAnGg6XcvE4FYaJQekrv9cMEFPED
	X1687JVnIBsCUkfJy0Szcxm1fKQ3PhlItxRb
X-Google-Smtp-Source: 
 ABdhPJzKZABSmMMUSA+s6ZP8HLrAsFyoNcMDMUVSP96xi39qaTSNZn40cpjpRUbAEi4cQ6Nk4SgGOA==
X-Received: by 2002:a7b:ce02:0:b0:381:2007:f75c with SMTP id
 m2-20020a7bce02000000b003812007f75cmr1918807wmc.6.1652220038102;
        Tue, 10 May 2022 15:00:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:679c:4264:8fce:f81d])
        by smtp.gmail.com with ESMTPSA id
 p19-20020a7bcc93000000b003942a244ecesm367651wma.19.2022.05.10.15.00.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 15:00:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Don't warn abouy make 4.2.1 for mint
Date: Tue, 10 May 2022 23:00:37 +0100
Message-Id: <20220510220037.247135-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 22:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165467

Whilst not a supported distro, we can exclude this from the warning as it
is debian derived and doesn't have the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c72a7b3ed3b3..b416918013c1 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -470,7 +470,7 @@ def check_make_version(sanity_data):
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
         distro = oe.lsb.distro_identifier()
-        if "ubuntu" in distro or "debian" in distro:
+        if "ubuntu" in distro or "debian" in distro or "linuxmint" in distro:
             return None
         return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
     return None
-- 
2.34.1



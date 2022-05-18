Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9E1C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.335.1652841066474008356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PrafHgjD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id n8so508117plh.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VHbgKVqdt9uewbg514XpAZRQrL3fPr3t2sW99n3YG6I=;
        b=PrafHgjDKZD/rPcYiZ7GP5to1TcvEjpHKE537jgRzm5HIs0/286MoYDlleqqEA7gWS
         5/TAJbxadofhIUMRlW+1WJS0jyVcdB8NbOSDj6I4ddzzvHfuxxLv2HciKNnggveKKu0u
         4fzt5QlhOEVMQtv+FUO3seQO/eWXrNR5AvP4Hf4KdDMz7ECiFT1JuqLbgqBNN+JwUoHP
         1TnEYvDcE/uSTeC3ORlTP3K7tShMHhhmFB7evxesHacwV6azQEXU1NXY1AGB2gVpvIhj
         7O1lMbxskNOH8afz4R7eRTu0iKAZuUP9VlYP4/xeSAOyTevglDdoUC4bsvpHSYSkH6Yk
         t8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VHbgKVqdt9uewbg514XpAZRQrL3fPr3t2sW99n3YG6I=;
        b=QnKZyrDHksYtkiSlK5WMOtPLEb/LxBan9lfoHYH8JDCfvXrekhpnY1R4FpcWyVkw+I
         vRHIyCmA5epMHEwUQiwXJiFqTuP1ocGJ4a+eFDML18PxZ8oHJmW2OnF34+DO2xottE5L
         m+HRG1p5SYXYju/YOhle+5+6gCq1GcH639Tp8kufuW4eiQAn0AEIcEl8HPHPOCmXMwjF
         5mjvG/ONF+6U6WyKnGR9JxVUlb5+X2zHcwY5np4eqP+Mu9b38HEkpUig2NXoyr1dhEjx
         TO5fqgjLC8L+hxAPs2Jei3xzjQ8nKpgIPj7wy2LZ+iL5YH7J3T3Hf0ByC/GsUSot7Z42
         OLEg==
X-Gm-Message-State: AOAM532XgzJ5FlqZqXBuwLNad4Koc3n/oouNA0983Djjjnc2oCrCL0d8
	9cqllyrZRnyr+MrIs986FHCiPYxtvfZC1ePA
X-Google-Smtp-Source: 
 ABdhPJyxnUBKdqSYrLiY6vgNLnDoModz+MzGN0TzIY9Cn3ElHg9GFGey6n1dRhsy0K259KYDuN9v6w==
X-Received: by 2002:a17:902:e84f:b0:15e:8edc:dec9 with SMTP id
 t15-20020a170902e84f00b0015e8edcdec9mr25206508plg.78.1652841065416;
        Tue, 17 May 2022 19:31:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.31.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:31:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] git: Use CVE_CHECK_WHITELIST instead of
 CVE_CHECK_IGNORE
Date: Tue, 17 May 2022 16:30:33 -1000
Message-Id: 
 <970743af349e21a399da6241587b849b14933bc5.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165787

From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>

Use CVE_CHECK_WHITELIST as CVE_CHECK_IGNORE is not valid on dunfell
branch

Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 879920d97e..b5d0004712 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -22,7 +22,7 @@ CVE_PRODUCT = "git-scm:git"
 # This is about a manpage not mentioning --mirror may "leak" information
 # in mirrored git repos. Most OE users wouldn't build the docs and
 # we don't see this as a major issue for our general users/usecases.
-CVE_CHECK_IGNORE += "CVE-2022-24975"
+CVE_CHECK_WHITELIST += "CVE-2022-24975"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
-- 
2.25.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC1CC7EE22
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:16 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.70177.1684081932406911614
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VroUgE2j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6436e004954so12278632b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081931; x=1686673931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPfrUkaTAgP5PdKDBCba+VWzcKYj10eedYkXl25GdsY=;
        b=VroUgE2jZwASVGzN2Jf2Kmt+jz/V8JOTMdyp8nZrglXAj13gqQLWugZGwEcnRc3JkU
         UBKoB6P5YMbBOUTRwnbJqjdmLRqL2hfJ2qkqo8W1+qfJaj1THcRxLsPTD0QtH99Lv7/e
         fsweHI//HZt0MOcb78IaSFyxkFlIjZijt5yCy4IMgpc3PLlLFPs9cMQgAsOoDbrIptMn
         Uh9rwk0GGsqInUWBY5Vz047Yt8jP+biHq1CPzM9WZTqfmTYIkbFHpbmpfV1LbMJHaYbU
         r20rYiNdN0HeHKbAgoyDANhBg1G5UHy9yyIcjvgUYC1wRhJSSCuJ6qrmIcHtWacQB+R4
         P2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081931; x=1686673931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPfrUkaTAgP5PdKDBCba+VWzcKYj10eedYkXl25GdsY=;
        b=khS7hrdOhKG89YkrhjBqvcBuYw0HqR33n7DhJmaYCB7n7hFq5NZ5PTzSZsoNM/+V+1
         gCp4OqDo4vbJZXQAotueLmQxgodFQMDnTzYi/fpdzf+qnbYhdVni1SPd2HJZqA8sXXdt
         st03qphLr3hRs0x/ytm6Xfm4GRuTTIOtoWl6i80BLYg7LW1RA9aQG8vGxoqtjOJMVt2i
         +yvGnlRyUSGRa/8WTqZp3jMzucmrTRudNAvSiNlnkPn+ymIWVG1Y+AeOrEFAwh4Ndmsw
         dzRu6jyHPJArgyV3UJzRl8IVUn6T/mVQ2UN/PjvZbe3fOxg7g5n2oYu441txob6BMMff
         GHew==
X-Gm-Message-State: AC+VfDz1/YkySeGIEKu+2y+iQGZADKg2SO80/WOhxf1z7gj2+vXIQkW7
	bVSV3GNt39Hpz5fJFv5fKrqO7x48lWY/nIn63rE=
X-Google-Smtp-Source: ACHHUZ4M4E3O38jWHJpCK4j0bveU3Ig+VPBv/xF/SXQTn9L8B0eciY/GqAb+/vE/8WEmHcxc7VuQ5w==
X-Received: by 2002:a05:6a00:10ce:b0:639:9089:798e with SMTP id d14-20020a056a0010ce00b006399089798emr40640335pfu.19.1684081931521;
        Sun, 14 May 2023 09:32:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.32.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:32:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/15] maintainers.inc: Move repo to unassigned
Date: Sun, 14 May 2023 06:31:39 -1000
Message-Id: <0b5bab7aa8bae98ee7fcb2a8863d4c10ac0ca37f.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181215

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a51a069bad78c578122ae1a5b500f715246d413d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5699cac3a2..94b0e8432e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -717,7 +717,7 @@ RECIPE_MAINTAINER:pn-quilt-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-quota = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-re2c = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-readline = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-repo = "Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>"
+RECIPE_MAINTAINER:pn-repo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-resolvconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
-- 
2.34.1



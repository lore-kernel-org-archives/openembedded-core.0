Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48671C76196
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:04 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.5158.1679003160760548784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xo8X9h7P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so2986035pjt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00q50CQ41k3/LO6aGRhg+dK+uASYc2UKeBpDijjxYH8=;
        b=xo8X9h7PJSCM3lUWimJ3PMNliHWoGfj9FlTHgyzSu+iGHkBgFMuxqT10OHWXImpsGG
         Nq8qdTyLsQV4lrJ5eSW5INkCSuIOTok4uay/PweiIzGmaKCVl3jJHaUYFMZAkIV8ZixB
         bhkwnK0QL6DFRc6/YPAgK5XOCvT96sFczaDAz7HHVwWMMh0OR8mf8m5dvhaDoneOI+Bw
         WCdKX+1C6mj3ii6yg6SStbLs/tFTO7fwPUCiygbrPlYcXhuLhcmFuUx6q+bdzG5beJZS
         UyuvuINtvdmaSCeBo0yBMZ9DXbjnVi4Wt/Y6TdaG8iIm0SNUqznqupZ/gbNVpYknRfgd
         JfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00q50CQ41k3/LO6aGRhg+dK+uASYc2UKeBpDijjxYH8=;
        b=LgoZEL43H7bncJv2sdb4AdUWAoMtbxGxY6IevR0TLw3PdQmX/ldbShX7r56chkwiGe
         I0u4hzVsKxFVO2zs1ocVY0f3AGyUklYvGjxB4RXELJVIoy5b9/ADR+lyUt4cEr4tXaTz
         BRaUdbum0Z443SATASkSnQ5Imrsp2EoIR/Q/q8dMxXMJY3GT1/t0KufXWxXDesMgnWSQ
         mfKE8ePpipEoIe7MS3aa5t4BsqMIm4dF4ScFe57bIKAST1TeoQSCSbWz/gnH6dPoZ44y
         XU2oyLFVp+KB2SNr+xKFb7+lbyPMKkHmK3gW/WqmTHVdL99fyqvz9kNPNq/FDDqEP/He
         arhw==
X-Gm-Message-State: AO0yUKXlYX4XBN6LH3JPTBDJN0NoX6lrh61VV3qRiOsib/P0zpffSrl9
	VxS6FNCnHfsxPxl+J+VSEULdpg0L69hJ7eQJyCo=
X-Google-Smtp-Source: AK7set9qpHyb0QqJjIZMPsnT+DPo7Fallc08tBTsfchED46KL+1Tu6o93mD2j3BOlPyPEhGJJfmjPQ==
X-Received: by 2002:a05:6a20:a103:b0:cc:8a62:d0d4 with SMTP id q3-20020a056a20a10300b000cc8a62d0d4mr6656887pzk.38.1679003159876;
        Thu, 16 Mar 2023 14:45:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/23] apt: re-enable version check
Date: Thu, 16 Mar 2023 11:45:15 -1000
Message-Id: <fa5d357becb222a600380c902f4fe8f4a856d404.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178729

From: Alexander Kanavin <alex.kanavin@gmail.com>

2.6.0 is out and so we can check for latest version again.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9851579eeebbdced9e770c4828f521b359e0306f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index ccdbd3d652..ef85750b84 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -38,8 +38,6 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # is considered stable, e.g. 1.0, 1.4, 1.8, 2.2, 2.6, etc. As there is no way
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
-# needs be marked as unknown until 2.6 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 inherit cmake perlnative bash-completion useradd
 
-- 
2.34.1



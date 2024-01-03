Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D5EC46CD2
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 03:14:21 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.6134.1704251652138487525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 19:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jN71w4Fe;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5c65ca2e1eeso2795503a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 19:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704251651; x=1704856451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2daObhL4Ah7NsiXnY1TiVEmHZSXDbOf8kAvUSNrAlw=;
        b=jN71w4FeVd76goxXHQhtGaPos8dgv+2jSa4iRjPogxYjw1e0wPZ/hqCJXn46vVBYzW
         4W3mHiBbQS7NZnaJ61pHsdVOX6WtD+PqK8/d36S2fDHLVu4iyL9pEHjQajyBD5U+0iM0
         EgFLSG8aBjRY+yGmAPjTMZNQl4UGuWSv3732+aWSuXTb7ETpEhf1G0okKZDiajdB2/r2
         6PnKsoYQ/TH39eKdxz9bAH1l7DgNutgDTIiSG1XsV8ci5qrMxmlQZvcU+lnBeMVN0aAa
         uO9VAAc2OG9ltpvddSRrE7B4EZMjwxJXvxi4ihJ0SD15f/UYkrQwydwEUe4H0bB9Ig/c
         ZmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704251651; x=1704856451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2daObhL4Ah7NsiXnY1TiVEmHZSXDbOf8kAvUSNrAlw=;
        b=pPOFIo+3xIAm8MqNhycLmNzzCqOwYnm2GaQdP+dcHsbR4AxOiGfjd9UTz/MlrVD58+
         capmNrgvluA37suz30Z2D6iziJY7guvWl7UPiafIXDa+2N3nPn7n1mz/RcJFg+y8Afh2
         j6GPpjtRBjpq3B0lZ1BZrWw4OMnehTcXpxycY4uDWhL5CTPx41yLlx2B+zH9yxXCri3p
         bJQd+xIKRE1zmeFa3/FmHmpnVs+UHwZGJiCfttzOTz8YN/ZgxmdbWSRtwH5yxAbrJR+1
         /JaMzVnxTZtepLcF/rYjX0EVaV4YSiV0pEwrqzOq76zxAlCYvJCWS4t22/waZnmypBeh
         QffA==
X-Gm-Message-State: AOJu0YxGaHkepUT++PBcxoHqnYfbnzw5Ix4gAmJGgl0MAAfd3RNF49SG
	ykyVxBl9ci4bT8B4E15dpGKVo8IV2SpqD6/+YKpGEskzA0UYLg==
X-Google-Smtp-Source: AGHT+IHMG7tjraIRpd+2DM8LuTeOHGV2bSmefbpEYcEN4+VqAz6g/muhtZoTCyijcAdT7GkibuCSrQ==
X-Received: by 2002:a05:6a20:548b:b0:196:530a:33be with SMTP id i11-20020a056a20548b00b00196530a33bemr3897613pzk.93.1704251650933;
        Tue, 02 Jan 2024 19:14:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id ay5-20020a1709028b8500b001d4ac8ac969sm5868681plb.275.2024.01.02.19.14.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 19:14:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] tzdata: Upgrade to 2023d
Date: Tue,  2 Jan 2024 17:13:57 -1000
Message-Id: <3ea36d92800b139eaaf75995cdd59912b63db9ee.1704251506.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704251506.git.steve@sakoman.com>
References: <cover.1704251506.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 03:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193268

From: Shubham Kulkarni <skulkarni@mvista.com>

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2956b1aa22129951b8c08ac06ff1ffd66811a26c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2960bfefe3..75f13cfc94 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023c"
+PV = "2023d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
-SRC_URI[tzdata.sha256sum] = "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
+SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
+SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
-- 
2.34.1



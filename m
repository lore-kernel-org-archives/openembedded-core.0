Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63DCC25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:26 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.22259.1659940997486029254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L6LK6KTq;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id m4so14831017ejr.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xfWkv5sN/pUlhLQ0R07H0xpUkqc83jJpsyp4iPdA7cI=;
        b=L6LK6KTqo15VRQ/c+myagbBaJ4BctOQeS4GtwUXuNmeKN1GytRvA49ZoGsBAQtwbGm
         EYhX3H2ZEnAgqK9YwkPiKGDC2VvJIjj+M+lVlxELMYwzm3mqqc5q1ETLX2wR2gy4RS57
         97q44uoFd+nK5DqPSQNxXJMJMWY6OMRGUHKqz1nDGmHi+C6aVDdlTFaiFiVSA9XV2NjU
         qeg0+R/vY0OLoGWJuG0QgXPH5SjuY9EnVeLgryxydf1dFr2QDCYECjJr+dtnSckzHnFm
         yxhTUwABSc/igsLi5SFLIZyWxODKbs01cIdQYn5uNXAwfVBR2F2WLFI3voV9zhczaYgE
         5wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xfWkv5sN/pUlhLQ0R07H0xpUkqc83jJpsyp4iPdA7cI=;
        b=COM9P6h0dtob/EkgnuCA9DiCCgpMqtlTGdHSjguFLx1MNSpjXvCstyLCpsGszr7btE
         59Sel0vuTmco/7Md7hr8dPA6i0ljBLTgOptQTvY1RW887RCVKYCbhU8sTZGu0WIiWSwR
         ExtKerQlUEAERPqEC5uDZtNMOBsa+pkc9NB0giBrYF28TNu+04xqxeH7eq8HlGRWDvay
         QmD30qFlox6W0TaJM2IfFXqWKrhM39AA1H5CtLhH/0OFBzvPey6sXa+IEzIR1z3K4gNX
         pz2JqmsaybvZy0RZjfZWbcqxz8xbTfixbkIVIwEFY/SWm3rNgRiOEWe2UpTtzlteYjdU
         5X3Q==
X-Gm-Message-State: ACgBeo1nUHeAPbjkRARc7AjZDPDflSbU8aiDzqDg0pIwLRJUOkTYYqLt
	ARC2kWN3vStp/7zvDIMsRyghJ802t4E=
X-Google-Smtp-Source: 
 AA6agR5WSgFUyfUy4oWyIY1PyWDCTP/p0nYhcu0q4XYTheN04o3VR0qaOEo6pCFXR0N1/xSLo+CE6w==
X-Received: by 2002:a17:906:6086:b0:731:3970:48d0 with SMTP id
 t6-20020a170906608600b00731397048d0mr5365525ejj.16.1659940996064;
        Sun, 07 Aug 2022 23:43:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 40/44] sqlite3: upgrade 3.39.1 -> 3.39.2
Date: Mon,  8 Aug 2022 08:42:33 +0200
Message-Id: <20220808064237.3975347-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169064

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.39.1.bb => sqlite3_3.39.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.39.1.bb => sqlite3_3.39.2.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.39.1.bb b/meta/recipes-support/sqlite/sqlite3_3.39.2.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.39.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.39.2.bb
index 39ddbfb908..dfef480895 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.39.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.39.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "87c8e7a7fa0c68ab28e208ba49f3a22a56000dbf53a6f90206e2bc5843931cc4"
+SRC_URI[sha256sum] = "852be8a6183a17ba47cee0bbff7400b7aa5affd283bf3beefc34fcd088a239de"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.30.2



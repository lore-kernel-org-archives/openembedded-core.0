Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91E3C32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.475.1660894085121305634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c6+Co1Q7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id h1so1883374wmd.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1wVZkslQtYL5IALnOc4Vf67CDroV5lP9ED+z9za4Wj0=;
        b=c6+Co1Q7q0+SvCWZ5ntJbipT37QdhMzMNAroBV9y/LNn1GFOa6YP05Ui/vvI++d3Kr
         a5gmIWvCOsjc02JBM66W5reyKaP9QJdPrCURHruTrtDTlNjCiXrFW3lJSiz4oDKtWk1g
         R17fXv79iVEIdDtpKZ70YJrmfH+z/kUzsQ348pJpuLCeE3KOSfPB3EsYtxwNxbS3WuKa
         jEZGdZL/E32pwLCBWDLShOPTH7/tkGdV7b5VTWGEipqmf7yxNbkZzTEDxMFVVsdFroLU
         GKgQj5yfEJ4B3CYHcY2rOfqdfJF+LuXqFM4hWyQ2qLzgE/DpriMTi5mVYEkGgl3pcaM1
         ki7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1wVZkslQtYL5IALnOc4Vf67CDroV5lP9ED+z9za4Wj0=;
        b=4VzDgDOc3uKrD6cg/8bAQLTW9IXQiD+b6NRjEkbp/kNIVAOgH9sAzzh71zTBe4mF5K
         P09WummnmjttJgkplYupfbzBU77FMVcjxicFE7MzhrTBXz8j9uscGvtR1qUuEqKb2/DE
         RqUQFya9UmP7DPvMc6vybDPMlbP0W644nCaa6g8biD2iSshV5vRHRtKnZZ9YTQcWPh6G
         RZaftNKLvjvxn3Er7keh1u0DbCUPMNcymWWr8dZxOvhzcsiLu+HFWMg/yqFuvBU18oV7
         NoUyYgE4MKIuXkcuWEDsofzDJtw1gI+3WB41fbYCiCXYFuW9wdg6suNDjZvabdkYcAU0
         tkYg==
X-Gm-Message-State: ACgBeo1Q0WROBxC93dFHre15oUQHnzsDcAiskpjC8U+UZcJ7LpzLkPLz
	dfSxVQqtSIf/m1Q8RC/b2laWI7r5Xys=
X-Google-Smtp-Source: 
 AA6agR6t/sJIdhHQBs9pCn1Fsx6rfRS5IFzm/N0VfK7BDnsyXHBcVOiXVNPlm9txOtKc7JQcVOyxow==
X-Received: by 2002:a05:600c:34c5:b0:3a5:fd9d:7b2b with SMTP id
 d5-20020a05600c34c500b003a5fd9d7b2bmr7189976wmq.1.1660894083509;
        Fri, 19 Aug 2022 00:28:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/42] lighttpd: upgrade 1.4.65 -> 1.4.66
Date: Fri, 19 Aug 2022 09:27:05 +0200
Message-Id: <20220819072727.2236928-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169591

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lighttpd/{lighttpd_1.4.65.bb => lighttpd_1.4.66.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.65.bb => lighttpd_1.4.66.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
index 10aa27f072..801162867c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "bf0fa68a629fbc404023a912b377e70049331d6797bcbb4b3e8df4c3b42328be"
+SRC_URI[sha256sum] = "47ac6e60271aa0196e65472d02d019556dc7c6d09df3b65df2c1ab6866348e3b"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.30.2



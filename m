Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A726C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 06:55:48 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5305.1783925738332716168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 23:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FPsjos6z;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca913a601fbso1924602a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783925737; x=1784530537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em3TwzHx/62SYb2JQKEOQOS3gTAJJbDVlz10ql1Ri8Y=;
        b=FPsjos6za8nr+4tPEN9mggYC5WGKWkZ1v8+0yiB4zZKZFQKZUKANUoUzFkvlMJmWTE
         F/xvou6iyGJ6jmN0m58chuPCrCfHNFyFAA92ygF4N/oudqvKBCehbeuv4AheLA7MLns6
         j6q1wsUWnM3vDG5C32Lzxbh2iETaLh+dtxILw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925737; x=1784530537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em3TwzHx/62SYb2JQKEOQOS3gTAJJbDVlz10ql1Ri8Y=;
        b=VukUtKUfaiwxZTle+lBbdnwKRqM/cZuj/OHnt4Ubu/AgdciEcqefwciT52M2E+bA4C
         Jci0tofT6FV/oz9icl3GAu+isSvEX4Qjs7k2oc9PIvLk6KQzkJ036MzFHjj95pC2/te3
         byPeBssypTlgzYjhpN8kYUFj5as7FITEfqLFQHb00+7WxBq2VPc5cyqNzMCMHQDjVCIJ
         9JV4uWNMay30fw03RS7SIiIUsy8/zoKISXLXVZ8nvyx10G9dIvTB9wEgQErIS8Uzw8Xr
         yZ96WvUKP0ybs4tySuczHr+QOrze8cNaoDou4w4vWo1OHlb8TtMG4C9hO1ndJyhlIjne
         xM3Q==
X-Gm-Message-State: AOJu0YxqyvDtibq+dFW1msDso87ctFIM+eye7NA8wMrz1mD00iRXemTw
	SVleKzlik+cEi0Mu2/cCA3smSt8mQ3VWsR7NxpLFqU3GlMk9SRUPPNgAEotHoEi59hR148yteB5
	VRR1KszQ=
X-Gm-Gg: AfdE7clssiSD9pkjZq+ShlYpwugx2IUjQ0Mla112Ry3j+zxpfJBhknmXApKZqvmLY+4
	5do4W9Iyhj/S3bZAn6BA7I0/dZT7H4szgsp/XVJqpZDr8PPwHywI06wAJzSaV7xCOGYvAEFVkP3
	WEXBv+nGuZBJrjP3bhfslQxV9q/t80CC7eH8ApkwcxBW6uBs8jPArGdNUXdWvbf2VD2gqfmyAZv
	UvDHYFk0HY9fDjJ74rN2f+6p5Csbfb8Yvo20dt/dL6ULb0mb+elzMjvNkmbA4FOmJbFSXO4UGdi
	V+RwHiTv2i1NgEfC7PXwH3zuilnX/vRYRb2uEaJQxmhQcehQObeglxJMdTECoYP8+HNNQ7QCYOv
	b6DCBrhjQbAI62Vtu7Jwpm4yJtXmgdcP6DXKj5yj/2iOOS++9GlutO2dEZCIamfkFVoZfY0IyE2
	qYXDOkfMDd9wzlYc6ehjsLJNgwb2nDxYuj
X-Received: by 2002:a05:6a20:3d0b:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c110b45649mr8314350637.42.1783925737426;
        Sun, 12 Jul 2026 23:55:37 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm59505421eec.9.2026.07.12.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:55:37 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] screen: upgrade 5.0.1 -> 5.0.2
Date: Mon, 13 Jul 2026 12:23:26 +0530
Message-Id: <20260713065326.18642-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 06:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240828

From: Siddharth Doshi <sdoshi@mvista.com>

For detailed information, see the link below:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=e9206eff9c9c97bdae4809c97c801e221fcf641c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../screen/{screen_5.0.1.bb => screen_5.0.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/screen/{screen_5.0.1.bb => screen_5.0.2.bb} (95%)

diff --git a/meta/recipes-extended/screen/screen_5.0.1.bb b/meta/recipes-extended/screen/screen_5.0.2.bb
similarity index 95%
rename from meta/recipes-extended/screen/screen_5.0.1.bb
rename to meta/recipes-extended/screen/screen_5.0.2.bb
index 0155ece374..b88d3e7346 100644
--- a/meta/recipes-extended/screen/screen_5.0.1.bb
+++ b/meta/recipes-extended/screen/screen_5.0.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
            "
 
-SRC_URI[sha256sum] = "2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d"
+SRC_URI[sha256sum] = "ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332"
 
 inherit autotools-brokensep texinfo
 
-- 
2.34.1



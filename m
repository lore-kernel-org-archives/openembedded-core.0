Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777D3C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:20:50 +0000 (UTC)
Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1761.1790148048459054012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 00:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z39YL5ch;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.92, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-485b1d2874aso496980f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790148047; x=1790752847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lwt4g9aoHaenJbEOg6xMZTm/zIqCx7WB36+4DhmWFY8=;
        b=Z39YL5chZ6UCa0o2hpDbwOyKqUkf0BkUYf6+KkRlltRTT8mgs6IFXpqtOjUMJRdYSq
         SzjKhcSnt915fo6y9JFH2Kne57TL6p4QixtloswYPuOJ4iL6In3XHmH9oTumYkTFo3bu
         BuMsgWlfj32+kGrCy94LFzb1T10XDRtmIz0qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148047; x=1790752847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Lwt4g9aoHaenJbEOg6xMZTm/zIqCx7WB36+4DhmWFY8=;
        b=vcnpmctSmTuDp7eNS3q+OWp/PLTsZL/defhDHUGN35UlOhr1eDh8On2B2bCvd0Y2Lk
         cuRUkjhuqHX3yLIC+x0cbXsHICXtkPQfm0ixOJm/5cuRC4UuhfT4KuSDmgj0LEyF53pd
         utQFPGeiHuc4S5IUEb9kRf/bw4lqZBsY4VBz5hi83PGsBX1ChAQOhPwebdYTNQE0Cfhx
         MAt4egZ2J0Trf4LKZlPNca/XDnPG5OS2KomKhTb0Qba1OUEYGgKHKJUdy3Ti//tgOynX
         E2NnnDpBpOy5Vx7nLs28hjVkc0V1WT60rwKoUmL2ME67fyJBEj0N8N5Lkh7GHokO8D3w
         gmwg==
X-Gm-Message-State: AFuF++kOL+AsnwlzmRVnYniv4O+cAn31lnSJiAzkk5SoVjmfsjEheBLc
	nSATy50EqlM9UGOZVQZUH0TBz8bHViDDfCpyL6BpSsd2GEf2zP49pFN/ru/4AMCnLu6vN4PTZCe
	rN9XJMXc=
X-Gm-Gg: AYBFou2Ykd1cnBDafPcWjo17ZF92BiO5qybMboRB1SWZgpvdu1Ex01Zlupps2ZQG6Q2
	bQhYt55cF/5nHi8/cjPL+Ug4m5RZWD97PDrPiWt62W1us2p40AmKZIgS/5MThAXAyxM5MfbgHOw
	ZewD3/ixHA2/x7TPOMuzVQzWqC6zsX0ckzny/9QQ5rSzc6+2YB+KRFI3oVcmmHd2Y/MMnow76Mx
	6A2QrvtxxByRbQbUVzISPtu9ehGc920rAaidO6cMaZUThcsa00JcpGL87l828UELzSHHlRR8bAQ
	GWTi95i9xcKCO/P2x4G/vPbg+yLI5U1gU0vKcQbSRqarbuWnVGkwUNvEO3LVVVKkV74JHZN2F5D
	72amX7ufXJcsmSkblpXWoO+Y4YVAM2lPHyAslqJJBCKXrUNcwYDm1S0SraaHgVABGeQt75WtKHf
	gtkY9h8nNY/REv3Kn3aXi4H/Kn63T7F1kEdz+DweqnxKoUOuTdXk9Xb3LTZCnEAVUKmS6ll08ot
	YHvgYndOX0mMFXm9Z4cYh047p4=
X-Received: by 2002:a05:6000:4a07:b0:487:27f9:82c with SMTP id ffacd0b85a97d-488670902a6mr2422445f8f.33.1790148046720;
        Wed, 23 Sep 2026 00:20:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f510:706d:14a9:45ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm5427800f8f.14.2026.09.23.00.20.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:20:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] ttyrun: upgrade 2.44.0 -> 2.44.1
Date: Wed, 23 Sep 2026 08:20:39 +0100
Message-ID: <20260923072039.3153452-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
References: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246457

<No changes within ttyrun itself>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ttyrun/{ttyrun_2.44.0.bb => ttyrun_2.44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.44.0.bb => ttyrun_2.44.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.44.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.44.1.bb
index 776698e1b69..a8b276c0715 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.44.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "03f7566436b42c2f1a4ad717dcf610c1f926b8f4"
+SRCREV = "8840053a7bbaeea1de3834fbc7f84b16813fc409"
 
 CVE_PRODUCT = "s390-tools"
 


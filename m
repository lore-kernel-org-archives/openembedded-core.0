Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A783C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:12:50 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.19602.1640182369783031197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=botjQKiS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id s15so2490312pfk.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Tc06RWXc1wbFGmiK9OOBIqYJUKsWM4DYc3UlDOYj1LY=;
        b=botjQKiSe3UTb/NXneoK5odrdYbngy5yE5NBJr4bI4LFLN5wes68qTVBEU81dY/mM2
         cQk6HsgrVISZyLap+Onf3azI5MzS46zBOUK4J5rTtO/eVhwZw30ysjxhYZNXdiXAy8Hg
         RpxrpLvLBsR0vYG8ANaITPviV0ryE3y4yVjmzGlDAzqv9Mrx8VxkroG03iGSG7ND3aQ6
         nV3UgYEwQJ4mfZ3pVwLi89qIYgHdBbvSj9qOSTnQbupoeurn0x7Rjw5hpwzTP7D99GG0
         sE8vG+kWEcKAab26xtu1hFIIDNQ3rkJ2zC+5jLEhjE04DCmy9fTtPQHI9DckyPbfHGDZ
         h+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tc06RWXc1wbFGmiK9OOBIqYJUKsWM4DYc3UlDOYj1LY=;
        b=D6EA4RaWu2Oka1nPhkNEQ6GhHO3NR2NzKPwJ/XFABhljxQgrXW/rkZdtxdnWhseC9+
         BKdurXzDa4N1T/a03GllEDzdIm2zKVnRay/bxsXbfJMrzYOtcWSHYuwH355O7xj66Ufg
         6wdWeBFsgfifIuF6qIFTqQRk1NZQDfIemBLjuVIy6wtA3RoE/9fZVgzuy9ejQr4d0Gsq
         UCv0kiLEvDb/Oe8UhYIPwqy3NckOQY6ea05ABYsRF7TeQ+W8RwPJzFdf/3XfPte1Hxdz
         EVDOJL13sH9tRIWEvrMVF9nVIO2B8RXemBeA1c7KofkmjZPQ1QOJt/Yd2gPJQBn74mhj
         3LRw==
X-Gm-Message-State: AOAM531We1IbOSiM5uCCJCaO0+5nbAELWQ+m8IRLhKedgsSwikGF8iyl
	q2h6v53W5diplYyDSBhAD4ucSEjw5/yb0Vos
X-Google-Smtp-Source: 
 ABdhPJwy43VFLcrv78ZOjp1J7ABQgSkmwahAIh9q6wQXo4VjF0gsiMZic2EQMMl4hS2L5TPRbz5RNg==
X-Received: by 2002:aa7:81c2:0:b0:4ba:81a8:645d with SMTP id
 c2-20020aa781c2000000b004ba81a8645dmr3092606pfn.77.1640182368783;
        Wed, 22 Dec 2021 06:12:48 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:12:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] openssh: Whitelist CVE-2016-20012
Date: Wed, 22 Dec 2021 04:12:16 -1000
Message-Id: 
 <79c677e994399611819e1e382b3e1b0be16eb6e1.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:12:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159948

From: sana kazi <sanakazisk19@gmail.com>

Whitelist CVE-2016-20012 as the upstream OpenSSH developers
see this as an important security feature and do not intend to
'fix' it.
Link: https://security-tracker.debian.org/tracker/CVE-2016-20012
https://ubuntu.com/security/CVE-2016-20012

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index e903ec487d..ddc9ed0b32 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -51,6 +51,15 @@ CVE_CHECK_WHITELIST += "CVE-2020-15778"
 # https://www.securityfocus.com/bid/30794
 CVE_CHECK_WHITELIST += "CVE-2008-3844"
 
+# openssh-ssh1 is provided for compatibility with old devices that
+# cannot be upgraded to modern protocols. Thus they may not provide security
+# support for this package because doing so would prevent access to equipment.
+# The upstream OpenSSH developers see this as an important
+# security feature and do not intend to 'fix' it.
+# https://security-tracker.debian.org/tracker/CVE-2016-20012
+# https://ubuntu.com/security/CVE-2016-20012
+CVE_CHECK_WHITELIST += "CVE-2016-20012"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.25.1



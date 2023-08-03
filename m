Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2219CEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 04:39:46 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.7316.1691037582606359674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 21:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eLlQ05bp;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a3fbfb616dso386613b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691037582; x=1691642382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1GrURNqeEdvPwyabI9D470WkRuL4UH01cSYJmB+w48=;
        b=eLlQ05bpeWHETiDajWTnJDxdbTgfRvjbjvsht3Jp7P7QKy4OFDpXNkRc7OT+9dmrhk
         oDFdrswxodL2+E7erS8PuD3zAk/jY9gv/OfkakqiHufnyjtdpfQRwKWgsPwEPNwTkx2w
         OxFCFXuYdHEhWxIycu7xUUmvy1Wnbc8XRJiVc79PYUdH3V+gucOoAAaw5n6EgbjE+1kb
         areLZMCMHjuTon3Qn5eQB4rPAiwenwBg3q1mSZ+cooybh3+7WVeY26O1Ibgj9Dn8aBND
         j7CDKvR4w3hxCJdiX0BSfZWtF/QRd1lLZDodokVe3GwoMFZKYnaNvczkIZI/kboiJFiX
         O59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691037582; x=1691642382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1GrURNqeEdvPwyabI9D470WkRuL4UH01cSYJmB+w48=;
        b=OdryOIFUdzhE889FGkaQKDb3IyUnpUHg5vZIYS0rRMJnF/qajSi2XDhWBbv7yIuh0I
         7hGpPqSqnPnm0nTB0e2k+2Yl7GaMurZj+SgBtqpw2QvRI2q6qHjsQ/e4Cg/bxOumPlqP
         npxMTbb7eZhA66JRaGFaKJvneY0WJX1FsiOQoTXP3NL32LBhBW8uWBXxEc6rAK14b9zx
         MrcMJ900vpbZ6Rc+Z+ybiATkhGxbMaKtyPmcpa8dTkER9ax/qjkauk1b6zsr6y1uw+mv
         QrA/gJTvT1dQO/GXcwIOzouLahfUEErNb/GL9J1SlbGroQbxvEcyTsNoWndumkxEDoT2
         jZkA==
X-Gm-Message-State: ABy/qLa+82BUECQTYl777b4t4/L2t9avTJI6cdgwhYTau3q9LAVoCxkg
	bzQACaqAT+rb935cEAj/EdgBmES8ckRqUw==
X-Google-Smtp-Source: APBJJlEwsVEkaR5gWfryYvOGavRlC9+iurXyo30Ec5E6pba1nSEB4JnXtfa1yN5gHiijrgdJrZH1Aw==
X-Received: by 2002:a05:6808:f14:b0:3a4:947:c97b with SMTP id m20-20020a0568080f1400b003a40947c97bmr22411530oiw.0.1691037581463;
        Wed, 02 Aug 2023 21:39:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id x13-20020aa793ad000000b006871bea2eeesm8409268pff.34.2023.08.02.21.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 21:39:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luca Boccassi <luca.boccassi@microsoft.com>
Subject: [PATCH] systemd: Point to  target binary paths for loadkeys and setfont
Date: Wed,  2 Aug 2023 21:39:37 -0700
Message-ID: <20230803043937.45082-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 04:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185452

with newer systemd, if not specified, these paths are searched on build
host /usr dir

log.do_configure.2373278:Program /usr/sbin/loadkeys found: YES (/usr/sbin/loadkeys)
log.do_configure.2373278:Program /usr/sbin/setfont found: YES (/usr/sbin/setfont)

and if build host happens to have kbd installed then it
uses those locations, this would work fine if the assumption between OE
distro and host distro matches but fail otherwise e.g. on archlinux
these binaries are in /usr/sbin but in OE they are in ${base_bindir}

This results in
qemux86-64 systemd-vconsole-setup[211]: /usr/sbin/loadkeys failed with exit status 1.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_254.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
index a4cfc7b1f44..653fd6910d3 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -241,7 +241,9 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dsystem-gid-max=999 \
                   "
 
-# Hardcode target binary paths to avoid using paths from sysroot
+# Hardcode target binary paths to avoid using paths from sysroot or worse
+# it pokes for these binaries on build host and encodes that distro assumption
+# into target
 EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dkmod-path=${base_bindir}/kmod \
                   -Dmount-path=${base_bindir}/mount \
@@ -249,7 +251,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dquotaon-path=${sbindir}/quotaon \
                   -Dsulogin-path=${base_sbindir}/sulogin \
                   -Dnologin-path=${base_sbindir}/nologin \
-                  -Dumount-path=${base_bindir}/umount"
+                  -Dumount-path=${base_bindir}/umount \
+                  -Dloadkeys-path=${base_bindir}/loadkeys \
+                  -Dsetfont-path=${base_bindir}/setfont"
 
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??= "60"
-- 
2.41.0



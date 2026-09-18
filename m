Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7E3C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 17:54:33 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16709.1789754070714626605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 10:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cRNWY7DR;
 spf=pass (domain: konsulko.com, ip: 74.125.228.43, mailfrom: tim.orling@konsulko.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34907so1255305b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789754070; x=1790358870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHwSxw6qRuAxFuShXHx4ATEVaVNtS8uyjzJPXpblE14=;
        b=cRNWY7DRwp7aopERK4PqN5LKAw0L7r5/JpBdArPEEaKGetXaN5XTxTkUVyTj3apkXM
         ++AMMOBl1jaDmGcajFO04oknGzxp9P6McCDyaLUA5LhiCfAZ3l0mQVynVS7yrRgcBF/h
         w7SJaIeJmvL9lWbUR7Otf7HS5kqTOrUjgBp0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754070; x=1790358870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHwSxw6qRuAxFuShXHx4ATEVaVNtS8uyjzJPXpblE14=;
        b=pRYBmDrOieBJeluOz6T4Jm0cDin+9+AwDfp59yUMES48/4qYeqJU6cPPBEabvSkgs2
         A8tKZoXEejPT162JE6blO7dE8kCLSd0eb+kbeNfdhHG4cICCmD9P0iXnOi+zPFqIJTVb
         G/rjKpjaRP3gPZb4I3Yk/PPtcwiCU1y8D2eGSvIxoZaPodS3vrX/c7bjFvH/ZA+fuq9a
         z4nt1IQQVr/SVGkaCgB+f/+t1z2ledDXD9uXdejP58gYUVKQEP6xfFYImlbc8mgvFAc9
         CzKENiRBZSdBhHBMu4kgGcoM3H3b6rXPP9RMvsSpoaCi7kVgYAY0Gp2xRn8Sj/cTqJIx
         XilA==
X-Gm-Message-State: AFuF++mYoWoUI66Cq39yS/dtHWFs8nl9EvJESVJA25TtVPxTAW9A1hc1
	HWulwAEDnGjqcVweF0MI8SjMzhwNlNMHH8yE8jmMaK8qkehSWtbwki+/DGXdJpV3UOpIPyMMQFk
	hFDCE
X-Gm-Gg: AYBFou3cR/617nttKNY0S4qBhnqV170RrJcH/mWhK36EnIlompTls1vsH+qAZ80nUJW
	OAup46JR02SgC5422tVxEgnQqeAIUJrTzW8m1fsfOPnwv+9VdnryoVYwMFvJi/FudadhpuZCdck
	f4QpzO5voGF6LD/UtcywJtlcLOB6pe4OpuLE6Fs+bvXvn/hqRuBo6kQyg7S+1C8ACndq2B/zMPa
	sv/+65K+eoV7jRZyOJ+ICxWNgDVSsVcoJOUezjr06w0glg1kFfKGEIqXwlGn8me1H1IPVXkO8KE
	0GFaK6AB+bAve7fCPJl+EJhWmX2C5UfZ6dD+GAHPZ2dwGsno3pmP/3LvuYB8LkPAnbqAlvtI9Kb
	v84BGc9/+A5F7PWrMQe7Apwk8Ej8Fuh7bsuzj2I92aFVVC00N2oboGhOOB+2r5MgdHuuDNRGKXZ
	+9VgW2W8TGQ4uwWZrQdL8F219SoWLyzhrDgig2yN3hZpIIF0ZaMgHicrsx7VHtg1mgbEWHfy2ih
	31vbajncP2sUc8=
X-Received: by 2002:a05:6a00:2e20:b0:857:7337:5db8 with SMTP id d2e1a72fcca58-874dd9f1d6cmr6036525b3a.22.1789754069733;
        Fri, 18 Sep 2026 10:54:29 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:a917:4af:eba4:93a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6bec90dsm152477b3a.8.2026.09.18.10.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:54:29 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] libtest-fatal-perl: upgrade 0.018 -> 0.019
Date: Fri, 18 Sep 2026 10:54:19 -0700
Message-ID: <20260918175419.2257904-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 17:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246224

From: Tim Orling <tim.orling@konsulko.com>

0.019     2026-09-13 16:06:25+10:00 Australia/Melbourne
        - lower required Perl to v5.8

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...{libtest-fatal-perl_0.018.bb => libtest-fatal-perl_0.019.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtest-fatal-perl_0.018.bb => libtest-fatal-perl_0.019.bb} (92%)

diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.019.bb
similarity index 92%
rename from meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
rename to meta/recipes-devtools/perl/libtest-fatal-perl_0.019.bb
index 68940567ac..79d01fc430 100644
--- a/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
+++ b/meta/recipes-devtools/perl/libtest-fatal-perl_0.019.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f7fc7d4b26ddae0843b09ba56109e65a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Fatal-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "b8d2cccf9ee467271bc478f9cf7eba49545452be9302ae359bc538b8bf687cd6"
+SRC_URI[sha256sum] = "d8f6b6c87bb399a7d60c295a94a4b741a85b23889cfd6b72f1ff62f0c55cf70b"
 
 S = "${UNPACKDIR}/Test-Fatal-${PV}"
 
-- 
2.47.3



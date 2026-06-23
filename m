Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A45BCDE008
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20843.1782220487409542042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HGzT+7jw;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso9846185e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220486; x=1782825286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WPRV6tNRd22hIPzNE58QF8SoiX9yip6gF0cBKnZ4jU=;
        b=HGzT+7jwoPtk6YwfczfX4cBqiX+z5gdpfM3DGi33B6s44izzB5Z3lSkx9yVEvga+VR
         zjgSdwLDeSQM5spNVdnQTsOhvgaYDyP+pgjVdfvB+5TbZ9KkIKtjpkILDkwOktHMErL2
         0APdIA88rBw+ULusLmlmauKuq11K9NeTxIemA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220486; x=1782825286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WPRV6tNRd22hIPzNE58QF8SoiX9yip6gF0cBKnZ4jU=;
        b=OeSE7f3B0yVSace3D8y7lxGPDpCrOJqvrGiUzYxNihdv+8lw2BJIS+iwhvkUa5pv5t
         rzDv2KgUCkSK1e7qFspWgffnqbnBKgUsNPVvJYE1QXmgO/weuN1VRC5oBedhjhOKGAJn
         jJnCPDVVNyczaoTNnVRlzeDYvTKplXrM9UpmuAP0vDNfjsIDjtw1rY4kftYjUS8vfoRJ
         v1Bdq2RR8X5P8HIRiQc1HvnAg0GnMVMAv6GcdSIfojzx08QpNCIxp7V61mqJT2AbLP6a
         SPMBUkJnHV2CcFj8MPWL+lYNqVqQ879VtmiG49EOwZAma87/VUkQ4h0QmieOWrZDZtuL
         mV5Q==
X-Gm-Message-State: AOJu0Yw9JkuJQQXdm++xEYDkTPXbpDYz/OKFrACxsrahqxXbSbNBvOj7
	7YXnFXpYPk9L5S6K9P5Ztko0PXhxkGAB1Uu5lTIwINbL3gcKIpjRM71hs+x51e3G93dkml+s/nY
	+lIiK
X-Gm-Gg: AfdE7cnUk3GRLLLZVGP+clMKJCXaXmtnojFCog2wFDMZh1vZFQz17GnLEiUG06d7jAM
	iQCx0qQzQeGlBArV6bgw4ssw8M7PLvaeMdvIsfXR47ULqiPqxy+/O3gU3Qbb5sII6aPH3vwC77H
	7uSV0W+eecQO/ErIqcUvTm+CoU6nanyJgLE9KBDJtT00i0gMQC1dSfw1idQ9Yfh6AV9ZVdCBX4L
	PmCHCm5cxkGJUzBfsmqV0GYwHcPwysO+pnsZObv0jITGEjilKcYbFOA9u71kTZ7V5Bn/X1BtzJq
	CIXteyaskFplhNlLYk+WthEIX7dsD00chD1CRGbOney8hWNp03NZuQmK0LAaqLuUCzYauTZGfYm
	Z6ql4WE+Mg97JrGQIcpPiFojYTRNYkBgc2Cu5bYDHOn8EWyq75VlqRpxt33XqkhFCxin+Crvkn1
	xDaRcGnYTSfCs1ExE6vOG5wqtz3aLRbNGP/us0Yqi7Y7iU4EL7xJNlHoxe8aD+A2fgSOVdY4DET
	rGT7BIKCMpsZsh7mA==
X-Received: by 2002:a05:600c:83c8:b0:492:4889:3d18 with SMTP id 5b1f17b1804b1-4925a0b434emr49490805e9.9.1782220485492;
        Tue, 23 Jun 2026 06:14:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/26] rust,libstd-rs: set status for CVE-2024-3566
Date: Tue, 23 Jun 2026 15:14:07 +0200
Message-ID: <8c56e85dd02063da5630c9b73fb242686a970e20.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239392

From: Sudhir Dumbhare <sudumbha@cisco.com>

The vulnerability is Windows-specific and depends on command-line
handling through CreateProcess, which does not apply to Linux/Yocto
builds.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-3566

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 5b433ceae78..318c7f0e293 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -23,3 +23,4 @@ UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"


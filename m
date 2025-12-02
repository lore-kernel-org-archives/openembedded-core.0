Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC95D116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:11:01 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9717.1764688256983726042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5EsTQ39;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63f96d5038dso4787843d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764688256; x=1765293056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hX81CrNeBV4Cb4G8ayMhi2Tu4rS4mwOR5KzWiSwR8Xk=;
        b=g5EsTQ39g2j6Fl17qtLgtSviVqr70hETyowfBEWKFYgOleycmtuWkWzTgYn1PosKxb
         GxHLVnS3G1F6oyBTWL6Qve7vL6JyjPHz2NHavhwWT6TnYK81TOhV3t0lQRP9G5IqpwF0
         P4sMfO7xWTX+uOYswbeIhqX05LRLNzMweU+zMTRVWapLx9yheQW2+/2RMpVNmt/a+Y5+
         Ccsu8Beo5NMhdwDpkzGsG7rbJ8T74+xd3hLfAaRDCXd+9/1NSw6/uCrs/3gqmfkvgHui
         LovZ+ngzxrm27pCkGwLp0gC1E80dwKwHSIVweK/CL/BB7OwZ0jr8vkRpF1YzHjHisnZC
         IiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688256; x=1765293056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX81CrNeBV4Cb4G8ayMhi2Tu4rS4mwOR5KzWiSwR8Xk=;
        b=VDyCUN1/U5TAk2Wtck7dUbyBePRgWFd3p5Mziz5n8kWAmdDuIuPpQUEWw/Woi1NWIX
         NWL6w9OxVwF0ETTghnYbTZCUMg4f84Yj6Upa/YA/pB/TEy/Qj057Ey7aj7XHU7BXmUys
         bJvDA8Pr5eeQLjgAcmMSBmv6KGXDCpCSJc7htQXjhnpHSEQCNtsS4GJgv1AYvsiL16EO
         yWUDzw/1gGV8tPvOIf5KuFhdhuIXd7Pd6KBkAQsny00gcmOT0KauwUjluK40uTTJxw/t
         qfCr3PPGlmBUs3wlpRxnSGtnJlj2sZeR8FSPpakRqfjm5PJYkkfpPAdkt3NvOjT1K8xA
         +s2A==
X-Gm-Message-State: AOJu0Yx8Iv8f8AL2X+qru6iBuLvG1dD/CgvmmeNG/ik0i564DDkfDyS+
	SVVOQ+PBC+IpB0LHiDK7Yqcsi8EyHMkTXQ8YHDIVIW2LjQZKCMIz6FJYkCbHA3T4
X-Gm-Gg: ASbGncs1yor3f6GFQIzVP/N9HiCzYLfK+PmEzyDwTuz4x9EOyELmfelHYcZRR/U/wjT
	K4m3GoKXQ+r0ZpI1/TxNwddIGrwhm2xlNS0ALEWjKCA95FFHat9XN5YeKLwc61w8KaaQo+WJL7y
	qAysg0A1TknYA1vrNsAr6z/fRi9nCPo4tnP5u4mPrSgOvkcmpbw5wRatWoZ8CqqwTE8iuNq+IEi
	ANSY19VHOcRGjIxXaE6oWW7LIw+4W+Gvcy+kbKnqZ0rihTUbca+XKeFYP5vIhvqcpjGxndQ7995
	1cHUaoBhsHe8KOrirTeMPrF0vD2sd4+xwDAG10eOYMrcAyi1ttU/aoQKw0wSOsAw7l5PKIVh5v2
	3VCjZopsZcI2KbeY1icXfm7YjibTJTxgqWVSgLocBeW2CSKAVscXc8ta/O5gr88YphKq304W2rC
	Ybx15yRwnhIsVsYtzLqxx/gNMzp8tab9QigLblJsGFlsbS
X-Google-Smtp-Source: AGHT+IG+dtLL0Y/kNVVR863isB/oWtxuO4cqOVGBXjH3XYavakqBxg2N/6YhbkXa4YNxJFBdshsuag==
X-Received: by 2002:a05:690e:1513:b0:63d:5d72:1918 with SMTP id 956f58d0204a3-64302acdb62mr31056906d50.63.1764688255552;
        Tue, 02 Dec 2025 07:10:55 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d5fe26sm63459527b3.18.2025.12.02.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:10:55 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH 1/2] perlcross: upgrade 1.6.2 -> 1.6.3
Date: Tue,  2 Dec 2025 10:10:30 -0500
Message-ID: <20251202151032.15053-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227170

https://github.com/arsv/perl-cross/releases/tag/1.6.3

Provide support for perl 5.42.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl-cross/{perlcross_1.6.2.bb => perlcross_1.6.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.2.bb => perlcross_1.6.3.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.3.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.3.bb
index debf2717ce..41a601b14a 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.3.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
+SRC_URI[perl-cross.sha256sum] = "cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3"
 
 S = "${UNPACKDIR}/perl-cross-${PV}"
 
-- 
2.43.0



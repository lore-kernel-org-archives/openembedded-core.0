Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CC4C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:54:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.113868.1738666462400525123
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fEDNFLeN;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361815b96cso37302755e9.1
        for <Openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738666460; x=1739271260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iXAawK8xXd3lwhCmz8Ortq+y5vw1ttwGvIJyy1F1Wo=;
        b=fEDNFLeNXqTMXoHZThG+ttnrnJ0QsouMLlCSFAHczBzOdQ3nyEtAH9tYKFniAWLsZJ
         d/nPwRtKDGwjLMp+tdKp3VkoH6h56inULXqMRt4fhonrvZFtpoJ4x0I5KRKaZIyqFA5Q
         MahUYqHnhPihwZxy5RWc6U4AExCEBihwEmNFmDs9red5AAuMK9AYqQECcjabAvkBFZYr
         jKVA8NMDzNwDRRt2B1GdViZIT2ePbnycl7bUBneQUZRH52tqHZuP55D+wPKdcQIbA6MP
         JiymboprxuxwsVqloDp/VkXMpDnatQ9Rmh4HW8ZBZ6TJweQgJm19NDYvRocgolkar1nQ
         mZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666460; x=1739271260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iXAawK8xXd3lwhCmz8Ortq+y5vw1ttwGvIJyy1F1Wo=;
        b=aEEP3f709oJ1orYgDAAW+G63+mrt1tdPi+Fe9KnX6coIBr7QmY4tqIR0zEpisGPiPi
         CVLKNUtmqkWMneHgfawmIRlWwRq95LcEUCDdHlydrOD+dgvzidLdtDBWR4e5mhLQz2cO
         GMWJyXT155SgYtP1SDVo0DO22dwYsnP522uv/nIBG2ZFNUJb/+Vfj2PWkaTLKSvrPlbw
         fnuTYNI25ha43hutbRUGCVxNMOQ+pRdjSjtaOrIWxWX4jxThupwGpZo5mt4GUDBB8aDa
         khGLxFoaI+U8mptwGI2uTNGwgmoyTmWZFWNTZl77Ix67op0sWevyL8bkxcpskqLAFW2l
         /6Xw==
X-Gm-Message-State: AOJu0YykanM+3wlH0CzmkxM6xzvSW7JwFdkD6rdYHtMg9GyZ/pk6NuNM
	4oVNm0nh6kdZch6Jcd0jBpbIcWte+165MbejBmTbeB17XOVQV618XWYSl0LJ
X-Gm-Gg: ASbGncuJA2oFJe0JtAX74JmMZVmyf831DaXIQwJDkdsngZ+mHOJgeH86A5q/lKcFeXF
	tx6DxBdMzRzJdzhpIuVAD2HI6kBWVH1v3sQgtddY5AqJlgKmrDbe+50TLiqcR4h6mpNx4y3ZJgL
	thHE8Egqk4eLg2ySEwA8QyzUk1rCs9kaYYGqtWLxU0Q0e3+SvTB03vyeWmQL9ss772BDK18Mez4
	l03p+iLUWd9HmC53kDzfhWXXti/hG/9KMaWktENB6BGwDwS6QoeYIYK4MFeRzyhQbYZHyfxSXJ3
	Rgn44bwzNcDfgJXphsH3/mrYAKOrOM7dxqA7NX0T6/aI
X-Google-Smtp-Source: AGHT+IEphkLKmu9o1McD4fpat1mXUxWZLdCn5P8BP0jJPmDDFEIFX1vIJ12vqp+81YI1XCBuO5/Stg==
X-Received: by 2002:a5d:6d0c:0:b0:38a:6929:ff9e with SMTP id ffacd0b85a97d-38c51946af3mr17597431f8f.7.1738666459951;
        Tue, 04 Feb 2025 02:54:19 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81941sm220702145e9.36.2025.02.04.02.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:54:18 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 1/3] bitbake.conf: Add conditional host tool getent
Date: Tue,  4 Feb 2025 11:53:13 +0100
Message-ID: <20250204105315.84079-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210766

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

In case of systemd init mananger, it's required for the native build.
Even though we don't build systemd natively, we might build some of its
binaries, which need to run on the host system.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b607088c6..6b1bfaf64e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -532,6 +532,9 @@ HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLAS
 # Used by archiver.bbclass when compression is xz
 HOSTTOOLS += "${@'xz' if (('archiver.bbclass' in (d.getVar('BBINCLUDED') or '')) and (d.getVarFlag('ARCHIVER_MODE', 'compression') == 'xz')) else ''}"
 
+# Native build of systemd tools requires getent utility
+HOSTTOOLS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'getent', '', d)}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 


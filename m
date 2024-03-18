Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99172C54E60
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:31 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.34197.1710728547667437966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rE4nj5An;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a49261093cso968532eaf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728547; x=1711333347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tuzdavcj1ZhlgS93ltOXTguORUin5LTNZOhR3VUf+o8=;
        b=rE4nj5An3V2YIV2Ed/r9CbJM/fwSi+vtU7sBV5LJlI+WaFNqLSdq//9Z5HGkw8tzLl
         QwNr8kaiVfO5D/YkSXtMRwWuChhsx7UOuETpseqLo8rzWVr9hKCReCochoV0kGlcuK7p
         6BPdKPoqjQCedCAcY5mz6RLzhHFCj/LwpQvLTUdeIe4+pYMsp6BNPXXFUVe2U83dPMUv
         GvH1/N7qnmf4EZ9WEuMahMmQvaospeANi17ZpJ2tNR9/Q9UBxF6fuW40CMAwh6Nhc7ds
         J+2UCaI54hcf/sqdl7wH9wtCcDYoF8QuQp2d19mRUB7q7RrrFUpVXAOkF79NGl7i+t/q
         HF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728547; x=1711333347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tuzdavcj1ZhlgS93ltOXTguORUin5LTNZOhR3VUf+o8=;
        b=oHK8hCWpai9c+G04C62dF2DQ/9KJnEHmCVYrhcVP5I6WbOzY6NybD3mucLFPcwQvoM
         npEAJgQM+0dmL4dJvzvUQLt9s3r9A6iCsOIOk6Li6hHFHFOBfyguMzdx9YkSQ2iiBU+m
         nffXpr7mNJGTGfb8P+6PKsF/S1SiCYQ+CGtrwTMXMXhN6SQjAEuJvZhWPNruq8FGjt7F
         FQByRn9doa4NDySUVKVYalbabql77Y8RqCR7yqf/DXJ0N2aC5XUHpFEocl5kLOFd5jIO
         IhTHw5030vDYKbU+4Lbw1voSt91CZXLsOtRlAz4al5zKoKopSZd05U31QKHpB446Yb5y
         5ZwQ==
X-Gm-Message-State: AOJu0YwyUKPmyORnoopjO03qLD5k74ejsD96gIICSgc/9cHBn9N03EQ4
	HSPyI8p0aBTJEx02skjplOSA/GT6HL7lo+F6kGSvttZIb89zr+TQ+qem8cHvHqnHH3HNtWiWJox
	E1janwA==
X-Google-Smtp-Source: AGHT+IHLsyWslrswkQBodtHBswPOH00pYj4IB04mYg20W3gtWvetOpvOIf5ZwpfgraU4+Dt9HCa5cg==
X-Received: by 2002:a05:6358:56a5:b0:17b:5712:70f2 with SMTP id o37-20020a05635856a500b0017b571270f2mr12505437rwf.11.1710728546611;
        Sun, 17 Mar 2024 19:22:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/14] core-image-ptest: Increase disk size to 1.5G for strace ptest image
Date: Sun, 17 Mar 2024 16:21:58 -1000
Message-Id: <719a155b7f85d4ee623f78c3e85ba987f9142290.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197289

From: Khem Raj <raj.khem@gmail.com>

Autobuilder sees and intermittent failure on strace tests and it occurs
quite often therefore bump the size of image as the space requirement is
more now with parallel execution enabled.

[YOCTO #15370]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 02d31355b20f8f3e7bd1b71c9412988eca9ec4b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index b6f5c2fd60..f2d0ae94b8 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -21,7 +21,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()]
 IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "324288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
-IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
 # tar-ptest in particular needs more space
-- 
2.34.1



Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.35341.1612792435827229122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=N2UNmp+B;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.53, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f53.google.com with SMTP id z36so3457088ooi.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j6B0sNhKafjIJ0FUngFbymCCVK6gW3Q2yJgq5+XX9Pc=;
        b=N2UNmp+B0fS88FVtwEfKR+R0xV/nXPsHSH32Hes9Dt1a5Cbqiq3EVk1byLWd3NkeSo
         vj8ODzAGV0qd8CQSYyyjclBYOY3oRw6Oh8A6T6BhZEr921mrzhv3pBKm2VWPLZ7Vlodj
         kamsUfVmKKyYSk6v7c7lCo7MO0EA7JxbhzVBjIKSZmxaWPVFYc5A4sq3v172w5XnWyjA
         ZndAQ6shKJtCjp2/J4YxyppB63qLrmpzndbMrnDfvWD/e86zFsO7DaauM+8ybs8k7Dda
         iSRwgQJ0/ottNRZByC4EE9ritWpcbmVZsHnzbHy+0zF1w8WkCHYxp+3OEohlT/SXq6GN
         08sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j6B0sNhKafjIJ0FUngFbymCCVK6gW3Q2yJgq5+XX9Pc=;
        b=ma2JVZhII53ujksnxGC4/rxIKqpALWqFNjre0BgiZwrL/FnokYLB3g9r2yKlw8k5Ff
         QLt3Eb9VRfMASUI+CfzUrnSpTdmP5SY7zAQ8t8WZAiZmFEjfoOradGGKZIh9H8h/0s4b
         afntygMjlicODJttcrfaPVjBRMuPU9cPxS+qm0oht4pPMUPXrQl8RQAcTK+Ev8f4DX4A
         AK8UBcgiUWH5YZ/CaKu9gVCmf6VJ53Uyj2SV/4/fAGaweP7WBuZefdoQGnhPlBk1x5D0
         AcLDu053NbVWqNVe7jQHkJpS6yZUGtImpkBSSEZbVgJKGszKXLfWvCJ7S5wOz51ppwkn
         EtXw==
X-Gm-Message-State: AOAM530RYbs8oiAfti79nnzNrb1qm0r/ROLSNb1b5gTpU9Oiqj8UUAoC
	3xj75Xvh2dPLtO+zJ+003Z45luqEYrAuO7aqhgY=
X-Google-Smtp-Source: ABdhPJx5OONMGs2gvOKxPTg7NP37CO3amoaLFLxvOfYjBuenBRwfN3hEbyvGW8r2G6PeTn5oMff5AQ==
X-Received: by 2002:a4a:3517:: with SMTP id l23mr3925663ooa.18.1612792434710;
        Mon, 08 Feb 2021 05:53:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/28] kernel.bbclass: fix deployment for initramfs images
Date: Mon,  8 Feb 2021 03:52:03 -1000
Message-Id: <352cecca98a0a845e1dacd10e399e26cdf8c7a93.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Awais Belal <Awais_Belal@mentor.com>

The do_bundle_initramfs() only processes kernel image
types that are found in KERNEL_IMAGETYPE_FOR_MAKE whereas
the build system can generate other types that are not
directly supported by the kernel build system. In which
case when we come to the deploy phase not all the images
mentioned in KERNEL_IMAGETYPES would have a respective
initramfs bundled image. An example is using vmlinux.gz
in KERNEL_IMAGETYPES and enabling initramfs and then we
see

install: cannot stat 'arch/arm64/boot/vmlinux.gz.initramfs': No such file or directory

So we align the deploy phase with bundle initramfs phase
and pick up relevant initramfs bundled images using
KERNEL_IMAGETYPE_FOR_MAKE instead of KERNEL_IMAGETYPES.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 526bdd88ccd758204452579333ba188e29270bde)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2a65c001d9..83a574efcd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -718,7 +718,7 @@ kernel_do_deploy() {
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for imageType in ${KERNEL_IMAGETYPES} ; do
+		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-- 
2.25.1


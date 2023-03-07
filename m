Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FCFC6FD1E
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:49:05 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.8648.1678229336431046166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FAJJn1UC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id y2so14784376pjg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diMIx4q9yIWjmOVdIJU4BmXcUxLF0fzLFgvNjCl+Pak=;
        b=FAJJn1UCHDvkyr61UQUfLTO+FH93kzaiYS6xTD+Q1hxgZ4pgRIHjaUbV4KxQRJTbV9
         NtHIde+RxbyIImbx5slIPxrPrTWpvp5PcqcqhvCS6nlWtYj/kSHLsjC34g7EAX4Pwt3B
         9Bm4LGtHX21/OoDj5yMf4C6ypqpC0Gut7Fh7x+JAEm7U7MZNeofT0VN5PGG6g/C2Fv7X
         aWPb06yi3ptHc4fH/USTQmXoQmoLrgBJ2PHMobtXdwCntMeoEYRWxIeDzwRxTx53foof
         Yg1yBvLc4SQVq0JGw2K8DQC0tfHRfZ7aOBnb0CvLU6Bx3PozEKSMn0MDF2Qgrfm2Ztfk
         OKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diMIx4q9yIWjmOVdIJU4BmXcUxLF0fzLFgvNjCl+Pak=;
        b=owIjfBS1Fa1eJZDuspFlg0oivnwg/RUQxNVVbMrYArI26n4VwhcuFeAlO8vS4quDH3
         gC+oo4Sw2Y1Rg6dvgods2rGHZsQgMqrVTOiNR+HzwFhsAMKoyt/Bh+EdmUFwNdyQC87G
         07x3u6ZUEqHX1atpuzh1FLiWlgTErjMOG0YwpQu7Tm7e+iTWurGcAgD7/HvTXpecR96v
         /9QAzEulxx26PkY5WDwr+vLrQAbupg8b+lMqSsA6kraENRPVNu42DMlkYgMvBBF2MTXz
         HMcWgMaKRdwSOkb+GI54dasqFypXD6ixFyHq77OIgrmXZy34MPgpF9+r7KQi+qL9sJBi
         bCpQ==
X-Gm-Message-State: AO0yUKX43+U0gUCyepAh1i6xB8HD/QDqLjam6pjLUt4QqGH/AI52ZFdK
	Y2FnqtrUyrpiD7eExbzUVBsL/kwRtr7AS2KNA7Q=
X-Google-Smtp-Source: AK7set/yWTo35LCDZlv8vSHhnF7emRhSpvdnHvrl09neYefpgHqR6BJPnd9H6ujHaDwqll4uAT7Oug==
X-Received: by 2002:a05:6a20:144b:b0:bc:c663:41bd with SMTP id a11-20020a056a20144b00b000bcc66341bdmr18649571pzi.4.1678229335514;
        Tue, 07 Mar 2023 14:48:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/23] kernel-yocto: fix kernel-meta data detection
Date: Tue,  7 Mar 2023 12:47:55 -1000
Message-Id: <4533e8363549f87a0484d7c0a43a162c918f33bc.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178143

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Fixes: 7ef7af5c03ba ("kernel-yocto: restore kernel-meta data detection for SRC_URI elements")
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c77754f23e3fb49a62602a6c6a04d5525d1cf457)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 2a6231803b..2abbc2ff66 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -194,7 +194,7 @@ do_kernel_metadata() {
 	# SRC_URI. If they were supplied, we convert them into include directives
 	# for the update part of the process
 	for f in ${feat_dirs}; do
-		if [ -d "${WORKDIR}/$f/meta" ]; then
+		if [ -d "${WORKDIR}/$f/kernel-meta" ]; then
 			includes="$includes -I${WORKDIR}/$f/kernel-meta"
 		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
 			includes="$includes -I${WORKDIR}/../oe-local-files/$f"
-- 
2.34.1



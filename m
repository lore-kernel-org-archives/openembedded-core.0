Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED4AC44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:48 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.895.1783881820095127906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=dvZJ8wcU;
 spf=pass (domain: underview.tech, ip: 74.125.224.54, mailfrom: vince@underview.tech)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664d78637f8so4378080d50.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881819; x=1784486619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYFPEwKn+IXzhWCeDgqjE4CiGZSJ0rvJEo2g4dJH2sw=;
        b=dvZJ8wcU8dcn+t1SwKlulMSJ+JTSofxcFSvZvRJ1rBvq8kaFOrNejMNHzjaIBzgSPM
         RjVQjCQgfxGrhkcQW8OtjATXdDBdBn3546fR2Be52jdoV1VNd3M8rLsckqPIIwnZLevk
         bblmvlFVBzfe/FYNtiUwEa38xDfLMIM8zFqsjh5TCoNMsLC8EmcEkCdMZrAsmc7U6zzH
         lZ0O3306sRIN7Q/w6ztxVQzU839VWqVRk7OGN3SAYJOw9QR3Qmax8lFWTrGJaA5+RgRU
         0Y2edkVmoL0ISB217zbrdgrZ5b0/Zt5b2nWC5MdYAbeA+nmBaVFQ2lAenhEMHQHLXABB
         12Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881819; x=1784486619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYFPEwKn+IXzhWCeDgqjE4CiGZSJ0rvJEo2g4dJH2sw=;
        b=UVHAeM7yjUhzNmOXw692+gf+j9Vyi9WGMgwf2Sv61TwyGDo17Ba0D8CHtabUBVjhpa
         Sk9V/gibP4maBPkLCvwuDzz40o0r2a2R8HY/GoxrGQW9nrOGOqyX1MxyYVN18MM+/cvo
         iizlxS2rrF0k9YMD2+UACmEvJK/8tutRdm4g+RPTJQPpjZ3QbN4nBQDLCOgTGffVWnGX
         nre3y10kfQxvHC6qYEN9hImGNmeX4jm4qONPz2UKIM4JmCs/HoUQqTe7lCo1Ks9O4DNh
         bKdQZVhM7+EB80qc3lR2Fb1K8XxC2qZCdvda8thZtJN2dhrk+Wzu+Q0Z2vbLIWvuQ+fg
         m8iQ==
X-Gm-Message-State: AOJu0YwJ137uY1vihvdK+403Vyt/WgDhBnHq9GDrIPmpiNjVMB+HSXKx
	dP5RjKn4c9Tj/r9E8SZUCje76WSOBS8t2zVFylpE3Gppj+TeXdN1aeUYWkgM11Kaimpzm1rZKWc
	28OQLtfQ=
X-Gm-Gg: AfdE7cm+87TTOQFiBn+rpEWqfDTbOppcdQSk+Dr7We3Q+nv/NGqlrvPh5ZfX84dO4bV
	Zmu+eplIZklnxE1TJzKLLlHOWtXMXf42fbLB7o1eqKcWAnEo+5NXCjptlqpltWrOosfrSeWCg8h
	pUyJBlVedZ84NEaSMAkQOK2sBoo0XlTK81DvKzI1Qym41++s2oMDtf3P8cnK3MVZyNwbnJxyM4g
	M+3Yn/XvbW5c2fV6jnc8ptxAsW/IDaXmUkDBB0bf6LZot8lZ3N5KV2B9mNu8PyOH1ovDjw1ywHZ
	drLE/Kqphayo3Eilt6mLOyAIEHqUKEWRWZ5YXtsRCdcpZop3+dDb8gXcAd+KGWf8c6GR1KXAvC4
	q2q+wuTlmwE7J5EVlSlw82ltvBfOzD0PmdpzycRRFk8WX4BbV2kehpYzJBw7Bsgqk+RveXOkpaR
	ptDQ79Z+E6VTJFSA==
X-Received: by 2002:a05:690e:1030:b0:667:aec2:a8ff with SMTP id 956f58d0204a3-667d7c469f1mr3381411d50.52.1783881819099;
        Sun, 12 Jul 2026 11:43:39 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:38 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 25/27] linux-yocto-fitimage: add KERNEL_PACKAGE_NAME prefix
Date: Sun, 12 Jul 2026 14:43:05 -0400
Message-ID: <20260712184307.3259642-25-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240815

get_kernellocalversion_file relies on hard coded
kernel-abiversion file. The kernel- prefix changes
when you modify KERNEL_PACKAGE_NAME.

Update to account for the modification of KERNEL_PACKAGE_NAME.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-kernel/linux/linux-yocto-fitimage.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
index 6ce1960a87..68cda0bfae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
@@ -10,4 +10,4 @@ inherit linux-kernel-base kernel-fit-image
 
 # Set the version of this recipe to the version of the included kernel
 # (without taking the long way around via PV)
-PKGV = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+PKGV = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}", "${KERNEL_PACKAGE_NAME}")}"
-- 
2.43.0



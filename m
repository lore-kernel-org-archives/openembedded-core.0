Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49651C624D7
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 21:22:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.279.1788470562614218364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 14:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A7moCucj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso3615325e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 14:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788470561; x=1789075361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8wytAVIdFpCdN4p87iYZILidhhpJTY/LhjyZarV3VQ=;
        b=A7moCucjOesFC+EvA4msmt1x/HS9l2060sIWVsolsq1HW0g1HZztdJeH3FfABCt6jI
         nw3Z3vQOqjR6FK3oOwn/Qa2rxuYND5MgsqN9Jwqy95V3jOMjaSXm8VEvQb3HB2tmdOyE
         3Hpbc4OJPmSlXkeZo9kwSWMzIthlJq56vXOnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470561; x=1789075361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r8wytAVIdFpCdN4p87iYZILidhhpJTY/LhjyZarV3VQ=;
        b=HdC0H3Pa7s2EaKntVhHaFDUf36moP9SDyqL9Pv5NL3MBLfVssq82xCiaUkzf7qLLBD
         hmPW70N4sexrh6UiA8JfCxEWTIalxKeyteqduWsXHoihlRgywrto1B31DU9OuOKHtPdm
         x1lrjIv8MZdcsX7i7Bnlei9WXXBCz0eDvqNbPrz24XZrsYyshcq3pLiw2cSquGpLQbLg
         UwAiLP4E2M/IP0JiVgWF94HOb8+HbxGoH23URs0TkAMCq/UagErnHEycauau/EM/YaiS
         l+lCG2Pv1LIkMkJHk0/3hlAwNfeMIoSldipPz1nGrMPDs3LggWe6lNUZCSwcH6HYyPO9
         haYg==
X-Gm-Message-State: AFuF++ng+CQV2wOeYD5kZ/VqEw7sPtTDCtbBHmC3QCWlNqrK52pCbu8t
	rsid8OqmZFtJpgkHDzEWd3B2cBWQxwcVIaPfKoOWjV2M5i6ra5O9EjekjZZ4p3Y/Vq8mAAeL5xX
	ppIx8Utg=
X-Gm-Gg: AYBFou053sv98P+8eiDmwiMszhA2uJbgfstCwjhEyPGVAAe83oGQ62Y6JE+4/i0fP3B
	KljXSeMwTjVwbpVGShVHj1t3dMS7btE6CLRs08Mz4iv7iskkLhF3a4tVPNUxVRzx+rf8FGnU77N
	MYBEym2/qI8lx43txemI8GZ0c0mhXSsxOhJNIVeosU7uyK+JTgTkhMviSGTbRsr3eIgi+t1AIUS
	78rbdp930svcCBiplfi9/GE16d5MbicR+su6SoebSog9a8XhShRhMlU0sf186NU0E9fkeVRYVyU
	Dt4C6NkP07mIfVzTw4n1IZlIunRtNJqdKvO0mgicaRrSsXgRWw1qDHOapEGlLubNTISBtet0mIA
	DAj8/BEuolnVFqTpJglc9FO5q3W4oawG99t84rswy0P4Auoup+G5PCecQCPa4z8CV1jFg44P+ht
	5f9fArvfTf/3L6WAJztehzATOab2KLq3Xe+5++UqDk/mssUfQlNlrx1bGHKSL9w36Gwfi7X0Ed8
	4X3IGf3As4BBziO
X-Received: by 2002:a05:600c:6383:b0:49c:e88b:b7ce with SMTP id 5b1f17b1804b1-49cf823f147mr14014905e9.11.1788470560910;
        Thu, 03 Sep 2026 14:22:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f77:7f7:7ec1:8841])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703ef1sm12780285e9.3.2026.09.03.14.22.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:22:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] sanity.conf: Require bitbake 2.19.1 for bb.fetch changes
Date: Thu,  3 Sep 2026 22:22:39 +0100
Message-ID: <20260903212239.632265-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 21:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245047

The bb.fetch2 -> bb.fetch changes are in bitbake 2.19.1

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index f80763bbe97..ea39170c709 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.18.0"
+BB_MIN_VERSION = "2.19.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 


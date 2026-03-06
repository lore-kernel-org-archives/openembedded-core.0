Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896C1F01812
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 08:41:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65348.1772786498947382682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 00:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HqoR2ngQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso81866255e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772786497; x=1773391297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhk37PTorIQPiZKVEX+v3i4al7mnGp1VAVEgbK5fQ7k=;
        b=HqoR2ngQTGdCpmYgH4qEnQuBMib+QDSfFBTHK1NmkvPz9j6TBXpKK6q3TihpUJzKN+
         l3kmAwA3+NjbQnFL20x6Ns6sXfa83VJwfzgxQW1KByYURDJ7YqaixK9XCMDYxcBmHe5g
         s9lrfJaaLDItFqmo1smhhMMdlONw+NHVv5vqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786497; x=1773391297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhk37PTorIQPiZKVEX+v3i4al7mnGp1VAVEgbK5fQ7k=;
        b=E8Id9CsXqAgAO3VsO2C7X18s7C9a1txTFRgvixti5CMI/df/3B9cKrnjKDjnhG3dvy
         65JJNMXGN/dbrEmhTKdbbWZOsDTI9HKskxT9AaUCW2PU9NF1mdfqgas/ZUin+n4m+bI2
         0GLv1tMsQfsVMZYcTxMFmWymZGiApoe7DkAPrvKfrZl3IumBp17IIWeFibQPoxb14Fr3
         7+RV+8WBC/IplLt9rWGUpsdglP08E7CMrcU607b/6daYr8lorj5Rf0P6BHBghdSf4DTb
         aUwFtGXd7zsn+zMtsnB2ryUdcmqKphThNez46b4jXUoXJ2VdR4MaUGP3im5avJvZRk0z
         wSww==
X-Gm-Message-State: AOJu0YyUmof209WE6XyZlrU3grNOr7xqp3EgWo8TTqQj6EZKsQFRswxs
	mhRHVOUxVlBGACJ7e86l00MueKdjaTMRE0w7dWMFbO7JGAMIBd2OYkQCX1RbaUmSFFiOD/Ex7QO
	r8eyl
X-Gm-Gg: ATEYQzxwrFa+mHaU+/26y45v1s74Aky3FvElr0nuNR8skh8tXWXIRHNrgadjRSzMsa5
	BxlJQqxsC7PIkCwj/TtHou7wLzejEnsPMnnVTZ7l5FASzGiTtu1rHGK/LUsF78dfXfXzMv8T3zk
	eBRiwFZNSuutm/eoKfUpwGzZb+ibnIVRUwqVbWYcBLDrm96BKRb7/Jj5g93ncHtI68CXGGGQ0IS
	6QsMkAgB4WYOFC40avur3X+gvIQ4iV1YctKzxg43LaoFl16T1ZYdDEoYbt6Uot/cbbJHCAKX8NM
	ghFex8N8FAkFgk1Vy3A1sm756agsaFf+SmSa+iL38Vs4zcstXeuacfubjYrtspV4xmAt8XLM1xz
	FLJJBblIjGsz98nDy9AegsqHDWtpS0/PWTTGWVYIPzQYUYGKo4ovAFP1xLd4InA2nuTwLm6xP9P
	HXkAjlBKL3RMJCNxmXKFLW49Bxd4SVMBtcWZeoTHjggjgEd7PuptoIkzKG1YvALtd46QoVm/u6K
	zw+m2+E3qtMOZux/Jd33z984h8a
X-Received: by 2002:a05:600c:870b:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-48526957c7bmr18808375e9.22.1772786497014;
        Fri, 06 Mar 2026 00:41:37 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm190610255e9.9.2026.03.06.00.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:41:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] ptest-runner: Upgrade 2.4.5.1 -> 2.5.0
Date: Fri,  6 Mar 2026 09:40:43 +0100
Message-ID: <20260306084043.375192-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 08:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232557

From: Yoann Congal <yoann.congal@smile.fr>

Changelog:
- utils.c: Fix dirname() handling in run_ptests()
- ptest-runner-collect-system-data: add info to logs
- main.c: Set PYTHONUNBUFFERED in the environment
- utils.c: print a message when a timeout occurs
- main.c: Add print_helptext() for detailed help
- main.print_usage: Remove unused argument list of -l

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{ptest-runner_2.4.5.1.bb => ptest-runner_2.5.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.1.bb => ptest-runner_2.5.0.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
index 89f85e24555..d9ec0baf799 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
+SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "


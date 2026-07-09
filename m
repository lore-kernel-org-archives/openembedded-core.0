Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930B7C44507
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5801.1783591623508109488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UqefPTWH;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so12939215e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591622; x=1784196422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GDj86slT/MePzt6WHoLlsW/qUuLYhq+nxTY0OQIOCuw=;
        b=UqefPTWH/Lqof0rYUBrUo8FtL7g6SACEVisCpoIcsuy4/84V3XQskjaGsu9+ih75tQ
         nZ6f3XG82pqoNCsRMo+roBqrLsESgcBRR+nK52N/M56G53YVhkEVLCju2bSwcbj7I7D/
         T6W6FoeaYeyn25N+K5cN0X1JOvP/LPZ3475+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591622; x=1784196422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GDj86slT/MePzt6WHoLlsW/qUuLYhq+nxTY0OQIOCuw=;
        b=dOzfHUhkBcyZcy6GTBFKXtO7YL7ckrC2xiuicTlgA3MJi6WS0bHlo76q6Ls7YSnYwu
         EVLhmIKvwsgyZAi+mXB3qZguegq9FGJZiQSeSfLpTqTzKrAIe7okGGtr+6wun8uP5dk9
         RMVI3s/KoQk/V/jbBG8zR6oc04FJSz0um516n4xwy2JEY951zMLEd/FbFvP4N4wDWJvX
         pNq6KxT5ZC3kMEPRV6hNHwUTREZDA0mTBh7IQvg3DrtAoqAHb8TkRkah7SjMvCquVVF8
         TDp0+5GEp5/nuBCPleiq0R5yqM2cDI2DXKQP80Bn8iD2uGHkYTNwow89eJGjBHInYSyk
         xlWg==
X-Gm-Message-State: AOJu0Yy+ZmerKuEhztp1jjc8LwQTlcIYv8csM54LypIWmHmWZDtSQbrg
	nr50Uy9o8cAAEs/KFTGGsk4XoWZF38Ws1nJpVofNUDrGXRVBDVqoLNM0zJ1SSsd3ShBNbt7gTME
	l2Vpc1nc=
X-Gm-Gg: AfdE7cko+xgns+ZHN7I/wfSJ7LNzEm+zl5zk1WQ/m/YXfaWfE1AKb+ymJJf+oDUNKDj
	1hq4vmcK4qSkmOkgdcb1spZsNlbeJrs5wwKoOr4mV1+s8G26sR1TgXGGlR+qCiFJjRz9eC6U1QR
	pwZStyND5cLPQ8ier59+sPgBBpq0j6geN3Fe+hMQS78xiOaiphKn+MmpP4Ui6nTE81EHJwG6Ndg
	HQFStdFeaeyTzXlt3KHlkw3RY+UI5ZRDpNTx3+AkdB2vIas/grZhRnxMnZiONXAgR4Rb8E+sRh5
	glK8U5FkugLOjaZu8rjHfw+4JMKH83v2c2wVoovrqCdHeliiK3w57AeGQbahaQb5tCV1HeAXA7l
	EMV2Oz+NtB39znqDyqooYhjO7zqo1ZrEllVzAqvUtcobMalyEkcsGtVJQ7NE3YsiDGn7wJZejhr
	tN2chkNT8TAcjIzbUD1UYzmuFV4ypg8swuBVj85WBgSDihR46kW3bBWLpScDh4wOP1ReSuGoaHx
	LqbYxnvFAlcBhgwOvc3bNhPTsnA
X-Received: by 2002:a05:600c:e54a:10b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-493e68d4081mr42142345e9.32.1783591621681;
        Thu, 09 Jul 2026 03:07:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/25] sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers
Date: Thu,  9 Jul 2026 12:06:20 +0200
Message-ID: <55f7bf8cd9516971d6d01c1c890bc4c1df62b008.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240550

From: Nate Kent <nathan@otiv.ai>

[YOCTO #16321]

In version 1.9.17p2, the line that the recipe uses to add the 'wheel'
group to the sudoers file does not exist. This updates the sed usage to
the actual line in question.

Signed-off-by: Nate Kent <nathan@otiv.ai>
Tested-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76231f202a437be221c2580d4fa0fc100c453e92)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index c934dfdce27..90672ed7afd 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -34,7 +34,7 @@ do_install:append () {
 		install -D -m 644 ${WORKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
-			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
+			sed -i 's/# \(%wheel ALL=(ALL:ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
 		fi
 	fi
 


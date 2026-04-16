Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3771F8A171
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 12:49:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13143.1776343747706547860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 05:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AtGDtJD7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488971db0fdso79806865e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776343746; x=1776948546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPAJkyp5Eg4+puxaWz8FB0Sy4m9d8yCGHNHaxTwFVTc=;
        b=AtGDtJD7q1qsW/M3m/y4Gv969Wy2xCpU6Ri/Vl5McVEtyfG3biGJDOyeB7l/oJV2jk
         wEiRI12lpZMA8x5B5AOkYIVddnzgPSkVjpucZ+yI3NUFwZ4m9SKcPcM8Sk9NVnUyX+E7
         k9yoRJQ6AWlr3BrmXlHROC2TH5VT9csUlDWfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343746; x=1776948546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPAJkyp5Eg4+puxaWz8FB0Sy4m9d8yCGHNHaxTwFVTc=;
        b=StufqXRhSg0+upHLQP9PIPn6nHYK0p5Y1w7FwzrPfNs41/nxDoZbu16/bbMAO22kdD
         pT9FHQI08Bv7OVdLgWeAz9NhrTM8Ut0MHzKIvtPa0Z5H00dH6iyRep+c3r+Oo44zH6kd
         +MmdukHMnbastuX+1/gLbgqvQql5UM0UkhxlP60juADQ9ZFHXrUBvuPOEBVl2bi9qvds
         WwOwbeHBOGN/iz6DsXeMsvf9Soogc3tz4Kk0xYgz0GkD4ArHznRsAt/mQxPA+rqNM6jI
         BnX99D6zZjKpH09M4f4eFTlixTu9XhOX3C/q+Sj3Vt5rTgyfVMB5HAf85045Gx9OfEgy
         GiEw==
X-Gm-Message-State: AOJu0Yw+RIvkPFZmBqpD9By3g/2oP8DOIuYcH7Cxg0Dl8h3cm4i9EpK8
	Rz3bXbjRIJse4hOZzFQuDevyiewdko/a+iXAup6QitKS+2pK+RH8ERsrnm57yw2JFSx6Va5oREA
	Trs7IsQA=
X-Gm-Gg: AeBDiet58tUHEOPVPD5/sbGOYx8QufahSfe8nhElI3dZEJdCHBgk2Vms02U2rahy1P9
	WVnYznnZzSgQXe8NTd9R5t7OHoJ7Hh7tN2KstLjjqYy1PSt9ASgW4XHthhYmZxAM/wyXb+LeWEP
	NMU+/5T73dQb3a7e87sb6su6P5iaImzrp7UJcCeUXvwTU5dOdLb1Rpt+19centav3bmITondZBA
	JC/jWhpKtT38fNCz7tBK3LIILEhB1QQrGJW3lsCOZMnYMHJPSo6EMeiq1mczCrV+sJIXn61iKML
	a6ywfxR3IKX3Rl/7M08Fp7S4zjWyg6L1/6MZ4OrnKSAmEY2rcr3CS/pG472oLJfiG368lYkNST7
	/evdC/G6hAHnDHadnMsEqMCzid68BfI4bnoS9wlowBU/p+IFV57eWgycqCYXCs4GTPy0EMrVWz8
	djJCi8AjdQTN43LRTBfmPpfIACwoK2YNkiBjk4TSTVUfL/aXzW2HMvre12nwqdSA73xiBZxz5/f
	Q==
X-Received: by 2002:a05:600c:5249:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-488d680079bmr341323775e9.13.1776343745550;
        Thu, 16 Apr 2026 05:49:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9444:ba74:dc4b:e8c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5c8fsm14282167f8f.19.2026.04.16.05.49.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:49:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] useradd: Switch from --root to --prefix option
Date: Thu, 16 Apr 2026 13:49:03 +0100
Message-ID: <20260416124903.3175806-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 12:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235404

Whilst assessing where we use chroot (which requires superuser privileges),
I realised that shadow's utilities we use have the option of specifing
a prefix for files. This provides the same outcome but avoids the chroot
call. Whist we can emulate that under pseudo, it is probably nicer to avoid
doing that and use the prefix option instead.

Therefore switch --root -> --prefix

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/useradd.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 9d857a4555d..d7ed6cb9315 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -26,7 +26,7 @@ SYSROOT=""
 if test "x$D" != "x"; then
 	# Installing into a sysroot
 	SYSROOT="$D"
-	OPT="--root $D"
+	OPT="--prefix $D"
 
 	# Make sure login.defs is there, this is to make debian package backend work
 	# correctly while doing rootfs.
@@ -37,7 +37,7 @@ if test "x$D" != "x"; then
 	    cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
 	fi
 
-	# user/group lookups should match useradd/groupadd --root
+	# user/group lookups should match useradd/groupadd --prefix
 	export PSEUDO_PASSWD="$SYSROOT"
 fi
 


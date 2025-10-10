Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048F0CCD184
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.2324.1760064658492220693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hs/r16vi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-78af743c232so1477512b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064658; x=1760669458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xK3/u+8eBDddcCx0QLYIzSFXSD0z3aeBu4qBnC1iiaQ=;
        b=hs/r16vitD+EVKqEPxudhZ1ywYzgXc039LoMdtqasTIh7A0LHhGsuvJMy6/ULQHiRp
         DL3EQGBDgzTm9Im+JRPiG2HToOtN793vwTut8ReLy0tmjCvoMQRGApwwKfZhNem7WEgd
         dIBiwbz6Ho2y3uYEq2aU0vB6nYM7NgEredDeeb+ct/S4HhWjwjEsPFUchaI6NSFYJ+pj
         NtWwcdIWgIfs80mBSf4biu8Z2Y2yI0mN8vZorWMa8t+0mYuNmcjWORZsnIF2DvV7ZC44
         wEWPr/qjabJAvEyb9oHPXlgtOC1iP5lV9OFwo2P6khuPz4ZQmpBtw2bxq7SefOhFabNp
         eSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064658; x=1760669458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK3/u+8eBDddcCx0QLYIzSFXSD0z3aeBu4qBnC1iiaQ=;
        b=WTbo0p6Ilu/6RsA9NvRpaeQcnuNJhPSKeO1usyKYs06f6wMr8+hKEvrbuo0j7LX0ak
         Z/Nr5+VfL8/1jKHBKy9o7kTbOc6a51fFk+xk893972PgqlWYAuWc4+aTWOqSKthc0PJM
         HuR2YQagwF/RcK68GHbxhAxoXgdObNgApIm9MUtStO6VyqPARZS3C7MmD+eWEPEzgPsR
         aI5+rQjHPiFTT+Bvk6lW6Y2+I8u1lF7ZR8ZPbcN+2SIzGoRRiBN9/JeHpXhw/xI4H/ub
         4C00rlid1OttsNHyE6l1AQ/efZWn/VLCbHmLnUZK9KNDbozfyCF1wctf0MQIzmr/LQtP
         q69w==
X-Gm-Message-State: AOJu0Yz7ivHXCwE6k4acCrL8PF1J4m7D8wLnjwXr7pShtmder8xjKpRz
	fmlVmPoJse9e0AacP3s7LKZoZ1LTVHqPpKPSwxVvNlkQWyrwX7kcBKjXRRwY4bG5D02ka7/Kif2
	yHGGp
X-Gm-Gg: ASbGnctZik5ySb64Tb++uc8iL4oLdFPMZ/vj37UIg0Hd10M5lezPtBUwX9UKKkWRsNn
	1TDvm3H9UNfv8oCoFxbtCfimd6gbMDNL4USwMh/JX6IRs/0vnucHVsqxsb1Kx8CNp6c9NwwWeu5
	J8eFX1i+EJOxhfFEvbVvvQKIGKQILmpwmdmSiHFAX2rUjENDci78VHB9ff2qgqBwoT70NjQ1o4B
	aoD1IP1RrUvAwqhIU3mTQlwakJmJCxcd6MudDaoRPkEl1MdTuAvn7pawC6QuVHawcsThWJP4836
	tkagUv1pLzf5gslbwS/to/DANJMrdVG0dyBEhIELbW5TIJnXNdJs5iwTGeD/meJ3kAg7LOkzYRo
	qAr7qTh/UEVgPe9jVUs+Vum1H/o/hz+LB
X-Google-Smtp-Source: AGHT+IEZ7B+Kp1P8VytLWiSY07nIGcoMtYn2UZX1GU1FIsO/yA/68IOW3ZFA4BXnsxNIHW2CJIahcA==
X-Received: by 2002:a05:6a00:1706:b0:77f:50df:df31 with SMTP id d2e1a72fcca58-793870523b6mr9472584b3a.20.1760064657730;
        Thu, 09 Oct 2025 19:50:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/18] pulseaudio: ignore CVE-2024-11586
Date: Thu,  9 Oct 2025 19:50:28 -0700
Message-ID: <4cdcb27238be40e815ce5a0b67ce419331079801.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224653

From: Ross Burton <ross.burton@arm.com>

As per the linked ticket, this issue is related to an Ubuntu-specific
patch that we don't have.

(From OE-Core rev: dc81fdc6bdf8ab39b7f2fd994d50256430c36558)

(From OE-Core rev: 72e63e44a0c6ad5a408c4dc59a24288c36463439)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a93ef8f338..26e9e08a63 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -281,3 +281,5 @@ RDEPENDS:pulseaudio-server += "\
 RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
+
+CVE_STATUS[CVE-2024-11586] = "not-applicable-platform: specific to Ubuntu 16.04"
-- 
2.43.0



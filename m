Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3449CA1011
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:22:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6054.1756880554258383319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PquSuqrw;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445806df50so47920445ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 23:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756880553; x=1757485353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjmJgjLnvaFhPXJu6n2jKnm1NlAppCg4mG2/6MHG9QI=;
        b=PquSuqrwTIRG/isdOmJQ6j4DfuDShh1s9IkImQkxh7b+0zjux/ytc9sYZnmm2i/vx5
         cVDpl/3qitrJQ96Oj1qyOLNV9mJAJt0lDuXBSjEzqvoki2FlvTfmFGS6f6+8UvqjEsJA
         +g3RS2OGVQLEwJoc0I48cGek4+DL2CHjTyDMSCU7YuAPg1lnndQPBy9q1LZ0xuP4tJ/f
         Lwz9WzDFY9oTkd66SlDpbPpq4g1b0ex+3JBdDg8h7JZybp/9GbHqwMpujcS66qXHCGNs
         OOq0upOP0muVAe7Q608OC7fNw2tsMmVR6Ew1Tw2T73LU1h4J5g1+1SuWFgdRi8uScUug
         JH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756880553; x=1757485353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjmJgjLnvaFhPXJu6n2jKnm1NlAppCg4mG2/6MHG9QI=;
        b=sJn1xk9mzp+cENoVG1akp0+NGEsHYWYmzuZ0ikRvkW6vbdn4ZmsERoEQS5LYjZK13Q
         mRQXaJyWe1k6W1A/efifK64Cg0fJfgSA2dtemwrJESEa7oinRRHgJ0IeOJLSHBIZanLZ
         fJZWtI2mqBZyg2H0d1O+OwqKFLGRHNUn1q2+8Nmo6r4BivXu4m6BRMqIRWOawrZP4ikP
         Rif7sOvskWPsvhsf6hx+f+Ka1KEbtsPziyH5APaqTiJsPTfGx8A00P1L/WuVrGBJHjEV
         ci+/N0sZKa7/5u1gOp3xmraEiwnIgh7GUCdscVfYg/8ePsuBIz3Qtu21SC7zoiXd1oTM
         FSZA==
X-Gm-Message-State: AOJu0Yzy/36yKDheq4Brp/WdADRmuXslvrwhyX7pd6jtoOifVNJL5KaI
	47EJ8Tov1fxV3D6++Fn29KLbGeGDNPtZEvS8ugokBDWCWQsEYwHfJb+Hd5e0xtUc
X-Gm-Gg: ASbGncuJEj7Il5uXEb9f2lAg73HbuAkuFCKaYazoi9V+TXNVOgGtJXMrreUbxnmoJGk
	8SVCV9a2YYTdgmCk+3SirWtaxYPdaQlGf+vm/PPyM1F+i6pX4PoBtXCMS7tF+gmzG0+8IjNlTwP
	7kEFhsU37BhguvRvjczQYFa7l8HCpJDk86j5Nd8nLzszBFZ2fKwdbkXqEnjNZujpoVmXnXg+SAx
	DcAqBL6qv8ImgcoSaJjHxP4lRiUbWINgjd3lm92K+LygHYb2ClByp7Qu1we53u89ZergpkghmiB
	PBW6AZsT+DbFZkkXncJKGJHS+uqUfqGUy3Tb8MNjmeOvuK0iLAa1ACp8EDiYmA4glEFaZBrFv0D
	e8XQ9nUoYeBn9kHINHcY8NZKCFqTb2e3IY00+nVsGp/Co2K17ddKCkSukGx+Rv0hbYC7uGKqJQN
	fW9lOA5CiiybQDMbrG910B3iXBZZyxCCxfagjY8I1x/ioEyc/t25Q=
X-Google-Smtp-Source: AGHT+IFSqBLmmsg73abfwcT6nQx8QE75byAN7dgZ//NqD6GyfxpqhVs+NuahOTN4wYNE3VDs08OiPQ==
X-Received: by 2002:a17:903:41d2:b0:24c:a22d:4c34 with SMTP id d9443c01a7336-24ca22d4fc5mr3424775ad.41.1756880553269;
        Tue, 02 Sep 2025 23:22:33 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da2a05sm147564915ad.72.2025.09.02.23.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:22:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 1/3] boost-build-native: upgrade 1.87 -> 1.89
Date: Tue,  2 Sep 2025 23:22:28 -0700
Message-ID: <20250903062230.3959250-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222843

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased
v3: No change
v4: No change

 ...st-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} (88%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
similarity index 88%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.89.0.bb
index 5b914b6f88f..911de72bc1f 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
@@ -6,8 +6,8 @@ SECTION = "devel"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
+SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
+SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"


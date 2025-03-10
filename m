Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887A7C282EC
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:36:37 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.37434.1741613791256673589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Fk4QbSOa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224341bbc1dso44259535ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741613790; x=1742218590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TY0/mtF1iAAsjbafjrjWqO2nfaE5fhr+voBzP8unTaU=;
        b=Fk4QbSOa6No49AORLeichTLo83YTvop+cPrBddf9ojuHA4zWZ96278pdt/VkBtw/IV
         TGuxgkDGkhKuAEHYTpFgXNOVAvFA7rH8OluoVRURXP6/hheAGTkpGQTcNLsjnZpEmkr+
         QLctVau3+d08hbNinEM1YtPJPtszzBW9yKQ1/eeC/YbuYsgPA4RMKk0ZYBu4pFg9/yRL
         YEL6H1CqRQTZiX1OD+jFOr7nbKt8cWsL0pFDVEuevXa3iuKPwXY8HkHhFFvhiKOiToiI
         mdJKmiqUSTZlA6XMxoFkLUbbIleV2M/PeMXKDFEd7+lGp/al2PLUgRRbVSckXP0uJ0Kw
         HD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613790; x=1742218590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TY0/mtF1iAAsjbafjrjWqO2nfaE5fhr+voBzP8unTaU=;
        b=LBdWclPA4EUKnR6ZO1DctGzuIFS0zwqgJFm67W3dv/PONFQS9vOod2X0RKrvAaJwTH
         Zv/GbCtZUDpmxXTFtrl/IiNhVoaY3r577AKdC3fw84ud7cLq/fbBGggxx3YK62bApUzo
         We4n4pNytgUIRKZ5hwyT1gjWi0V0GtjtlV1wKijPRUOYyvKrvCjfMUl5CKp6FQiUS8lq
         D7La+hvEja3vVwU6jLga5z2DER34M3J8O3F7444PTHkbeOVYpJf3yI8mozkNmwqMX4Zp
         E9aPnJF7bAzhx72bmca+Iq1BD5712P7vPitQAesK2IaUdIBczX/D5TChw9P2DnJD8WGa
         YnwQ==
X-Gm-Message-State: AOJu0YyF/ZRl25PMzsGDvAAfzfov5xqwjxo6kaFzOWP0E53P7YUPpkcS
	j6sttzS91R6D+uHaKzZ8xR41+vIHqdMCo4Q+6DO+J0kuk4xvVyDvO2WQBYuWTSsoDh0jG/ru0pb
	H
X-Gm-Gg: ASbGncsQ72tW6x/gj4RgiDcH8dM/VJVMiubRB0YrglVpZca/CNXQUqVLoVG8qg4cVOX
	th0g03ImMiMf2BKf9CXrqXqYsfNfWZ3+VZmk1Ng3mE28PFfE8gk27+ecSOQDluQ0lML/hVvHQ7k
	OZ+7x+EE++KviboETB0b4L+Ig1i1oXmlBeup0nMAHdIbYb0b8wqYXp+00sUcocrvjCSsfDZrD03
	yQvBcWCT0BiPVfc9zurUZKt3QehZVOjqcHaDcmfR5CjfwH5kzyan95hTsK7R+A7E+xtU/O+lT9M
	rhSvq0WhG6r087f8FAm5YS+zs34mt1VO/cHeVCMHvzv+6SU=
X-Google-Smtp-Source: AGHT+IGry2YTRtTx9nFUuIQKZtkLcGE1dnU+W3hK4aeGNaikhPCXM+MKYD4ytNFLi/kfm24ZsEwyaw==
X-Received: by 2002:a17:902:f645:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-22428ac90a6mr201020375ad.42.1741613790408;
        Mon, 10 Mar 2025 06:36:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2ea8:96c2:9f70:5c1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfbcsm77820095ad.21.2025.03.10.06.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:36:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Mon, 10 Mar 2025 06:36:18 -0700
Message-ID: <cover.1741613667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 13:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212520

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, March 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1152

The following changes since commit 0d9f2fcc2058407eb138297d9f8f12595851b963:

  mesa: Fix missing GLES3 headers in SDK sysroot (2025-03-04 08:43:39 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alessio Cascone (1):
  tzcode-native: Fix compiler setting from 2023d version

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-0840

Hitendra Prajapati (1):
  ruby: Fix CVE-2025-27220

Priyal Doshi (1):
  tzdata/tzcode-native: upgrade 2024b -> 2025a

Vijay Anusuri (2):
  openssh: Fix CVE-2025-26465
  libtasn1: upgrade 4.19.0 -> 4.20.0

 .../openssh/openssh/CVE-2025-26465.patch      | 140 ++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0038-CVE-2025-0840.patch         |  53 +++++++
 .../ruby/ruby/CVE-2025-27220.patch            |  76 ++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   2 +-
 ...{libtasn1_4.19.0.bb => libtasn1_4.20.0.bb} |   7 +-
 9 files changed, 279 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.19.0.bb => libtasn1_4.20.0.bb} (63%)

-- 
2.43.0



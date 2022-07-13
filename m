Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6061CC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 19:46:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.1611.1657741602961038788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 12:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WTITAVct;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso5294236pjk.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tcfkmjKqnUhY9gJFCzl0MXcBADqHL6SCKflPEVjJWJs=;
        b=WTITAVctn7Pyl5il2U62dLlt9K9SRcPwW3TYRC2ZT+eCWj2Cy/p5rUx1D93autkptm
         4541m34nqbCJYkiQIN82Byc/Ew7Nt/eVmYZhiL7O/kC/D038BEP0neii7HFbcROUhrC9
         TNfmtLyZ1N2mc5XMfftCalogeJ8rieF/+O10I5bjaCo3uMMwJNIdQSGQI4HPgswadOGM
         nTD5gIC32UIfUK+w38z/OD4uulFxdPfz7Qw1waItKOmPiipBs9ep4fjwmBTIN8ueYCLY
         WiGj98ad8UczWzonS9CoDfn1/kTabls7rlIv+F837ENw6muKjNtOx49kKvHLhvQLBhaM
         zy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tcfkmjKqnUhY9gJFCzl0MXcBADqHL6SCKflPEVjJWJs=;
        b=EX3Pyy5OuaRGnAHWt2MM0tb/z49GH33YAUFZ9JTFJo6RzYJdC6d4pxBikuMasvMs/7
         LvoXBJOYzfvFlPdkal630eGQgonf2FYQQYPvBjwB0UhQDLEyqcIme8H+EnfJvUP4GYva
         ebMvH/k1JaXC6GVz1nktu25gJmjq5oJnp21PDkzXjz+t6bOtjNPmaIKFqQUgk92goxAQ
         3b2EuzgBGcG92motfE5755FFzYYBZF5QVB+aPstxI6OziaYpIELTZesMjAqOMqZGsy64
         WOElNhsNFijmvt28ki6m6BBy50se+uXG2wotVCEERuJabXYeXlmk77zvIoX5aUedOsQu
         z3+Q==
X-Gm-Message-State: AJIora8T+t4xbsmwB+HEjpWzD5AV10qy9wDntKXH2QaY4Dkq1JCWBZtd
	JeX1QcAaA5146oj/i6DJFpCnzCpX2/7we0kL
X-Google-Smtp-Source: 
 AGRyM1sOWsCckV+8UHefdfF6WnhxydY0LR19z+aTEOdOemTrVLWVTaBo4xJu8RbKA3q1t63B/sKnbg==
X-Received: by 2002:a17:902:f78c:b0:169:b76f:2685 with SMTP id
 q12-20020a170902f78c00b00169b76f2685mr4610419pln.41.1657741601689;
        Wed, 13 Jul 2022 12:46:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g4-20020a170902d1c400b0016bde5edfb1sm9113429plb.171.2022.07.13.12.46.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 12:46:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Patch review
Date: Wed, 13 Jul 2022 09:46:28 -1000
Message-Id: <cover.1657739246.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 19:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167985

Please review this set of patches for dunfell and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3905

except for a known autobuilder intermittent issue on oe-selftest-centos:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14201

which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3820

The following changes since commit af25fff399fa623b4fd6efbca21e01ea6b4d1fd7:

  qemu: add PACKAGECONFIG for capstone (2022-07-12 04:08:20 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Joshua Watt (1):
  classes/cve-check: Move get_patches_cves to library

Ross Burton (1):
  vim: upgrade to 9.0.0021

Steve Sakoman (1):
  openssl: security upgrade 1.1.1p to 1.1.1q

 meta/classes/cve-check.bbclass                | 62 +-------------
 meta/lib/oe/cve_check.py                      | 82 +++++++++++++++++++
 .../{openssl_1.1.1p.bb => openssl_1.1.1q.bb}  |  2 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 4 files changed, 87 insertions(+), 63 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1p.bb => openssl_1.1.1q.bb} (98%)

-- 
2.25.1



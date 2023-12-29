Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB8C47072
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 16:07:58 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.152098.1703866076429964670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 08:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UsAtjlFT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6da202aa138so1101359b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 08:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703866075; x=1704470875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=addNQn3/oyHGUFgBIWR8CiDGoLdpP1QwIAUxG+n6auU=;
        b=UsAtjlFTGtVSjYybe8SxQc/rjfU1eOB+UILKN+JPeJdAmJbzsSK7ddkIyZpLGshhs1
         C1ZOuFNp4+DnGhu/t4901DTdrCxUr7X/F5GBwjk2C0yTDO+G5xphG24ieljWUe2/2mk2
         D8/paHVS3xLnoYQmw07ajJ2T2GlZShhDGMDyDAse08G2Vju2JY94D2o9JXM1h0DmvIFa
         hswiz51PfkHEFiYTjoelCHG7sMoH0RFwg63e9AKYkrkkAvmVOgOhu91eGIzGC8HIFN//
         YsCnCCs6TXxi57VRTZBmgtDJmMPv6nanE7OzuGMw3z6Men/lmo2s7omSePkVfogxOMo/
         dSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703866075; x=1704470875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=addNQn3/oyHGUFgBIWR8CiDGoLdpP1QwIAUxG+n6auU=;
        b=WWZziff3gx3Lv1bEBmgu3oUVQNizrWv2u/uLYiDfoP6zyV8NP/0/+1kIPBH4WTFEtv
         Kn/V0eBRmZ6gMP7MyP3HnvSxbEGhu8FG2uJgllfw9jrlpG2q5O4lPAiquqqWZHRGpl01
         7Q8DQVjcgezZ9R1rIv8j80ngtMvhXlg6tHX9+iXdsU88Imrxx0dy5/eD4DdamUUEFnUV
         eH97yWU+Cz4KbHwAbMW2V8yW5fPaYiWKR5j3zJ+r5HMHCyywgL3g86p0T/cN7iMWHws/
         lisTT/Nz/MJTQg/S1iVMPaHD+heGognAitd2mSoIru8/l3FXXp1Zg7RLNoQlJ/Twvkn+
         Xbpg==
X-Gm-Message-State: AOJu0YyMEB89p/h0wlZ1uBwbwaG7nxkohKVc0UvGPcRobxNJkjha0Wui
	dbSa+dcrp0noqLRu71pupds5vKBzCl8VqbVyarumQqtZeVth+Q==
X-Google-Smtp-Source: AGHT+IFTW89q278OIu+KqPULlp2ZFCpxpmpiOzEvLrvkDn2HIh1XkoPicWU1N/6ina7FoELVAb1prw==
X-Received: by 2002:a05:6a21:a59b:b0:196:4761:3f4a with SMTP id gd27-20020a056a21a59b00b0019647613f4amr3701955pzc.123.1703866075028;
        Fri, 29 Dec 2023 08:07:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78499000000b006d9b2682c91sm10028691pfn.113.2023.12.29.08.07.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 08:07:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Fri, 29 Dec 2023 06:07:44 -1000
Message-Id: <cover.1703865952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193059

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, January 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6384

The following changes since commit 2afd9a6002cba2a23dd62a1805b4be04083c041b:

  testimage: Exclude wtmp from target-dumper commands (2023-12-20 11:40:13 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (2):
  openssh: fix CVE-2023-51384
  openssh: fix CVE-2023-51385

Khem Raj (1):
  elfutils: Disable stringop-overflow warning for build host

Steve Sakoman (1):
  testimage: drop target_dumper, host_dumper, and monitor_dumper

 meta/classes/testimage.bbclass                |  24 ---
 .../openssh/openssh/CVE-2023-51384.patch      | 171 ++++++++++++++++++
 .../openssh/openssh/CVE-2023-51385.patch      |  97 ++++++++++
 .../openssh/openssh_8.9p1.bb                  |   2 +
 .../elfutils/elfutils_0.186.bb                |   2 +
 5 files changed, 272 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch

-- 
2.34.1



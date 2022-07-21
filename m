Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA190CCA489
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 21:38:41 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.1059.1658439514276844201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZcG4RdNE;
 spf=temperror, err=temporary DNS error (domain: sakoman.com,
 ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id l124so2896714pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9ybsm7IqTp4mWlWoAsHJGT4yRL+4PUDUDTM8l1SCgo=;
        b=ZcG4RdNEzNcgi2NgfHWEiGCtqAQYrq9eolxRScdIstYxsjGuGrblzVJtddBpoyHfPa
         T72ecr6fXL6FBY/WkNPsexgVHJE0CqKbmuDTeFifXf5+gY9aEvfaQofoMwTU08cwOi2X
         3XSV8Rirsq3cR1H36rIG//Eibus/dcMa6mtOCwMokQPnA9J1zatN2PKfnLe7hel+/fQM
         db+aK2YQVjF4gXgHO7I42P9nwfPKUfCkg4WUu7OJIMz2bxQg/0eKm37kgnY/MG1xe4ym
         LiViYdOwt5Rm5Hawb2/3HgLFakWMVPbuWQwaC7S+fxc44hKtQUjfMkss0afQr04EIYhV
         aIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9ybsm7IqTp4mWlWoAsHJGT4yRL+4PUDUDTM8l1SCgo=;
        b=2Vug9G4pbEq6gLSjpLItvzmV8WQM0RUIQ4czl1kaTmZ6fp8etYSdD1hMp/LqsttOmE
         49AGoIREJz4k+kQm9NZJO/ML4tUU/Bfhchw+dmOmgO9WC+hIE8vpfULls9fcxKyrpuWC
         Y5o/7pxQf00AQoAXz7QPNStaBtt7FsRdhIZp9sVo43uoFphCrpqdc5Rfxth6z/rQJ8NA
         WCE2fF83Sb6IfwBSdhDz6CPX5um8Nyk4N/bpnZoX7RLJzVhA9saAUTr7KkOWHh85+PlZ
         YO1z6CiL7JLlhnJafyMcISimKmcr/yLn+z/GD22xIz9enwuV6V1s6bPCJtbJ++Khs3xq
         QLeQ==
X-Gm-Message-State: AJIora9vY8FRCmTeyUV/oNQAzF1Rtjj93ye+kb83xDCz40/zijQ9se4/
	yv25u6gt1P+I8cMaukf0fas7qEvDoeDiWrte
X-Google-Smtp-Source: 
 AGRyM1u8sfXYL2OzcXseGoN5viL1Kmypnb51d2KxT/nHqRaLhRBtiGaTII5csFyrIHHNh6GnNsQ3SA==
X-Received: by 2002:a63:500d:0:b0:415:e89e:42b7 with SMTP id
 e13-20020a63500d000000b00415e89e42b7mr357035pgb.140.1658439509862;
        Thu, 21 Jul 2022 14:38:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x184-20020a6263c1000000b005283f9e9b19sm2194275pfb.180.2022.07.21.14.38.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 14:38:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/4] Patch review
Date: Thu, 21 Jul 2022 11:38:15 -1000
Message-Id: <cover.1658429064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 21:38:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168392

Please review this set of patches for dunfell and have comments back by end
of day Friday.  This should be the final set of patches for the 3.1.8 build.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3944

The following changes since commit bba069463ca3813666d084643b0239b9af0199e1:

  classes/cve-check: Move get_patches_cves to library (2022-07-13 05:25:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.205
  linux-yocto-rt/5.4: fixup -rt build breakage

Ranjitsinh Rathod (1):
  cve-extra-exclusions.inc: Use CVE_CHECK_WHITELIST

Robert Joslyn (1):
  curl: Fix CVE-2022-32206, CVE-2022-32207, and CVE-2022-32208

 .../distro/include/cve-extra-exclusions.inc   |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../curl/curl/CVE-2022-32206.patch            |  52 ++++
 .../curl/curl/CVE-2022-32207.patch            | 284 ++++++++++++++++++
 .../curl/curl/CVE-2022-32208.patch            |  72 +++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 8 files changed, 432 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch

-- 
2.25.1



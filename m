Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DCCEB64DC
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:05 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.711.1687275598733334332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3Gy1AA9O;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-51452556acdso2130358a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275597; x=1689867597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cT4VJLXGTJlGFDYLjs6/8X8y0+UuIxyIZG3S46p6yc=;
        b=3Gy1AA9Od8Oz3OdMaJ+DDHbMMbnH2Xw9d3+MuIkNScl/uvXzH66wxL91mq8u4tEvKO
         1tZFB1mZ3XmRm/zdBtJGaevcbUAoL1B6//lYyZOh0NZAI1tJd35+n38w1Zf13A/kf/8b
         0s1jzZa/u3dopFKZ/SjfNbbY1whJUi23omEn5AvpRDEWKPCfeE2xTbaL/ChX/ByCwrmx
         cTTPpfk2UBiF7NWNd7+lP5y1Vn5aqTyJ0C3o6lmZx+szcPn4YOuZrjzTUdXsuFyWVOe4
         XsiXMrt62K3JALRWDZLpwzhdV+B7B5S/nV6CHogzotipjFv0abDXL2FMarIfFgxAG8nt
         V5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275597; x=1689867597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cT4VJLXGTJlGFDYLjs6/8X8y0+UuIxyIZG3S46p6yc=;
        b=MgyFC8ipN8+lBl5/QTD5gGfqtKTclWabousnZct1aFmIQhhKWLnxaiK4p0g8GsTM17
         WeXTw//hH/l9+PIkFqy3oT+fqIUYAM62LMBh9ucZk+Lyvmt6qI2xcpXBpUC8JqkDmf+m
         x9ytbkC7y2qI5tMTvqKV843geug68JWGkivFrejobYZRKes0RMYJZe2RgLBWMJe21LoZ
         sfEVJjgmmAuoqliEFuPDiR0itdc1be6dOprZJdrmkpqrRB7mv6hK73XFrAUkw+NenAeY
         eSbc5IWpmlABzoh9+KfYWfUS1uzeGZa3IUQA6mC41c0jqJaikOT9nn2F3F8UwBRo37DN
         q4Og==
X-Gm-Message-State: AC+VfDzvKBOfLeq2Jtqwr8loXqUAMSaw40jz6UEWk3MLA3DskCIqwv8B
	4hHlNSOHeSugEWSESfpjDgI/t08p+vmI2iSkKmo=
X-Google-Smtp-Source: ACHHUZ5KDqubELHm0rq+8ndEus3nw9VcTAKt6uRN+7pir1fLHFmO/aUuE87aVobnQOCxNMZ5Wh7xPw==
X-Received: by 2002:a17:902:8c8a:b0:1b5:2728:4721 with SMTP id t10-20020a1709028c8a00b001b527284721mr6675472plo.58.1687275597540;
        Tue, 20 Jun 2023 08:39:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.39.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:39:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Tue, 20 Jun 2023 05:37:19 -1000
Message-Id: <cover.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183143

Please review this set of changes for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5492

The following changes since commit 0e17a5a4f0e3301bf78f77bb5ca4aaf3e4dbc7af:

  Revert "ipk: Decode byte data to string in manifest handling" (2023-06-17 05:18:44 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (1):
  nasm: fix CVE-2022-46457

Bruce Ashfield (1):
  kernel: don't force PAHOLE=false

Chen Qi (1):
  staging.bbclass: do not add extend_recipe_sysroot to prefuncs of
    prepare_recipe_sysroot

Lorenzo Arena (1):
  conf: add nice level to the hash config ignred variables

Martin Jansa (1):
  go.bbclass: don't use test to check output from ls

Pavel Zhukov (1):
  lib/terminal.py: Add urxvt terminal

Ranjitsinh Rathod (1):
  kmscube: Correct DEPENDS to avoid overwrite

Thomas Roos (1):
  oeqa/selftest/cases/devtool.py: skip all tests require folder a git
    repo

Wang Mingyu (1):
  iso-codes: upgrade 4.13.0 -> 4.15.0

 meta/classes/go.bbclass                       |  2 +-
 meta/classes/kernel.bbclass                   |  2 +-
 meta/classes/staging.bbclass                  |  2 +-
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oe/terminal.py                       |  4 ++
 meta/lib/oeqa/selftest/cases/devtool.py       |  8 +++
 .../nasm/nasm/CVE-2022-46457.patch            | 50 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |  1 +
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  3 +-
 ...so-codes_4.13.0.bb => iso-codes_4.15.0.bb} |  2 +-
 10 files changed, 69 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch
 rename meta/recipes-support/iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb} (94%)

-- 
2.34.1



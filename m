Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BE7C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:28:44 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.2718.1648607323807816540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rP3oVG/W;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id t13so15137469pgn.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6beWw5eOjI69gxyQfqR/h3ehoL3RAUI0Q+c+Z9xLT4=;
        b=rP3oVG/Wf+gByMXZBRuxQJBran2yYH5sqO9cHsDrLk5zQtCupthRwZlZ9nFd4zQc31
         bSLdmBIS6efh1E55liZaEa8Wx7XvANIpBaGf+VQ0wFeHg531Xg+XpfRQDFwvpnk1mRgt
         fR8P7Cx4vQlHJsxMJL4XbZCk9FgO2PI0gM1THM2ExB2+xeEFE5qC6RlAIQ2xldMoxmpJ
         ffizXOH3wAWrA3PA4pNAyS3lt7iWw1WZBNy9fWU6YA4R5YJK2prV0aMhPB0hQYUJQpk4
         53qSjApZUgM2XWa4p5npVVzWZtsG0CD1hawDCT0E0R2jpbj+Giu9MpYHTq0igAM9abYg
         w7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6beWw5eOjI69gxyQfqR/h3ehoL3RAUI0Q+c+Z9xLT4=;
        b=mkeYxkQn+e5D7jZ1j9rftUTdKeR2+ZIN+7EKkZWt4dcpTrOrQhK/cQ0hqLhFh6eR8m
         1lisxv//O/xvK25lyvOu3qgMhFCP9DIXhWcRVtGLGRX39QrukGQIO6Mw425kbDM9B+K2
         O3WrzcDEs5e+MZkG6e4vQO6vm+wDiV1aQSak/YNC7OtMP05zEmuWEjq6viEyNbQqzxAk
         xEoMySwmSeOph8tjV9QPJqFLwEJh6txHPfDxSe9KCOdxCaFtHg8bBF9tetcy46CQkByF
         25InKT2TeLAtPy0/P/7EtUfPaghkvC0c88A7EyiMRU9b3NlMMWj8mOT+YWnsYlg9n/PQ
         LQTA==
X-Gm-Message-State: AOAM532MoFzTO5uJeaqGpbuLc2TGlo7f9DIh9qR8y/k5/8cz66CHkYYl
	4Yxan9tqDPWefOn3n8CEOKhUPTLeRS5apFg3Z1o=
X-Google-Smtp-Source: 
 ABdhPJyVAlxTSIMqxjVMxYpyvKKgE7pyQtLKLKc2wI5XUcxCE+hfShISt9Yjidjkif8eXQ5cSUsIOA==
X-Received: by 2002:a63:618d:0:b0:398:a0cb:6435 with SMTP id
 v135-20020a63618d000000b00398a0cb6435mr1956625pgb.370.1648607322515;
        Tue, 29 Mar 2022 19:28:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Tue, 29 Mar 2022 16:27:52 -1000
Message-Id: <cover.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:28:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163763

Please review this set of patches for dunfell and have comments back by end
of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3445

The following changes since commit da5cba5ec56cc437ede46d8aa71219a2a34cbe9e:

  oeqa/selftest/tinfoil: Fix intermittent event loss issue in test (2022-03-26 16:25:24 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Steve Sakoman (7):
  util-linux: fix CVE-2022-0563
  xserver-xorg: update to 1.20.9
  xserver-xorg: update to 1.20.10
  xserver-xorg: update to 1.20.11
  xserver-xorg: update to 1.20.12
  xserver-xorg: update to 1.20.13
  xserver-xorg: update to 1.20.14

 .../util-linux/util-linux/CVE-2022-0563.patch | 161 ++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |   1 +
 .../xorg-xserver/xserver-xorg.inc             |   2 +-
 .../xserver-xorg/CVE-2020-14345.patch         | 182 ------------------
 .../xserver-xorg/CVE-2020-14346.patch         |  36 ----
 .../xserver-xorg/CVE-2020-14347.patch         |  38 ----
 .../xserver-xorg/CVE-2020-14360.patch         | 132 -------------
 .../xserver-xorg/CVE-2020-14361.patch         |  36 ----
 .../xserver-xorg/CVE-2020-14362.patch         |  70 -------
 .../xserver-xorg/CVE-2020-25712.patch         | 102 ----------
 ...xorg_1.20.8.bb => xserver-xorg_1.20.14.bb} |  11 +-
 11 files changed, 165 insertions(+), 606 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2022-0563.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.8.bb => xserver-xorg_1.20.14.bb} (73%)

-- 
2.25.1



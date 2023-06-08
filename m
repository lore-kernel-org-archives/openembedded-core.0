Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68011C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:36:16 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.494.1686191772393190137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XMQFIl60;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64d44b198baso113894b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686191771; x=1688783771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jgVlmsnHABh7FTSMZDZQQrcb054APF2+urBpvRo248=;
        b=XMQFIl60vbhtAjKuuaZtjatUnk6W2jifXM9XenHZwREr2UEMm9fwUagXTiYUMTLfqM
         byiz54+0zQQsiMG39vAnQcOu/SfdoHeivvni1pCyLk4djVJ6BsmpB1Q7FqL5P+pYtgiU
         vDof/kfPBdCu81CAeM/sRPiVTD5Aq8w2KhR81k8CfWRszUx2S7aTbyRrBrdiW5PpE/a9
         tiPQfB1nTscSXY+TUgzPETLwrbEmdwv9LWZICjzri7SZSY4wIi4d3V0zjvjaiUTZS0sc
         2LXYh9hbEo0HogER2lBEUxUY51cdoVCH/tYLd1UN4BsFtN3MsPJheMRDL9kRZOqAmXeV
         +Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686191771; x=1688783771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jgVlmsnHABh7FTSMZDZQQrcb054APF2+urBpvRo248=;
        b=cPcpUlgqKoUBR0srxSN6yq+trzg4obxIuPqTladeq0BkgLG7DNLUuEJTobO864Sc/G
         yJZmJiAB2gEx3MZl7WIBVKm9gYmQFw0ZnQrf3MO73GbylhdPocBJGSFDio8S+eOKYTPW
         VO6FYw2XiviYOjBhjpsTPYedF7svX2vf7wrg+C21UEIkcMYvBHLz+X+3Am+T06Vxar6E
         ShcGRvVZHbIBJL6cgzhdGlVg9Aur3ebpMtRJ7KLxu6rWuvHZyxQCoSN5FxH5gA+21mzL
         ko6N6Rb51zeiYqiev1W3yKs0RHxv+Z7GSZWVzBNnk4zkMHR0PZf8cNxa0qiYeBRMJdt9
         Ju+A==
X-Gm-Message-State: AC+VfDwlVVl+BnfQ+Ndgse4qu2Gkrplm5w2G3VCWnbYd5+Ffby5MTl6a
	NNxWSHsjwCAk4ymAEsllpDQj7zQxwPW/gIEK6rA=
X-Google-Smtp-Source: ACHHUZ4AsehimLR8Dl3mEA0QEpia1vZPc+VFSmr2mnQA+yAEFhwxJbt33GDrGYdWANDmglcN8I/9Cw==
X-Received: by 2002:a05:6a00:178d:b0:64f:ad7c:70fb with SMTP id s13-20020a056a00178d00b0064fad7c70fbmr992897pfg.17.1686191771021;
        Wed, 07 Jun 2023 19:36:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b00649ac17779csm19478pff.160.2023.06.07.19.36.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:36:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Wed,  7 Jun 2023 16:35:53 -1000
Message-Id: <cover.1686191643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182482

Please review this set of changes for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5422

The following changes since commit e4b98a42970574296e0da06842691b9fc1ffc9a1:

  selftest: skip virgl test on ubuntu 22.10, fedora 37, and all rocky (2023-05-20 06:02:24 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alex Kiernan (1):
  openssh: Move sshdgenkeys.service to sshd.socket

Ashish Sharma (1):
  golang: Fix CVE-2023-24539

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.238
  linux-yocto/5.4: update to v5.4.240
  linux-yocto/5.4: update to v5.4.241
  linux-yocto/5.4: update to v5.4.242
  linux-yocto/5.4: update to v5.4.243

Nikhil R (1):
  ffmpeg: Fix CVE-2022-48434

Vijay Anusuri (3):
  ghostscript: Fix CVE-2023-28879
  xserver-xorg: Security fix CVE-2023-0494 and CVE-2023-1393
  go: Security fix CVE-2023-24540

 .../openssh/openssh/sshd.socket               |   1 +
 .../openssh/openssh/sshd@.service             |   2 -
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2023-24539.patch           |  60 ++++++++
 .../go/go-1.14/CVE-2023-24540.patch           |  90 ++++++++++++
 .../ghostscript/CVE-2023-28879.patch          |  54 +++++++
 .../ghostscript/ghostscript_9.52.bb           |   1 +
 .../xserver-xorg/CVE-2023-0494.patch          |  38 +++++
 .../xserver-xorg/CVE-2023-1393.patch          |  46 ++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   2 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 .../ffmpeg/ffmpeg/CVE-2022-48434.patch        | 136 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 15 files changed, 449 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24540.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-0494.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-1393.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch

-- 
2.34.1



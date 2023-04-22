Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C6EC77B7C
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:19 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.10390.1682179090608143956
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=I9AwVzAk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-52019617020so2860076a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179090; x=1684771090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcH50u77U60cxNEAkpiGOGyUINfGaDUs5VIvdagn2Ys=;
        b=I9AwVzAkcK/aXdBPLKEtc1Huo0PQQDSkyaV9tdmTg5UMrz6R61Tv82WtrUjzBOmpRI
         zKwOG1AguOEaJmODt5GRh9XL+3vmOERkmBpy2N39xIcs4GNOf28LrPrDGDuyVOPRWyRP
         mk8iXI1ciU1oW/6afOSx/jheWqM9McyIg7x3puMi3p9+9WIAkffHT7idkQwzprq3KZwM
         MfaUlQaLsCvmkAbSr31YHvDkOmfT4ecxHuV04wGETmhgUMLFQTU0RiXDZohavsz/mv1d
         xbbuPkhST5ufCqyl9BNFBC+NJMiHWMfpFa681/am9xk57w4I1Lpq3mmvaOcNMsgWfJY/
         gWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179090; x=1684771090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BcH50u77U60cxNEAkpiGOGyUINfGaDUs5VIvdagn2Ys=;
        b=Vblg4GPv851Spec/mdS+S0t+id6zRtlhWozRP1hgKwG/E/2Ev9A8KRbeEs3gdiZ8Y6
         9UAYRvE1Wbcd7m+XxhEy1frp7s8cvHHnQB1XoJ7hN1mo1tA1mK5c1ORir38/k8A0aexg
         jnurYrZPk5agY3gfA3j+lRSaYRSJ0KG1Rlr8O8AiP4bJKPYrXiqfPiLHaJF4+rc+DHz4
         RfT+pIN18/sxYVrt7jy0km5MnfElvfjSAQric/OekXmvVA3N9xkbPdeKSoSM2BSRxtAN
         ABHi+YMUc6h6HYNskOK20lf6pX5e5T/wuI7b+oY29eFosDiyhIMWkWr1DT+UgYh66nSi
         8DBw==
X-Gm-Message-State: AAQBX9epqvF1SL/yjml+GNizDLRuJrQKheiuiUE5iyD3Rb2JrzUcLUcq
	LDsoZp7QsjEmdVhngrPWC6nf4/e/U5YJL9pORQU=
X-Google-Smtp-Source: AKy350bZ6Kpvigb8EweLqGx0XLXsVqKa0E0BB0uufvwrT3UiRcfa38zd7KV63JpgNlK8kxsr1AFuVw==
X-Received: by 2002:a17:902:f68b:b0:1a6:3def:6007 with SMTP id l11-20020a170902f68b00b001a63def6007mr10948871plg.7.1682179089644;
        Sat, 22 Apr 2023 08:58:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Sat, 22 Apr 2023 05:57:57 -1000
Message-Id: <cover.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180311

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5210

The following changes since commit 9aefb4e46cf4fbf14b46f9adaf3771854553e7f3:

  curl: CVE-2023-27534 SFTP path ~ resolving discrepancy (2023-04-14 07:14:33 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Hitendra Prajapati (2):
  curl: CVE-2023-27538 fix SSH connection too eager reuse
  screen: CVE-2023-24626 allows sending SIGHUP to arbitrary PIDs

Peter Marko (1):
  go: ignore CVE-2022-41716

Shubham Kulkarni (2):
  go-runtime: Security fix for CVE-2022-41722
  go: Security fix for CVE-2020-29510

Vivek Kumbhar (1):
  go: fix CVE-2023-24537 Infinite loop in parsing

rajmohan r (1):
  systemd: Fix CVE-2023-26604

 .../systemd/systemd/CVE-2023-26604-1.patch    | 115 ++++++++
 .../systemd/systemd/CVE-2023-26604-2.patch    | 264 ++++++++++++++++++
 .../systemd/systemd/CVE-2023-26604-3.patch    | 182 ++++++++++++
 .../systemd/systemd/CVE-2023-26604-4.patch    |  32 +++
 meta/recipes-core/systemd/systemd_244.5.bb    |   4 +
 meta/recipes-devtools/go/go-1.14.inc          |   7 +
 .../go/go-1.14/CVE-2020-29510.patch           |  65 +++++
 .../go/go-1.14/CVE-2022-41722-1.patch         |  53 ++++
 .../go/go-1.14/CVE-2022-41722-2.patch         | 104 +++++++
 .../go/go-1.14/CVE-2023-24537.patch           |  76 +++++
 .../screen/screen/CVE-2023-24626.patch        |  40 +++
 meta/recipes-extended/screen/screen_4.8.0.bb  |   1 +
 .../curl/curl/CVE-2023-27538.patch            |  31 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 14 files changed, 975 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-2.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-3.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-4.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2020-29510.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24537.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2023-24626.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch

-- 
2.34.1



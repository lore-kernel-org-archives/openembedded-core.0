Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3807BC47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:14:48 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.863.1704730481634319331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GZXcTB33;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d9b267007fso720243b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704730481; x=1705335281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NR0umiBG7fEynaV9eGm5ttZqhP9Zh1ZnKFkkvEBRqCA=;
        b=GZXcTB330RaGOtNjnJmCQu+A/i25PAmYQh4mRfYEtEOSQkdGtH0/TP+AL6yVYuJ+PM
         hyEOmHI+kxrtnTByFTiuv2z5C5e7YQeJSvvnuxa+WgjK2VTDS3sEmBFV5tWUs1gZwjIm
         jLmyYlxuBtj11iY0FNuWR7rxiu8XrrRqhjiivlboJ2vnnnREu0tbtYTfiERAx9ONhtrS
         0Y0dKDlTsoueFubl8VkfOyWCdngutYq+ldq2OKnGwfIldhzs8ZUpSiuS1/5F6W5dLb9b
         IIkREmfae0MW5ltfcrVSsoBu3kGIjFCv1MHOUrZDku7ZhGDQAFJM5MDSXz3WPCFZ5DSP
         YDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704730481; x=1705335281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NR0umiBG7fEynaV9eGm5ttZqhP9Zh1ZnKFkkvEBRqCA=;
        b=mvn4hkp+6Mj0JxNPhLibcJgBW0TCm0heofNb5Cp8+zgI81eD7r5I6NX9Y96P4SqjsR
         Nmobxb0eCreHnlH+Bny4seG5uUL3+613svopXec7hgGHDHE2KdkJXWpB28DUyjM+QZQS
         rp3OaMRbJqKscMOLIMsqetdWN68CYy11lSGG1ASkn1SrX8fsuNAEQZ/+dBIzPTpdZ0ch
         AVWD03wb427KD+4GvM8cvvNtOIxxvqI9AU1/cEtqSXtcm8xlSX/CVC4hS5HBoAV4Jt2b
         PrIykvu5ck8jAUD2ZxwnuZqv7/S5F+kJWcR3B++bZXr08/d+60oac3E+X94AjVm5DFQc
         x71A==
X-Gm-Message-State: AOJu0YxatsInjYD+6tyvm102y5FgHMss+u4NTQLGl7ldQZDyg3AvsWu9
	lYo5UugzpJ9dJE//EePD13uXztqc4MKVPFRK8l4nOAisPV6+3g==
X-Google-Smtp-Source: AGHT+IEYWhbz5drHGQgDL/XiOqIOp+0Z8FsrhUzdSoao/ku2oHzsd09hir1oQKMnhyof3J0lt3MH2A==
X-Received: by 2002:a05:6a20:9710:b0:196:1f69:4676 with SMTP id hr16-20020a056a20971000b001961f694676mr1269634pzc.68.1704730480568;
        Mon, 08 Jan 2024 08:14:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a11-20020aa78e8b000000b006da14f68ac1sm45753pfr.198.2024.01.08.08.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:14:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Mon,  8 Jan 2024 06:14:26 -1000
Message-Id: <cover.1704730354.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193415

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, January 10

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6425

The following changes since commit 227b3d4edad31b0d0045f41133271693265240b0:

  tzdata: Upgrade to 2023d (2024-01-02 03:46:18 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Dhairya Nagodra (2):
  cve-update-nvd2-native: faster requests with API keys
  cve-update-nvd2-native: increase the delay between subsequent request
    failures

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20230804 -> 20231030

Peter Marko (2):
  cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
  cve-update-nvd2-native: make number of fetch attemtps configurable

Vijay Anusuri (1):
  xserver-xorg: Fix for CVE-2023-6377 and CVE-2023-6478

 .../meta/cve-update-nvd2-native.bb            | 27 +++++--
 .../xserver-xorg/CVE-2023-6377.patch          | 79 +++++++++++++++++++
 .../xserver-xorg/CVE-2023-6478.patch          | 63 +++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  2 +
 ...20230804.bb => linux-firmware_20231030.bb} |  4 +-
 5 files changed, 165 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6377.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6478.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (99%)

-- 
2.34.1



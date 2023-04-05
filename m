Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC35C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 02:29:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.121226.1680661792007579865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 19:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bF+0tK50;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so38092163pjb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680661791; x=1683253791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pMV6eknP44bZXbxLZ0JaqV5nKPaDo0HVNLFSIDCUwEQ=;
        b=bF+0tK50BFFSTewqKotDsn6kmUvYNVNpvTaoKW8A1zcjNZtiZBn9yDBv/iUXFE+o3p
         4A5GuPqnQsH/jrOgPWujG4CUNPRBL+GyzvYlwU18Bqh2tTVskb8UcTr9QXVxiaUzpcYe
         97zp3Mj9AD+/53cb7exhl/arAB969yAX2Apbb1afZCkO1BLOpsaBQ1P2QPzm5ILF32IC
         IRFAZo59ebNa+Z/4/bEdHYHRsAJ8/hAn8jSSq9AxjMUqUSKVUYm2169WBWZigK1oa/hC
         6HMLV+ljRz6GrfpNpkxuxCUreCeRgxD4ykJM7QTJ7kGbi0nmiYXotciuKGwYDKTt7LRg
         SnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661791; x=1683253791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMV6eknP44bZXbxLZ0JaqV5nKPaDo0HVNLFSIDCUwEQ=;
        b=rf8aAY8e/+unrMHr0TwJdlkws5VIAL4QaIIiQ4sqluEMQumKxlegLMHi73zi+r/pnM
         DgVLhnlMEsCH9tYZxpwQYy6CNkHSwepMYzjlvXkB3Z9/zDGX9O/U8jmdUJFz9eOiPfdf
         hSZY2i4t/OTryX/hZ6bNOTkAdZOzMgoQ52uFUdfdkYUeorvl+sSnpcASEZPqO+UtL1I3
         w0UxatM3AEAhcA/2JKxtPYqKHhpPEF4DFmBOr4JdP1jDZsWww2aEc9XuqQLFPoaM/YU/
         v9R0gL7iLzSTP28TMPD9f2LITJCpOT6N/SdpXwrF4IxzvN6AHZunzU/ehSTkKHOXlA7Q
         rK6w==
X-Gm-Message-State: AAQBX9crii96yy4rfaJGHg2A3x69p1wew3R0tPhjwewLzI/sIENoCPNe
	YrO7Tlq3N8mPUfSV/Sbv3NCznBArxmKJ0ESeyb4=
X-Google-Smtp-Source: AKy350be+o9v85ESSwfC790JbiSlrhbZuulWp6w9J3xPBCR9ClCo79SHMra6trHkaB51ovsJrF/KKw==
X-Received: by 2002:a17:90b:4a0c:b0:23f:abfc:5acb with SMTP id kk12-20020a17090b4a0c00b0023fabfc5acbmr5075285pjb.18.1680661790756;
        Tue, 04 Apr 2023 19:29:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001a24cded097sm8937702pld.236.2023.04.04.19.29.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 19:29:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Tue,  4 Apr 2023 16:29:28 -1000
Message-Id: <cover.1680661617.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179713

Please review this final set of patches for the kirkstone 4.0.9 release and
have comments back by end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5147

The following changes since commit 3eeab90fd45a1e8de6d9d16dfdec79c72639614b:

  rsync: Turn on -pedantic-errors at the end of 'configure' (2023-03-30 08:29:50 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  patchelf: replace a rejected patch with an equivalent
    uninative.bbclass tweak

Michael Halstead (2):
  uninative: Upgrade to 3.8.1 to include libgcc
  uninative: Upgrade to 3.9 to include glibc 2.37

Shubham Kulkarni (1):
  go-runtime: Security fix for CVE-2022-41723

Simone Weiss (1):
  json-c: Add ptest for json-c

pawan (1):
  curl: Add fix for CVE-2023-23916

 meta/classes/uninative.bbclass                |   2 +
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-41723.patch           | 156 +++++++++++++
 meta/recipes-devtools/json-c/json-c/run-ptest |  20 ++
 meta/recipes-devtools/json-c/json-c_0.15.bb   |  16 +-
 .../patchelf/handle-read-only-files.patch     |  65 ------
 .../patchelf/patchelf_0.14.5.bb               |   1 -
 .../curl/curl/CVE-2023-23916.patch            | 219 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 11 files changed, 419 insertions(+), 73 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

-- 
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87DFC7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:54:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.10291.1682178888758918700
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vnQuzHws;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a814fe0ddeso34749135ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178888; x=1684770888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjpUDO6DobtrjBVtp/WlTcrsjEYfHtDiSkNoai4kIM0=;
        b=vnQuzHwsT3RQKAOCwkEL1XCW024cg823k6wAgxI2sdYAh5Ej2z/ykrSVu+ohwxtUBD
         7cKG7C8D4MUnjekcrRGmGThyr3ttFhoFAw5XszI8EeGna3EJHT/eywDQCPGkDq2to1Y5
         pVJzXi+3pvPgQ8uR3VANb3XhqpK8bR5Idsl4WFHRSSS2IAhUe6re+vLmGEzc4/Jj9PO+
         cszIHaUNEVT514fhBgg7dcgpOjM4hSDefPzFgtmI4MT8taOAKPa7yEkSlD0jtVxqfbNW
         fKNND48ZgYbzWM44PtfBev8QOnSKKhWDzSkN3ZeLWojQhepOmvwTNMUOlhdaGp4Y4V0R
         xkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178888; x=1684770888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjpUDO6DobtrjBVtp/WlTcrsjEYfHtDiSkNoai4kIM0=;
        b=O9gjVDQe2mnsIh79FVDY8i3gsyinQFjcDoZ5fYpWLIz9Tv06HLK4BshkIza+6Uajey
         Jd7Dnxodm/SrjTKgoiIx2inQLrcqNVgbSPDiQMvz6TwpHGEVCBZM/SmHtsh9jwOS69Yi
         nRg9iCEDYpfwWrAHIkRenXbYBHRz15cjh1v5k5yZpKz7lL0PF8Rk0qU5YchmEc3d/cA2
         +t5R4GbeDihyXLF00GqRUYrs80++6YpW0/MM2wB3OJqUo18F+RVHjO5MCMZ+ecZ/0E8y
         81PBYDmTE8bH6XqSDzd+tByNb0ip6VgeIKzy+29n3FZkCIang19arMpgqzKkyG9stLVc
         NfzA==
X-Gm-Message-State: AAQBX9fEVs86eoKZBxNig8CT2T2TUSUO7ZTeJhtdue2OLOz7s8RrMm9u
	l452KrcFdbkgMhTeMbNnWW26FZRHXf8SHUxLab4=
X-Google-Smtp-Source: AKy350ZU5MvDl+EuAdm8vRagJGXvTFR5MdMJ+S0UtinFlOp6ObvWRPSSMqE+Xz2olcoC8qcioxpHHg==
X-Received: by 2002:a17:903:5cd:b0:1a6:4cbc:14dd with SMTP id kf13-20020a17090305cd00b001a64cbc14ddmr8763437plb.8.1682178887528;
        Sat, 22 Apr 2023 08:54:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.54.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:54:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Sat, 22 Apr 2023 05:54:32 -1000
Message-Id: <cover.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180302

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5209

The following changes since commit b67e714b367a08fdeeeff68c2d9495ec9bc07304:

  package.bbclass: correct check for /build in copydebugsources() (2023-04-14 07:19:08 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (2):
  ruby: CVE-2023-28756 ReDoS vulnerability in Time
  screen: CVE-2023-24626 allows sending SIGHUP to arbitrary PIDs

Peter Marko (1):
  go: ignore CVE-2022-41716

Shubham Kulkarni (1):
  go-runtime: Security fix for CVE-2022-41722

Siddharth Doshi (1):
  curl: Security fix for CVE-2023-27535, CVE-2023-27536, CVE-2023-27538

Sundeep KOKKONDA (1):
  cargo : non vulnerable cve-2022-46176 added to excluded list

Vivek Kumbhar (1):
  go: fix CVE-2023-24537 Infinite loop in parsing

Xiangyu Chen (1):
  shadow: backport patch to fix CVE-2023-29383

 .../distro/include/cve-extra-exclusions.inc   |   5 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   5 +
 .../go/go-1.18/CVE-2022-41722.patch           | 103 +++++++++
 .../go/go-1.18/CVE-2023-24537.patch           |  75 +++++++
 .../ruby/ruby/CVE-2023-28756.patch            |  73 +++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 .../screen/screen/CVE-2023-24626.patch        |  40 ++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   1 +
 .../files/0001-Overhaul-valid_field.patch     |  65 ++++++
 .../shadow/files/CVE-2023-29383.patch         |  53 +++++
 meta/recipes-extended/shadow/shadow.inc       |   2 +
 .../curl/curl/CVE-2023-27535-pre1.patch       | 196 ++++++++++++++++++
 .../CVE-2023-27535_and_CVE-2023-27538.patch   | 170 +++++++++++++++
 .../curl/curl/CVE-2023-27536.patch            |  52 +++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 15 files changed, 844 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2023-24626.patch
 create mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535_and_CVE-2023-27538.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch

-- 
2.34.1



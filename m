Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9704EC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:28:28 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.8892.1683840501211302985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vsBRej8R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6434e263962so6830402b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683840500; x=1686432500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb1xnzUAO7k7GAmRv1tqsQJqEA73bDkQXCF7pIGouUM=;
        b=vsBRej8RbR7YyQssZfHhZ8b7j/oa2a/PYiev+yEH7RxM5tgn6moRDYWhLUq62CC4v4
         wUs9vofDILyypqeqlE0/iMyBQCkJFA83ZWb+bpYF0u39V4Tcz+UUgYpuGcLcUdUW73JY
         5qLcAssBXKJK3KDW66t91rmiQzVniBHvXy6nwzvGYhFffxM9nOvGvaJ2ZL1/grYZVbBK
         gcrRO1Lc2uoJwMQ7Vfm8rHbS5VuIFzeP5g8osF006WvZuqpPZeH564q6CxSxhF0/ezzk
         znBjR2OcpC+D+3fbShZTieJFaQo4jlj8b33cCORdZHRuPHGiXZvSVjFNiH39/0/HRnG4
         5ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683840500; x=1686432500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb1xnzUAO7k7GAmRv1tqsQJqEA73bDkQXCF7pIGouUM=;
        b=Me+GRbfgSuceYVU4wDTQA2hnD0bfYyzSaZS/ugxF9EykGG1HsEzX2eI2edQnfxVaGG
         eIQQ+NKH9/vAYNL1fq1igsT1U2bfc7myWxz6yC+ULtbX04DIyauVsYULBSflrcqAJ234
         u4gLZ1DWJrcYRACpFDdlkyX3ht/BZEI603CAsDMX1sood4imKJWWMgSYLLweoKAIL+YS
         x+nsm1p7eaThMiraZd1uYA0H0JSdAwOkJu3zpDdv3C0ukNBIKLHzbXH9CknReZ6+gcyn
         Lu+G5+1WpeW0szMUQDUZLO6+cF4TJUGRtA4G7p8n90Yjqm4XvNA3MXBt/D7mRRuw5h2S
         Tlsg==
X-Gm-Message-State: AC+VfDzpuwSPHjND5LDlkWWQFgj1HwhYlmP6GaFnReAym7jk3G9DoM3W
	hoaJb0yZfy7s0X67yCBMhPnGik/JDO80Cm4P5yE=
X-Google-Smtp-Source: ACHHUZ4usqI3GrnLE7rIUAbGsOZbLeeM5OGu9AAhSLGbmuyoY6eo+g8kGsdGFMJ67KlJnHlTSo6P5w==
X-Received: by 2002:a05:6a00:2d97:b0:636:f899:4696 with SMTP id fb23-20020a056a002d9700b00636f8994696mr30137275pfb.24.1683840499627;
        Thu, 11 May 2023 14:28:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e5-20020aa78c45000000b00640defda6d2sm5671981pfd.207.2023.05.11.14.28.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:28:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Thu, 11 May 2023 11:28:04 -1000
Message-Id: <cover.1683840390.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181146

Please review this set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5294

The following changes since commit fd4cc8d7b5156c43d162a1a5a809fae507457ef4:

  build-appliance-image: Update to dunfell head revision (2023-05-03 12:29:24 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Arturo Buzarra (1):
  run-postinsts: Set dependency for ldconfig to avoid boot issues

Ashish Sharma (1):
  connman: Fix CVE-2023-28488 DoS in client.c

Peter Marko (1):
  libxml2: patch CVE-2023-28484 and CVE-2023-29469

Ranjitsinh Rathod (1):
  libbsd: Add correct license for all packages

Shubham Kulkarni (1):
  go: Security fix for CVE-2023-24538

Vivek Kumbhar (1):
  freetype: fix CVE-2023-2004 integer overflowin in
    tt_hvadvance_adjust() in src/truetype/ttgxvar.c

Yoann Congal (1):
  linux-yocto: Exclude 294 CVEs already fixed upstream

 .../connman/connman/CVE-2023-28488.patch      |   54 +
 .../connman/connman_1.37.bb                   |    1 +
 .../libxml/libxml2/CVE-2023-28484.patch       |   79 +
 .../libxml/libxml2/CVE-2023-29469.patch       |   42 +
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |    2 +
 meta/recipes-devtools/go/go-1.14.inc          |    3 +
 .../go/go-1.14/CVE-2023-24538-1.patch         |  125 ++
 .../go/go-1.14/CVE-2023-24538-2.patch         |  196 ++
 .../go/go-1.14/CVE-2023-24538-3.patch         |  208 ++
 .../run-postinsts/run-postinsts.service       |    2 +-
 .../freetype/freetype/CVE-2023-2004.patch     |   40 +
 .../freetype/freetype_2.10.1.bb               |    1 +
 meta/recipes-kernel/linux/cve-exclusion.inc   | 1840 +++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |    3 +
 meta/recipes-support/libbsd/libbsd_0.10.0.bb  |    6 +
 15 files changed, 2601 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-28484.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-29469.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion.inc

-- 
2.34.1



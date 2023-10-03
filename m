Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A47E8FDA7
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:00 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.129.1696361817491137426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T1822s7z;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ae5ce4a4ceso883286b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361816; x=1696966616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HbPakIHVYj1HdJrLCI9BMvwBSYLAiNs2YYOFOxBKz24=;
        b=T1822s7zi8AHZxpocoD4BoRG3f9q826WuD3FyOFBUD8cNj0okL1fGJo1LHxC9T8sRu
         PU48+V4Y2IAbqa6+HhYez7b7nYeCRZjq6GCmmJwl9u5TeiogQ0hKCebjcIi97w6A8Gc1
         RYGgk4yXJXWjNBhVIYoEbdhHHLQs0DftyOQwWKErUpe+6Jz8uVSLrOtI22r9LGtZM7pD
         agLCYC5BswUF3L+Ym6DMrMopIWu+jwXVXfnHTwfhkxOWqBhLVUizWVBlJO93Cp4n1fDI
         IcuAVvGMqjapZJ5mttKWvWPzP4OQ7nvLlqpYgqgyRaGutm3371yiK6azth7CwYmQf3iu
         A3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361816; x=1696966616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbPakIHVYj1HdJrLCI9BMvwBSYLAiNs2YYOFOxBKz24=;
        b=AHSAohgsfhGun8fp1tjJjv4iy5F6SIYk6x/FsgLLFkqwo5zGIKRyQJEOCnjMq5uQmw
         YqzZ8P3CNma8PEvyzkPB8BciCzLAYEJHhUUW9ZwhC10iiU0ZMGNzu07oqHh3D3rftH7s
         FpLx5qiuZIHuFMHuRlrctw1MyCcLz7ATGfG4l2B/6EAW+/pudS34mYBhtbWiVHp0glyi
         zXWtpwmGzNFIsAz/kJpJ8FL0lNPqHTxuyT3msfXtm77RWjDty+x1yXSZj6jPU5g/chKD
         5nAZE87L8JY/QVdZJaLKMfiIdJQr674Tk1uns5cNAPZwH6DkTB+DF8tVlOw8truK7nN7
         uFww==
X-Gm-Message-State: AOJu0YxCOmjlWnKgQN40Khc+Hub+dTbNu7BxFEt5ELbePNR6pwZgfPyR
	pk4MnF9SNuEoqVQx1EACdhn8+6c0HWl8//A4RYs=
X-Google-Smtp-Source: AGHT+IFaPq0Xd9Yimef4JXsaLmF/g0kEpmnbxaOSOh8IWazroo73K3KjdisgRQptewUqtV0/M0pxjA==
X-Received: by 2002:a05:6808:b:b0:3ae:e79d:7984 with SMTP id u11-20020a056808000b00b003aee79d7984mr494422oic.55.1696361816355;
        Tue, 03 Oct 2023 12:36:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.36.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:36:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Tue,  3 Oct 2023 09:36:40 -1000
Message-Id: <cover.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188650

Please review this set of patches for kirkstone and have comments back by
end of day Thursday, October 5

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5984

except for the meta-aws test, which breaks due to recent commits there.  Maintainer notified.

The following changes since commit 7e177848f97eb9958619c28b5e5dadee12f67507:

  kernel.bbclass: Add force flag to rm calls (2023-09-27 06:09:46 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.189
  linux-yocto/5.10: update to v5.10.191
  linux-yocto/5.10: update to v5.10.192
  linux-yocto/5.10: update to v5.10.194
  linux-yocto/5.10: update to v5.10.197

Martin Jansa (2):
  ccache: fix build with gcc-13
  fontcache.bbclass: avoid native recipes depending on target fontconfig

Narpat Mali (1):
  python3-jinja2: fix for the ptest result format

Peter Marko (1):
  json-c: define CVE_VERSION

Shubham Kulkarni (1):
  go: Update fix for CVE-2023-24538 & CVE-2023-39318

 meta/classes/fontcache.bbclass                |   1 +
 ...x-FTBFS-with-not-yet-released-GCC-13.patch |  92 +++
 meta/recipes-devtools/ccache/ccache_4.6.bb    |   4 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 .../go/go-1.18/CVE-2023-24538_1.patch         | 597 ++++++++++++++++++
 ...023-24538.patch => CVE-2023-24538_2.patch} | 175 ++++-
 .../go/go-1.21/CVE-2023-39318.patch           |  44 +-
 meta/recipes-devtools/json-c/json-c_0.15.bb   |   3 +
 .../python/python3-jinja2/run-ptest           |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 12 files changed, 921 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-devtools/ccache/ccache/0001-build-Fix-FTBFS-with-not-yet-released-GCC-13.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24538_1.patch
 rename meta/recipes-devtools/go/go-1.18/{CVE-2023-24538.patch => CVE-2023-24538_2.patch} (53%)

-- 
2.34.1



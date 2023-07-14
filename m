Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCC9C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.812.1689374021597394635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UhPDGWQN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-66872d4a141so1669632b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374020; x=1691966020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjO+EFzIkkbGNrbjKSgIevOMxxHwCqBY9AO1nw0OwqI=;
        b=UhPDGWQNH8CIx+tp9Cuxtd3Yrcqc6e2+SokXhj91/vu7awVlZ/W6HTGLOdW1INjqjQ
         R62i2y08t9vSDhov8gkdR4qLk1n5PrBGqZ6u/0bcQQxewdWdYQUBkHzceUDWZCLCzo5g
         ZGexpYprIeBGmHutvhpIKrwf6XcMxOXJ/hc+dEX61OAL/zAO1J7YxlnfuthbHpk2itkN
         cMa4X5ssDstiTB9svvgyXUdj+jy9tGEoeaC4p4+TJAVdYfNExfI3PczxYwKgGTfQqKpX
         cWXYi5dPx+5VEtY8TebLfLn7jBQEjCrw8PBcaesniU1a6SaJ08Dq3HlTXQdqmjElAEvZ
         yz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374020; x=1691966020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjO+EFzIkkbGNrbjKSgIevOMxxHwCqBY9AO1nw0OwqI=;
        b=Spk8RYbCzHAs0YNrM/p4e8O3CUH02ekOaD70/h/wGj69sQqoCxaPFK5kJATddwDg4e
         KrW8/McD97VTonalSwbnz5AsZK0YfBC9Wx2qHLnZMomer702/+zKOp1WgVDE4eyp2vXq
         cg3zYa5nOBEgUB9tvOfJTxpuQYYk8vMBwj0zDDJRlWBoLJ1LtWsORSq31Xl1A+EC+vHv
         TzFHB/b/HzRc2DtX+hJmFsCOw1/GfZGUOqm+NAJUxLDv1vtudzyXg0ZTMkengKg2c+8y
         cbi8OlxWS7G5H0qvEINTr1lPBzqsh1QoMxa83WSclMvapEfdXLf+Pa3VGVjtf5txkdfu
         ooqg==
X-Gm-Message-State: ABy/qLblhSSb9flv8V9skj9pu4v0NVaaugg/R+S9PrZipi0byFOxvH/4
	ChwqTpCqBE+UWS+sw78pTOc++tZngft53Ge0zFw=
X-Google-Smtp-Source: APBJJlHXV0hmp7MSSxhlXLP+B8TS1QNOILJX/9j6uEY0aP4nDD08tfFkuc1kT0Qqe09GPIp2QVGvbA==
X-Received: by 2002:a05:6a21:33a1:b0:132:c07d:9dd2 with SMTP id yy33-20020a056a2133a100b00132c07d9dd2mr5368405pzb.39.1689374020590;
        Fri, 14 Jul 2023 15:33:40 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/26] baremetal-helloworld: Fix race condition
Date: Fri, 14 Jul 2023 12:32:48 -1000
Message-Id: <fe637f795238685f5d8e4e3dbf48235dabb1cc17.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184296

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

There was a race condition during the Makefile execution in
between the assemble and compile targets, only the assemble
target had a dependency on creating the build directory.
If the compile target was executed first, an error was thrown
by bitbake since the build directory did not exist yet:

| Assembler messages:
| Fatal error: can't create build/hello_baremetal_aarch64.o:
  No such file or directory

Update the SRCREV to reflect the latest changes serializing
the makefile targets to avoid such race condition from happening.

[YOCTO #15146]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a999af292c7b3dd3bb7c0722cc31624c425f432)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 4182372057..c5d3e04ed5 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "These are introductory examples to showcase the use of QEMU to ru
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
 
-SRCREV = "ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec"
+SRCREV = "fc7c43d138185028b6ac14c83f6492fce26eca95"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
-- 
2.34.1



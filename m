Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF67C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 12:14:16 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.46265.1754914453831575867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 05:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fEgopyhm;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af97c0290dcso750569766b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754914452; x=1755519252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICEjrXJdWnpLCH2JbPc+9Yxma+5bGHK6WvYJkKbAWjU=;
        b=fEgopyhmszt6yTFImHrluJ8jLgaXRePQm9H09FwQZ06EpH3/YANFaHkZ2p+rwbF5me
         yd37KhLhq+SMMbQu+r9rC758zpy/CxCe5BuzPM8YYrH2pyprPEim3Ure15hOFeR4DYSB
         1Bw8UZeFEOuZA2mp3qaJwRZIuEOadrtq700SWHc8HEggKsRDPWsABUBzetXiHComegv3
         ULTPUZ+4L47yezMUrE7FPwyo+hfjMtRUp5trEvrTY4upG34PV806P4MrEfAIScX37cRR
         kXp4yV/vQ6xom4IuB0myusebzjLXOkNIfm664+kUOzZrniNkVFSLwObptYoB3h689L9Q
         in4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754914452; x=1755519252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICEjrXJdWnpLCH2JbPc+9Yxma+5bGHK6WvYJkKbAWjU=;
        b=sI0uDtwZ+mR/uGQvsz8VzeCPDj+CBFNTZXqPRoR0rsjzHRuT0yWPN55QQGI3C5tTPr
         U8RxzzrKNKDtVg45apyBU1OGHw/955spVKXxQuir6RgrLINOkoM8/0SYxTvbHgupqa8t
         9h8Ou2DCcavNYHFgzXoZsYrCG982UQRlME0Qx/ON6NoIhMq5OFUicGWcpNXGBHikz2wr
         BM73Tmub1Wm7+h20C+mxwUia+IBCxbw2R479jwlEN/1UHHVp7R9w1ARln8815XuWaz7z
         DBxPvrBwmQr6PAfYZ3ihChHrK7wpV4Jo8C4V26KEyE7IwbSNqG4lXAxsW+hZVYJ59bQv
         JtlQ==
X-Gm-Message-State: AOJu0Yz4jYdpqm7rpEwrSJ/nUfq6r1N7h+WhSHAqm7uiHA9seG2KzB+2
	bK9AtFShVWiLaR0YeB+bqLLZmEoLk4B303d9vMiUZLF0cyRUI1U0Me6VITwmOA==
X-Gm-Gg: ASbGnctHOK8OYwwCBZ3tTo70R4RhnVVAtCDj+2+6KQorYxSyyRyyjZrUpT1ENOryZ6i
	f2VaQaRp4Ivan5XJoCNxo0ZzdW+yu0NV7noFGaqmPJAO+P7zZvX/ivpSCLpbNdly2LhHiuN1TM4
	gc4YP4CC4m76NfgFeChH2oKD1Tf5nFgo46HMhx2ZlQugjgi/7CmS0zvxdkxxAaK+eBT6X4VF7J6
	pQWiO0ZI+6sCX8O/mHdxshAurLtroHvVF1oCrTGEDfz1T2ykEZvXs6WJsOzbJQTawnPdmIzmFPF
	b+BZ4Ru9GNlvIvUDgu+zo0oVf8qA8noQab9LMSqyji7QN41sLzn1DWxK4ZROrnPFHYRN/X5Srua
	MfhowY1iEY9InNhNgH4Y=
X-Google-Smtp-Source: AGHT+IGZQOCPSVtJUxa9hHaO9OYVwQEcU6VKSrzrGZXtqMDL669qJQEbtJ8+MCXgmyIqSp91xSvAzg==
X-Received: by 2002:a17:906:6a0f:b0:af8:f7be:ab8d with SMTP id a640c23a62f3a-af9c6552fe2mr1234507666b.36.1754914451672;
        Mon, 11 Aug 2025 05:14:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8359sm2003830466b.89.2025.08.11.05.14.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:14:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lua: upgrade 5.4.7 -> 5.4.8
Date: Mon, 11 Aug 2025 14:14:10 +0200
Message-ID: <20250811121410.273742-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 12:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221735

License-Update: copyright year bump

ptests passed:

PASS: lua
DURATION: 0
END: /usr/lib/lua/ptest
2025-08-11T12:07
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Changelog:
https://github.com/lua/lua/compare/v5.4.7...v5.4.8

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-devtools/lua/{lua_5.4.7.bb => lua_5.4.8.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.7.bb => lua_5.4.8.bb} (90%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.7.bb b/meta/recipes-devtools/lua/lua_5.4.8.bb
similarity index 90%
rename from meta/recipes-devtools/lua/lua_5.4.7.bb
rename to meta/recipes-devtools/lua/lua_5.4.8.bb
index 6e414a0805..1d37cddeb8 100644
--- a/meta/recipes-devtools/lua/lua_5.4.7.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.8.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=344ad98880a7ee9ff6e1498a519a7c76"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,8 +12,8 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30"
-SRC_URI[tarballtest.sha256sum] = "8a4898ffe4c7613c8009327a0722db7a41ef861d526c77c5b46114e59ebf811e"
+SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
+SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
 
 inherit pkgconfig binconfig ptest
 


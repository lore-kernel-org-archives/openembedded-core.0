Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE61C38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:40 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.82064.1674238296753883379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=i4O0rQFZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 7so4753285pga.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amK7+9RGJrXO63B5XF+wLvo1Wywfomxbxr9hVYox2sY=;
        b=i4O0rQFZ8m+msVtYlDsmCKJe6e+ZgWZk1uIoVa1+zsizQHNSfBIme6TZZzxxFVZF1n
         EFG8FKVFAPhqYVCr0xbt74f8hRmtx6qfgyOYF2PwMc2yKbk2Q1FFw5Xt+mcvMa1TZA7+
         hCrf8JgA28OWuiV2F4rKhrlgBb9mK8ljSyxsnb4j41erfd5Pgvy3oPBWMiJjYpZBR9rc
         CtkQs+ltmMO1mhi1YN5vFujM8QONQ89lMsQURWyWGSywoqwVY5VBwPt/0CRjDSBfEZUD
         4XWw/wyxS8ERG4NErOTI4nhWZ9AsitdPDcnmnMpoBHrhoDUQHOhz4ZXaxnEclQhAQ9rU
         ILsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amK7+9RGJrXO63B5XF+wLvo1Wywfomxbxr9hVYox2sY=;
        b=FEWbczl+9/119SHxw0ZtOrcZkXxXDpiE3e6ObU8gkQtjeW3ngC2nGbJLcF8Yknr7hB
         cpztEp2QvihErg9j3LjzE8huNebunBI59wC2cE9HHE+jI6Ll0k33GaTmuCsnBh/G11p4
         ZDay8GCMNAUZUn1Nvwnbqyq/MqYWFAWojcuptuNDV1z4GihrRiQr0KFxFCIhx9cx73uW
         J1zZ8sN/rVgRJ7OIHnuggo62VlHau/d+N1OsCkJDTSIli398jiVuiwrXMMI6FrdOLAyE
         UDz+aTGMEpJ+2u+PHY+ARQ92urVcpz3hsGgWd3im/6qOfg+mWSmxk3mwT2/8cekcDkXo
         zKGQ==
X-Gm-Message-State: AFqh2koFxu/5TncaIb5EPY1AEi7rxVdJDyvVgGZYEpc/R+POVKdwZQRI
	PyAMwB4qlNDSJfK77GtwccZwBbP6MxXHrXViUC8=
X-Google-Smtp-Source: AMrXdXusISuB6mqReyZ3dU7jxVpdbbgn+Riii0vFSfyGDWSGzyUYAWz6BtOi2j89swYX9wvjWPF8PA==
X-Received: by 2002:a62:bd08:0:b0:58d:be61:4859 with SMTP id a8-20020a62bd08000000b0058dbe614859mr14410523pff.11.1674238295776;
        Fri, 20 Jan 2023 10:11:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/41] linux-yocto/5.19: powerpc: Fix reschedule bug in KUAP-unlocked user copy
Date: Fri, 20 Jan 2023 08:10:34 -1000
Message-Id: <a313a9900caac981ff272d9fd49a2de937e5442f.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176223

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.19:

    84f2f8e7a625 powerpc: Fix reschedule bug in KUAP-unlocked user copy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 438b3523625807e2deca1797ce20649531270676)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 8fb4a6b665..f4d205e613 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8385624e99ac8f15de12a2253e8537dd25fbb082"
+SRCREV_machine ?= "3101c367eab8952721086b545ad37c301b2a7452"
 SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 92214b4d90..95a8a46bbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
 SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 2462f5cac3..5baa0c1130 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6a3ad6f786482c60fa0619935fe48dbb44673084"
-SRCREV_machine:qemuarm64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemumips ?= "6722056dc4ccc7ccb7ca6a9d3dd840031c83d66d"
-SRCREV_machine:qemuppc ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemuriscv64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemuriscv32 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemux86 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemux86-64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemumips64 ?= "d5bdf10616a90465afaef449feeaf31a51748220"
-SRCREV_machine ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemuarm ?= "f30404d233fc4cc461a0800fd635f4e9650a20a5"
+SRCREV_machine:qemuarm64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemumips ?= "ceaf2134635845794c24b750f15004096a597256"
+SRCREV_machine:qemuppc ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemuriscv64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemuriscv32 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemux86 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemux86-64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemumips64 ?= "acf9ebb1e7d1ceb61a89ec33ca4cc3613287630b"
+SRCREV_machine ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
 SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.25.1



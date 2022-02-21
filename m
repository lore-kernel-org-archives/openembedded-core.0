Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A268C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.5722.1645406882377524157
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdCzyiD7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c3so1969014plh.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CfHg4DcEJtMZA8euboN687Jj3f+GOy7LRl/b0rjXE5E=;
        b=SdCzyiD75yDlyOzLNiawKpZeaU34e8GQhoobQip/GXWcd+rx6GVvnzbB8ZJZOPAMmn
         3Scn3WOOF7L9pnbMAi8LzMK3Y7oPLMF5eBt70o1UossCg6MtYDV6wlOFbQIljmUnCPYi
         4AYmvi3iY4uhjbomKDRvWiV1DRdIa4FALw+IAPmdrJxE326oz3StfyDmW5u1JEnHgv2t
         POQlHBMOIY2fixZ/bZ459115W17Vj50+aiKilwTQ11s0VRCH7MIJ0nLJnS8ig8LNpJGG
         Za/GqWd85nwV6K99rvC2IqO7MnZbWrswdYwKHy92iJWdZnLJUMH2JWZft7s3BoL18L3D
         UGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CfHg4DcEJtMZA8euboN687Jj3f+GOy7LRl/b0rjXE5E=;
        b=tEGhTYEWBPmqOz5o6zlteaT1gsfUhK62+BVPpivAgd0bkw7aEgavnzYGrmnq9fnidk
         Ib56wFhhLHNPxXRb7JImvn9ZJboWHGCneBS2nwDR+BQl5IXer+baafp4vYzIlwfOokNw
         tLRN/sG8u2EUbxaNXQ9JtaMurcZioZ+U3NM4v4lqlwrQB4LJPtd6860kBhwDvm5g0ySS
         BAMJSeQw5f8Z2uuaHDE/xfY9FmRDUB7MbvnI/gJZpQ6lg4HVbD1TbQqda1ltM6EPv4By
         YD9bwFPed+4x2RHV5Yz0TRmDNb1iHHRYQt1P06Z1k5lNBGJ6LIsUGw690d3XAUD2bOhB
         SMXg==
X-Gm-Message-State: AOAM5322WLstaDeAUR4W0vdZl3Po544+ane8VSy1ZzjcJE5x4eQKVOo4
	6XvDfbQ3qITOgb44mizKEOeuaprHDmoAAg==
X-Google-Smtp-Source: 
 ABdhPJzofj4L8XPmAKXkgzIzcWNLtuR6ves/mtncApXNJ1Bz4p1IsISWaqPDxFUFS5MCfsh0uoz/+A==
X-Received: by 2002:a17:902:ec90:b0:14f:686a:7558 with SMTP id
 x16-20020a170902ec9000b0014f686a7558mr15126291plg.31.1645406881475;
        Sun, 20 Feb 2022 17:28:01 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:00 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/19] flit_core.bbclass: add helper for newer python
 packaging
Date: Sun, 20 Feb 2022 17:27:33 -0800
Message-Id: 
 <37f0e8398b27811d52d7866b867732d965133f09.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161996

Some python packages now use pyproject.toml and declare
flit_core.buildapi as the build engine

Use pip_install_wheel class to install.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/flit_core.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/classes/flit_core.bbclass

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
new file mode 100644
index 00000000000..0f2eec85d0b
--- /dev/null
+++ b/meta/classes/flit_core.bbclass
@@ -0,0 +1,16 @@
+inherit pip_install_wheel python3native python3-dir
+
+DEPENDS += "python3 python3-flit-core-native python3-pip-native"
+
+do_configure () {
+    mkdir -p ${S}/dist
+    cat > ${S}/build-it.py << EOF
+from flit_core import buildapi
+buildapi.build_wheel('./dist')
+EOF
+}
+
+do_compile () {
+    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/build-it.py
+}
+
-- 
2.30.2



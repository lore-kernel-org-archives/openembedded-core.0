Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B376C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.1858.1645557427636819533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=an4E2pLD;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id z15so7311951pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CfHg4DcEJtMZA8euboN687Jj3f+GOy7LRl/b0rjXE5E=;
        b=an4E2pLDo7taSfrahChTgCHRNZJRRXc/r/5jxCbmETT3ie1tFGR2Uz61eSqYJz2U+Y
         MootkDFvrL7UTRl9cTtRISffZJ63iQOi5JlOOkKoXuhFFlb7wN8yFJeM+zofLzguuTx5
         XEfd5mkuCNQeWolFGbWKZt7ruqaUovk0hHWYZGzNyxMQZ77k26rNKR1TwPTlYy+fL20K
         uVk8EXHwPZtblstjvNQa8gkPmbbe8xtXBbE5mNBv9XbKpSv52G7t5PuYppJ47KcUUpKT
         EtQraMnx4hGJf1WLc1T30Ra57YS6YjulZl+kKsFQUmcak95sx2CsClqJqiKcYbK8hjV8
         QPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CfHg4DcEJtMZA8euboN687Jj3f+GOy7LRl/b0rjXE5E=;
        b=02j0WqcEzxxgfCMeqfwrJ+Xoso/8EOltdbyrh6r26bf/9IwxAIYxi7y/e4jJ1mJibw
         9ejbB3HkYvV1HgyZqs3K/SG3jdSp7OBVJVsx39ZvmH4R7fk6YMRWHpIKB46RI8Mh0w/X
         cIK/GHS5HRFgCCKKqnqFDjDbvnt7VIrp0qO1SWnKHkxELFZLvUL8flbjWIQPVENicUdh
         OKYGJ9mgNKn2R1B0donF657feJZLYyXcPhfxxhhLCfrF3Eix37Pr4ZSOertMEm81k/uS
         0fy/rtWbKC0KweBt9osfLrDPMY+8CRSWzkL96XFT+OFVATdlJtIH/DRigVuiViDEydS7
         20zg==
X-Gm-Message-State: AOAM532MptswCnLHb4exHeLoMmZYsHocSVGrBXRtRRmUzRvfkBhhDdus
	LgiPWJPDLMbI+rd/WAM6iQaTk92UE7llSg==
X-Google-Smtp-Source: 
 ABdhPJxOFKws3UnEJ4/wVCEOLhd18v5bMzVnCn/A6ef1R8py00TDUhowWfzGynmKyXxowUH68UJ/TQ==
X-Received: by 2002:a63:4b07:0:b0:373:e921:ca4e with SMTP id
 y7-20020a634b07000000b00373e921ca4emr15558585pga.58.1645557426717;
        Tue, 22 Feb 2022 11:17:06 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 03/32] flit_core.bbclass: add helper for newer python
 packaging
Date: Tue, 22 Feb 2022 11:16:29 -0800
Message-Id: 
 <168dc5b183bbb0e552923f0def94290f98d8e339.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162194

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



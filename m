Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7F6C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:34:52 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13610.1784295283459732666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SuJWE1ly;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: twoerner@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-736eea06c3eso2494275137.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784295282; x=1784900082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ss0BmXYP/5NJnMPbwsdT/QXBmFaCIwl55D7pgyk6EA0=;
        b=SuJWE1lyF+g8nLerYBaI0FpanDx3LQCGBJxQU/6DD0734OTGEydB0DYjHKSMM6SxbS
         ZXFH/i+GBco90Npt3r9rYrdPmYfifzHm08kIbDTs4ME/M9bLz6jKvYY4DiSRL0/69I8S
         mL9viUm605vsHNg2WjFgfrTBUadym7MN3iU7xG9AoJUmQJtUwd8utAJ3YP5S2tKTo9bT
         mAC/NIFLmaeFQ8uNL/KBE1N51IP4Mf0O5TNsbyx3yxvABnegEuM49vfHKQT4vOAzwPdy
         kpBtKvT/ZvL8At880hHfYaq8MmBas6HZKui2uhJbEUZSc1IquVVkP6E0jdvpnFPTqmIk
         pdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295282; x=1784900082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ss0BmXYP/5NJnMPbwsdT/QXBmFaCIwl55D7pgyk6EA0=;
        b=hlKI7DE737iuZecDnK8mESvdp4AGzYZGURmdwDq23J6eUw5JYUCfilkHTbAVg8cD8j
         zSAOTSw2XN61tEXnWlJxMegUbc94i+FOhjGI05D+vybCyVkHnj9UgcawQmP32dL4WQtT
         wHaaYxRKJTkdzVcTrDBJResG7ivaqjOoo0RmNo0lCSifE4bIdpTotarTT0CxchTwf9+B
         F2yXk+AMGP/Iy+NJu89OSrZlij+YImI9nx4pKR24sCBE1wVJUoWEvks29bBbBDZ411PD
         wvizXyG2yrMIY4Ybo8L7vSnGSSqKZcXXKeK7RBPlTdwyE/gJ36wVrIqn5OgO4SN5NNky
         OanA==
X-Gm-Message-State: AOJu0YwweOR7CkPjYtEV7RTPNm1cyBTAfZzMzjMpFbDNmgGK7i3xmEsL
	50gni/glAO2VBUtuTFEvjSycmTqTorHZMAG3Is8orImpP8OKYIsdFkgolb6tvQ==
X-Gm-Gg: AfdE7ckfuKvchxwqVF56TL94aDokRn7vd7drj8L8062grIYzMdsEb0a/ig4e5Bpt/7o
	VSXt08T3O4bxPvZq9M819Pwaq3csqkYC5WAhj2YNqRcMBQErtx0/qXvfLDZEe6Nob+k6rAV5qcw
	ev5/cG3gw8ewKrlz+vTMMssFmbXSILEtPdzMEwPdmQIjwji1jfO0wkJh7UwS/MSnaEIZaBLXZjg
	05RGa4cXKudkDE9j/SwAQaYivPdrIisB1InVPyEZ/kph1eV90YVvyMvPKda1O+rsMmvv+u3aHR4
	ZL2GlMol83OaquOAS0mR6AlIC5SugYohnZcHWPFInrvJj3P5FmVaCLXUn7AZb3wvKc2jj9H56Qp
	F448mof1H1UR8z3WHBAJaSleqDP2h/FSJEMtqmqM1bHav66liLY/s8olCxNrPwgD/M85APwZfqn
	lfutDGWs7qnQOX+UNdz9i4INXO2as03LkZoSIjaNfiQGmc77JU8SvGX4dNvKYvFpnxUw==
X-Received: by 2002:a05:6102:560f:b0:738:8022:d74c with SMTP id ada2fe7eead31-7475360e095mr483995137.15.1784295282390;
        Fri, 17 Jul 2026 06:34:42 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3688e1sm565059241.3.2026.07.17.06.34.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:39 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 6/6] nativesdk-packagegroup-sdk-host: add an lldb SDK feature
Date: Fri, 17 Jul 2026 09:34:21 -0400
Message-ID: <20260717133421.3510970-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717133421.3510970-1-twoerner@gmail.com>
References: <20260717133421.3510970-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241188

The SDK ships the cross gdb (see the "gdb" feature), but some developers
prefer lldb. It is a large addition and not wanted by default, so make
it opt-in.

Add an "lldb" SDK feature that pulls in nativesdk-lldb. It is not enabled
by default; a configuration that wants it adds the "lldb" feature to
SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- new in v3
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 31559eb2cd82..bf9de4201810 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -31,6 +31,7 @@ RDEPENDS:${PN} = "\
     nativesdk-perl-module-integer \
     ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'sbom', 'nativesdk-python3-spdx-tools nativesdk-python3-sbom-cve-check', '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'lldb', 'nativesdk-lldb', '', d)} \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a



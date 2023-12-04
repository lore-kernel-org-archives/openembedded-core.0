Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C67C10DCE
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.72358.1701705584468221458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0dmpu8pC;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso17796105e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705583; x=1702310383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0y3nqiWo+iM/VgSe9noW2bvm/Ew1cYjCiWg4MOuKPs=;
        b=0dmpu8pCokz3lngVxQeV62Bqa55SZibwtnNU08pVIjnUdNg4m12C9IOA61M2QqEWBM
         GV+2sJ8dVtvtxWfLrgsakJyeOfZqgME5pdPL1k7jWUtU4Wti6OYoxa9RwDxJCbfDIO6t
         utVRuPD2showUuET1q6Xu9Er8VpZ+aT3Xu68kAhjBhRfIutAUqRHFJpr/y3+NMbGrI/T
         a0nQoP29anbcccys13TMZsII5AdBE5DmV0GH+OY1CcIUXXYzER/26VHIrfMP0NeuyHGq
         uQAPIdmLZDSC7XZwl2bqFhHKf4ctcQBVQ3Ti4zRuKZr5/qPRQuyDiMSTGFuu+kWZhNeq
         ivAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705583; x=1702310383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0y3nqiWo+iM/VgSe9noW2bvm/Ew1cYjCiWg4MOuKPs=;
        b=Tx/9BNB9RO3mkWBwQrVCgJSAp+TVkg7HMgeZpaO1hV0VRv/9PO2UE+twkJpT3zJWy9
         flhy/FwTh35Hci06cAbBvo09cXiYFgkDuk6nWnVrMcfDLQ+1Q5K/QDjyJz1BLUyFV+m4
         Nn+ncL+N7P1rvEXu+VGANADsOVl/78skutQkOU0illdiSoj5H3ykeaqrYbBEw8+JXfJF
         KEdpLQbfNY1gIHFjB/spMJmHWyM6M0wFjnL24bcB5zVvN3yTd8XDNMN258c6XKC0Z+IV
         ZfPrsaNAGu+s6M5v3hftSYBeEiP/we3jcEkVdMGJP352xXUiEpjn4SovEXNO0++t0gJW
         T2Ig==
X-Gm-Message-State: AOJu0Yyt0pGDI8+GmlCipb9bmtQvNiVd3YehP6liVq8zwH3MtGRHawCT
	puCriW7+GrrCmPoZ+87Q0hAsBlop30B47MUNEfH7Ew==
X-Google-Smtp-Source: AGHT+IGZBEMg+cY0/O1qa/AfgHHdovOAbOUpnhtv6YRrB9/ccVpqX3x1ceDPkuLGsRuXv9vS8o0Q1A==
X-Received: by 2002:a1c:7c0a:0:b0:40b:5e21:dd4c with SMTP id x10-20020a1c7c0a000000b0040b5e21dd4cmr3200346wmc.122.1701705582880;
        Mon, 04 Dec 2023 07:59:42 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:42 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 2/7] recipetool: create_buildsys_python.py: initialize metadata
Date: Mon,  4 Dec 2023 16:59:29 +0100
Message-ID: <20231204155934.836992-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204155934.836992-1-jstephan@baylibre.com>
References: <20231204155934.836992-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191756

In the case pyproject.toml doesn't contains metadatas, the metadata
variable is not initialized and the plugin throws an error and falls back
to another plugin, which is not the desired behaviour. So just ignore
metadata if we don't have them

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 9312e4abf13..b620e3271b1 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -726,6 +726,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
 
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         info = {}
+        metadata = {}
 
         if 'buildsystem' in handled:
             return False
-- 
2.42.0



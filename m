Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0E9C5ACB3
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:12:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9055.1700219560326233052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ReU1Rg1V;
 spf=pass (domain: baylibre.com, ip: 209.85.221.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso1169672f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700219558; x=1700824358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0y3nqiWo+iM/VgSe9noW2bvm/Ew1cYjCiWg4MOuKPs=;
        b=ReU1Rg1VEAFN+No2IStetkBMut7Vx7XZAuJF7UVf+v4CjFv0j4PxitByzbYBDMeo6h
         QPsGh9s65XLrNEDlR3a8UAKUlOzvDfKjmiT/qw6l+29Cs+9oWiQOydMFVCFRCCQLdQus
         Htzki+ADAsbJDg7iayy9QW1ZJ5PNL4RAWFr+VDy5h144XpZZbzH2xQcpG/VFXx0Uh73Q
         GJpBSD7fz5ViAM7WLwD5e7R3WiTefn51IlbGLoZg30IVeRtqQwxfmPaGrWEGhQNySQVa
         IrjgUvEDgHXoAsm4YBgFlMhuTWF6OoHGE8Yhao9Hau8ZSWZqqCw+kjwGycIPYkuCsAxq
         N9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219558; x=1700824358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0y3nqiWo+iM/VgSe9noW2bvm/Ew1cYjCiWg4MOuKPs=;
        b=fDSuFcxP2KdItzRyVs2FL/oGxxzIcAwKHHyMK+gygO2QG4r4mOsOls3/cOt21eWW6S
         vFV2gS2zbiWBtBmmtf92aV+Z+Q5Ho09ih5dq2S5tBPgAEo02E4XRpqIly+XMhZwy+HD2
         dKKAG6k08Iqhboydbgjn9y2yHR4qgW2rtcYKKRuwDALKfxTTjSsbxdX4dml1g0gO0daW
         4ntNC+cfBUXz5jISSLCNjtOauswuVsQck0BdM5KVKTZariBPHYWRo6omJ14Q9Ao04B98
         0HPTB6mn3IwwKNjRbUUZ6WbLyqKNk50ZB0/Ya4kk2l+gnriaQWtizhIVxJfFLXIWxFD4
         IOAQ==
X-Gm-Message-State: AOJu0YyV2WZtLLbUnPAh/PPpDtTS2mkQ3khdpkblFygOvMGMYNguAtOc
	27VBApZNxPXEgqvExpdNhAIpI29ZbXkMPdnVtpBOqw==
X-Google-Smtp-Source: AGHT+IEqXbFgmvkjAdBfJ0aWencxc0o77r4LvFwISKD7ILPHTnh928BY6MSTCSe+bCUghbJXtkaoBg==
X-Received: by 2002:a5d:64c7:0:b0:32c:eeee:d438 with SMTP id f7-20020a5d64c7000000b0032ceeeed438mr14469317wri.54.1700219558355;
        Fri, 17 Nov 2023 03:12:38 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm1982440wrp.28.2023.11.17.03.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 03:12:36 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 2/7] recipetool: create_buildsys_python.py: initialize metadata
Date: Fri, 17 Nov 2023 12:12:13 +0100
Message-ID: <20231117111218.3344066-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117111218.3344066-1-jstephan@baylibre.com>
References: <20231117111218.3344066-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190838

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



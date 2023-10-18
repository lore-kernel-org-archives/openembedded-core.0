Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF4DCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 12:01:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.279501.1697630479296882548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 05:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=bepXXArt;
 spf=pass (domain: baylibre.com, ip: 209.85.167.53, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507a3b8b113so5462698e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697630477; x=1698235277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFG+NgKDD+a3pHQn1XSBG0pv5Z6pNQtH02miX+DoJT4=;
        b=bepXXArt4YpwNmDFzkd6u6LAd99JQL7w8lYn8oTTAql6TbCVm5unBsEZRnU8+izTY0
         Wof7NjGqXLRs+13o9nG8MjlDZadu/wb4yatUutNh0+iBtTJJNROdmBn5OiL++0b5qyGn
         NV+t8orG4M9EPcstD2sJ2Cs4GKXaaPhwF/h+YF91zOw9rBbK8SbwSst9iyjR5Osj0Tvm
         qRvO8YAqsAf0msHG/mesb8SpsANJn+sLEZzn513pjNZIeymfxzC1zh311Bj+6HUmBu/1
         FiiqEijmZAUQVsyA9kJH8qC/3J8cqISnLoaDmLIN+njp08DpNt2Tb3kVnQRJhDaTNmHW
         t9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697630477; x=1698235277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFG+NgKDD+a3pHQn1XSBG0pv5Z6pNQtH02miX+DoJT4=;
        b=HmD83lHIpFQxMdvfTaQK+eRTwk9CbnuOAHZTWp4ZtCGhd0B87wFGZNDDyymyofDrB8
         uFXjK4KO5oyxsKe3kUIVr2b71jlJGknFyboMKU6btbKiwCNCdiO89hmKWA6oTeu2Uwn/
         9kWY/+CshsPG694Ll11hnPW30XFd4c9YZ9mpNYMv9aFCq1W8CK8skRWqzYBAK5TD1IKm
         dyt8DTNtF0ORtBx3Ty721RZfxwjnTvYhVx8whbO85Ohbu3kx4FXI5TuptghZbSYiTzco
         rQZWAGYBcv48lqps3/TjgewcgAtPpeP3KUW7MAeUFT7aZZP+yMJl9MU93VeKXJ1F7Zmd
         KJdQ==
X-Gm-Message-State: AOJu0YzcIxc78WxLckMC94gwxlE5pbLsFXJ1Ccmal6wwp75ow7PEgS/m
	M83FSwvbZYIA4NOFzZH9hTKlDPsKW+0pVTVmOFV/sw==
X-Google-Smtp-Source: AGHT+IFj97iYtM/S1mqHsMogn7AaIeyPRM3ki8GQk/MAXWuHRxSBUiMfT02k37sV/w0bP5W+1wTn3Q==
X-Received: by 2002:a05:6512:401e:b0:504:7ff8:3430 with SMTP id br30-20020a056512401e00b005047ff83430mr4346094lfb.10.1697630477003;
        Wed, 18 Oct 2023 05:01:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j4-20020adfe504000000b0032da7454ebesm1960312wrm.79.2023.10.18.05.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:01:16 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 2/4] scripts:recipetool:create_buildsys_python: prefix created recipes with python3-
Date: Wed, 18 Oct 2023 14:01:12 +0200
Message-ID: <20231018120114.1222475-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018120114.1222475-1-jstephan@baylibre.com>
References: <20231018120114.1222475-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 12:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189384

By convention, all python recipes start with "python3-" so update
create_buildsys_python to do this

This rule doesn't apply for packages already starting with "python"

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index d2c7e251bf7..7726ba7f161 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -297,6 +297,11 @@ class PythonRecipeHandler(RecipeHandler):
                 value = ' '.join(str(v) for v in values if v)
 
             bbvar = self.bbvar_map[field]
+            if bbvar == "PN":
+                # by convention python recipes start with "python3-"
+                if not value.startswith('python'):
+                    value = 'python3-' + value
+
             if bbvar not in extravalues and value:
                 extravalues[bbvar] = value
 
-- 
2.41.0



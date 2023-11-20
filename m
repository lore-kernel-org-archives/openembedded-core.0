Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A578C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:23 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.623.1700498359850450579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WmRVI70H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6c4eaa5202aso4703429b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498359; x=1701103159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQgs+X4q58wHxyIn6arIV2eKrl1fcK/T6AN5nvZzXms=;
        b=WmRVI70Hajw+oBykxI5D+xeQgTrlkZSD8+sKtGqDs9jBhljdRiE1BK8D7yZsjRhPo+
         3xV/5MEXzUblgGFgMBoR8o14eR+FAYM8vWalHR04uTx8ITVXyYDy//lCt0fI7YylwEAb
         /vbHIu6r4U+KvGPcdBh3J4BBHoX/Ynct6bbufBsU0o/lSEXeR0+hSin6EJzdm0KFCkW+
         kSWxD36M8mmSQX6PtaZuJB2wnAf8/V8USZnNdyh2TpYsdR3muXxfms4J4kb1CwE0Pxsi
         4IJLlhIF7Le+lcHVDEuGLCCEWaetQdEpJIDWSfgzojA2tqQzLTVBCV5aH2PbqaLXsN3N
         VwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498359; x=1701103159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQgs+X4q58wHxyIn6arIV2eKrl1fcK/T6AN5nvZzXms=;
        b=sZhJwczeG8F+IqULjnujF/MUPsUMAtWY7w+a7yESXCduWVP91wP7fDJOKrY6z4qbuN
         +mXN+mcO0CoCINRODBP7XjFCMCDxTa2NyCWBN9f1fji6ZHH6YAY0YM3qZT+djp5Xe0O/
         tsOYnqoT5Qvx1Ad/X6VEnhrTCP6f8FX2kfjNrq0rqfF2pVrEOeL3Bz8aYFn3/WPy7UiI
         hm0PFwimLWSh3wneomXT8/1pyNrZ/XNFnQiRMPIbNKku/r7yGxlJciB1kRMyt0JoZHIR
         PfgL/XzlSNmSTJfHt7WSK+Q1EbMKcBTYki3k7os88cv4WjFx9KpzjTF5LZ+gh2T2/EWN
         oZ4w==
X-Gm-Message-State: AOJu0Yx51wWttAC4PUJM4hQ1tTyr5bzjmRoo0B1XwBxVpdA2DfsrW/L9
	Hx7QYgJ0s5I1+dYdc9yIjIRZIT14bwb7hoXkZQguAg==
X-Google-Smtp-Source: AGHT+IHlru0j1W4GAAmjUEjiGAMEZGjgun0LLq4goKfblqgEYyYxISN+gm3k44WdC8Pu3oxtOJSoww==
X-Received: by 2002:a05:6a00:3a12:b0:6c3:1c74:9c5 with SMTP id fj18-20020a056a003a1200b006c31c7409c5mr9802067pfb.0.1700498358963;
        Mon, 20 Nov 2023 08:39:18 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/33] oeqa/selftest/devtool: abort if a local workspace already exist
Date: Mon, 20 Nov 2023 06:38:26 -1000
Message-Id: <74c852619b7496cf772ea8f1ecd4ac8b1934f65a.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190901

From: Julien Stephan <jstephan@baylibre.com>

if user run devtool selftests with a local workspacelayer
the tests fail with various error such as:

- devtool.DevtoolAddTests.test_devtool_add just hangs
- devtool.DevtoolModifyTests.* fail with the following error:

 ERROR: Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check bblayers.conf or layer.conf to fix it.
 Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check bblayers.conf or layer.conf to fix it.

Check if a workspacelayer exists, warn the user and abort the tests

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a74962cfb0485f6f2b9e2b751c33c8eafca8705a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b577f6d62a..c36b1efa78 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -27,6 +27,9 @@ def setUpModule():
     corecopydir = os.path.join(templayerdir, 'core-copy')
     bblayers_conf = os.path.join(os.environ['BUILDDIR'], 'conf', 'bblayers.conf')
     edited_layers = []
+    # make sure user doesn't have a local workspace
+    result = runCmd('bitbake-layers show-layers')
+    assert "workspacelayer" not in result.output, "Devtool test suite cannot be run with a local workspace directory"
 
     # We need to take a copy of the meta layer so we can modify it and not
     # have any races against other tests that might be running in parallel
-- 
2.34.1



Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559F6EB7ECA
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:44:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15142.1772621035873990082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eSFCww7c;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2140086f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772621034; x=1773225834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csm1ZwZwWh3bnb3Pv2NbbdKHkS/F/gKbUQkABmsSf5E=;
        b=eSFCww7cerJNgq0iWVZJRJX5e3Wtya3wzG2r6eOZGxVdw3nY/RSgBojaL36TzP8Xcs
         twedbPGxv72GvHfsvd31Hes6RCzNrJYwbd3Qy9nrWyfcZQTu3PQTfb3p2b9M/1Hp59MN
         aHluwBbwrCGnYQ7p2x8SZgG46Lr8iGG4hV5Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621034; x=1773225834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csm1ZwZwWh3bnb3Pv2NbbdKHkS/F/gKbUQkABmsSf5E=;
        b=gBvojs8N7asqyJG1Dd/bMXnB2xR1HtvYdu6GVn8b2SWsluzLtkZtdIh4tCagFt4tl4
         8iy11+XfCUsPhvcG9Q3hI+5e9vJ6lTAYZoQ5Lx7MNxz4E3rIuTzyCkTa8gA8mJkds8Qa
         kXpLUnlPIPRzPBER/UKjSU+gX2aBfXZDVAIQ1C0ZasA2djz/Z7qbf8PC8afJPXJ9VM9a
         oF/zU5QL5nHQ226I2UoHMl3HZhQxiQsBD14RVk7uzcuaCzFjfSrHi7Y/nSp4pwu3OGwW
         hBDOXIzkjxsqTlBDnIu0Fx0wDS+IUklpVaXphdirD8/XcW5NvUoWXHRPnpnfwg54aVm+
         NR3Q==
X-Gm-Message-State: AOJu0YyqqjMM0qZnbKdzDafkqm4o+qE8yeJU2APi1RBW0Qh7rAKFMHw5
	nm2IWiqAN10K77oGUz+x+bW8eomS57CueAAOzY+LFJs8P2DqWUt4gP17HjWPx2PQ2UtetmrY3F7
	McnbDyig=
X-Gm-Gg: ATEYQzyLO1K6BVg6BKy+yuUc2wThHFXtwzYq+DT/z9ypa5L1R/MPCi83q4rIntd9RfP
	qZV37AyiqFEO8moECMXSSZfkFYSixjKgMAYNAi6m35YM7YfG8t2aj0Ox+3NsMgpcTF1DPrk/03+
	7J3w/xxRsgV1gDcaKEcaBdYmtnumRarE+6Xg3r0ldIaDd0ecrO3G143iqJrhuSUejF50rw5Ztd7
	29b+KkygQNgangBNEYJmQQ3MllTAG264QLXR8fmdkV9OvrMI/jVU2vE0VpqGxTvB7nmfrwInUKJ
	LgB+Vqhd5AB8snyBwKPpLUrio15EP8VbMMA/IaRHoTrn5JDrKmnUxE55Sho4V2VHqHWkoO7y6r3
	HTx52cW+rs/2GEyL96rHYoF9ohnTKR6NhmwTxfqgFOp04bK3iNjgJV4VxblK20MqGaNzFS8kvbW
	c8hOL7U6F8PmcFqqiGQzL1cJb9x2Jzo7NQ6GjlSKhNzoV8qUt5vCq28zexnwmE8esjj2O5luIBn
	uA2VtW3eKlK0yiw4sGGJpVQYbJmIFo4b0ZNcMX6qeM=
X-Received: by 2002:a5d:64c6:0:b0:439:a95b:3c47 with SMTP id ffacd0b85a97d-439c10a8fa3mr11035540f8f.10.1772621034263;
        Wed, 04 Mar 2026 02:43:54 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm25638168f8f.10.2026.03.04.02.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:43:54 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [RFC PATCH 4/4] devtool: use default AUTOREV only for SCM URI
Date: Wed,  4 Mar 2026 11:43:42 +0100
Message-ID: <20260304104342.869457-5-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304104342.869457-1-corentin.guillevic@smile.fr>
References: <20260304104342.869457-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232374

Same than recipetool, the default revision is set to AUTOREV regardless
of the URI scheme. AUTOREV is now the default value only if the source URI
supports SRCREV.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 scripts/lib/devtool/upgrade.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 8930fde5d6..34e23c2c45 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -157,7 +157,12 @@ def _get_uri(rd):
             break
     if not srcuri:
         raise DevtoolError('Unable to find non-local entry in SRC_URI')
-    srcrev = '${AUTOREV}'
+
+    if srcuri and srcuri.startswith(('gitsm://', 'git://', 'hg://', 'svn://')):
+        srcrev = '${AUTOREV}'
+    else:
+        srcrev = None
+
     if '://' in srcuri:
         # Fetch a URL
         rev_re = re.compile(';rev=([^;]+)')
-- 
2.51.0



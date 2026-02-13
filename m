Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0372EF48C9
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 17:46:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77638.1771004765015637923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 09:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GvSSJ8r9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so13461895e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771004763; x=1771609563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJUHcvAYJfDYbZGS5Nh6L0UmBG3xbsW49BSR9hSpcA0=;
        b=GvSSJ8r9iRYubEdaSE8saWNnXTXLaW8uAxOxBDV72cnOB8tpadMNHahRhQQzQSCCNQ
         KPlYxvvycc4JH9BbpHabiBO8R3YD8CoTudFck95HNnuMkP9icptLwZaKtBwvyfLpEO+7
         wSoLpdOI4oz/agTvtF32AQ2GWgP9hcx7zBFHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771004763; x=1771609563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJUHcvAYJfDYbZGS5Nh6L0UmBG3xbsW49BSR9hSpcA0=;
        b=OW5AbV6abECXAqWwl84WDWngtw5oKUc2H+18ZP3u77hy/2K9BBDNwj7fGDBlL7pp/W
         EicDWtItGt2sHCXRJvJoL/NiXyEkwRLUkuxZos9FsdwCeuENSqBEPP+fQnS1+10QTLKg
         mPk9PZ8mq32DeRczrOpV0U4sXHyCk04tqyNptEe4eJvFl6svkPdoHVTny9ev6VuEI8pG
         A9jpMH/zpnELcVvQOwfJa20FrYOPAYF0pxomtJ+d3sgMrbx2es81bXJrrTEPgZsSXuSH
         mJMIRb+7mEpfQ7FxJOyt4QtbT6OQaezZkr/nkY+UYMQo6qIFMUjD/L27vKCOu7ohMraz
         TGow==
X-Gm-Message-State: AOJu0YwSzdCHVXbAdEX2isCc7nhMqF5rThvZUzgqOnNyF4XYYJ7RUej7
	hljCJjuu4telAH5CZJMYQ0IVJOpYWgggAZdkza6BzcmAQR7T7DdCJi7k6d14D/nRv1A3FMzQRo0
	j/NXZ4es=
X-Gm-Gg: AZuq6aJDUU66NgL2ME001keS6dz816lIMwKdWwd23BEu1etIrfmuI7fjoSdI38Ju3/L
	aQlTCt/8UDF7ihJpnb6CDGYUdk3ygLL54cklpFwlKlZlWg4VnkJJH+8j1o0DGLsI9bU75RJRsvz
	n4wIXX8Y0iqpP0w/VAem/jsFvZ0AeCM55YANTp+1ciBL5YrAzHEZDOlkGczBBbmPbVtZlY3f/TO
	3kYuhveXauE2c77XjwwcZ5aS80mTgQqkhC+fK8C+nYNmLwHmiHAUpIEF7WXeJd18BjAcQP+baHW
	gDrOZvtibXu1inO2k+eJGDRP+yZau0N8Ym8LjoJiK+ODwRqlK4Abrkl8ooPf7KWK4GcK8WHOIPT
	gn/gS1DnAlJVCcAkssTDDDcvprnEgahDHgKqc+vozQ8cPqfBn65enukwCeUbyyi9BsUKeurQW52
	llqyLM7NPd3rPzGX6nhS6+jXAmXExPbvcizlKIJGcIweJSJG5bJ/U=
X-Received: by 2002:a05:600c:8706:b0:483:6fc6:1e20 with SMTP id 5b1f17b1804b1-48373a09effmr39620465e9.9.1771004763008;
        Fri, 13 Feb 2026 09:46:03 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e20e:afdc:37ec:38d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483709f6935sm36502655e9.0.2026.02.13.09.46.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:46:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] sanity: Update to account for removed fetchers
Date: Fri, 13 Feb 2026 17:45:58 +0000
Message-ID: <20260213174558.1799136-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260213174558.1799136-1-richard.purdie@linuxfoundation.org>
References: <20260213174558.1799136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 17:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231132

Some fetch types were dropped in bitbake, update the sanity tests to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index c89ff2c51fc..5165bb34325 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -957,8 +957,8 @@ def check_sanity_everybuild(status, d):
     import re
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
-                 'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', \
+                 'git', 'gitsm', 'hg', 'p4', 'svn', \
+                 'npm', 'sftp', 'ssh', 's3', \
                  'az', 'ftps', 'crate', 'gs']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()


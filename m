Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF16C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:48:59 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.12525.1693226928442329477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 05:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=YYcIOznq;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WMKH/LeQFSNR+brCBRxwqemAIo7bBhkLmujW3OZ0N8Q=; b=YYcIOznqGVrMK37hmbCGJ/TPuZ
	0J9kG7fKsJ0XUxY6obOCk1atd0/W0fvcNgd09EfPj8Co+FXduoZK7OttncX+OQe1nkJR2jPXLQ/pc
	3VLPQDn4O1K7C+ufSq8c31wVye2onBEIT8Ka55PNtjHOcpcgGSru7Dj6r/jQi4kfp9TAFA/hv1paZ
	rIygp94FT6oxVwNTRfJllI0HgGJDl+b67fnMQVtBW1zWCjLxYGZ2+BhTugC1Bt0oswIljNW116SMH
	5nJGxcUXm68lpiS/TxWMilf+258yw0klckNIhRkLlANDICGGRFKCbDQHiSTr03R4fMDwg4pxCFc2b
	7tWi9clA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qabfi-0009GP-Dv; Mon, 28 Aug 2023 14:48:46 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qabfh-000BNd-WE; Mon, 28 Aug 2023 14:48:46 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [RFC PATCH 2/5] scripts: build-env: allow passing JOBSERVER_FIFO from environment
Date: Mon, 28 Aug 2023 14:48:26 +0200
Message-ID: <20230828124834.376779-2-martin@geanix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828124834.376779-1-martin@geanix.com>
References: <20230828124834.376779-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 12:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186823

Sharing a common jobserver fifo between multiple (containerized) builds
is much easier, if an administrator can configure said jobserver fifo
path in the environment. Append the JOBSERVER_FIFO variable name to the
list of variables configurable through the environment.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 2fdb19565a..c8e67ffb8f 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -112,7 +112,7 @@ HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
 SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_ENFORCE \
-BB_LOGCONFIG"
+BB_LOGCONFIG JOBSERVER_FIFO"
 
 BB_ENV_PASSTHROUGH_ADDITIONS="$(echo $BB_ENV_PASSTHROUGH_ADDITIONS $BB_ENV_PASSTHROUGH_ADDITIONS_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
-- 
2.41.0



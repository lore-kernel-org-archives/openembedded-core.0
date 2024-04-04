Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FB9CD1296
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 11:38:13 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.35865.1712230693158754649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 04:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=JQMQuQ8j;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DTdqDTJf+8ZbmaSryfnJ+yAvb/hJN0pxsAlQagkdlF8=; b=JQMQuQ8jjmOqAynJ+pBC1nQKbX
	0tne+iwZzYc8UywpIeU8e0U1gInxvlXf9CqpHy8BPa1/UrUnmhoKvWuNdcCQNl+sc+8aqig9RwlXw
	ij1igT1PYiudl9MvtT3Ve3eKoM3uH9tUx8KqyZhtW/rihRhdbALdxFbmDWPEzlIluapY8ly2yzRj2
	bSDPDCIK97KejRAejdF3oeiV15RiJakHCf/HUsYcpqhOTNw8H1pHvey2ziFt8rI1R2nvt46MaoC9G
	cNvVjY4CikYFW5uHpY9pnrb6FvRFNsQ5umkpqk8F732Y16Ew00atciEBzQtGLtZELTdZiAtbaXBnO
	JUnIrVmQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rsL52-000FZ1-KK; Thu, 04 Apr 2024 13:16:28 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rsL52-000Wu6-0G;
	Thu, 04 Apr 2024 13:16:28 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2 2/5] scripts: build-env: allow passing JOBSERVER_FIFO from environment
Date: Thu,  4 Apr 2024 13:16:10 +0200
Message-ID: <20240404111613.2574424-3-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404111613.2574424-1-martin@geanix.com>
References: <20240404111613.2574424-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27235/Thu Apr  4 10:24:59 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 11:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197958

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
2.44.0



Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E08ACD1296
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 07:02:55 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.5339.1712127766025947691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=iZ6gwvzu;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DTdqDTJf+8ZbmaSryfnJ+yAvb/hJN0pxsAlQagkdlF8=; b=iZ6gwvzuEvYgugTE/E0KHSa0zR
	kMk2BO2J3KkKEK15JDVAOQgpsJctBE2dx9pEqo1eziFGkwd0GHJOVUEb+HHT88cwXtuspvfOVcieQ
	LyMRX8gz/2TvOliyPIbVR6ByIK1stS5p9XqZT7lUH09wRLxNyujVpajbPiEmhs3RSfeXZC4u4GbcP
	3U2a9lXto23w4khkBt6Tbz/ITnaLVXPRzOeIJwlKwJOac8MZeg8dropArZbjaazASku1EBwkjX9Ou
	vzzAbNyZQvoT3H1apSAcvetcfLM9tkzEJF0BmAsLkMLMjLUvvhu2Jn+h28F4PlQLdbKx1tgjYhP/E
	BfSbV2fg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rrudu-0007UR-Hm; Wed, 03 Apr 2024 09:02:42 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rrudu-000NUU-2k;
	Wed, 03 Apr 2024 09:02:42 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 2/5] scripts: build-env: allow passing JOBSERVER_FIFO from environment
Date: Wed,  3 Apr 2024 09:02:01 +0200
Message-ID: <20240403070204.367470-3-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403070204.367470-1-martin@geanix.com>
References: <20240403070204.367470-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27233/Tue Apr  2 10:26:21 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 07:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197908

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



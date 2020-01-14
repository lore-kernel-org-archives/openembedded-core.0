Return-Path: <stevenrwalter@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 24D127FA23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 22:16:10 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id z7so10141408ywd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zVweJmcHUh9uqx++0sommMaHC69fNZ4y1kU86DSj9Kg=;
	b=YmvB0eiVetQklVtIlagy0gqKSwhkNwQeT2MnmkbG58A9rWsKpkERiV/eaxgs6Ig4gI
	QoYGlJONOZyrji+gdK5dt0/9WIRxrbQSSjulEV/OeTgc7rc9+gfMe5uZnG9n3uKuib3T
	oKDgundfN4O7pNfbrczatQRewm9phQgAYxF3N/welCkP5qdtbeRaWLaWbcmL9Ya9IgCn
	rFo4BOGqpMSUAvwQaGtL1uidmz4U5n6Jse0Khn2/aTl6X2N0T+OjdxNeNk285NmrAkwR
	DD5ko0yfJxWAd9s3/jMekLrZoOWZri13SzvRSoBpgEPL2k8cILfubXSrr8sRU+fURYa0
	L11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zVweJmcHUh9uqx++0sommMaHC69fNZ4y1kU86DSj9Kg=;
	b=XHGIU1sXFvj6UelrrDnnrjDOOlkoy5BBP3mIAVBuMGcmaf36k0lkSlZoYVeS4W3YSN
	TZqY6S32rVEWqb1OrDM5SXmd266QZg7qsazpg24N5dGAcxo7Wi3zUa4+QuQdin/Ia8up
	YBjYDMRMirdWgHG3aj4ff4XZnYRTsMV9JzL5GIJMdJYw8Iv7OJn5YW7GsGL6BO5aUdYv
	UUPR1qA/zcIvd46AfL/nnJYdznhofw+Sr5T4rhnFr0yeVtEsTo8VeXlnAFMzTeNe8XeV
	jtqxOVMg4V/5Tkrd2qzqXSvNc3i9mf00aNMdcq4CxeEVsR/cAsTOQNDmP7dCGytwriID
	g4FA==
X-Gm-Message-State: APjAAAXwYfWCF7S6f6pwtsqbIdhuSsR1YwnDW5rycJluQawj+GkiqxXt
	bknvyUjVxjDQSYK0Vm21lqrFYTpJzM8=
X-Google-Smtp-Source: APXvYqxOnfkY1wrRQp/qO5rgbwjV4Hja+LX21HJIUMAFIBvNsQRAp553AWM323zVNjtOYPjal93o5Q==
X-Received: by 2002:a81:3c90:: with SMTP id
	j138mr16002779ywa.319.1579040170940; 
	Tue, 14 Jan 2020 14:16:10 -0800 (PST)
Received: from brock.localdomain ([2605:a000:1707:25a:1de4:eabf:e8ce:977a])
	by smtp.gmail.com with ESMTPSA id
	n142sm7310999ywd.26.2020.01.14.14.16.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 14:16:10 -0800 (PST)
From: Steven Walter <stevenrwalter@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 17:16:01 -0500
Message-Id: <20200114221601.5707-1-stevenrwalter@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Steven Walter <stevenrwalter@gmail.com>
Subject: [PATCH 2/2] Allow original $GPG_AGENT_INFO into do_fetch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2020 22:16:10 -0000
Content-Transfer-Encoding: 8bit

subversion 1.9 uses gpg to encrypt authentication details that are
stored in ~/.subversion.  This means that GPG_AGENT_INFO needs to be
available when svn is run by do_fetch, or else svn will not be able to
authenticate to the remote server.  Treat GPG_AGENT_INFO like
SSH_AUTH_SOCK, including it in the fetch environment and BB_ENV_EXTRAWHITE

Signed-off-by: Steven Walter <stevenrwalter@gmail.com>
---
 meta/conf/bitbake.conf       | 2 +-
 scripts/oe-buildenv-internal | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e75bbcece0..3b083d9103 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -878,7 +878,7 @@ BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
     HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
-    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT"
+    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT GPG_AGENT_INFO"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index c17cf4da71..3e0cd642b5 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -106,7 +106,8 @@ BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
-SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_ENFORCE"
+SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_ENFORCE \
+GPG_AGENT_INFO"
 
 BB_ENV_EXTRAWHITE="$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
-- 
2.24.1



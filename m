Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D827365CB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 09:47:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so2825676wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 02:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CztpS9Ev/TVRpBjtpE3qlXiZU9ar1X5mEUeDIVoU6QQ=;
	b=iVzDyzT0cUqpuKCa3m4iXj4j5aODa8x7FsWH60B5QB8g/QcJ0iDMPwPBqnnKyvb3a3
	7QVGOj6edGUivYfGZI15WkBticAtroE/mIcm+9vUBQGnluMxL1gSW3eN4tDmb2j6h6UI
	oS/Ldf4I8cpn2OPlsC3G5lRErtKFcxLhYpXqTSJ83+T76zzGrzIaH/OUG8agL6mdQt7R
	36wh/Iy5cXmLMfzUajB11aI4RjiIXxYKCMlo6VKtWIsnfO0/Aqp3Vl7ZVN6CZp+VgfL1
	hHTUIAHlYj5N4vcGvnyzhnpVS+2lzus50JLcrO8OWrtOL+NTVoVkwvUbmCNTfTlfF54U
	Adfg==
X-Gm-Message-State: AD7BkJJvL7Jqt50Si7NgD4F/j6rSo0ODfurQgDzsC/OeFSByTMDSROffugDAkZJIO7uo1w==
X-Received: by 10.28.227.130 with SMTP id a124mr2859699wmh.2.1458726432070;
	Wed, 23 Mar 2016 02:47:12 -0700 (PDT)
Received: from sushi.stratoserver.net (sushi.andred.org. [85.214.105.253])
	by smtp.gmail.com with ESMTPSA id
	k124sm2044853wmb.11.2016.03.23.02.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 02:47:11 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 10:47:04 +0100
Message-Id: <1458726425-24672-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1458726425-24672-1-git-send-email-git@andred.net>
References: <1458726425-24672-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
Subject: [PATCH 1/2] oe-git-proxy: also check all_proxy and http_proxy env variables
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
X-List-Received-Date: Wed, 23 Mar 2016 09:47:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 scripts/oe-git-proxy | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index d2e9f92..38ce7b6 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -1,10 +1,12 @@
 #!/bin/bash
 
 # oe-git-proxy is a simple tool to be via GIT_PROXY_COMMAND. It uses socat
-# to make SOCKS5 or HTTPS proxy connections. It uses ALL_PROXY to determine the
-# proxy server, protocol, and port. It uses NO_PROXY to skip using the proxy for
-# a comma delimited list of hosts, host globs (*.example.com), IPs, or CIDR
-# masks (192.168.1.0/24). It is known to work with both bash and dash shells.
+# to make SOCKS5 or HTTPS proxy connections.
+# It uses ALL_PROXY or all_proxy or http_proxy to determine the proxy server,
+# protocol, and port.
+# It uses NO_PROXY to skip using the proxy for a comma delimited list of
+# hosts, host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It
+# is known to work with both bash and dash shells.
 #
 # Example ALL_PROXY values:
 # ALL_PROXY=socks://socks.example.com:1080
@@ -99,6 +101,9 @@ match_host() {
 # If no proxy is set or needed, just connect directly
 METHOD="TCP:$1:$2"
 
+[ -z "${ALL_PROXY}" ] && ALL_PROXY=$all_proxy
+[ -z "${ALL_PROXY}" ] && ALL_PROXY=$http_proxy
+
 if [ -z "$ALL_PROXY" ]; then
 	exec $SOCAT STDIO $METHOD
 fi
-- 
2.8.0.rc3



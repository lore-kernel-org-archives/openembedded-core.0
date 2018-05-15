Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 32CC2748DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 14:52:36 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id q72-v6so2305402itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YZZ+2a2zEaZXmMbhl7KT9np1KEg2rMo4s2iQBviZrsM=;
	b=RwDmO8phE1e9FA8HNuwTUJVeP527KcDPS4FXyjhaBlYYzaCUg2qWg88Q+zGWGusddk
	NKzLKMiqQSg1ipt9LK3pzc/vMAKOWb3l4hohBxkuARdIn4XFa2FURDnytu9RBAlNiMDN
	iDpME4sySMbxKxoJaP7daAYk/lnXTR5VwXUo/T3ISGPbH0U1dbNccy4D2R0c2Hg901Lm
	TRZ3xpOBWeHFTAVOSxM8IJ0adE5KTXB2xErPCWF69cvCO5Q+kIuYjVpj/BQcUD+05CIx
	cdnl5QVDkq45xTLn2wGMGxqaeTvtvmN+rXI82TNW6up0+NrfqjeAU+8AOTsHjW4U4uMI
	kZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YZZ+2a2zEaZXmMbhl7KT9np1KEg2rMo4s2iQBviZrsM=;
	b=k2+6dhF5XQCTNGiDrx4zr+89lSYf0u1Y/3h+VbMzsVN9+SBABm2lvP+Jk4YzJA0aGb
	ly5EU577OrksPl8gDsuQpuDZud5M2o8mnaRup1vM3gGOvYEadtmYnpPdQy2mpEOlGXGg
	KyHKc0R2IRTSWqmX4Yd8P0G0g0/8kDBNnraOwXv0qoGyXE4WqgzK7f+MxLd9pEUlvLG1
	YVgL8PprGyNGRu3RY8Kv8Sc+V/bXiXeEhsuUn46VUOMNjriqG5uIUXhfsSeMzx5M0lV3
	K3xa/rkcH0D7O2NxKH3wwQG2PagGPiY7SdbHzRXL1QtzJhkxO/pQNRMUNWlEq3uEIYga
	mFSQ==
X-Gm-Message-State: ALKqPwcRarScl5fpp/u+e/xXp84Q0ak5plsE4xwHVAuJ59Srd8x28lyT
	36k+zm79fd3+hydIUA7LP3zYmxyQ
X-Google-Smtp-Source: AB8JxZqenH0Uf3TIE7NvFUna5jDhCxsfuS7c1k8cTbJDd4trVczmuAgVNPLRD0Wq0QwTkm7yBOjouw==
X-Received: by 2002:a24:2f89:: with SMTP id
	j131-v6mr14181025itj.96.1526395957732; 
	Tue, 15 May 2018 07:52:37 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm126456ioo.60.2018.05.15.07.52.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 May 2018 07:52:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 09:52:29 -0500
Message-Id: <20180515145229.27887-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] toolchain-shar-extract.sh: Preserve ICECC_PATH
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
X-List-Received-Date: Tue, 15 May 2018 14:52:37 -0000

ICECC_PATH wasn't being preserved in the environment when it was
reinitialized. This prevented toolchain installs from being able to use
icecream by setting ICECC_PATH when icecc isn't in $PATH

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/files/toolchain-shar-extract.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index f7ab43066fb..9eabd626308 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -3,6 +3,7 @@
 [ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" \
 	LC_ALL=en_US.UTF-8 \
 	TERM=$TERM \
+	ICECC_PATH="$ICECC_PATH" \
 	http_proxy="$http_proxy" https_proxy="$https_proxy" ftp_proxy="$ftp_proxy" \
 	no_proxy="$no_proxy" all_proxy="$all_proxy" GIT_PROXY_COMMAND="$GIT_PROXY_COMMAND" "$0" "$@"
 [ -f /etc/environment ] && . /etc/environment
-- 
2.17.0



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D76261B17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 23:28:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v9so192840wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dQ+GGHS6W+aY2BPecrI0tL3Q5rIMtyyH9YBCpfJ/0t0=;
	b=IhkUHaCtfJxexFZOsl1iRJONXWn/z+LUvq4qrXdFqy6tDqNr8N5ZT9Y/XNskBxWKEb
	qvOh4aWnBegJlBEtcec6Aq5moV0Gso4VdJSKFji/PAkM1boo4Iiz2lNPwjfGlRpUxXG7
	qekkliv0F2ZA48wCc2cDaJPT/lpvpUPZOMwtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dQ+GGHS6W+aY2BPecrI0tL3Q5rIMtyyH9YBCpfJ/0t0=;
	b=MZDiqeYYyzzkVlupb1yZ7wCZKzJwyEnlqYFLaiPXyw0n/QW5b8WPixDCw99qKeJ6go
	HjGZFdabRAv4WsBEBCaKQM5dgHa2NSyAK//AzuZ47sNVaYUfBnZHSlEw9S22d4bp9hrZ
	3fLDjfq3wRfO8i1h64blqj/o1Qy94Ca9dA0cm3jfxfSBg1a9qWKl7LED+TjNf9248gcq
	3D5KSuHD/Uig/Zqbq2va4hxmA3sT/f0WYaF4CsNKKMyoaLwjoY+bm6KDCFPEmUbKtdiE
	xBl/Bon3gBz5cbx3tyuluJmzruKwkcw0nGwjG5ExVc4sbHo2PJB0eXnJRPClyVhhlvl5
	V1ZQ==
X-Gm-Message-State: ANhLgQ1KrVZ7S2KUltBdD96JMnHQZw17p5nkvxRr6xBlAO1HpA5iolpi
	am3t2xTLColbwV9WJAV8EgiVq0AryKw=
X-Google-Smtp-Source: ADFU+vudof57KlAO1pd+cqoj0zm+QhsUj0FXkINbPT3ZWdwbnVLvF+G69SKSv+XUwziC5RnguvMKwA==
X-Received: by 2002:adf:cf04:: with SMTP id o4mr242759wrj.347.1583882898605;
	Tue, 10 Mar 2020 16:28:18 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c85sm6254460wmd.48.2020.03.10.16.28.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 16:28:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 23:28:12 +0000
Message-Id: <20200310232814.48572-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/6] files/toolchain-shar-extract.sh: Rework PATH cleaning
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
X-List-Received-Date: Tue, 10 Mar 2020 23:28:18 -0000
Content-Transfer-Encoding: 8bit

Trying to create a clean PATH breaks cases where we install a buildtools tarball
on hosts to provide newer versions of gcc. Rework the fix for #8698 to clean up
directories in PATH which don't exist isntead. Do it with python as the shell
version was too fraught with corner cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 4c4b4deb4cf..2e0fe94963f 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,13 +1,8 @@
 #!/bin/sh
 
-[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" \
-	LC_ALL=en_US.UTF-8 \
-	TERM=$TERM \
-	ICECC_PATH="$ICECC_PATH" \
-	http_proxy="$http_proxy" https_proxy="$https_proxy" ftp_proxy="$ftp_proxy" \
-	no_proxy="$no_proxy" all_proxy="$all_proxy" GIT_PROXY_COMMAND="$GIT_PROXY_COMMAND" "$0" "$@"
-[ -f /etc/environment ] && . /etc/environment
-export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
+export LC_ALL=en_US.UTF-8
+# Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
+PATH=`python3 -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
 
 tweakpath () {
     case ":${PATH}:" in
-- 
2.25.0



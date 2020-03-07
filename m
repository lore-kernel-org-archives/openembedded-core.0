Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ACE8960706
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 15:59:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a25so2063704wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 07:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHmpERdq7nCH9Si6/x616EycWdIQpNqgMnTLCnME4Pc=;
	b=g5a8E7zWWHcsGWseMrD0D+frNPXmqTW/QZPO1KnXSLdS2z0umQ05t7l/AG8bDNV6WW
	QHXXj5jUWIjaoSA7hL1bQQR9ZWd9WCubfAvUL/fp3rajPJnBUrDiQPRULuqt2RZPvU+J
	iwctruvmjfwcv32smJGg4nppPb1GHswSCcfUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHmpERdq7nCH9Si6/x616EycWdIQpNqgMnTLCnME4Pc=;
	b=GcFYBeRlcf2025dGZ8gMkBbpbhB0eOhBkH1SNsk2bkIcfJxf9jc1TmvDJKq9RSI+K9
	XgPH2VL9vaLzJTP/8RaJ9PNiB9uxahyGm+7qiZkITJ1SMPjA2eSQHvK8/uB/utQ8n0cD
	Pkpcq99R6wZXgKJ34UC9AyPOLYzTtVoWmtKfPS5LufQfjBtVN+1qdG8j1lpV5qknHBnA
	rPWXgzpPZygx/EODjiVqaRPaXZhSjnGTH7N875oqSS8/kcVFcgj+y/CSxJ/ltXcZfJgI
	HjGQB3H6j5Uywq/6lpLDVTu3xD3VTdt7fb4Q6nOEWlUCjIl97BdlWseI986ZlyVLCkNy
	q4rg==
X-Gm-Message-State: ANhLgQ3Mm1bRJVczziOU1EC0hxPflRF/pVEy9u8h+XOFh+kj28yLC86y
	8EzKdZG6i7x5WBiIIo4Kk9okkkpM3Bw=
X-Google-Smtp-Source: ADFU+vs1q/9QSaBOKlOQAd0lK7g6IyNIYSD8KV2dnSomLash3MbdxxCgR4pKoudNdGBonmYS/hyWVQ==
X-Received: by 2002:adf:f4c9:: with SMTP id h9mr10368482wrp.168.1583596763858; 
	Sat, 07 Mar 2020 07:59:23 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i67sm31464673wri.50.2020.03.07.07.59.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 07:59:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 15:59:18 +0000
Message-Id: <20200307155918.1157101-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] files/toolchain-shar-extract.sh: Rework PATH cleaning
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
X-List-Received-Date: Sat, 07 Mar 2020 15:59:23 -0000
Content-Transfer-Encoding: 8bit

Trying to create a clean PATH breaks cases where we install a buildtools tarball
on hosts to provide newer versions of gcc. Rework the fix for #8698 to clean up
directories in PATH which don't exist isntead. Do it with python as the shell
version was too fraught with corner cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 4c4b4deb4cf..0002c9d7870 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,13 +1,7 @@
 #!/bin/sh
 
-[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" \
-	LC_ALL=en_US.UTF-8 \
-	TERM=$TERM \
-	ICECC_PATH="$ICECC_PATH" \
-	http_proxy="$http_proxy" https_proxy="$https_proxy" ftp_proxy="$ftp_proxy" \
-	no_proxy="$no_proxy" all_proxy="$all_proxy" GIT_PROXY_COMMAND="$GIT_PROXY_COMMAND" "$0" "$@"
-[ -f /etc/environment ] && . /etc/environment
-export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
+# Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
+PATH=`python3 -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
 
 tweakpath () {
     case ":${PATH}:" in
-- 
2.25.0



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCE77C8E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 13:58:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l5so20992561wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XBeCuBfcVSAQ3DZuNtp+4TeVh+2tGNTCKBZjYlmnaw4=;
	b=BwSsHcO9fTstAAmIvxqPlMwbbqaNgKvZAZ//cpjmouTIpvOniWsJPFtIjFwfeXhSNZ
	fotllba4JsaAcBVgttpSn7hsC3toLAG2fl2BvdjadowdblUDTTtyqvFeeKkQTptbeuJz
	HHogSXZkHlvCuIw1htP+F6J23WcGhDR/0vTYMtXs92vRR98Pc4mq5AYnmv/ceNaat4Vy
	w5QCogtl8LJgAKJhyS4h3f10usJoLRkS2ggPE5kSWRcnIN9K6ltkqjUNbQr6CeQaq1os
	wTcaooSQkjd8SayCGvtuGt+gxQxP+SKe7jPZyUyIHK/9n7T5LVeFOpMHx15eUQfSMJDV
	Rivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XBeCuBfcVSAQ3DZuNtp+4TeVh+2tGNTCKBZjYlmnaw4=;
	b=r9dpjkxZ95HfSHKW6uiIwxO+Q4YDUElt+WJvZDgLhIRTmyDYGJQY6ZVplOYEvUftwZ
	mCcsGJqbjdMgKhqaa4com/pHXu03Gp/5hBOWuwcwrKLcM0C8U2SbWXSYwRcaDvqHE1SE
	LLG2IGD2dLF7A6FtlCGIzcj8cnNkUssFl1ppwQ2o/PxdtcD3vZ30XNsTlUveVzDX3cmG
	WGQ6XCVJoOj2n+c/48M7H+beXjDlXA9bbswX8bOzoel4CWs6ppHs1kYMKHWCtJYvn3+N
	2fkLezKoIh1Qf1wuuS1VXcaeZI+kWafEk47yY+zmZxmsQqzkdvA6QG2OrSJYN+e88fMX
	pJCA==
X-Gm-Message-State: AHQUAubzPNenzla3QT9D2ePTSjrKKUM2jC1TG60ULomtEvL/W3R79nki
	WPrM3V084GQcLbg46hIlLBpqmocl
X-Google-Smtp-Source: AHgI3IYHqsno5jYSDO3NxfeUn5pWHEJkX/QqXLC3ZNmbkfm7s9I5j0y1uK7Z14n0BjquYbkMXDBzRg==
X-Received: by 2002:a5d:5410:: with SMTP id g16mr20185921wrv.214.1550584708551;
	Tue, 19 Feb 2019 05:58:28 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q24sm1959656wmq.16.2019.02.19.05.58.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 05:58:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 14:58:13 +0100
Message-Id: <20190219135815.18177-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219135815.18177-1-alex.kanavin@gmail.com>
References: <20190219135815.18177-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/8] llvm: switch to the official git repository
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
X-List-Received-Date: Tue, 19 Feb 2019 13:58:28 -0000

Until now an unoffcial mirror was used, which may or may not
be maintained in the longer run, as the need for it has gone.

Also, the official mirror has version tags which allows us
to track upstream development in an automated manner.

${S} has changed as upstream decided to use a monorepo for all
of the llvm-related projects.

Further info:
https://www.phoronix.com/scan.php?page=news_item&px=LLVM-GitHub-Mono-Repo
https://llvm.org/docs/GettingStarted.html#checkout-llvm-from-git

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index eca78af09e4..9e9b15bddec 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,20 +19,24 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "e5cc6808dc0d5b773479bf36c51d59d0d3174733"
-BRANCH = "release_${MAJOR_VERSION}${MINOR_VERSION}"
+# SRCREV is set to the revision of 8.0.0-rc2 tag, while latest release
+# tag is 7.0.1 as of Feb 18 2019, hence the need for UPSTREAM_CHECK_UNKNOWN
+# Remove the UPSTREAM_CHECK_UNKNOWN line once 8.0.0 final is tagged
+UPSTREAM_CHECK_UNKNOWN = "1"
+SRCREV = "98ebe7460199b9cd79eb562b5e8705ad28f5513f"
+
+BRANCH = "release/${MAJOR_VERSION}.x"
 MAJOR_VERSION = "8"
 MINOR_VERSION = "0"
 PATCH_VERSION = "0"
 SOLIBVER = "1"
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}"
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH} \
+SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
           "
-UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.17.1



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D1C7B7F7C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 08:47:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u2so13568431wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vrY2YU7ZoGs+vwCtyA8mTd4nvQexjJpyMXvmEFbcwdQ=;
	b=OXI8f3EDr/4hyGBrJrQmOhd0FI5kzvD0kuVXmImf6wQeqEi050JHcYRBpSyFljT7aP
	MYmAzASKdCPvhtCdj1Qcc6r7x5+uf1o+HLmahQ9wTVfV9n4tpDZHTY5/k55wXfRIJC9Y
	I/V9XSm/OGXCIDwVCxwwR1a6tmgZ+CDGBccME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vrY2YU7ZoGs+vwCtyA8mTd4nvQexjJpyMXvmEFbcwdQ=;
	b=o3mhKtfWghhA0hieQYHQU0R92R8VBr6P/hERTj5rTTmLzFac50XNUUDzKNU3bPKp3v
	yFqSiofV6ME8/wcQPfi3dqq9SDEAAhLcNwjpAihlypolrhciin7Qybz9UD5G25xo1Aly
	Po1vwTago1l3KifpnAZ/nR5NdDuzEZ7NDF/2/6m4xyzQD1geOSor+n8KC5sslnxoYEiV
	3gZGpLhf+qqpYUvUokj/OZ1EjRT5YknLyXTXW5aOkCqaGnzfTCSA7PECi3yc0mzbLfkQ
	hoxWOCPRhXcTy5z45anLtFDu8wmtgs+u/yi8sIJggwZKbMsdk3/Oo9l0rEW2h4s5Yfd6
	PjPw==
X-Gm-Message-State: APjAAAXeYLn6wNsWOJ4JdYrQdL+pn0nUfUhicVRGYaKfja8IDUIM/Tfv
	3FPk4cr5D35E3NZuFmHJPvIBhzMEjik=
X-Google-Smtp-Source: APXvYqwxXeuypbWl/50Q6eQr3aOeik/rTuNduvQH34CM3MCMirjrnUv7GPMN0thpfwUSgWT39otR7w==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr34441867wma.5.1577695662300; 
	Mon, 30 Dec 2019 00:47:42 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q3sm46235967wrn.33.2019.12.30.00.47.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 00:47:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 08:47:39 +0000
Message-Id: <20191230084739.19193-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191230084739.19193-1-richard.purdie@linuxfoundation.org>
References: <20191230084739.19193-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] bitbake.conf: Simplify TARGET_SYS/SDK_SYS
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
X-List-Received-Date: Mon, 30 Dec 2019 08:47:42 -0000
Content-Transfer-Encoding: 8bit

As pointed out by Masahiro Yamada <masahiroy@kernel.org>, ('' or 'custom')
equates to "custom" and this code seems unecesaarily complicated and unused.

It was likely intended to supress the value if XXX_OS was set to '' but the
code doesn't actually do that. Simplify it as we shouldn't have this indirection
if we don't need it, its horrible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 394484b2b73..62b5466b717 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -129,7 +129,7 @@ SDKUSE_NLS ??= "yes"
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
 TARGET_VENDOR = "-oe"
-TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
+TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = "${TUNE_CCARGS}"
 TARGET_LD_ARCH = "${TUNE_LDARGS}"
@@ -138,7 +138,7 @@ TARGET_AS_ARCH = "${TUNE_ASARGS}"
 SDKMACHINE ??= "x86_64"
 SDK_OS = "${BUILD_OS}"
 SDK_VENDOR = "-oesdk"
-SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS'), ''][d.getVar('SDK_OS') == ('' or 'custom')]}"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 SDKPKGSUFFIX = "nativesdk"
-- 
2.20.1



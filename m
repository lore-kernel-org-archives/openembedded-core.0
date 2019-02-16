Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 15AA07C7A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:46:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t200so13168819wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pOLrA1nUynd1BYNP1X6Kt/3nPRWEpD/ys943sCs4y30=;
	b=Pg+OHyKKmIgHkAC8Mqri6q/FhAmiDIaAzLlMq+cFvs9iYep9pelleWLANMFzL/b+eE
	JuYmlYVkP7lK3CBBpTEpDuOZsvsNx5XXvh+NcB2FnMUIJBg7HqEdvpkpb+Qqfi0FAffM
	VcWu80CUgKCj3zhCMdWlH4L5M9x1f//DEC+Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pOLrA1nUynd1BYNP1X6Kt/3nPRWEpD/ys943sCs4y30=;
	b=rVU8O5+dcyrnAV+z2wpB6qfHiFqLIdKgv/fH1EjQUHurKqHZtzqugPw+sCpHDefevW
	DYsZaaH/BCxea0+4x5CtKR1h2XZdWDYBD58WRHAA3sC3VP1Sizhsz1MqCU56/H48bajN
	GheM134G/m3yC7856o96/Jt/jJgKQfJt/AFNru6d3hK8D0YmfJTjFi2OmIEXFit8S1pN
	c+LVC01RWKhI2uLTZmKAQotXq7lBSDs/dlJD74Kwr9AOMpaGr0y69JeO/9nh6oJSoAx7
	O9/EYOAq1gW2fSfD/HxTxrTXOfBgX7BiySzS/MoCkLupJ4F6xmLqUpc5fCWtj6P53tah
	udTA==
X-Gm-Message-State: AHQUAubqu6n/X2d63+N6nLbUuuQuVN2qZL0ySudUY/wvCDd8XSlw1KKG
	GSabFjLmj4aZS6D2jmxGXGoLhrNVuzI=
X-Google-Smtp-Source: AHgI3IYZBGi+uRutvGAjYF5BIanoQnKgDXvjP056LxdTKqEfl1E7AqJlZbEODGJxPJ0k06ERTENr7A==
X-Received: by 2002:a1c:400a:: with SMTP id n10mr10496765wma.56.1550353603538; 
	Sat, 16 Feb 2019 13:46:43 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm7147773wmk.9.2019.02.16.13.46.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Feb 2019 13:46:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:46:34 +0000
Message-Id: <20190216214638.11456-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/7] quilt-native: Remove RDEPENDS on util-linux-native
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
X-List-Received-Date: Sat, 16 Feb 2019 21:46:43 -0000
Content-Transfer-Encoding: 8bit

This code is actually inactive and inaccurate. If we fix other code to
enable native RDEPENDS handling, this then breaks.

quilt-native is early in the dependency tree and can't depend on
util-linux-native which may need to applu patches. The pieces of
util-linux which quilt needs are long established as part of HOSTTOOLS.

The other RDEPENDS are already part of ASSUME_PROVIDED. util-linux-native
doesn't belong there since it has multiple components and is used as a valid
dependency elsewhere in the codebase.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/quilt/quilt-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt-native.inc b/meta/recipes-devtools/quilt/quilt-native.inc
index c7067042e6a..f6b1bd53afa 100644
--- a/meta/recipes-devtools/quilt/quilt-native.inc
+++ b/meta/recipes-devtools/quilt/quilt-native.inc
@@ -1,4 +1,4 @@
-RDEPENDS_${PN} = "diffstat-native patch-native bzip2-native util-linux-native"
+RDEPENDS_${PN} = "diffstat-native patch-native bzip2-native"
 
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
-- 
2.20.1



Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8107B7ED59
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:35 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id az7so17872094plb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aIv8pJ3WUEb06Y0/DoOgNWHtpRzUittm9mT0+UehMng=;
	b=Sz0vjRhEg7M26c+kH++0H03UrRDt9ptX3wyAYxqCWUP7Pn7ptiuwtpDGe4BdlYWKS6
	1aJ3sNjRDsDlLr9cE5sPQbMl9Fzz/Nr8162c/95fSZw6U3xkud0wxct/JeobjHWj1dAj
	ITKSz08qA+Aeg9C2PV08mJ3F6R3BD7Vfffx/Skg7dc3wBNGGlRp+Ts+ZhO1PclzAUX0k
	D5wqErLMjBFr/3cljTtkWAYYNSViGVvE/2PnJG+oRYwAVXRNjZG7bb7I58Hn2Snj7xWt
	pQXvnxUWNjjCVzQs1Rt5dn0BjZszUpw/Q7fYEzUZ+UhYe1A2AwqfU3WiihYSdM6i0Abs
	xF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aIv8pJ3WUEb06Y0/DoOgNWHtpRzUittm9mT0+UehMng=;
	b=hKh+xdWkmiqMcaBuw3vcTWs4ln4OpC4xo11ZMb9u7S8/UPFrowEc1FmACrgWiWiAgL
	U9TMczymvPqqU0NbgOEK+/7KWq9T2uygbL+v89S5hLGgyAfzu2MdF9VjwyzsXoWrfsdC
	yZiWQbWi1cNFOUUsfj5Vz85NFIieqoyjTRMKtW5XPpPH/19U2VJHNBrCJVhKxYt4wsrr
	2CxM2JK7skWHVQ/+Vecri9BMlt4bD6mV6vHn+26gF1O52amM3vyhPT169xgMBkVnpa7E
	EWAsm8LtoLLrrsKtcKs5a807k2yqbu1MBgcZk/jvOTOoV5/lqbheMA+a8qx46V2SbObj
	NBrg==
X-Gm-Message-State: APjAAAU1mIoS8WL0SYvCDstiboxjUNxF4Wa7zvzqS4hLijUe9Mg98mx/
	qw9PH5KA+D5MRiBoLRq5mxrkLUZ6
X-Google-Smtp-Source: APXvYqxEyKohJ6bAC3UoVTMHR8+HwUCRgeMZoMfbd/8/TyJBWYttYxEkxeziUoUI2tTo/Y3g1+xtLg==
X-Received: by 2002:a17:902:d892:: with SMTP id
	b18mr65677261plz.165.1563719136513; 
	Sun, 21 Jul 2019 07:25:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:01 -0700
Message-Id: <fca74928bf2002daf526ad8c1446c8d9ba891a78.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 12/30] go-target.inc: fix go not found while multilib enabled
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:35 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Go binaries were installed to ${libdir}/go/bin, and create symlink
in ${bindir}, while enabling multilib, libdir was extended (such as
/usr/lib64), but BASELIB was not (still /lib), so use
baselib (such as /lib64)) to replace

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/go/go-target.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index c229ab2..379f87b 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -40,7 +40,7 @@ do_install() {
 	for f in ${B}/${GO_BUILD_BINDIR}/*; do
 		name=`basename $f`
 		install -m 0755 $f ${D}${libdir}/go/bin/
-		ln -sf ../${BASELIB}/go/bin/$name ${D}${bindir}/
+		ln -sf ../${baselib}/go/bin/$name ${D}${bindir}/
 	done
 }
 
-- 
2.7.4



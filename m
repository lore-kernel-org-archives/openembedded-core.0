Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 64DB16FEE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 06:25:44 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id fe3so40158572pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/YfxBOIonhk67C5V/JE77A8tm4Zrfjn1flBnxLDIK2s=;
	b=x4M7/zJppehNluTUJ2T1gq+iH8h+GAdydHTp9xbvYBbOPwsN5GShTbiX8qwmOKZ8sG
	pzSsKJ2qd/z81Y2kc/5SGYGxhiW6AjmigHEDlwIxrVPiSX1mLN9ZxJgH9DbdGev4Z1c1
	8C9s6CICjeE4C5ALY6M9ZIUBF1+MS6/fVzKYuQkbIInZJ5HAMcvgAfH3lSaAcKbYQcj9
	ABPxY53hIjp+3eurH6GYTMnqxSAWEsmy03r040PiI7ZkMWNCp6W6BpIBGQ+v/GY/CmAY
	qGSNoL2nCOPGx+HiO29cifT3yS3Vki8L6vlcksCAdrDE7HxFNz/efopIN4p6W17AHHxh
	4XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/YfxBOIonhk67C5V/JE77A8tm4Zrfjn1flBnxLDIK2s=;
	b=OJ//FoNoPh9Pi4rmESZb83LHEQQ0GLii0yOlBrTTfAFIN59RmuMY0yHvpDia5Ix09W
	MuHpBiJ2f+tBPNHYF5RTcSCCakbHi8ir/WNpJ5OZHnUtlkDi/kYG4r07gQVc8kRhnlzQ
	tgsPFrkTptOlGmn+scqnbYXNRNXLjgoMEwCdGcYbh06Al3Uhcs/XfiDoq7T1xGxNcxS7
	+nxW1yiBRY07vEYkXnpw4EF/AAuYJXMeL4KY5/xdpT03GKQms4X6p3NjqlqZ+VUCUBqn
	xCFYVQ6Div+DTCYKcNR6rcWbMmg0Or/gpCz46dDt7cBVjZr4qkcrvvd7FUZIR3/svGsD
	thYw==
X-Gm-Message-State: AD7BkJLQaPhOmPjuC9Z2QkFqPTLfkesPEb3msVE4/yLvEagM0SZrM9X1VKhNyavveAgxnA==
X-Received: by 10.66.253.169 with SMTP id ab9mr18930780pad.62.1458887145648;
	Thu, 24 Mar 2016 23:25:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id 8sm13966042pfk.69.2016.03.24.23.25.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Mar 2016 23:25:44 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 17:25:12 +1100
Message-Id: <1458887112-27434-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH] gdb-cross-canadian: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 06:25:48 -0000

Python support was not being enabled because of a conflicting
--without-python configure argument in OE_EXTRACONF.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index ae97759..6fd3e3e 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -13,6 +13,7 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
+EXTRA_OECONF_remove = "--without-python"
 EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
-- 
2.7.3



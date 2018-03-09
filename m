Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1187893A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 13:00:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so3373611wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EtuZMaoT9mk7neXQSLbMD5Kzt1HCrrpcjMXFsL9A12Q=;
	b=sxINcnsQGMxDr4xKm1gl6LgFiJeT7Unxk7/OnGrLhFJ6vDKmvyJ07ClVr2HE092ADA
	2bIBFx2wAmb48FdLJs+8EY5ynZhlyrjEjXyLkb4n/MQ2xjI8w8Me7gvbrdWxWM9SyAyL
	c0lvlXBrUlSkvKKKi4RO6O3Bh1NPCZvkXPBVzmI8/oHZLGu/uXcJ52nrtzuCOH7uUoRl
	2UC3Qg7dkgwl8kTSewYXQj4iXeNKI+sKkkve6EmivCnjMWCXZDlh1LQ/qc1MbtppaaFR
	GE0hQPXR7HRwesoeoNAOKN6oSdB+JUy7FcwGQXRQEZQczpd2U/Doa4TklU/iwSj/uRY/
	bElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EtuZMaoT9mk7neXQSLbMD5Kzt1HCrrpcjMXFsL9A12Q=;
	b=hhrGZtaCNX0NxI+xkUBqty9tHAU+gBYkh0vrR2bXBseKtkMAwrQwerC1/PXrf9lvVg
	epO8kCPxoKp+gNGwwwewB4DDSA61ijnm/Ckqb0LqnXyZVriSax3Ze2iHr5TOh4UCzNKo
	svoW6Ojmz1NAqCWKnagTk1jI4FF0i6U3QA7E+d02x52a6DZLKg+bwYgi51QRTKt1RFPk
	D4GQ2aqr+9r9VR7pZRfSEG6btOOpNFIX8weHwUh7Xwyx3SspptMrokCCLTIn74IYHl+l
	W1nPgTvMN+mkLSt+2A+4beNKI4CH2rYy7/gKi8pNXeKZcMmutl+0YUcLOX/pbPerSFfA
	kgQQ==
X-Gm-Message-State: AElRT7FezTdmeS48gJeI7x9jZP2/eAOKRQghhvp+i84CyjnFyBaC/xQG
	yTCOauxIh3XJp6gGrwd9kFJv1PBN
X-Google-Smtp-Source: AG47ELuTFbeP7LdH9cDYwIOy+0rlUDO+gnP/QoAbLAnRaTDDdaZ2sW9oJ1pv2JMm1jePvp6taqal4A==
X-Received: by 10.80.231.18 with SMTP id a18mr17163776edn.240.1520600414382;
	Fri, 09 Mar 2018 05:00:14 -0800 (PST)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id x44sm885036ede.80.2018.03.09.05.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 05:00:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 14:00:05 +0100
Message-Id: <20180309130005.3052-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] ncurses: fix deletion of /usr/lib/terminfo
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
X-List-Received-Date: Fri, 09 Mar 2018 13:00:14 -0000

Ncurses doesn't honour ${libdir} for terminfo, so try more options to remove it.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-core/ncurses/ncurses.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 106dcb0..0bfd644 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -201,7 +201,10 @@ do_install() {
                 ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
         fi
 
-        rm -f ${D}${libdir}/terminfo
+        # When changing ${libdir} to e.g. /usr/lib/myawesomelib/ ncurses 
+        # still installs '/usr/lib/terminfo', so try to rm both 
+        # the proper path and a slightly hardcoded one
+        rm -f ${D}${libdir}/terminfo ${D}${prefix}/lib/terminfo
 
         # create linker scripts for libcurses.so and libncurses to
         # link against -ltinfo when needed. Some builds might break
-- 
2.9.5



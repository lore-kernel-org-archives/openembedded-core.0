Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.354.1611586373077634101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QYVGb5q5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id n10so9025977pgl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n878ybmaFJLs7LnffndZAvYpjaDAxPiyuERquVuDNt4=;
        b=QYVGb5q5HVx2fnvjKY0XeTXBU+XVM9e+C357YGUwViiW/VyqandDqX4+9SkBPxmt+V
         OD5cnwEa0L4ucKRY0L+OPP3DOo6noPqduxr2lid9u6QxDgrHfo2au2eKKjUmMvZ0xH2T
         vOOsTrKBWAlf58kxk3WPbIUuHiD84uesTKMTAwpyY5uToYZGlLKMCAB35nCrWXSM/3Kp
         0fauwskCGKeRXV2JIrxoWKinWqPO0m1KJBCryiOb1nMDZCi/Ett48xpGMY3D3khArGJj
         XaScyC6jGChBmHLtiFhefs54WM9wxMhuifYOvqPwAnfsDr7Qmu+KXN2f+AbarwcBHcgc
         HTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n878ybmaFJLs7LnffndZAvYpjaDAxPiyuERquVuDNt4=;
        b=fJyw5txESHnblWZ+SOtb8obfIqZKkDDVMnUD/CdFYEiNLSJD/oF70pTrr+wN5RMzEf
         T1u8ZZuBrrbhS0oijLGauOSdETQdFr0pcaKXMJ2Pgjubu4D4yfkg8wY92t70SyMMyG88
         OrUottScVzlWf7MuEoDckyfW1riW6q2lqydYy1OPiLBbA7D6YjvoE7kkv3BkE6oyTfVw
         8Ed8LhKrO8ezy1WkaWntbBglh7OX4t1/KyXiO4o22YVs/ZiqLeXQhkzY3XJsrhOaaXOk
         ikzsDEMcm1esp1/BIOk2wU37LNotUdsWyDzA7+0mPyvrEKt7gwYUdVpT/o8/kju4KZwO
         Zhyw==
X-Gm-Message-State: AOAM5302axgy/H3ZyHkIZB2wwJsGIRdpPqKk4NKWINoyENJxj7mT+GQu
	YD0LhBuaO/YbzNCrS+s87wbZD5zvvAlKLEI/9Vg=
X-Google-Smtp-Source: ABdhPJx6rYK7EdA7mUwaWXY/uT+3oJtIGkpGc9MD0Q4V/QYv8G/k5L2arZtkX3Nb417M5Z5wupPYyg==
X-Received: by 2002:a63:d901:: with SMTP id r1mr949768pgg.209.1611586372165;
        Mon, 25 Jan 2021 06:52:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/47] tcl: adapt to potential pseudo changes
Date: Mon, 25 Jan 2021 04:50:57 -1000
Message-Id: <74c75d48267ca7fcbba738bb015e5e8e0e2846f4.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

It failed as below when rerun do_install for tcl:
 $ bitbake tcl
 $ bitbake tcl -f -cinstall
 [snip]
 | NOTE: make -j 72 DESTDIR=/build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/image install
 | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
 | /build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/temp/run.do_install.3490694: line 184: 3499214 Aborted                 (core dumped) make -j 72 "$@"

By default the S is ${WORKDIR}/${BPN}-${PV}, but after unpack,
the tcl source [1] unpacked to ${WORKDIR}/${BPN}${PV} and all the
files under ${WORKDIR}/${BPN}${PV} are acutally the source files.

But the the main Makefile.in is under ${WORKDIR}/${BPN}${PV}/unix
for tcl, so there is below logic in tcl recipe:
S = "${WORKDIR}/${BPN}${PV}/unix"

To adapt the potential pseudo changes, there is a general logic to
exclude ${S} from pseudo database in base.bbclass in [2]. That's to
say, just the dir ${WORKDIR}/${BPN}${PV}/unix is excluded from the
pseudo database.

But it's not enough for tcl, we need to exclude the actual source dir
${WORKDIR}/${BPN}${PV} from pseudo database specifically to fix the
above do_install failure.

[1] https://downloads.sourceforge.net/tcl/tcl8.6.0-src.tar.gz
[2] https://git.openembedded.org/openembedded-core/tree/meta/classes/base.bbclass#n396

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d835f8069a336fd6bab1058d4e605a81c844212)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
index aedd96b021..e6feb25a7e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
@@ -32,6 +32,7 @@ SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 VER = "${PV}"
 
 inherit autotools ptest binconfig update-alternatives
-- 
2.25.1


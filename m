Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.12885.1611672200020893467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EzzcKpHZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d13so4130638plg.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n878ybmaFJLs7LnffndZAvYpjaDAxPiyuERquVuDNt4=;
        b=EzzcKpHZL/g1wfPGOgH7mqpgS1dCuYqvePrNMyvNa8+rpLMkXbWY1JRi4iHFdleGaY
         WyNdJ3N5WSl1va1nkh1eeQJWWcbFlIrhj9ByXInKlny5yD8S1brSIwQ0KyoKUJB40KVC
         f7wudHdlPAhVr/Cwy4XeSFj/zW64FSz8+ulhHXTPi0aj6UViETKsq5Rq2/Ul34mrx5w3
         s7QEq9ga+euJbnW+kt3bbQIEDkb75FZgrjXjWObcNT/2Oi5tAqUjkQ1lfH9yeY84Eb6+
         udw0jX2j5XEnQcqQgGbok4ObORaDSGSEmrXAlPtDHnocB6p9CXhBFUTpsI974TyGKfEY
         gZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n878ybmaFJLs7LnffndZAvYpjaDAxPiyuERquVuDNt4=;
        b=Bjplppc1U7Kq+IZ8nyFo+DNpwOVWAzX5pIExQhkH09yqBmqdNs5382PB8wQd3r/sVe
         QWWfab5yVz0ihVKUK4/Mel5IDzMpPx1Y3O00jKrLxFFFEVypQQxSdU3//p3vXP6qWY0G
         ZHtfGH/HUgaE+8a/8sChvvtFwF0ZibVqhn20fgrf2l4ZOkXKME6D9snhS+prfl+Xc3P1
         k5yA47Vl30PrfW6LB/H7TTSIMMJDtnNS9ERBqxAGXtxHsrrSxG2bPVTa2udCF15KAMnK
         O9MNVMJLLmCXjxTamFzqorbXH1h2xvrRCe4WewhpcUyQLHoQ8InvE7WrBIi2rEnH9C31
         iU+g==
X-Gm-Message-State: AOAM5319txoJR24PYBaVZkqvN2tr9f+K8y3YrkDk7Pl/2iy/jjZFpNlM
	P2PzPX+/nzHALRcpBNojYFXVhmJW7zSvoMDs3fU=
X-Google-Smtp-Source: ABdhPJzB//qOTI/Mpre0M/mTfqohLdQzwiyphaKdL+TZOXeDUPLiJ5LSvEmcXY5/Gum2h/cnNi1CUQ==
X-Received: by 2002:a17:902:ed83:b029:de:84d2:9ce6 with SMTP id e3-20020a170902ed83b02900de84d29ce6mr6259897plj.4.1611672199082;
        Tue, 26 Jan 2021 06:43:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 24/46] tcl: adapt to potential pseudo changes
Date: Tue, 26 Jan 2021 04:41:35 -1000
Message-Id: <139538905c230e38c39c71d988dfe6c0e0b6d675.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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


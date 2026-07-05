Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B67C43602
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:07 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139225.1783291385185268248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=4IFDSjwl;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46ed4f66256so2139451f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291383; x=1783896183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeTLLOBIdXL5Q42JJCBTRUylIGlHZdzGOag6XvsPxk4=;
        b=4IFDSjwlvr/0noMzzeKXvVCpP6N0iifY3lL6oZpjaSSgmxPx2yLhXmH9I+2sHWKBmS
         ptjdSScL56n5Y7XIbQz5g4+rVyWAXDW14VvrYZQ7rLeAFX18oeJEIhZ/6yllaieLvZkZ
         gj6eFh41i/BfcQjltrMJhsrMesDe3wWC4KF9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291383; x=1783896183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yeTLLOBIdXL5Q42JJCBTRUylIGlHZdzGOag6XvsPxk4=;
        b=Axo5FoXbQe4qMt9s3wh6hJYDE7B3a1Q/nmvGkTx6SR+KGYf2OPhVrvA8SgGLoX7cpT
         vgSkDoKkceFKdAPBx9wxUqE0R6HQRRVel8LOYcBVQElaXPOGrPB0yLV9N5ewNUVbT7RS
         dR1Wgi7i4uN4rOPC4Hgw5nZMKbNbG2IahbpQFlvoqnaRJIVurTNpSaYYSatOQjpqd+F7
         LGi9yiozIp9NlLWmBPLcg8uTRmJOHdgLCxYBLRSomGn4tzFfwAXXQxlbrsQDZRBqqqLq
         CaR3aDs1nAcyMpFrQ14YQFazGDBUwed1KrF/eU5bs8bpAU4RifBxKSs4bH7ghghCaAx6
         duGA==
X-Gm-Message-State: AOJu0YwULVrY4JzFDhVcLlRV2N7E9gC6UdLIBdiaKTC1qWFaXeOeIW/j
	F5V0+90tFW85CmhZa8gBc1Fwcx2ddgRZBRZ3u5HHvDkC97srQ8ja8IEw7UFgj61ChPEMcmPT8BC
	/u6yNh08=
X-Gm-Gg: AfdE7cnzWoXqdkXfPtQnuKSDKeAYQqoDISXxvpQPIjttlYvUKlStOKetXXZ8Pbhornp
	LRyjVt7VMKYl0DwX0BbZ5/v2c5ZbDrRSg00X2tyRdtgiu/fOHP0o5/5PjJ0VZiViS8FnyFBPOju
	Jy73PG0pG1lMEfgNTSxwYLBHDKoWkwYeTBZbeoa4xzZA/VnXKFJlyIrY9Wx/sr+3Xj9oW/Rs5y/
	TvsXy5smq92J1zT7C0DBGzrMEQPie0k0EX/97U6hfZhzqtZHKLGRHuWfx0I3mHiITeZ7W/4GBt5
	C64kFN8yWLxKhLyqdMNhUhDBuXD05lpXE4vCZ9HhKXfS1uKApb2OArrxT8gpRxf3yXO4PHZqzuR
	RADXzTvOJoC+NLKXhr+jJuHsJYxYn78dYq6R29uPf1EtHVixsAteEC1ETcEUtmdWkHo6sCjmPjq
	6G5u+4vzEf6Mu4XoaATYAdpgVoKlIgX3a/jmSr
X-Received: by 2002:a05:6000:707:b0:478:4457:21bc with SMTP id ffacd0b85a97d-47aaec5d64bmr8820050f8f.60.1783291383396;
        Sun, 05 Jul 2026 15:43:03 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/55] texinfo: add missing perl module runtime dependencies
Date: Mon,  6 Jul 2026 00:41:25 +0200
Message-ID: <93c30ef081beea0412c7149c1ff1e81782124378.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240189

From: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>

Some makeinfo commands like makeinfo --version, makeinfo --html fail on target
with errors like:Can't locate xxx.pm in @INC
This is because texinfo's texi2any requires several core Perl modules
that are split into separate packages in OE. Add the missing modules
to RDEPENDS so they are pulled into the image automatically.

Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfe02ddac02e4d949dea67db20979565ea4c3f30)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 2 ++
 meta/recipes-extended/texinfo/texinfo_7.3.bb              | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index f97a28cab56..768a0383c5a 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -37,6 +37,8 @@ DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl-module-threads \
     nativesdk-perl-module-warnings \
     nativesdk-perl-module-vars \
+    nativesdk-perl-module-locale \
+    nativesdk-perl-module-config \
 "
 
 DUMMYPROVIDES = "\
diff --git a/meta/recipes-extended/texinfo/texinfo_7.3.bb b/meta/recipes-extended/texinfo/texinfo_7.3.bb
index fae4e510b45..5d942464d49 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.3.bb
@@ -77,6 +77,10 @@ FILES:info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
 
 FILES:${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo ${datadir}/texi2any"
 RDEPENDS:${PN} = "perl"
+RDEPENDS:${PN} += "perl-module-if perl-module-utf8 perl-module-encode perl-module-encode-encoding perl-module-locale perl-module-integer \
+                   perl-module-file-spec perl-module-cwd perl-module-file-basename perl-module-getopt-long perl-module-posix perl-module-data-dumper \
+                   perl-module-storable perl-module-feature perl-module-unicode-normalize perl-module-charnames perl-module-unicore perl-module-file-copy \
+                   perl-module-file-glob"
 FILES:${PN}-doc = "${infodir}/texi* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"


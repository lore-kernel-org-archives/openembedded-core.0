Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 051347F50E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:18:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o18so7343546wrv.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gmEmLKAGwPB9AoJILNAYy8fEJLanpDg/96TWc2Easio=;
	b=rJjbu5duKfZGtEKB78uGuo02lfQwPmXbnFftg8KAGXlHG/2FDe+Eu7vzV3Yw/avx3W
	9HkrH/yJ8ows0/SaB0Qr56fb/2UgUvzDVUhF3yVgIi3Lv/rTci9XAJ8cQrLN1nI8hh35
	qsi9tdgECyb63H52D2LSngW04rNYlA9fnpU7a1Y5RGY+bsYo7fCpEycqcIG10MeevJ0Q
	g1x6E5UEX+o8GhSNQ37M3wFxcKm4yBWaXMQaGr/tCWXYNQI5NDJfkYCVUj21US/o33i6
	SmiX+gRdWssz0I+jHblkjSK3/HoJkn/q91OOWM/AqieDGuxUbFj49rFjEtoUe2ju8Bw4
	KtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gmEmLKAGwPB9AoJILNAYy8fEJLanpDg/96TWc2Easio=;
	b=ob//Yh1dhLKL5PnLpt0WN2vp0J1DthzsKCeNo27XGf4C/5Iup1UCWEpDAwtteMICcl
	J79EFuIO/NZXf+sAMOFkgDVAp7GPl2YjtXsbG6swMebKf7SzIEiJ1i1n2+dHa92tfYhk
	N4/YtMblbsZtgkFq0Q/0/fH8z8UC4gdjBsJ48FLmGN3oFui527PgtY9IzwRXf1VKm2eT
	Kjx/W6Cg60L+bQkKStqHYTBwwGF27byF8Nm+45kEbbslEX2XAyFiicIi2nUpK6bcJnLP
	tSkr4mtVHikrVC4Cb1yrlaCT++8gfcBYb6v1mi1ngPz+gwLL7MRScOi5IAGSyWDC6Gz1
	mbyw==
X-Gm-Message-State: APjAAAXpjjftFBpcEg9G7qCYtDXECZKrAaLu7GUcWjuDWvUzBaPV7fOB
	KwRPqEle9E73t+hazzA2mOJx3uVElKQ=
X-Google-Smtp-Source: APXvYqwzjRock5LqoOw+xxYfWL466x4WyKyynq7j1pwzAVpZBfPAVHbhJ/ndrZR3AGQqfbPGlcWD2w==
X-Received: by 2002:a5d:420c:: with SMTP id n12mr7782864wrq.85.1570706338614; 
	Thu, 10 Oct 2019 04:18:58 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.18.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:18:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:43 +0200
Message-Id: <20191010111848.3825-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/10] libcheck: split /usr/bin/checkmk into its own package
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
X-List-Received-Date: Thu, 10 Oct 2019 11:18:58 -0000

This allows not pulling in gawk, which is gplv3 licensed when
only the libcheck library itself is needed. checkmk is a
development tool that writes out a C boilerplate for tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/libcheck/libcheck_0.12.0.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
index 94b0dc1bbd1..25ac2c4b260 100644
--- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
@@ -18,7 +18,12 @@ inherit autotools pkgconfig texinfo
 CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
 RREPLACES_${PN} = "check (<= 0.9.5)"
-RDEPENDS_${PN} += "gawk"
-RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "checkmk"
+
+FILES_checkmk = "${bindir}/checkmk"
+
+RDEPENDS_checkmk = "gawk"
+
-- 
2.17.1



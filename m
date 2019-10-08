Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B82BE7F38D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:44 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q12so10915870pff.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=Un8+40wCLFpOriZBw2ir8p1gBOstcviHZllKPf3fmcss22b3vpJRCEhyUVeW9AKwoI
	kq4YlsSoYkktbjUV9QaOUgLhHOoAsa6U61pHobf71Uq1KXfpuJuMsm6LXryDrMG8HPJq
	3tZYm3fv5f3rBGpb/dDxkD5ojGlOcjLLBukYaPMGp6Q4nafkD5RFw8kVWwYOQpKvKj75
	kwryiVsV6Zb8vPJp5b+PscdR9CkTBxaNJRVa2YxhaIwHGEbI5AbwBTHSzwwaJIb35trW
	gd227PJ/S9jvlryzXlmdq1QS0853vfQKAVzmJwNDtNRZYpX5H0iFEhPYhFCAVR2RxXG1
	Qe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=JFynBKwC+IdZZ9816vrvz+WrNr3YGUT8licD/cW/AilKmM+zYc7DUSfhcqbXz1LAnc
	OgvW/z1aPFVvcK237k0Rlctp6Fe/r3UVvz4YV6PQlDSJHLEKgG0whCiIqex6POfrwMfM
	AURoed8fpt+qW3vkLbU0sFL62J9N9jZ8+LXui3PInBz0Drm6XV+HI5d2tlw13fBOC8jB
	GsNxnYe458jAxlfR2vwFtruTes5KYliuzAAyEHg9KPdv2TQCVp+j5tRFgcICAHg+iSY6
	rH6FvkujLnk0M+qwRcQQQFa6tfWXbkmz3qrreVuhz5gBzAYfRe5BkJWJTbMOQ6lEPWW9
	wekw==
X-Gm-Message-State: APjAAAUs2tiXaFNVuZmS5Ms+7jQVAPKa8s2B4bBv72gsMlj0u6/1EeHL
	0qBGdnkqIntGWR1nQwL9T3Ir50/UCl0=
X-Google-Smtp-Source: APXvYqwG8RP2ricaH0PIkENsi+si0ucQqwVhIjHsxwtxQnZ8NiNxWeDs88o3tmIzkmVqdIv0QKl38g==
X-Received: by 2002:a63:6843:: with SMTP id d64mr27913946pgc.75.1570547085625; 
	Tue, 08 Oct 2019 08:04:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:30 -0700
Message-Id: <07b19cd9ef127ec87f727e154eda62272a828275.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
Subject: [warrior 03/10] json-c: Don't --enable-rdrand
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:44 -0000

From: Adrian Bunk <bunk@stusta.de>

In recent years AMD CPUs have had various problems with RDRAND
giving either non-random data or no result at all, which is
problematic if either build or target machine has a CPU with
this problem.

The fallback is /dev/urandom, and I'd trust the kernel here.

--enable-rdrand was added in an upgrade to a new upstream
version without mentioning any reason.

[YOCTO #13534]

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68..e6a3899 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -20,8 +20,6 @@ RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-rdrand"
-
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
-- 
2.7.4



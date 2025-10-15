Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67705CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 22:26:11 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.23.1760567161178387461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 15:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EM/HCmFp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42557c5cedcso45347f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760567159; x=1761171959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CoCM3D3q99f3uraMd2qCixbGqR5XuYHcieTzPcGsLW8=;
        b=EM/HCmFpJThJbGrJD3C2W3vQ4N7xzcCqwMOJ2zx1B0LHPqgxNCAwyusft0/Q30yFRx
         t2JSpGQMkFZLmjZ1+hwGIpMyc6xQk5GiRywiI0s5j/W7bRRIhIfg+nHnawSQUN2ibHki
         uwc3akwkOf/A0sTztefxaiD8CNSxtyYwwO5wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760567159; x=1761171959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoCM3D3q99f3uraMd2qCixbGqR5XuYHcieTzPcGsLW8=;
        b=exu0wdA6Cx4bVKkwhZ57zix/ZhyWsAPlvJX59+aY7TZMeApRiS/W4oh/nFU6IOugxq
         JiEewqlxNg9Fv7ysuTLcfhmqfAra31D/ZaIazWaTdo4fy6+1Oq0F9NzO1oimDRrrqI6I
         QuyZUkv+4bfMnnYr/ngpZIGTujsvDShuahUD+JuRglLW1GkXPmAMeRdaZZZJV4LjIXfb
         wbnd1y0h/QVpLf0UBKEQfCZzvmPyab1rksOdUbs/rV5qz7fsKBhXvor7tXeDgiNxFGCI
         1GUjRUw76Y0pNPT0B/ZEq2R+TZjd0uYqL8FkjGAUdcvVF06Icd3SAunhZaqFqAegNvDH
         5MWA==
X-Gm-Message-State: AOJu0YyN0To4ZO/UcRsm/3P8CsachFoeJIer562nM08i73bpwXCLMC2X
	LrLebAAQR2qy+zO4Ea8q3fjFN2xa7nE3tjnvzQpJSdBLiff6tiTKKWCRUQvJEH4hE2yFu5ZljOh
	VBRIj
X-Gm-Gg: ASbGnctF0y6QA/jN83wBgEUJ1B0SkJcMi/iET+LiSVDCKHGoKcYyXdyWSWTnFcWLhu6
	LdK0Q1ImjtPB7mIWudkVQlNohAVhGFl/w+viNVW40yrJ+i7hv2UosYkCdqrcZ5Ed2bGRXo07FAH
	M3UpGNdqs3pKwDQer60MWSxDWtqIdF/C9SkOfhA7mFs1hPC+J8XCCBqjAxcMaV132mBtjX/o114
	jF580HXJodxbQbqrJUOJo53zCknAGI8nYl3J3jd2yJvs1/ghJ1TghL3RmjgrcX4117MK0pvdJ3r
	47o3Pzxl+s7CHparBkmBzw9LOl35eAmoNItn1GnbuWRJG3lPri3imOH560EuxbSuHKLooCH+4N3
	6sytXOfvwDTqxlkyrjY2WmDyQiL0XFE0+idrwAjZs5sFjoZgkAvct9RUYWYCjQtbiwZeiYXX5mh
	oTah13bO6NsWRS14E6WK3HiVpDvSPgMAovSrVoDOgBr1+fmcyD
X-Google-Smtp-Source: AGHT+IHCV1JM2zWX3NoOnBaeUIJCTWVGXrbCOXZWVCd7fM+5IT9Q0cjhxLAWEdQqcZB8V3w0ffn+Gw==
X-Received: by 2002:a05:6000:4308:b0:425:8bd2:24de with SMTP id ffacd0b85a97d-42666ac2dd9mr16752650f8f.9.1760567158944;
        Wed, 15 Oct 2025 15:25:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:331d:2cfd:b88e:41d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d0006sm31414464f8f.34.2025.10.15.15.25.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 15:25:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: Tweak reproducibility fix
Date: Wed, 15 Oct 2025 23:25:55 +0100
Message-ID: <20251015222555.896797-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 22:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224908

Instead of building libperf.a, we should run install_headers as with the other
libraries. Hopefully this resolves the remaining race issue around headers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index b0d796e9cc0..b69ba2ac122 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -10,8 +10,8 @@ HOMEPAGE = "https://perf.wiki.kernel.org/index.php/Main_Page"
 LICENSE = "GPL-2.0-only"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
+PR = "r2"
+HASHEQUIV_HASH_VERSION .= ".2"
 
 # zstd is required for kernels 6.14+ when libelf-zstd is detected
 # Respect the coresight machine feature, but note this causes a
@@ -178,11 +178,10 @@ do_compile() {
 	# There are two copies of internal headers such as:
 	# libperf/include/internal/xyarray.h and tools/lib/perf/include/internal/xyarray.h
 	# For reproducibile binaries, we need to find one copy, hence force libXXX to be created first
-	for i in api bpf subcmd symbol
+	for i in api bpf subcmd symbol perf
 	do
 		oe_runmake -C ${S}/tools/lib/$i DESTDIR=${B}/lib$i prefix= install_headers V=1
 	done
-	oe_runmake ${B}/libperf/libperf.a V=1
 	oe_runmake all V=1
 }
 


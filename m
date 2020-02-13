Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id E685260BFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j4so2556596pgi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dpESKMEjmNzsIDbp1oJSSB+DDjZAGV4s1Va0tBQRmss=;
	b=i70FFIGKVHyNY4ee/cl9/dajZWTwgZapDLwdmBie/vw0MRwaTVtq4jOT0vCZmkaD2o
	kDyCh40f0Xwd7vWel0/dYllg0sJA2jtzqFWX/T1FqKzqDBj8Ri/OoZ/RKRxAyqS8DLbX
	AuqRWwES1p/qM+IDANeAIBC2Bh3oYbvNHmuAx8Zn7yqEFW+TK6fmmGn6MncdYFtYtMGI
	Tx5p9ZwywgptKJZarL08UI3JkxClzT5TiiRIgDS3fiowulqqsJ+UubgBbuNnxhtdYZN4
	BF8vZwaPGPFGM+TGjgB2Wpy6UuogiF4PXO2QhAkDZ3E9smwkMCeek4+QfQXyPfiVpxER
	+kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dpESKMEjmNzsIDbp1oJSSB+DDjZAGV4s1Va0tBQRmss=;
	b=N0YEqY8jdU6gsRR7tftmioejlH3/r+Tdm7GUgpvU1VJoMO7AX19MBHIubxxPPSEwQk
	Imnv1ymktfCwaTSIdG5cU54+6SkOrfxnwNQvVhqQlfDjMnL/jDEfEfGxerjD1F+l437U
	7zhg3RgUBBGT8yerbPeLbifL7SqLaLyxv1a4bM1drIctRoZ/oSt900hCZ1ITnx1+Xnw1
	Hg56qHFmpcelS3RL/TRili8mtr/CTQriPX+bJpQfjVk02NlFa6pxxhHv2x61FMS+ChpA
	UZFSNLsCdWSIER8F1hV/ag1rx2tpeFZpLkEhAtjrYUzAtVOIpjYZz9wRcLuBWDBkXN+Y
	4SRQ==
X-Gm-Message-State: APjAAAVRFvkDvadic8SdzfoDCTSYhuvku1RAMi9taQ1jnhRGtJYTCiRk
	mi4i4I3gfB1Y4xBQdyenBCAz1hEQuHU=
X-Google-Smtp-Source: APXvYqwmgjC92wMjHXXgX8bq8HCzuNXmq0Yg0x3wZvadTNXLANyLaUA0z32oFAjdC+ENfswjE/Ny1g==
X-Received: by 2002:aa7:8695:: with SMTP id d21mr12615145pfo.199.1581575903473;
	Wed, 12 Feb 2020 22:38:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:17 -0800
Message-Id: <03e628eda8b5438fbc6fb1cd09e0d850485d2dd6.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] libsolv: Enable rpm packageconfig by default only if rpm O_P_M is enabled
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:23 -0000
Content-Transfer-Encoding: 8bit

opkg also depends on libsolv and can needlessly pull in rpm even if
the O_P_M does not desire to use rpm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
index 502f4e0e85..265a27c00d 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-PACKAGECONFIG ??= "rpm"
+PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
 PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
-- 
2.25.0



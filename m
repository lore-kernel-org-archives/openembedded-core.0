Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 31CF160619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 00:48:46 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q8so313206pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dpESKMEjmNzsIDbp1oJSSB+DDjZAGV4s1Va0tBQRmss=;
	b=QzbYHCQo5IYee/GbPfmhQqoozgV3AqvXF7/bZY53wrRLtNvsH2Iegs1S1HrtJy4knl
	Mm4FMnIxiNwoRLmZdpmbq1cKSYMu//MT8KKUVi2hgWpqUM65BFwJGXWUQIVuffT5ap+c
	MnvJGd7BSkaSLXHGxsuO7QOwQSWraq6GSZL7evG5217qmnD+i8koumARvyyW+o92w95O
	8eR249EMcpmcTKIetpwz9GKpY53Zhdl+950FZnbPO0mPdUJvGawVvjOChsJ1iCiHN3Df
	G6CDlhOg8nxMtAbytOKa7WINgiLhKvescnrrRgiHQSePDt12d87LqzuP+L9aS4FT/M+b
	mjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dpESKMEjmNzsIDbp1oJSSB+DDjZAGV4s1Va0tBQRmss=;
	b=IPaD+Rfdjk2m+SUmobCS0rG0V5rFfVjv7yeY07Q2cbKR1Rnh+/v8wxhastsWcTiMHl
	bMcz0WHMURGtiVohyOD5NUAiRuO5hftv6cQzyMWe81XBFW3HUG9/fFF7sBwVkwb6grDd
	SpF0qi11ReJl3EFiJcnfpKmMrhjdebkts5+oMWzBACgffylg2oozWiWWOEWTiksyji46
	CuLTTHm9J/wMjuddrN/VGWPZdWAlJxm7QGZKEyuw4h+Ii/F9ZM3bZAfl3DaT4IKbJ6US
	hoMaQ1uh3GYDRAOVZSET7fOSvr1txtUxLn99gVMAyG+ge1q2EQNDjE1x22od2Vf/WYJQ
	YjxA==
X-Gm-Message-State: APjAAAWevQO/D0X/50nWvIHBLOZOOtkCIFRVUiGmfeXZLOvAUDilrqV6
	VnbEGKXT48f6dD0C2/ccWYOFxlXu7wQ=
X-Google-Smtp-Source: APXvYqwRPfdRct4P57M9HD2CLLGHctPJ1t41LfXH6fZu+lIJ+lmYBcJPxWJqDTjJsQvZL0k4UPpIKA==
X-Received: by 2002:a62:2b8a:: with SMTP id r132mr5643992pfr.56.1581468527717; 
	Tue, 11 Feb 2020 16:48:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	y23sm5495785pfn.101.2020.02.11.16.48.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 16:48:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 16:48:52 -0800
Message-Id: <20200212004852.4046470-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] libsolv: Enable rpm packageconfig by default only if rpm O_P_M is enabled
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
X-List-Received-Date: Wed, 12 Feb 2020 00:48:47 -0000
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



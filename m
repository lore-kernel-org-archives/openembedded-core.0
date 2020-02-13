Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04AD560BF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:21:59 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p14so2697468pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dpESKMEjmNzsIDbp1oJSSB+DDjZAGV4s1Va0tBQRmss=;
	b=L2qtvKCUuWtrKX5uBldKc8ocduly1UsKIG2zMYU/TEosez2l+6bjb5u8R8GKe24roo
	S8M8isIN5vR4+KslJnCfLveFpjCvRFHIunK+nnjSFOdwC96UOkrjHsB6zWNvzweiGniB
	76cnNMrA3coqk+gAaQ/rleEX4fyw4fuB1H4948VMTveNL3TIDKqBjBlVCShyJc+EXwPL
	tCiQhJHYu5PfrKkB8N6p4euK6mYf3/RaZzyCZgyVmeppXN2JSt3MR2uj0yBz3Szhr+tT
	cBfJGq/bOiA9XDMcT/IXMgXR3GZfmdhT9VRSWUCcNXqDeepW7AfxMHWPVwYjQqUKEx41
	gyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dpESKMEjmNzsIDbp1oJSSB+DDjZAGV4s1Va0tBQRmss=;
	b=VDbsp8ARKoIOx2hkB59MWPoMWBiP8clF6vPD7IbM3E3GY1MucGTRVLOr10JuQ9eEk6
	xh6CS73KfwT2L9IqfNCT/EVHs4blpn6gOR2x9OJtPwwqdXGoGkTZp6esh+nuDoX6/7lL
	QIzY7NmQy3y5QOw2lems06Rt/ly3PsyJ2nKWOXVOzoUVv0Z8MnMpQUKMuy5RkDoPMZaB
	jB2GdahAn1QvHQtbGwuaG35clj6ZW0t23Hmk6wFmyQVfxZlW+pByljXPD92FvlVwPRRR
	29r6yftrxuArzs28iDLS4O1oa/Gx2eUXB5vwT3+tGTXqx5u9yBDHrKmaNSBd2EpFN8ED
	ojoQ==
X-Gm-Message-State: APjAAAVf8cvHwONFSAfboIn0Noe2aUCmstJdez7NC3ZthT5CKCCJjkC7
	uUmUGzJ2S4nxVGtBEfugDeb1srnav9M=
X-Google-Smtp-Source: APXvYqzQiqqUX3AwvV3Rwqm1FP/fSVs7rv9HZxi9yECcMspgil4lZAogmF7yOzKYJc4+DJXa2y4OiQ==
X-Received: by 2002:a63:3308:: with SMTP id z8mr16492008pgz.230.1581582120448; 
	Thu, 13 Feb 2020 00:22:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.21.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:21:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:52 -0800
Message-Id: <03e628eda8b5438fbc6fb1cd09e0d850485d2dd6.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] libsolv: Enable rpm packageconfig by default only if rpm O_P_M is enabled
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
X-List-Received-Date: Thu, 13 Feb 2020 08:22:00 -0000
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



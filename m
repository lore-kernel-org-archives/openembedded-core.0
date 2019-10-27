Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 91DBD7D97D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 10:15:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z11so6823540wro.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T6ALMJYOiN8zFbfjaysLIOkB/9J4+mP3s1C29B8aI8c=;
	b=UIFQJ36HGSd1JNFS/K3ug2TxpZQC6reYxSev63sGtWwKyHddaTYmvT2FjAZNJnetWO
	U6Z3aU5rJhTmL07xnzHQQ5FPY+NPloZ2th+uBJiTxNV7bY4D6YZ5/iR9LGxqILyvETSi
	CdRYb0cvFKHPM9+npvbTanb0DSIySAKvr9EUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T6ALMJYOiN8zFbfjaysLIOkB/9J4+mP3s1C29B8aI8c=;
	b=jH/5yq9JJSHaxsPRU6wmPyT6p++RniAgMPClZzGv43MEkULDntFzb9hviDZ8DoQ6GJ
	QupY3BrA7u3GyiKCFwPUJVuaIcEBKHMyqbC4RPt5x53KEgqGNrzb9D2C4mKBMSIN/ZpC
	yIVbdCTcD9+LsT6KcF31WfT+RzQpn5RDL5NHxZ2cD7lsZFvrg9cuvEDq1N1cj3ldd5tu
	3H26EQIcPERcS8K4ClBojr2IFeiq2KrMG92HRn9M8occLMT0xh6z13/2QguCRiyR/p9M
	vomcfEQmhRyZM80+cQNVH5IOuX439WfeCrtyrC6sJPmjspv5U3mmPHb+vPWPnQuiMSzV
	+lkQ==
X-Gm-Message-State: APjAAAV5t9lhjQuRsIY/4nMCWespeNRrdGUEf66Us7aRgMrBXIJws1Vu
	P+XSzqFej/2sncpCPmIU+jDEVD6jXn4=
X-Google-Smtp-Source: APXvYqy+CkjGxY7UkrHX1f4cWJr2Wb6lLRVsHefo7Zb4zSViH4zHnoT65w0XWBFSDIfIlN/jNRWapQ==
X-Received: by 2002:adf:d846:: with SMTP id k6mr10829260wrl.178.1572171308996; 
	Sun, 27 Oct 2019 03:15:08 -0700 (PDT)
Received: from hex.int.rpsys.net ([176.12.107.140])
	by smtp.gmail.com with ESMTPSA id k3sm3613229wrn.95.2019.10.27.03.15.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 03:15:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2019 10:15:02 +0000
Message-Id: <20191027101502.23140-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemu: Avoid potential build configuration contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 10:15:09 -0000
Content-Transfer-Encoding: 8bit

Changing the gl options to qemu doesn't result in a correctly rebuilt
binary, the GL linkage can persist from a build where it was enabled
to one where it was not.

As well as clearly being incorrect and non-reproducible, this caused
some mystery failures on the autobuilder.

Cleaning ${B} at do_configure time avoids this. Most recipes
(e.g. autotools derived ones) already clean ${B} as appropriate and
avoid this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bb444b63d97..601fc2286b3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -95,6 +95,7 @@ do_configure_prepend_class-native() {
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
+do_configure[cleandirs] += "${B}"
 
 do_install () {
 	export STRIP=""
-- 
2.20.1



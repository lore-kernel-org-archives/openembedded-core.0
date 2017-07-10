Return-Path: <jan.kiszka@web.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Jul 2017 19:42:41 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by mail.openembedded.org (Postfix) with ESMTP id 9247477D2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:42:40 +0000 (UTC)
Received: from md1f2u6c.home ([95.157.57.47]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0Mg7Dt-1dIBex0CsH-00NRS4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:37:38 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 21:37:27 +0200
Message-Id: <2f4578ff1d9806c847db0de79be208bb0af8c141.1499715449.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1499715449.git.jan.kiszka@web.de>
References: <cover.1499715449.git.jan.kiszka@web.de>
In-Reply-To: <cover.1499715449.git.jan.kiszka@web.de>
References: <cover.1499715449.git.jan.kiszka@web.de>
X-Provags-ID: V03:K0:vwC18zZ5gUN1IBxBCaD7Vh72m1XIIiDCQm9f8gzSK6UF3xUnqZZ
	I9ls1JdI042MmvMRKQwmMDIJor52ZOVhqPbfd4MTkYtqd6z3dRHSMmFCEs/eqv9ra3Z1Fyn
	Yth15tr48s+6HOzOC+8EApA+1rYsunjG6Dt4rUQ3gZoGNAjGfRZ7+qXZs+O5ZS4KyPzMPhJ
	AaIeNIjfN2i0oznULVZQQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Z7qZjvLbhGc=:Ii1KyvNRnxZptK4yyb4e6e
	C1dqX2oF4EADnd58fXaL25XPYOuo7cif3Q2ISH5fFcVbdLO6Jd4puXgIh60v3mgqppap48cgl
	BEpHJeeSj0QZOLUHPuCKNhyZUotXP75twt97thhmg+0p2sHG7bLhtRVAloLU2htIrxAyM9/28
	xNNiDcw7IKeZMN3N9MZpDz3fX7dupkS6JnMQZrTc0XGxdIarWK63W3mDQ8YdtQI30hvpWhXSL
	sv86x3DJjjQw4kOtjfx6t4YZXK+uGGPHinIeVbgK0X7E3zXiZNK0CJ/8W5+xjm7w2W7ZpG/kL
	qc4JrqD0PqWegruKjAgd79yR8drKDpC9ratRzQePW8o7LjWpKKB2bWTdVatEm9yLfooR6C2si
	25j3EvKpl+CxUOLMVxx76cCo6X58oJab+3exxBpxuCTeyzNix/SDKg0UXhHxrH/BSiW3+i/e9
	E5oazPBJh7HARC9LuUQUHEHDFJxcJ+S65AIPg2xdseL8HIvEcIIkMqyt/oBiMymxMub0pPFCz
	jkZBSZTBs+Jd78HQ4BvNMHb5ECUUNsW6dTFsu0axlND18BrAEtzILhIRmzqRSP15pT1b9UKI5
	HRI0/bQwJS5K0L0ASsdMVxt6rc3+6WY0W0dI1UWgzzdkQC9mbvJnvfcIJnz16SDME9PJhfcPQ
	nYqK6e13gtefQL2gzOtARFmqGz8J4Qw/oGi9p6EKX6tRK0poBtdToDV72WpviqC9v95TKtd70
	sQ6+O3Sr3pp/13F5DLhinSTdZKT9iTTOWhrwhV20Z9bA3z8Ulfio+gBX10U=
Subject: [PATCH 1/3] rng-tools: Start as early as possible
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
X-List-Received-Date: Mon, 10 Jul 2017 19:42:42 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

This helps systems with little architectural entropy to initialize the
random pool earlier. We just need to wait for udev so that drivers have
been probed already.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 meta/recipes-support/rng-tools/rng-tools_5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index de6e5f9a76..ba5076204c 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -41,4 +41,4 @@ do_install_append() {
 }
 
 INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 30 0 6 1 ."
+INITSCRIPT_PARAMS = "start 05 S 0 6 . stop 30 0 6 1 ."
-- 
2.12.3



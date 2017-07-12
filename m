Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7FD9780B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:43:43 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id 77so32306196wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uULdV+BuuSk4l2X7mKwXS82kublqKpUXbBiMjhmOyrc=;
	b=rCYtOgQ38rTyTEb0DLOg0JQTiBOPft5RgUrqrhdVAUPKC3tsASY6SmAz1kBrmwl8lq
	Tto+JYTx60KHypz+8l9jd6hJkJ89j/1Qq88VR+ai8MEPeqNO4eP/+9ykw5PpoWI3ExYf
	tWGxef/ME/Pi0S37W1CfkSuPKz6M9VIAFlfyhxPxdhuJkNSdH2+RMgz6kQ6YLlhKCF33
	ClakHQmsfOMXqOBw7Rj5ahkOstVwzOoKafNfkcSL9mjp1P0xvpOA+Yg4Z+jiPUSyCRSX
	uDZ2lcD+0SzrxYjM6SAWV/nBhCTSu6pkfCm0C5dgqD1oXG0Bw7sKfHonFlPLlafFCPfO
	m/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uULdV+BuuSk4l2X7mKwXS82kublqKpUXbBiMjhmOyrc=;
	b=mHzNQI2z/XHKilpRvMBDztW93wQCO6xik9lCwB+y/pXYC6ofH46TQV1wz5fMilp04z
	1fClGKvaT180zs2Ur6+f7HzdGhsi6Lk+/dTriSGjYm3p21+U/1+uRiUll228VJ03KAsX
	QY8SQVu4yoMJDniSJHSE8/AUI94bi7aEFE82pk7S6clrCFwcASYE/9976Tf0lRfjLcys
	Uj7DdVahj5sTsRpo6BXR8nIKeCkHrmaXkYpanZVuYMeskieQKKYtATN1nvdaaTsNLEri
	bVnL6izxBlLgfI10zwfvEQgSC5cbCC8d5+8V4JLgznHczU3k7NsXhk3iHegwEXteRpWd
	i6jg==
X-Gm-Message-State: AIVw110zBm1LazkbWSSadRZy20/tfPbN5HeVQwE++gshJkYAjwkE4WaZ
	l4mcYrSC6ZnLbK98LOE=
X-Received: by 10.223.164.29 with SMTP id d29mr2675456wra.183.1499863423861;
	Wed, 12 Jul 2017 05:43:43 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r70sm2800052wmb.16.2017.07.12.05.43.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 05:43:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 13:43:30 +0100
Message-Id: <20170712124331.12444-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170712124331.12444-1-ross.burton@intel.com>
References: <20170712124331.12444-1-ross.burton@intel.com>
Subject: [PATCH 4/5] ccache: don't search PATH for ccache
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
X-List-Received-Date: Wed, 12 Jul 2017 12:43:44 -0000

Instead of searching $PATH for ccache in all builds, simply set CCACHE in target
builds to 'ccache ' directly.  We build-depend on ccache-native for target
builds so this will always be present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ccache.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 960902065c4..8e4b5ab8410 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,4 +1,5 @@
-CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
+CCACHE_class-target = "ccache "
+
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN}"
 
 # We need to stop ccache considering the current directory or the
-- 
2.11.0



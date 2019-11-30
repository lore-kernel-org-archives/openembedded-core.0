Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 936937F775
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 08:07:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 193so15751034pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 00:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LJDcbNPche5/+njrYqGrObOU4OWj8iaXyyLLQsaxzZQ=;
	b=shrnV1wWfN3ihLZjPWvdYzkR1mCT1MghIVqgqOG7Xm+sc5H9NM1iltewbM/xLErY2K
	9ylrb4EWISwh2dP6Cy4/PCIWsuok+gJ5MXiYHIZ7aLjdE8nhD/zNAKKKRPJUou2zc7mm
	OpWrL+HUUt+grkopX689zOwLq8I/PWv/h+gQxbNyBqQUxS09jrt4VIavS7TnMWb67dbQ
	t7QwRLpb1cKyLtri505yDWYcNXm+LdLyAe8ZO5opdnwAnaxl70oPqU77Pt4NRsPAlRkx
	PYmpFneWHHWSy+pu/rrUrAoOTmHnN87nQEYirS16qvuCHeQ2aHfiir1BFeqiZO0WuFp/
	JxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LJDcbNPche5/+njrYqGrObOU4OWj8iaXyyLLQsaxzZQ=;
	b=JnszpYTGboaoN8ML1iPVFinrmhV/b5po2ffHki253kfqNv+51IilVs4qQLtz6izKn3
	qe/4u/Kn0xXevXPGHi2ZxWmmean/UYGdk1j3bvJZP33ZwOI6Vbwe6n2kY6yVuzUID1wW
	v2eL+ZxxIQlUKwC1m1t1BjNoQ5AKi+qJq97PMuBRY7KuEx67KNU3rDviU1U6vVjPf2gE
	ZGOMhYLk9Y3oDFqnydZxMcQCYS2V4uMhXgiv822bXJ7cyFMF4DVMnplOFDn5gKBlWFTq
	t2o7G50CRnHKi89e7YmHmVfNm4KzVe+T20PoVXg09Z2Hw3yZIy32I1INxzilBNKnPAI4
	NR8Q==
X-Gm-Message-State: APjAAAUvHsItNMPBmKG0puqfccqoXXajyQPMNZJPQhuG0+nPu6FJzEjo
	mgOpPH5rkpqd9+8mEO0rKjHCqQdM1z8=
X-Google-Smtp-Source: APXvYqxbZTRw9k67VILHLyv6qSIR2r4eKdLX/aFDXaKOMG3Cd7jmMDMLRN/8bRQamcJeDwX7NGJlkw==
X-Received: by 2002:a63:e316:: with SMTP id f22mr20629899pgh.102.1575101238941;
	Sat, 30 Nov 2019 00:07:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	q20sm26518634pff.134.2019.11.30.00.07.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 30 Nov 2019 00:07:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Nov 2019 00:07:05 -0800
Message-Id: <20191130080705.1918858-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] base.bbclass: Add python3-native to native paths for hg fetcher
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
X-List-Received-Date: Sat, 30 Nov 2019 08:07:18 -0000
Content-Transfer-Encoding: 8bit

This helps fix an issue where python interpreter in hg script could
overflow the BINPRM_BUF_SIZE which is 128 on most of systems, because
interpreter is hardcoded and build paths can be deep.

This patch helps, because now the absolute python interp path in hg can
be replaced with '/usr/bin/env python3' and it will ensure that python3
from native install is used instead of the one on host.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index ff3fbb28c3..31457f9f12 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -601,6 +601,7 @@ python () {
         # Mercurial packages should DEPEND on mercurial-native
         elif scheme == "hg":
             needsrcrev = True
+            d.appendVar("EXTRANATIVEPATH", ' python3-native ')
             d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
 
         # Perforce packages support SRCREV = "${AUTOREV}"
-- 
2.24.0



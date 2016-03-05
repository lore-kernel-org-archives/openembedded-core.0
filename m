Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6066FF93
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:05:18 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id y89so56684083qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5dEe18bJUhtmr6gDR16eKe7Y0IL44rHVx/8Kg7Gr9OA=;
	b=k3J/U+esCCX3mR7kmYh5vham5+MakkEp7ClZxu2kAvDx/JXh8vZxudqJksKqwJDquT
	0w+uEosKglrHMco/a3wAlHIcn33qzqS5xG5rkKL8mhIS0YFUc9ZySYUmW9LkA/6xnJpi
	gB0jziou47aIAl0dO4Le6sJEc+wUCEZDim3okd1X1r1SPr6kMymMT5NZgzkhdSFmlyEg
	BrisxY3W4Igey+aDURWQQbIAULNkh5DDe9No2SSYQ/oQZoa9IuZ8FM6DwCLR2xwj1Sc1
	ckkrGN9Jbw+5nuP/5x8kSof57kk2y5rayYeXXJfpJMu5Wja1DsLeBepMVgQp+PlUWv5v
	PDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5dEe18bJUhtmr6gDR16eKe7Y0IL44rHVx/8Kg7Gr9OA=;
	b=UfxLvwRdst43alBH9cv5XTPC9Vow2JGUDQMDowssZVZc2J5qBSXlPwo95T+ljPc+JT
	ghffFClzu9hu1qhuV47cj54PQItvxRPqi7xJgvh+m5f20lrTpzPSBu/fF9S903tKOV9b
	zQXGnfJipT6XbREqLer4Wrh+U9AVu7JUzmo8yCG6xaX2aBfqTTbLHVN9G0Ps+X2TAoJm
	vVlfv+zCJTEN3VqM/2HAo01j3vQDqdVOpl3BVK4U8aKtyJ3L+oig2QS2P6xiLYkmLdoO
	NTugDTkLof5wMQHTJmVsni3cwVvwzXHRKMKWrrYdg8V7COPnn68JeUprNpPvQccNtxv2
	cIJw==
X-Gm-Message-State: AD7BkJJr51ik0cu0P6/siMFaPb05kTkLDPwprvnTuN53/+Dz57hjsB5Kclfi/xYuXdGt7Q==
X-Received: by 10.140.224.18 with SMTP id u18mr10231764qhb.10.1457136318758;
	Fri, 04 Mar 2016 16:05:18 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	b34sm2726617qgb.31.2016.03.04.16.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 16:05:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 00:05:11 +0000
Message-Id: <1457136311-21090-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] net-tools: Override CFLAGS/LDFLAGS in do_install too
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
X-List-Received-Date: Sat, 05 Mar 2016 00:05:22 -0000

do_compile does this but do_install needs same env as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 14b8e49..40a021a 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -83,6 +83,10 @@ do_compile() {
 }
 
 do_install() {
+	export COPTS="$CFLAGS"
+	export LOPTS="$LDFLAGS"
+	unset CFLAGS
+	unset LDFLAGS
 	oe_runmake 'BASEDIR=${D}' install
 }
 
-- 
1.8.3.1



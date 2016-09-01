Return-Path: <mattias.waldo@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1FCA75C60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 14:36:58 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id k135so4225137lfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Sep 2016 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uyysSKuopfhk2zz/7YCo2o/FpQ1gsjY5jAjy7S0xsOU=;
	b=eXNffivUOb+rQkp1ZEWGFeo+BlJTFjrzWCmdEkDMM/lhWKN2vsdBCIQ4uFSFWk35n5
	bWM6RBuy6pMgFZEI0A1RD9bOasLEIeCa2P6ItJKlozcoVqrBlMQUJkVXZ/dkT/PhLqVB
	CQcHKuD4eoFJHyRcC5Qogj+JBLhLHjm2QnYTKSq1Rf/lXKtrCJStPFqZq4p60akTO5Qw
	bkqXaMNyah57GnkWT8CnJ1X/xcrVdQyvz+m8mQMYsQFgEI2lPXj1hJcYZQPPjDA1W4vq
	qW195XP0Ju2SBxjhkrYktc0ZC4i48p0T2uq/jyG8dHD0IvBN89i+pJ49OnELqavjnRO4
	3yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uyysSKuopfhk2zz/7YCo2o/FpQ1gsjY5jAjy7S0xsOU=;
	b=fYecf6593wRM6XrL1jTv2WN8wlJxl2eH4AECde1uaVfF2kxbntiNcPmmYalM/kYu0N
	kTTnPvhwlh0f1rLRftTwBOZvfoPyG5QI1oxmVjj0E4/IPQxV8FNyk4q6tmgaA8qICEiZ
	S5CWE8mqckchcxzEIX1SKZHF1PBeD38H7DXiswp/hU7+7zvy/Z7rpLvCtZm7jzAoEOLw
	zw4WaQsen0VDD1P8ZkeBB7s6Uw1FVCV2KUbt0q2lU79qRx6OS5etUjhO0G2Y0BWAHDc4
	VF0AUW5g2w0HwDbWUBemw6ceSYUuEKQUiTydnvbNOOuPGaMgok6C5zZcC5X9lncisu8s
	7RtQ==
X-Gm-Message-State: AE9vXwO7D3NOaG70Pjn6jsZ9J63RhDQGz46UItDwCGjcYoyFkRfYOKlRMKk3p5dP+lwTTw==
X-Received: by 10.25.23.210 with SMTP id 79mr5753735lfx.200.1472740617945;
	Thu, 01 Sep 2016 07:36:57 -0700 (PDT)
Received: from localhost.lan.
	(c-6dc5e455.04-597-6c6b701.cust.bredbandsbolaget.se.
	[85.228.197.109])
	by smtp.gmail.com with ESMTPSA id h22sm993530lji.21.2016.09.01.07.36.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Sep 2016 07:36:57 -0700 (PDT)
From: Mattias Waldo <mattias.waldo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 16:36:25 +0200
Message-Id: <1472740585-27888-1-git-send-email-mattias.waldo@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v5] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Thu, 01 Sep 2016 14:37:00 -0000

The absence of signing_key.* in $kerneldir made signing of
out-of-tree kernel modules fail (silently). Add copying of these
files during the shared_workdir task.

Signed-off-by: Mattias Waldo <mattias.waldo@saabgroup.com>
---
 meta/classes/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index db42744..4460824 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -364,6 +364,14 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	if [ -e certs/signing_key.pem ]; then
+		# The signing_key.* files are stored in the certs/ dir in
+		# newer Linux kernels
+		mkdir -p $kerneldir/certs
+		cp certs/signing_key.* $kerneldir/certs/
+	elif [ -e signing_key.priv ]; then
+		cp signing_key.* $kerneldir/
+	fi
 
 	# We can also copy over all the generated files and avoid special cases
 	# like version.h, but we've opted to keep this small until file creep starts
-- 
1.9.1



Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF9A6C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 09:06:31 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id cc10so6548294wib.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 01:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mpp8voIR4Tce6s5xKxnsppPBMmW9+c8kl9J5c/ThLqA=;
	b=hI4XAdxs4SsdoomP3QUG0Ks0vL6UvJKAO/8y7Du7V0WSRMWFBaIJfOXDClsT62NcTt
	xedFVSS5E15xB/IqNX4YCEMzf4uq2gprFr5ZNvRovSxiy5hCMWonxx8VzvCOSpgvXg/u
	yThokCBXGflRTZah51QM5Hhh9GQOVNpNTZUqchMhyuOeqS4XmFBzz4opEvd2pGz58aou
	abQwygC8T1kzOdZiVG+wK5WyPqmTzjSSJJWDXd7kJNGtxckCunlIHs+uwIFWbPFZQOLq
	iqZ0jgQtitNnAM2zL1FWNopKv/qHGmzexI7jjQf+SebwsGcVU0E4N3Nsyf3iVUoLGR7f
	SpAQ==
X-Gm-Message-State: ALoCoQn6uHTS8h1GyqSTJyfw5wm16OcybPHT81ueIGynjtjCJg3nwL0GTKYV/KTcWYxDDg5D1eCU
X-Received: by 10.180.14.231 with SMTP id s7mr23578334wic.1.1390467992573;
	Thu, 23 Jan 2014 01:06:32 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id ot9sm20750586wjc.0.2014.01.23.01.06.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 01:06:31 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2014 10:06:28 +0100
Message-Id: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] lz4: actually install things
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
X-List-Received-Date: Thu, 23 Jan 2014 09:06:34 -0000

This failure was masked by having lz4 installed on the host system :(

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/lz4/lz4_svn.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_svn.bb
index 41464e2..a760313 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_svn.bb
@@ -12,6 +12,10 @@ SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
 
 S = "${WORKDIR}/trunk"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC=${TARGET_PREFIX}gcc DESTDIR=${D}"
+EXTRA_OEMAKE = "PREFIX=${prefix} CC=${TARGET_PREFIX}gcc DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+
+do_install() {
+	oe_runmake install
+}
 
 BBCLASSEXTEND += "native nativesdk"
-- 
1.8.4.2



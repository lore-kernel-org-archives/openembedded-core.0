Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB8660801
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 10:06:35 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id y16so12937179wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hJ+dWiddaPxq01/GoQsNtN/QOnwbVEgPTDYw1thRUAs=;
	b=besu4DvYvjvjMuy3INnXShksGXv1rbdKfOJ0Yq46RKIA2Xmveccukyv2N+3Vf63QPL
	sJb7VouYZ/hMCA1ufOqi0vDFGUpbWwKHnh5c/pdIi5DHeSl0a196qbtRTKp6sWcI7da/
	bWn37OLifdeihzekM0/ehQ9TKDpXS7UcsVqnrtQRISKM3ndyZ7tgu5PphpbxqZnKO7SA
	PGsSZRs/CTmt5fNG3xSl2Ayf8/dzYyr1M9262y1gplPBnhewalut3mZgIgzcFwQR0Yxr
	RTd+N7IdSyFfN3OGHUZAYEn8fApAFcBxXFBznGULWKo2OSK6qloM9H2v0x0sxYpBQ2ik
	5ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hJ+dWiddaPxq01/GoQsNtN/QOnwbVEgPTDYw1thRUAs=;
	b=HtIvY5FxyZtBA1QHx5VgcZLIjon61UUlPLThyEGdtc++v7Z9K307c63LSmOmEEmIkK
	WFLQR03zilk8OnQPjhCPzEtvjIQyfQNInxIVH8u3VgUUPb9aaSPWh5sWx+y40O/ScpUt
	0QKfShzJib3uhB8fhmpuXaCUgS2zdtG9DgnwxEpH2PclkSshR7XxVMEwB/7HhxsquYv5
	he1d64UAT14nSqyLwjPS+YS5h21YY3w3fmAie+RMwzFj0+JQnNqr8jcq9zquGnNgmXKN
	LQvPDgLKUfNir7UZTLbkuD7zuB/Yf18ID2PWFxSbrOtyckzJTr4jIRQyKEx4yfdjvwqX
	yfRg==
X-Gm-Message-State: ABuFfogUTjvG8aONk7T2PzPsUfwNA5zQJaxdXkzGcF6lR7mBI5SOy6e5
	Hc7R2ZxqV9yIcwCjJLE6yiqTq/BW
X-Google-Smtp-Source: ACcGV639tv8g6D5KgL9lwFGyRJu2GpsXssKmtC9NdYnPCZHAckd0xgj+xnrv7BpI5aiTgOwU/qNSuw==
X-Received: by 2002:a5d:6383:: with SMTP id
	p3-v6mr7843015wru.291.1538733995936; 
	Fri, 05 Oct 2018 03:06:35 -0700 (PDT)
Received: from linuxdev2.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	e142-v6sm4810560wmf.20.2018.10.05.03.06.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Oct 2018 03:06:34 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 12:05:17 +0200
Message-Id: <20181005100518.12412-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][Patch 1/2] parted: use update-alternatives for partprobe
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
X-List-Received-Date: Fri, 05 Oct 2018 10:06:35 -0000

busybox may also provide a partprobe implementation, so use u-a to allow
installing them side by side.
If one installs both, busybox and parted, one gets the following error:

| ERROR: image do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
| then please place them into pkg_postinst_ontarget_${PN} ().
| Deferring to first boot via 'exit 1' is no longer supported.

And the coresponding log.do_rootfs extract:

| ...
| update-alternatives: Error: not linking ...image/rootfs/usr/sbin/partprobe to /bin/busybox.nosuid since ...image/rootfs/usr/sbin/partprobe exists and is not a link
| ...

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-extended/parted/parted_3.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index ab30108bf2..6189fd2246 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -48,3 +48,9 @@ do_install_ptest() {
 }
 
 RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "partprobe"
+ALTERNATIVE_LINK_NAME[partprobe] = "${sbindir}/partprobe"
-- 
2.13.6



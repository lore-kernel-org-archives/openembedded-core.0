Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id C70797ED56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 14:15:01 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id x19so9731810eda.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nFIchSMvoAB1apoOsMZklsZsFTRG5BZOVgcNPSDI9lA=;
	b=T/N6dC/9bOfRHJIYR5wOUa73c5JuwxgqOCgp3JcBkiqWA1r9qHScb16iguoZ6cySv/
	HUSYuKT03QxMFl6DmkYL4MlaaVDessCXAjKeF6VW0Qh7Wbmbw17l4Bbi1d+F7CLYAE9Z
	CyP4TKI/EwQ2mvcwmf7VZuNiWAgc2tZ2XYtouzL1hepMfziUgZ8jYzA50i7APp1yOudK
	d2uYeFmbE9NKsmiqnD48ceQCM3hNbTjGL1I51Ei9fB8mSt8h97BQjJvDKpQp8RJUXr3F
	gbJkH5Br4NgXowl/1GNiyVqgkfcskJe9gRsmjiNFB61QsuROvGcutEvnoGkOX6/0BQ5Q
	Z5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=nFIchSMvoAB1apoOsMZklsZsFTRG5BZOVgcNPSDI9lA=;
	b=PXjQXnM2c/5bxNMTnMstz1FRwVCgaN39V75xps3pTcKSY/5MTQkI6DOzv+1Ci9j9wt
	Axahb8yQtCK1Ze4qo9VxERyFw9y8xWpsN7TtRIWXS7rX6fF9kGt2DMr1dw4KJwUnALT0
	7kBBfjiaS+lnIpeObl9TqGZpGyvobc+ukEJJ7WAmIDodlRpfAs7ulTeaxoOMLKSfWT7p
	w84viZlUBKsqAo7G40Z5BFcklp2gGh4I1pJBGyU6CcuVphlArc1svgKchqHBTeOTVHYe
	OhtPUpcj5R+Pt9r0dQap/cTwp/icArDVOMMufXAboQGtVpbB8lTILj8btAI35KuaqiqC
	EJcg==
X-Gm-Message-State: APjAAAXzuKQ5rOP5uk0stOAspuxYf7JA/Hb8Ztca9LJBpwVIOWhe189s
	A8BFuOy4W1TVCXok42g1R+fnwl1a6so=
X-Google-Smtp-Source: APXvYqw1kq13hIRK26sty5OlQEL5kM5l3rTLQRIhwg1+A2vUs6q8Mc/AtYVb0+vquPKMjetntnrX4w==
X-Received: by 2002:a17:906:f0cd:: with SMTP id
	dk13mr20908654ejb.84.1563200102043; 
	Mon, 15 Jul 2019 07:15:02 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	j25sm5092107edq.68.2019.07.15.07.15.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Jul 2019 07:15:01 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 16:14:58 +0200
Message-Id: <20190715141458.7382-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] nfs-mountd: Add missing dependency on systemd service
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
X-List-Received-Date: Mon, 15 Jul 2019 14:15:02 -0000
Content-Transfer-Encoding: 8bit

As described on: https://www.spinics.net/lists/linux-nfs/msg62022.html

mountd requires rpcbind, otherwise it can can fail to start, which can
lead to nfsroot not booting.

Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=907426b00bdcd69d9a56ac1870990e8ae8c6fe9f

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
index 27ea58d366..3c3a8022ce 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
@@ -1,6 +1,7 @@
 [Unit]
 Description=NFS Mount Daemon
 DefaultDependencies=no
+After=rpcbind.socket
 Requires=proc-fs-nfsd.mount
 After=proc-fs-nfsd.mount
 After=network.target local-fs.target
-- 
2.20.1



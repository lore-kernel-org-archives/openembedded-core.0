Return-Path: <allenwild93@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id D489074C06
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 May 2018 23:00:20 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id f138-v6so1738161yba.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 May 2018 16:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=X62bEN9XRKaCRtIh5CfJGpzS4KF56xiccp6PqAJKPiE=;
	b=CA02cFunj59cvoiOyqhaNZX6qBk/n+Ue5imfQDfvQ9x6VFvsGMducXSk6DOi2EYcIX
	Mf4d7dH18+628XfuSqtoFVMix8dtuqT9PEm/lmrnooxIeiQJmCrhR18bo3G68tK1dZK4
	6sFrolo1HJk0M79SHCMxqYx18wWc/yt+1goJzC2se35HWPfKXJyhJbt3/Fyx8O2IOTkX
	c6H4TJISpsAwXI96u5DTvMyEAyKz2yV8eRZepuK1ZwoJl/kNRLszNysLxtcWXsrIP1Hq
	3KuQI1pJWfdIxkWxRDCCpl3D1MFdDSOEdJESCJJeCnWJcjU38XtPEl3ewJZ8AWSZEMoR
	rsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X62bEN9XRKaCRtIh5CfJGpzS4KF56xiccp6PqAJKPiE=;
	b=poJApJj0fx5V+MsLngdNbmaBS1f1qYZwqnM60qE11ek3JDp59mlxwJgh0BmMsFUxO6
	YpzmNND8/KIwam5AbL7CbkOZilNLpjnnNH5oHDTlwV0hHy/7Zuosu2vOqRUhEWeXB9/w
	Md2U45GhoqWn1dNqyKLbDTkNsocyMUC+mvE3rO4wF1vZWfyDrqMQySTk+iRYDwc9KTBq
	p051tZ6kEDEoqCqPslHGCR3ERabA64XOu2K75q9cEHlKhtOos9jz3f07a/39eUZBO32Q
	NmgPV/31Od/ohqirC/kSnVwc/roLwB9srtqx4l2Q8eQUqjJ4V8ouVXMy9fNXTMaA0A3a
	mgQw==
X-Gm-Message-State: ALQs6tD3LQ7MP73S3MU5qwzboYf8cp8GZLjWYVJBB9T5XEFPcIebvTZ4
	r22sMP2IVGza3YL1JuFGtW5gL/Hh
X-Google-Smtp-Source: AB8JxZr4QT307zATbeceEtYABPgnD8t48jt8KZb3KKP4gi6MDWU2SU/hTOLRdc/80np/XTdQjVLn2Q==
X-Received: by 2002:a25:b88a:: with SMTP id
	w10-v6mr19251329ybj.61.1525647621298; 
	Sun, 06 May 2018 16:00:21 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:3d10:2828::ed54])
	by smtp.gmail.com with ESMTPSA id
	g4-v6sm5181133ywk.33.2018.05.06.16.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 May 2018 16:00:20 -0700 (PDT)
From: Allen Wild <allenwild93@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 May 2018 19:00:02 -0400
Message-Id: <20180506230002.4606-1-allenwild93@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] xz: use update-alternatives
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
X-List-Received-Date: Sun, 06 May 2018 23:00:21 -0000

Installing xz and busybox together may cause conflicts for xz, xzcat,
unxz, and their lzma variants. In the default configuration, xzcat is
silently replaced with a symlink to busybox. If busybox is compiled with
CONFIG_XZ=y, its postinst fails during do_rootfs.

Using update-alternatives to xz handles these conflicts properly.

Signed-off-by: Allen Wild <allenwild93@gmail.com>
---
 meta/recipes-extended/xz/xz_5.2.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.2.3.bb b/meta/recipes-extended/xz/xz_5.2.3.bb
index c0f8b82f64..65168920d1 100644
--- a/meta/recipes-extended/xz/xz_5.2.3.bb
+++ b/meta/recipes-extended/xz/xz_5.2.3.bb
@@ -31,6 +31,11 @@ PACKAGES =+ "liblzma"
 
 FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
 
+inherit update-alternatives
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "xz xzcat unxz \
+                     lzma lzcat unlzma"
+
 BBCLASSEXTEND = "native nativesdk"
 
 export CONFIG_SHELL="/bin/sh"
-- 
2.17.0



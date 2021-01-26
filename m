Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.12975.1611672162315651796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bmUs4XBL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id 11so10540556pfu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VukY38o4tUYdyIy8Itp8/QO03nYdhWeLvpWMigojKvU=;
        b=bmUs4XBLEhi3KZE2dv4aB/5rgzmaSBO+f2o7HSF8o6AFGRVw+I5BQ0dOr7IlBkxHQg
         HSDLV1w7Py+OBV8x8Qgn4QzO1U3bZMBF1yM+EwCumabfP8MlMuOIudrGFZbxLFTh7XIV
         jKERALpzyZQ24FhI2CDIqIXlieMfVNZ/J76bjTnxaXojLBIbZBAE3m7aGMapaGq+yM+b
         TclhNBqzC7zGKWQ717nalW1POY1E49ucEkuKjm2BGhYe22DN38NoLJ0T459zYvRzmEx1
         ISxkFOzmMPccOIuc3OApwUHCh4Z+dIlNhZpY63DO+lrjyVzwfESCnV8p9GvZZcO7oXzp
         d65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VukY38o4tUYdyIy8Itp8/QO03nYdhWeLvpWMigojKvU=;
        b=avj31G90fnAoMx6Q4cxgCzG9yeNaDwpZGdzJ7vCLGjxUEB5GNw1jEZiJIKL5ib7MWh
         F6+lPSlyPXwPz4N444NSR5f1tf4hXrRayoXL3KCY3F6+5Io4NCo5sLo9OlK/hZWIlceY
         gbOzvrI1UN0QaF8R3SHSYRxQWix04BQFI7mZ+TpVLSVxn6c/MtOAhegOMxqjIxdwhKUW
         AhzNBCzC4KoGz+mi54B69Yqd52dxunSH8p4YZBxrEnlwRx4cHWVmhxfHclQVpGgqTp7e
         vTqxsZkN7n3O9/7oNEXDnIcdCVvL3kudGE+CHveCxcvPs17w+YeWwMET0WSdmVRX6gi1
         n/tA==
X-Gm-Message-State: AOAM530Lqx7U6OrmR58UTtuKy4uKTLJSesOst67bVkkUkTVw+Mw44kdP
	IW8QNvfyeABwYrFTcgeAoaDXBTsfK6mOPGjLVCY=
X-Google-Smtp-Source: ABdhPJyY9GXb+zhhppA7t5uBmppreryDsx2NAHcbvhzo+iJJooZdKzj4d8u8+AkUcxc1svdDFfGuJQ==
X-Received: by 2002:a62:2c50:0:b029:1b9:1846:b490 with SMTP id s77-20020a622c500000b02901b91846b490mr5492922pfs.76.1611672161193;
        Tue, 26 Jan 2021 06:42:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 10/46] pseudo: Add may unlink patch
Date: Tue, 26 Jan 2021 04:41:21 -1000
Message-Id: <87d836d3c04d4669ed0b188d6f2dff80818a8d08.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Mark files which are unlinked (nlink == 0) but open with fd's as
"may-unlink" to avoid problematic database entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1e481f3608c05ab14c61bf45cd0837d7287b6a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/mayunlink.patch              | 37 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/mayunlink.patch

diff --git a/meta/recipes-devtools/pseudo/files/mayunlink.patch b/meta/recipes-devtools/pseudo/files/mayunlink.patch
new file mode 100644
index 0000000000..9d54e40dd9
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/mayunlink.patch
@@ -0,0 +1,37 @@
+Some operations may call unlink() on an open fd, then call fchown/fchmod/fstat
+on that fd. This would currently readd its entry to the database, which
+is necessary to preserve its permissions information however since that 
+file will be lost when it is closed, we don't want the DB entry to persist.
+Marking it as may_unlink means the code will know its likely been deleted 
+and ignore the entry later, giving improved behaviour that simple path
+mismatch warnings. We can use an nlink of zero to detect this.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo.c
+===================================================================
+--- git.orig/pseudo.c
++++ git/pseudo.c
+@@ -1100,6 +1100,21 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 		break;
+ 	}
+ 
++	switch (msg->op) {
++	case OP_FCHOWN:		/* FALLTHROUGH */
++	case OP_FCHMOD:		/* FALLTHROUGH */
++	case OP_FSTAT:
++		if (!found_path && !found_ino && (msg->nlink == 0)) {
++			/* If nlink is 0 for an fchown/fchmod/fstat, we probably have an fd which is 
++			 * unlinked and we don't want to do inode/path matching against it. Marking it 
++ 			 * as may unlink gives the right hints in the database to ensure we
++			 * handle correctly whilst maintaining the permissions whilst the 
++			 * file exists for the fd.  */
++			pdb_may_unlink_file(msg, msg->client);
++		}
++		break;
++	}
++
+ op_exit:
+ 	/* in the case of an exact match, we just used the pointer
+ 	 * rather than allocating space.
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7857b4f1b1..c5040f5f7f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://abort_on_mismatch.patch \
            file://track_link_fds.patch \
            file://xattr_fix.patch \
+           file://mayunlink.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1


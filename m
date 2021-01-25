Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.331.1611586322368537968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xiX5epcO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d4so7747229plh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VukY38o4tUYdyIy8Itp8/QO03nYdhWeLvpWMigojKvU=;
        b=xiX5epcOwnIHdToV6whBafPTvTsvCFDdDA4tdW0ePROL1N67v8TMWfskawPtz9thoD
         ew8UMjrlljd22cEQWhwFTe9HvcPGU3EVp0KsmlJUwnyWZU+dr20IOizwdeNNAJdn5TPn
         UQ+TJhsd6PE360SepHpcGjDfTgE0TEDYK4IlDzhRofITtNQ7IqJviiJoezFh6vo8fAps
         4H9561M8j7Eas+AGHxeTBUczzF0y+hmIj/O5xQYyyamW9uJgOck40YgHtGYgM9L0qLAT
         CrOVvglP2rDMOplsxoY/k6q4ifzSlWWV31rRDrbYU4sNVyHVa4kn/j+jiXQc1gXpaxXS
         nzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VukY38o4tUYdyIy8Itp8/QO03nYdhWeLvpWMigojKvU=;
        b=f3hnnFZC5D5skz6y49rHqSB671TFEsNz2V4zqCj7W+eEa2l+XDUNhkI2H04nUJu368
         mRq9UWbD+H67Taq4sW5OQCE9Cmp75PY4bFk9nFiGyC/VAPJ8qFG1IrFSWrWIKFScEQCy
         7Nn6aTDsO4yD1L9NU0j4nUajr4qF7mtdU0fK15Y86OMd8SoOc9CdZFzvNFTAYHOyD7Ud
         K1EQ1ZscpUI/J+i9oKNVCicfrPhCh6PSlYAjgtpZXw4C8vpcrP+oJ5GM2q6t2YjtQuHm
         vL5weZnli5Pw0mlAyKsnJFZS3oXw4dN8a4DlxwWqUhGeCOIk8fYhvAYc/xUZGEtskhYW
         uLCQ==
X-Gm-Message-State: AOAM531RbSZaJuxgIyh0ipX40TkGK1KIUNTkmVHu3OOehxC7nmCNe/GM
	A4SinT7SD2ql2wMM2CytsV5MaLT7m+WMHVqT3JI=
X-Google-Smtp-Source: ABdhPJxBqGLqa9s4SVxA9pVdt20cUw5Nv1noFP2/exP2/QR143MwfMgMRVH5evRq4wx0raNGasPwaA==
X-Received: by 2002:a17:902:f688:b029:da:a817:1753 with SMTP id l8-20020a170902f688b02900daa8171753mr991074plg.76.1611586321329;
        Mon, 25 Jan 2021 06:52:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/47] pseudo: Add may unlink patch
Date: Mon, 25 Jan 2021 04:50:42 -1000
Message-Id: <87d836d3c04d4669ed0b188d6f2dff80818a8d08.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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


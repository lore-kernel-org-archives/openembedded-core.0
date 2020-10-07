Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.9872.1602065695702787499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eTQdqi8J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id d3so1705607wma.4
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=APVx/Y7xvQStkVnj3L6UB/aPQlibE2qKmryg+8bNFOs=;
        b=eTQdqi8Jjft+Ftzb9LH5p0cPhkk9bTNJV1dShstS/sllG/BtQZpSUY71tSYPUxjd7y
         0BMvwa7T8/5w6LptMUoOZ07ZyxQu32tcKylt7XNPn8QC5ghHFSMg+BaK/TpSZlentbFW
         dGSJawAEYssNoKJiPj6vi+yVQwwYVbl4VaCbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=APVx/Y7xvQStkVnj3L6UB/aPQlibE2qKmryg+8bNFOs=;
        b=bFZ4SKSaYPXVQI2qFfhPizH7NXCtf6iLS2RJqcRpuzSe7sYR2MCyyfa+b+wkqwPx+S
         zbPRu7HnRlYwzRQQTSpYC/4LVrrcLDz6vXECsrQ9QWI74lnjYYd52Z5l1l8WmukaFoG8
         th7hRgket7cB4S93sFN4ugI9x5JkL+FO+WkGz/ReYpa5scQKgmQVhuXRoXT6ZIjYTBna
         61T8cumP8jNesmzJvG0mzuNSjLcUlPHFo7swDSirolKmxwoPMPaKHahfLDrRyymMAs5s
         wwYdpf15/wLVd+JP8BV328cooNPQc6ycB7OJfx5MVtk8bFvv+Nef4wky9mUNdSAlosri
         Jilw==
X-Gm-Message-State: AOAM530RmPkM+4im4mgxYYZRiEAhzwhrJU1x0XaIPgTaL+BrwMcxefIm
	wvR/CE1MMjpiWgk4ZVObxMiLkxO6OoDC8Q==
X-Google-Smtp-Source: ABdhPJwfsRYjsv9g6XTZtAlKYkHLjC2DbobYSCYVpBFrBmbfDUcTOAjOR2aZgj5kcNtuBoldvL51Cw==
X-Received: by 2002:a05:600c:2cd0:: with SMTP id l16mr2497291wmc.18.1602065693992;
        Wed, 07 Oct 2020 03:14:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 6/9] pseudo: Add may unlink patch
Date: Wed,  7 Oct 2020 11:14:46 +0100
Message-Id: <20201007101449.3132127-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark files which are unlinked (nlink == 0) but open with fd's as
"may-unlink" to avoid problematic database entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/mayunlink.patch              | 37 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/mayunlink.patch

diff --git a/meta/recipes-devtools/pseudo/files/mayunlink.patch b/meta/recipes-devtools/pseudo/files/mayunlink.patch
new file mode 100644
index 00000000000..9d54e40dd9b
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
index 7857b4f1b13..c5040f5f7f7 100644
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


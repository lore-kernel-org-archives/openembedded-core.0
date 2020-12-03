Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.11342.1607008145699178225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iNFh+Sax;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id x15so1306620pll.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WvNKJD7gVCx3T3dRevk2T1wpXC1e2d+XXFqIqQdBnps=;
        b=iNFh+SaxCGcXH6/e3LsltvLbp3SxC59f95nGKPC/uFBcrVhcFxt/XhA9TBYwpiqNHj
         5Rj82XHMuzdFdI7fiKaVnxDXx0BDL43EwegIyxLMIZOCxEl6Xy5t9eCZ332Uol65QMh9
         kQaHFuqIUdxMTjNrA6PoTlMiDv0sCThazuSGDY/WX7/PcOu5Rtzrp0XsfPU9iwVi0fK+
         s84ONGy7KBF/Cj4AEeeRxjHkS3brVQiUQlyQdJ7ED+OMsG+S/Tjti9tV07Lcds9f8hjF
         0FrZi458MOf35dJEHOo9lg4uiUGVBgqN2Rc8TnKIT17m0HGXP578G3ZyHh2a5nNTeSlD
         Murg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WvNKJD7gVCx3T3dRevk2T1wpXC1e2d+XXFqIqQdBnps=;
        b=GnXAmYAWdUZruIFIoZXIZS4EilxTaW0a27xCJ88yXH89PTfMpwwFxKjoqg6esQeqq9
         Yy1UlFZuA6VK4i0dw29d4XZbvyS8ON6JMqwpnaSMlgytztfO9+2n0bzRT6Lsg4iFLeTQ
         B96PC23kv8jbc7XmZOhVHYpRc3bi2piV57JRgFuDSB/FGzeC8IkBLyyLjwqkKuJfIrc2
         DytPZb6eZUiNkZ+pT/vF15NPKCXOPfMfFzyTV8H0qgh4XvHQJQeMhXKSuZvFRq7tqHTq
         txwveC78hEa6zAyb4TH6SuWde80bE57BSWCKA+ub+U+izE8aKp4dp6EvF9YWNQP5N5ya
         6YKQ==
X-Gm-Message-State: AOAM532vz4TEapcy7BDBT3pvhHvDyZUiZqJyG2HJvcWmCLEKWD4o9O4L
	/FmPnDhDv3/fQLB6aiEwowTQTANZMp3Tl4Uo
X-Google-Smtp-Source: ABdhPJwqBJDFkcF66UadeUfL/dLRIZYxMa/yO7M5IsgIvg3PIk03iJyq01dgodqFqCE1pjVkoiqTCQ==
X-Received: by 2002:a17:902:a9c1:b029:da:8227:65f7 with SMTP id b1-20020a170902a9c1b02900da822765f7mr3438299plr.49.1607008144348;
        Thu, 03 Dec 2020 07:09:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/28] pseudo: Add may unlink patch
Date: Thu,  3 Dec 2020 05:08:00 -1000
Message-Id: <39726a9e31638cb746cac79ce8b48ccd102d2cf8.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

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
2.17.1


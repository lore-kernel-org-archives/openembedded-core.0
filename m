Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.331.1611586308362667152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NHt2IPyf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id l18so2741408pji.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jNVjx2VOFOq3w4xDyKnGxsUFwdsMppYlOahEmUlrvTU=;
        b=NHt2IPyfXSpatApHRioMusqlMyCudN4UF/Q2ZGGvUT1a+74GWKePqmb2Od6zErqPJD
         IbEBR6swsEQD0xr+RSr6D2slWKU1EfANiKleTL+WiSYB4LdJHkMkzfLyWQeP2biX8t78
         Q4dujNT+zZWruVftKmRL/ZNoaoYy/oX6cmQqFduwPmpsZH2M2w5B3d0cg71AL4hrWJXJ
         Qr2CoaasT6yFNnOqvVo6pQdCNCIwoyURaDSX3cJZpDFzjjIRxxvM6Hqd5oKOXkzsIOYk
         ORvV8kc9hYafFbHXXyQXOXWgUWEhmZjLl1M/N+v1ylsQU+QEJticuSVpDMd2Jp3+P405
         jE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNVjx2VOFOq3w4xDyKnGxsUFwdsMppYlOahEmUlrvTU=;
        b=K8XFqAe+FtCFmuLb3U52yBvXkcFJTAW0E3mEXeKrd3/c2slASHTNpUSQXj5SnPOTuE
         A/fak3EDpW2ZQq0UWwLuSpKjAEqR+YFA0G6eR1PsrixxNRM8Jv99Ad0qvE7zC0SgjUyo
         p0vsrB+fQuINSKKvUPUSZp8lm2OYDNiPVWbgM57bn0TIgHf2VR9padFwSlSfuFV+YxXd
         yNEVk9EV6fkzWwlIfc2Y5Ydpqxi45XQUGYXUpbAMMs0PA/cMu5jduKiTqwlIVNLARImU
         1VXdAXyvyq5bDRxV18JFSW1ejZbI0eAi+NNq7ushrCLRbXVMHcG1XxK6woTZY6zUSao5
         lK/w==
X-Gm-Message-State: AOAM533bo7PjiWPTEGjeXbrcgFurCvwyUXBdwZbxjENsBF6QDOQZaSmW
	w0+7aLViltSSEFOLFGD9wExCoCdDP8IkjUnzcsg=
X-Google-Smtp-Source: ABdhPJynJzSyXkbNi+hfn7n9vw2jE6kl9wohKeISGiU4PtMt9xhlpolBRljLpxVx59gQqTQtddVhLw==
X-Received: by 2002:a17:90a:c285:: with SMTP id f5mr585428pjt.80.1611586307369;
        Mon, 25 Jan 2021 06:51:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/47] pseudo: Ignore mismatched inodes from the db
Date: Mon, 25 Jan 2021 04:50:37 -1000
Message-Id: <bd9fd142c4dca5c0759126e9590c7645977e0108.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, where pseudo finds a database entry for an inode but the path
doesn't match, it reuses that database entry metadata. This is causing
real world "corruption" of file attributes.

See [YOCTO #14057] for an example of this.

This can happen when files are deleted outside of pseudo context and the
inode is reused by a new file which pseduo then "sees".

Its possible the opposite could happen, it needs to reuse attributes
but this change would prevent it. As far as I can tell, we don't want
pseuo to reuse these attributes though so this code should be safer
and avoid bugs like the above.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c13149b81e03a1ac48b27a208a139d5493c3ce7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/delete_mismatches.patch      | 51 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/delete_mismatches.patch

diff --git a/meta/recipes-devtools/pseudo/files/delete_mismatches.patch b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
new file mode 100644
index 0000000000..6c78d787c7
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
@@ -0,0 +1,51 @@
+When we see cases where the inode no longer matches the file path, pseudo 
+notices but currently reuses the database entry. This can happen where for
+example, a file is deleted and a new file created outside of pseudo where
+the inode number is reused.
+
+Change this to ignore the likely stale database entry instead. We're
+seeing bugs where inode reuse for deleted files causes permission corruption.
+(See bug #14057 for example). We don't want to delete the database entry
+as the permissions may need to be applied to that file (and testing shows
+we do need the path matching code which handles that).
+
+I appreciate this should never happen under the original design of pseudo
+where all file accesses are monitored by pseudo. The reality is to do that,
+we'd have to run pseudo:
+
+a) for all tasks
+b) as one pseudo database for all of TMPDIR
+
+Neither of these is realistically possible for performance reasons.
+
+I believe pseudo to be much better at catching all accesses than it
+might once have been. As such, these "fixups" are in the cases I've
+seen in the logs, always incorrect.
+
+It therefore makes more sense to ignore the database data rather than
+corrupt the file permissions or worse. Looking at the pseudo logs
+in my heavily reused build directories, the number of these
+errors is staggering. This issue would explain many weird bugs we've
+seen over the years.
+
+There is a risk that we could not map permissions in some case where
+we currently would. I have not seen evidence of this in any logs I've
+read though. This change, whilst going against the original design,
+is in my view the safer option for the project at this point given we
+don't use pseudo as originally designed and never will be able to.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo.c
+===================================================================
+--- git.orig/pseudo.c
++++ git/pseudo.c
+@@ -699,6 +701,7 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 						(unsigned long long) msg_header.ino,
+ 						path_by_ino ? path_by_ino : "no path",
+ 						msg->path);
++					found_ino = 0;
+ 				}
+ 			}
+ 		} else {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 3b623d8bd7..7eb72f0eab 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://delete_mismatches.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F463C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:12:48 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.19573.1640182367693145290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Onx/iC2+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id v25so2231154pge.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qDJpXwyoLKDvkxf2ljW8DKZuLTMa2DqPheQpkZR822E=;
        b=Onx/iC2+SspcTYOnR+1E09dpw0Z4CypDSfjUwiKmEgZkFc/CjTtUTds90YKaxmbVOO
         fOvy+khWOYniQBrn4Zjf4HtMIwzgOl8NdHWNj3JNuuN+9bc4t4Jr392E60nVuucBwZC8
         w4SzqCIXX+EzSdMc7Pld7K+czj0qAKHzlp9TtzwyO7tiBfk8biZLLMxO6HYmcZnL3Aq0
         wQZIETeQOp9wFHsPrI/riUc0X1Jtqe/Oogqnzp7NP+zlktcFLw0zV1XfAenCkLvHjEWR
         XZ7v7GnNpDGX27KuSWOIk+WtBNEYYTRRpEVdR73acFJ7ZmbSsBmsQKwEY+Q4HYqYZVz3
         2xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qDJpXwyoLKDvkxf2ljW8DKZuLTMa2DqPheQpkZR822E=;
        b=si+8+HKkKkXMkj5CzprAMDaKv5Tk3G+UlJR2KRrI/yOgjQFSoTQqZ4VEcqrg13/Lnv
         Nt9pxNSemVvYrZJOpMEtik7xajgdfiZ9qXOb0XBaqGg7XL++FW3EAV5ym+ftf3HOtBJe
         JYW++00PoFp4l1UM6yDEPnwnKGXaKFcnqQvEs4CPgY29nk+6w3ycu3xGlxjMMNNt8qH5
         hib+kBZr/f9p7hZQGKwUwuvuq5HCzWCerPFWOUk2yGb+qnjlLqRBPyNnOc/p+rwefv4v
         CAnerDa+Hkds475MmledBwWD6YQVJm0I3DSjzPgoCzcGMdopyYRnEkwgzpEBbIaEXjDJ
         p/ig==
X-Gm-Message-State: AOAM5332KbKm8fdr+hsd4UtJanwmKFTkRnPuXOHFwsbqTZ4V6zB9oS/p
	OClrxJeU/IfBS7DCTEGvLbNXeZXx3bGKin6+
X-Google-Smtp-Source: 
 ABdhPJzr9c9HP7tLTpslJxeD2ZCAgGphjoe8LpqqIQGSARxlWcTJ5WZFlEULVMG7q/yC04klW9bxDQ==
X-Received: by 2002:a63:7804:: with SMTP id t4mr2872817pgc.569.1640182366492;
        Wed, 22 Dec 2021 06:12:46 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.12.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:12:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] openssh: Fix CVE-2021-41617
Date: Wed, 22 Dec 2021 04:12:15 -1000
Message-Id: 
 <a4e272700e18ca7e86e24ce4e24031ce7745c87b.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:12:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159947

From: sana kazi <sanakazisk19@gmail.com>

Add patch to fix CVE-2021-41617
Link: https://bugzilla.suse.com/attachment.cgi?id=854015

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2021-41617.patch      | 52 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
new file mode 100644
index 0000000000..bda896f581
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
@@ -0,0 +1,52 @@
+From a6414400ec94a17871081f7df24f910a6ee01b8b Mon Sep 17 00:00:00 2001
+From: Ali Abdallah <aabdallah@suse.de>
+Date: Wed, 24 Nov 2021 13:33:39 +0100
+Subject: [PATCH] CVE-2021-41617 fix
+
+backport of the following two upstream commits
+
+f3cbe43e28fe71427d41cfe3a17125b972710455
+bf944e3794eff5413f2df1ef37cddf96918c6bde
+
+CVE-2021-41617 failed to correctly initialise supplemental groups
+when executing an AuthorizedKeysCommand or AuthorizedPrincipalsCommand,
+where a AuthorizedKeysCommandUser or AuthorizedPrincipalsCommandUser
+directive has been set to run the command as a different user. Instead
+these commands would inherit the groups that sshd(8) was started with.
+---
+ auth.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+CVE: CVE-2021-41617
+Upstream-Status: Backport [https://bugzilla.suse.com/attachment.cgi?id=854015]
+Comment: No change in any hunk
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/auth.c b/auth.c
+index 163038f..a47b267 100644
+--- a/auth.c
++++ b/auth.c
+@@ -52,6 +52,7 @@
+ #include <limits.h>
+ #include <netdb.h>
+ #include <time.h>
++#include <grp.h>
+ 
+ #include "xmalloc.h"
+ #include "match.h"
+@@ -851,6 +852,13 @@ subprocess(const char *tag, struct passwd *pw, const char *command,
+ 		}
+ 		closefrom(STDERR_FILENO + 1);
+ 
++		if (geteuid() == 0 &&
++		    initgroups(pw->pw_name, pw->pw_gid) == -1) {
++			error("%s: initgroups(%s, %u): %s", tag,
++			    pw->pw_name, (u_int)pw->pw_gid, strerror(errno));
++			_exit(1);
++		}
++
+ 		/* Don't use permanently_set_uid() here to avoid fatal() */
+ 		if (setresgid(pw->pw_gid, pw->pw_gid, pw->pw_gid) == -1) {
+ 			error("%s: setresgid %u: %s", tag, (u_int)pw->pw_gid,
+-- 
+2.26.2
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index b60d1a6bd4..e903ec487d 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://CVE-2020-14145.patch \
            file://CVE-2021-28041.patch \
+           file://CVE-2021-41617.patch \
            "
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
-- 
2.25.1



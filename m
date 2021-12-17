Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D64C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 06:55:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.3465.1639724147417943339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 22:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GG4pyUnr;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id n16so318393plc.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 22:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=NRohQHBtvEl9oI3OKMb79CDV+qTysDG2Kf+d7c+/7I0=;
        b=GG4pyUnrQi8v8PJGiHh0QDHMHItYzq4r+3JxkG3r3QloXOZeA5e0KbZQZpnG7bZwHQ
         68Tk/jzGRMvKkOZujIGFWMv44d+koIDnTfGcCEsPD1erzTpmhxS8zR11XN2fPlpGOKVg
         80to5obeEa49AG0Da5okt0yKnRG8t7YC7ukAkQFc+cPRQE0M+c2L4IPZfBuEWVf/gG80
         ejs/3X4gE68KvlVXtInaiEVq4fi9pxfKkrllULVDBQsA59U7IezhaolalldCxAxO7Z2m
         /coHhfo3IQFeL8lokKyKekbzsbrdUYv8P5bCYnTago7zzDz5HGv5ihoa5fBp1d6z4AeS
         sWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NRohQHBtvEl9oI3OKMb79CDV+qTysDG2Kf+d7c+/7I0=;
        b=wgXJ41SAyPGQ/oJtEtfoo/MaspGOLNT1V/84FhLg6D+wgZ0fGaWY0z0NSFYgpCslil
         n64GBfQE7Za5ybMkX+Q0m+7+8CsJ6uJ2xGkUm9CdlybZWx1S2qwu+3Joo75/g980lJbx
         XxlCr5A677/0aWKjvGkOtbuDuCQaroRUD7CvVYuDIPtT+5eTWr8lTRv1VOGO2yFxk8Qy
         njm4osJVcaBaIitNROak8v+TpfW9vSp6paFRMdElmqRA6VwWhTU01zNuAzfkCdgyTi81
         VyDVqDRmrL7QPa6+A4iq7avGHkXZuPyexxXWankp5Ls6O2RgHgKvHinBsajB3StREzb1
         wYgQ==
X-Gm-Message-State: AOAM533PMaJHEAjCj8KWtvOQPjLIIURq6395t1PXTdZgytSL3Ayjv5wz
	xnUIPmuOV+xkQPmfJbffJGrRFrFqeY0wPg==
X-Google-Smtp-Source: 
 ABdhPJyZm5RntSNK+RI856zmYE2GwY4SgKgkp+4M+XGTqry7lS76+31+aOx7a+NVtNLK0h1xXOVUlQ==
X-Received: by 2002:a17:903:1246:b0:148:a658:8d32 with SMTP id
 u6-20020a170903124600b00148a6588d32mr1924169plh.117.1639724146518;
        Thu, 16 Dec 2021 22:55:46 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:502b:4528:10a5:44f4:647b:9622])
        by smtp.gmail.com with ESMTPSA id
 b15sm8935461pfl.118.2021.12.16.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 22:55:46 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][dunfell][PATCH 1/2] openssh: Fix CVE-2021-41617
Date: Fri, 17 Dec 2021 12:25:30 +0530
Message-Id: <20211217065530.6944-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 06:55:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159817

Add patch to fix CVE-2021-41617
Link: https://bugzilla.suse.com/attachment.cgi?id=854015

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
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
2.17.1



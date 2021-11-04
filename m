Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A56C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 16:37:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.135.1636043863947606118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 09:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AB7jZDqg;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id d24so9605517wra.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cMZ3czE6VjObJLtA8QG10VF5ps/9RUNhjHMDaCEdauY=;
        b=AB7jZDqgv1bHqDAIUXfnHdLS/XC82noYpIW8z/oqtfcYYYOcJHO2cmiwMP5w4HyGrx
         /ye7/odMSE6KvRnbqP9YkOUnE0MamxW2/Gt32M3I3kNqXzM7TE3z783wQgwLJswnzhvx
         ir7cY3+ALT6ksLEunpPklbrftZKqHgSUGyNDlTneCjI5wTpiVvUjUCfb3uBYTwPfm3k6
         Uwx4p7rwZOMQtIbBb0w90rA7MfDxzgFq0fjywvJulR19Ud0p4Yl8xiTUXJSvjPRnuFOO
         gsp2iOJL34AUQoHfXqjlWQgtbv1LEuOrsqApIfdShMz1vUyfvEDyteKwL9pFedcErFeH
         oMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cMZ3czE6VjObJLtA8QG10VF5ps/9RUNhjHMDaCEdauY=;
        b=GcbsihJ4N0RubSXbYok2KAmDJFyLWEhqSKtYb2+ekD3kJdiLckDsccc5fZjRp4jQLo
         Ci1y5VeAg/nUL/GVx8Qn3SUNzj3twYgl5saqD7YwXx6HuBLU5wVjI/9LgzqdQBP5rBsJ
         9knwTcp0aTg5NFlwBUPddsclPQ99bepGZSPFmqK7D6EIE8nNdLmm9wQq80uoz0wHvJew
         lnKOFMQoqc5AkT1p3/rXf4O6wCJDomxZnJ+rdyJbPROmajnHx0k36Cok5tXRZVH1CKzp
         4Mel6BRLGaplYk4f/AXSQNE03Eklb38quDi26tWQ24eQFeT7gpAj4BsPbg2MEB91o0I1
         2rQA==
X-Gm-Message-State: AOAM530aC3sCrygioyE9JxBjQ5J/iwmqnt/s1n2xOX55HMl02trWtecq
	1KYL+pgRC951xrnFRspqGs88H6IAAOE=
X-Google-Smtp-Source: 
 ABdhPJwOAVq2fVJnIoevlf37zF/F+ZsxEx8MXkWmT3B4iThEEnq9eP8yEX9c9NO9bDUrXnjrYArw3Q==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr21062055wrv.146.1636043861817;
        Thu, 04 Nov 2021 09:37:41 -0700 (PDT)
Received: from CTW-01195.. ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id
 d7sm5425871wrw.87.2021.11.04.09.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 09:37:41 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [dunfell][PATCH] sstate: another fix for touching files inside pseudo
Date: Thu,  4 Nov 2021 16:33:57 +0000
Message-Id: <20211104163356.65694-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 16:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157853

This patch is a fixup for 676757f "sstate: fix touching files inside pseudo"

running the 'id' command inside the sstate_unpack_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
will always return true and the touch can fail when the real user
don't have permission or in readonly filesystem.

As the documentation refers:
- the file test operator "-w" check if the file has write permission
(for the user running the test).
- the file test operator "-O" check if you are owner of file

We can avoid this test running the touch and mask any return errors
that we have.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---

The patch sent to master branch don't apply on dunfell branch
because of the ZSTD changes.

 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 38dc3bff30..c42bd7ab77 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -859,12 +859,12 @@ python sstate_report_unihash() {
 #
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror
-	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
-	# Use "! -w ||" to return true for read only files
-	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
-	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
-	[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo
+	# update .siginfo atime on local/NFS mirror if it is a symbolic link
+	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	# update each symbolic link instead of any referenced file
+	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
+	touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
-- 
2.33.1



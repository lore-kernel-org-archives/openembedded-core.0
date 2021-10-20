Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4CFC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:28:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.526.1634750932858776746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EKWKaJIC;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso11749530wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lss/wQ11S2pCoyJQVkNjSSvMpQKpIbQboi/OYA2Sz30=;
        b=EKWKaJICCxuPfosjNGNb9vaFoH1JmSD7uD9T9YUD9bDTpi7g7uzHJJFXKGZwHc2Ho7
         TSLXd0ISots8SleExBAZWRUg1uzatLcFv9vplkB5+4155OCbZJQyQAKT6UhJvl1YQX3a
         wW+EXRmA+PTh2L0NGjIZEbOsvMNYzzOqUylJzZ+nfUOBcTGlqgq5TVgQ3sCMImVyInp6
         t1l+aDbg6HTbUtu0zXWH5uyb6NcOf4rf0g5TBPJPxECovSOYdUImVbXp+8UrW1EUUs52
         ozhFFS6vajFDDE8aGRGmpGWoBCVqs9MiZ7IqgUGp7BlL9AhCYRguVkjl8oTHOD2lqMXL
         iu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lss/wQ11S2pCoyJQVkNjSSvMpQKpIbQboi/OYA2Sz30=;
        b=b3NEUQFMopbwniQv5VT6kNltQyV/A6hCxAKYPIZhVHc83/TOsZGA68bla9ioWEw8fC
         JPODs6MaUa6569AWJ+eU/+2EIbdCPxiV7yUOQNOHr0DcqPky5257WUNSyTWD1S624xkY
         IR2FNrUw+Yfm8Yjgdk1VVMoUl2V4SbsCGEbSDBUHP7MY6QQG3z6Shr/mj0650xfEgV5u
         wFq2+7WrbgQUVH3Sn/LQMbTqvmbqDKzFKvu061mFIbhixtt1fiK4fs3sHl5KzTrf3Dkh
         0Ox/yHkkNbZ5XCo4kZZqHww2np8hziWBcb8EtyumHJKEdEgEqbH28or6zFSWKh4cC8r+
         15yw==
X-Gm-Message-State: AOAM532Co9H3jEkEfmv/bSTn+At9NIKMRuH518WqHlWH8jhugEF3Vwt1
	iN75R9+I/Zq4oJwX3T6faLuK7WnptlY=
X-Google-Smtp-Source: 
 ABdhPJyzsiMZdCpM8h5+ttDmWivG18lsql4ZuRWG1clhq2zIaE8+NwzEc1I1ld/U5ZFQJIBTmDBvmw==
X-Received: by 2002:a1c:7e04:: with SMTP id z4mr15308547wmc.95.1634750930862;
        Wed, 20 Oct 2021 10:28:50 -0700 (PDT)
Received: from CTW-01195.. ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id
 d128sm6577094wmd.2.2021.10.20.10.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:28:50 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] sstate: fix touching files inside pseudo
Date: Wed, 20 Oct 2021 18:25:46 +0100
Message-Id: <20211020172544.394910-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 17:28:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157263

running the 'id' command inside the sstate_create_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for touch files [ ! -w ${SSTATE_PKG} ]
will always return true and the touch can fail
when the real user don't have permission or
in readonly filesystem.

As the documentation refers, the file test operator "-w"
check if the file has write permission (for the user running the test).

We can avoid this test running the touch and mask any return errors
that we have.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---

v2: redirect stderr to /dev/null to avoid messages in the log

 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3c179259e7..146f56ea2d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
-		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+		touch ${SSTATE_PKG} 2>/dev/null || true
 		return
 	fi
 
@@ -865,7 +865,7 @@ sstate_create_package () {
 	else
 		rm $TFILE
 	fi
-	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+	touch ${SSTATE_PKG} 2>/dev/null || true
 }
 
 python sstate_sign_package () {
-- 
2.33.1



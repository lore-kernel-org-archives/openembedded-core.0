Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F576C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 18:47:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.40703.1634582844208689466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 11:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QuBc4hu8;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id r7so43179922wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CFIi94CACAv3W/Jp1hSeacMnUmGi+MsikUAKt8Jb1z4=;
        b=QuBc4hu8dHaReCM4HzvI4z1H4lIH7Oxdm9AJXSrA4I8C2+oD9w01umYDGv+vBxNxRh
         0iwF/cg+nXMUDSRcbssKkwrXZ+YJbGYZjKpO9B772kDren5dKOtvLpjkVXrlfzzpbEcI
         Pz/trHfsfOAVM/0djpNv8R/w4iURw1moB5Q9/E/MTvkGQvg1nQnqJTBv9gU4oKKdvCy6
         PAqUq8OlaAwEkkvhr7lcxgaH4KXTM+BAaPy3josPbs8lKY6uxQH5UlFroSfpmCAkdYUH
         SkAUABweDQMqgpID2TUNk2bjaaSvBy5QQXU8e9VOC1jh3p4G9hv2CMI3yaxegDeo9p2+
         9eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CFIi94CACAv3W/Jp1hSeacMnUmGi+MsikUAKt8Jb1z4=;
        b=TAANJR67zusxaEqviqKt/zAxEOD3RhaI9Hu8SKnULC/qpot0JERuTBP5nKLWQMzBZQ
         MsPnfnVxVm4v0wP58uY/5qpXBF1Z9s5eC9awf/6mwIFDWq5riUzd3kaVkXPtXX6y88hQ
         Ga4V7Ika8KLFJR/Am0MEEMjps1eKee25sVaAsBh3oimCCt+C9UZR2s46UovSrO787/dg
         PThcgF88Bmw/wWsBIGWcsbkQeEQPjaiWpIb32mZnJK8e4c1cfNqjxJ0L/crW6bI82vu0
         9rNT6uBSVMZoRiYJaO4mTQw3ZxHVhk5ZYdDWBmmpetTZov5OTIJbwhOFV/L6ruuNe0S+
         PQqw==
X-Gm-Message-State: AOAM530yQ3fkUtbHupEibmqWsU8jQgrx2YsT4ImqYzMqGjyJc0uERTSZ
	breXMF0iepExd2cRA4xzDMJQX7w30Vs=
X-Google-Smtp-Source: 
 ABdhPJxzal+0afLMDKj7hANySkfdXVVkqQX/zmCEJrRY7pSQ6VntwCyyUKPvFElp8kne7ZlFb010Mg==
X-Received: by 2002:adf:b353:: with SMTP id
 k19mr38249699wrd.325.1634582840932;
        Mon, 18 Oct 2021 11:47:20 -0700 (PDT)
Received: from CTW-01195.. ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id
 133sm235989wmb.24.2021.10.18.11.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 11:47:20 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] sstate: fix touching files inside pseudo
Date: Mon, 18 Oct 2021 19:47:11 +0100
Message-Id: <20211018184711.94970-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 18:47:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157091

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
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7f034d746a..d4555150c4 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
-		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+		touch ${SSTATE_PKG} || true
 		return
 	fi
 
@@ -865,7 +865,7 @@ sstate_create_package () {
 	else
 		rm $TFILE
 	fi
-	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+	touch ${SSTATE_PKG} || true
 }
 
 python sstate_sign_package () {
-- 
2.33.1



Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3166C433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 11:37:46 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.30033.1636285065492159795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 03:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UW1mfsJT;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id b12so21669384wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 03:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sc3dNVAM4Ds3RwWkgJHrMIzPoiiQQPqxg07xZ3q/Wyg=;
        b=UW1mfsJTBtBPhqKKhOj+WS1JozVbQRQkWztqIDMPoX4rWRcOizmw/OFQ+E8dIyNXSM
         ia4dCVuUX5ilXBpevPbTTgBuyRxz6gYlOKl4QDSNIfw7298LWnNy6Qfsxxt7x06bmEwX
         mYJ+BB1YHwUATLvfuzhgGSdF396tFEH1QQElOZnm53qs2+wmYEum7pkwqQI/WLiUtL3r
         2yrXIF77xT+mca9zXFxUw769I1A030e9hiYIt6vwcOlAjVIwlctP55+u853QPJU/4hcQ
         9UmzK6x6TQ7VbCKIAFr32dwGRGdBQG9ltpObaJFZsJGGdE4A4qXVBe1Tr9o748gHuTQr
         Z81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sc3dNVAM4Ds3RwWkgJHrMIzPoiiQQPqxg07xZ3q/Wyg=;
        b=PWi19zqTIzbzcgJHcXod8jK8kZ9VjI0v1YEHZA5benzGrhub0CBGvLCNhMyl5z2n0r
         Xry2marNGITduGezWQEWBLoKlj6cPhs78vglwzVaeAaXAejIpoa3HhxhoNO7SnAep9y8
         z/2W6oyVMX7a2MTwQlJekqxskxCu+KEx0xa2a37Ni+kKqNTyC383CYzdq9KI8nUPLd7Z
         r2LIcMVPOAVtk+f/LloykYMmp+31wDbPviT+WvsgMtD9rMATMGk+RxyqKywXesiD5z09
         T5QR+/f/DsvY1UbeqbPDXSTwcWrMbQ1ariSeRG+7QO4NNtQmr7iow5tm4HGK+qdRFgIh
         cgdQ==
X-Gm-Message-State: AOAM533VWrWv+krlOobqzlb8enbWkV7PBJaSJrdEYZjGptE3suN55YfT
	LinpnsUhpyjJgg9rVH8dRk22fzDm960=
X-Google-Smtp-Source: 
 ABdhPJwYH5RAaFR26MKNf+IBOfkXYFGQ6ZOffga6aN53T4qGrIxL+5wK3CRE1ntK3IWWiILESb1iPA==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr64956717wrx.64.1636285063305;
        Sun, 07 Nov 2021 03:37:43 -0800 (PST)
Received: from localhost.localdomain (176.57.115.89.rev.vodafone.pt.
 [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f19sm14359755wmq.34.2021.11.07.03.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 03:37:42 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH v2] sstate: another fix for touching files inside
 pseudo
Date: Sun,  7 Nov 2021 11:36:52 +0000
Message-Id: <20211107113651.182107-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 11:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157949

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

(From OE-Core rev: 29fc85997ade490ae46ffca37ef8e1a56957c876)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b9210d66c78bb3f79056e5586cea7b0edd714a9)
---

The patch sent to master branch don't apply on dunfell branch
because of the ZSTD changes.

V2: match the original code

 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 38dc3bff30..930d87424f 100644
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
+	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
-- 
2.33.1



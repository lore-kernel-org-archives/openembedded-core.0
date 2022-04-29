Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCF5C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.11892.1651248139968059936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1zIwTW86;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id s137so6851495pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Suw84zhzMiIqINqFrjO7T7s+UuIMhp2hnZGmM856tIU=;
        b=1zIwTW86+oHTVxi88bPpIFf2TQB8eMhS0mJ2+eH1UAmy/cGOI9+JxeSyUr49DiYIrB
         mZ5dsc+fv0fARI0vdNsFbMIloBVDWJviujWDURQbT/GDZN0lFDSaPU+UyIuz1Ul31yqG
         iE8nVGYQnlOBmMblRoprFf5z9fWmnPY6k3FWt8y0aQirJ27V7ahV94r2R7od8PRE2XEj
         tpEw2YNYzaTOCny3Trc01KMbBfBMq0X9y5DyqqroOP1wPCrBYgyabPNe3X38TgQOabzY
         3BmU1JwJmMhdZX1hwDo15Y171NYJXzqBaIDUvWx6thhvmf3Q+7yRyeuiO70Xu+5w1xN1
         6IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Suw84zhzMiIqINqFrjO7T7s+UuIMhp2hnZGmM856tIU=;
        b=LJXWqRNl4NhBIkk4cNX572J+eq/nlsQvDaNzmG2x/+yvLZePt/N044BhvFaaPV1KBF
         b+CfqGxl00MgqZcr//QbzEjUm5K+KIGl6nbLL4HBrpeJT92T0H1tS15p/AC68Rl1BlHq
         WVIHh75e2GJqLw3PBeborjmeY00Vy2XKlTV8+KwY4URsK4ZLs2h1dM3JjvkiNCgCKnQy
         szY/em7GLOP1zSFXn/6ltE0Ow2DNJhxWkMk+/eMhklkS3EJSLTRZP8dgpvichmMRukHn
         CRJRKhnkWe16CZjZn/9hSum3RHGGxojDdaMwXfdu44C9t8k4/3zQAG5djOGyvRpbPXty
         i4rw==
X-Gm-Message-State: AOAM530JXo1BSM6Z83H3PZwTo+OOKVqYDnmzgOzaKY5cAbT0GMyXis4w
	EcwP6kg9wpN0Q/jHIplwnrVcbrok2vm2HNbG+ME=
X-Google-Smtp-Source: 
 ABdhPJwXW45dumLXFY4blbbi62dL1YcN6FCLe2rdEUDZVq68qCUHg6ztcQrD/w886qNWCROp3FusMQ==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr33065pfu.46.1651248138787;
        Fri, 29 Apr 2022 09:02:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/34] devshell.bbclass: Allow devshell &
 pydevshell to use the network
Date: Fri, 29 Apr 2022 06:00:42 -1000
Message-Id: 
 <147d4cc12cd0ac2680bffa4112cef2d2447d34e1.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165042

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Otherwise it will fail if using OE_TERMINAL = "xterm" with the not so
helpful error:

  xterm: Xt error: Can't open display: localhost:0.0

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba53fc3bcecfe32401471dc1008c7ead96504150)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/devshell.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 62dc958d9a..26c01c080a 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -21,6 +21,7 @@ addtask devshell after do_patch do_prepare_recipe_sysroot
 DEVSHELL_STARTDIR ?= "${S}"
 do_devshell[dirs] = "${DEVSHELL_STARTDIR}"
 do_devshell[nostamp] = "1"
+do_devshell[network] = "1"
 
 # devshell and fakeroot/pseudo need careful handling since only the final
 # command should run under fakeroot emulation, any X connection should
@@ -154,3 +155,4 @@ python do_pydevshell() {
 addtask pydevshell after do_patch
 
 do_pydevshell[nostamp] = "1"
+do_pydevshell[network] = "1"
-- 
2.25.1



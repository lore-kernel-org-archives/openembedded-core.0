Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB6AC6FA99
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.35791.1678494446174289350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aamsOH6Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o5-20020a05600c510500b003ec0e4ec6deso1191930wms.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24+IPTw4375H2jt3ot21n9JlHtKsYFihE4yRmc5YIMA=;
        b=aamsOH6ZRh0guBr+WLYpMxy/30VzL6rQQtH1nC4KfKcrVJSsVnTcmI2ASfZZAqCXk6
         iQLvy35HPjCeffrgHKxPl+ng9t7RASG6x5zGSmFNqjpilGkdxsA17vKuDOOglLfU9Aah
         K/vIaUyRPtQrXYYxvUadsP8PtPHD+iYLNYbmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24+IPTw4375H2jt3ot21n9JlHtKsYFihE4yRmc5YIMA=;
        b=wAPc7DHszQMb8BwDcmzXY0PQpe+mFRex+jH2Exlz1dbFBljjtb44Dfnd+2/u9+78fE
         QCF7Wfka7qd8e9pObgenDpc1Jl7RGdDOrZb3Vi7+4lLUn0BGxuyJpdfjq7TzqtrKA12M
         r1KNExMRQFLmXgfD6WyYHnmUZ7PFnIn5CZmo4asllvnZpml8ZahV2NVOOEJ+e7zfv4n8
         3SBuQjUUno94mbyu4K9+J8LEI1CjoGlDMl0gb8wCWKOl3YDNrXBHefFZMt+gS6WYu/4B
         hiT6Vk/oe/qRyTMWoWB2Pw4b7of4CNtYvHo56yCHkDvgGv1+MZhKVWSuR6Kplznq9JNL
         qhMA==
X-Gm-Message-State: AO0yUKVaunRr4T4Gjy/H+dZFv2bAJ6noWH62DNVUd8GGrGl+la7YJJ+x
	e7UmXzdQ59dAQDNo5nh7zOoxkRJKOFCtqUGUuo0=
X-Google-Smtp-Source: AK7set+SMM9BrsSX/5JpI+dKxwmq0DI3FaeKV/zdUmgZnIRVubO4Kd3X2ep+2r/Sc7U5CbxNhROYXw==
X-Received: by 2002:a05:600c:ccf:b0:3eb:36fa:b78d with SMTP id fk15-20020a05600c0ccf00b003eb36fab78dmr4353539wmb.23.1678494444366;
        Fri, 10 Mar 2023 16:27:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/16] openssl: Add missing ptest dependency on openssl-bin
Date: Sat, 11 Mar 2023 00:27:08 +0000
Message-Id: <20230311002722.3211118-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178346

One of the openssl ptests needs the openssl binary so fails
on a minimal image without this. Add the missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_9.2p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.2p1.bb b/meta/recipes-connectivity/openssh/openssh_9.2p1.bb
index e6cf2ff2d6b..4666237d686 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.2p1.bb
@@ -158,7 +158,7 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
-RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
+RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils openssl-bin"
 
 RPROVIDES:${PN}-ssh = "ssh"
 RPROVIDES:${PN}-sshd = "sshd"
-- 
2.38.1



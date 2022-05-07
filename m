Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E53BC433EF
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 06:45:14 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7454.1651905904853425222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 23:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pcGP0UCa;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id k27so10870133edk.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8OYxPAIMJY38stDyFP6IoKNBJ0gGa9n2CqP2Msm70Do=;
        b=pcGP0UCar6eDOXUvIHDJA+FSQJTfxKqp4BxCuGWmH6CAtbd23XuUftuRO/gWu4DFQp
         ESs/eu+idsMSUsU2KyUX6bxfIgRxEp5HC5Cu0Ah8/pYaZpojeY6gjBqV+hT+FNUnCIBt
         f3a/L3NQCoLVl0fyPFSJVHVb/K33bZFXsaiiXHT6CiZB1Rz6Tl9/oFgUXxLWQw4RAOKS
         xGV5uaNwhdK8kMLbzSPChsx3HIGqzv9mFy+Yd+eU+ZckE8wizW/g58JDaj+TVIhVlqMd
         cFJnSfIl1LZOBLm2sn6+AmG2nOzKX/uLhMprGBvXHgdVWkDutDDqkTJ/KlGbSsJcMnWI
         GM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8OYxPAIMJY38stDyFP6IoKNBJ0gGa9n2CqP2Msm70Do=;
        b=Ykd8dU81et0Nd3jvmVUq7zUEkYes1rboze7NmtmsOY0RgSpO1ZLuCmIzr+OMEZdowd
         b0Xkle3iRZqG07NpWaC3kqy7+N5dRQzD+bzqdFJ5241SC13mBmqh+1aKRL+0E7DDsTVF
         l+Plr+jmZzyeTHd/HjSdWq2+m9SWf00FSN2WRwOA09RN8fVrARdLu+AOPsZUfeoe0Q+J
         gQ36h4AkVpaFro1gon/zFJAeueAOkoSCox+yVQblbzWr/UToU6rGqpV/zelVjYGk4U21
         xRqPBt4DSXjHiy9nW+XNR+DyZ283hq9asCohr/8v5Z43NwOLijiNlebhb2U6n8dEHnVp
         /d5Q==
X-Gm-Message-State: AOAM531MGn0gHwJv/Qgn+qDdd5VEnL6b31UpRHeftrGspP3aKi64MJ1Y
	+lOihUZSIJFxwd0RodKjt8rierIMIoQ=
X-Google-Smtp-Source: 
 ABdhPJz7HAQQj/6sQmtY92G6OvidVip9LH6s5l2SFNre5KClXgLbaY04+MTKrmYPdaPdUVsrHZBfxw==
X-Received: by 2002:aa7:db4c:0:b0:428:111c:b6bd with SMTP id
 n12-20020aa7db4c000000b00428111cb6bdmr7208238edt.318.1651905903319;
        Fri, 06 May 2022 23:45:03 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 g11-20020a170906c18b00b006f5294986besm1294229ejz.111.2022.05.06.23.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 23:45:02 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 4/4] openssh: Add openssh-sftp-server to openssh
 RDEPENDS
Date: Sat,  7 May 2022 07:44:49 +0100
Message-Id: <20220507064449.25809-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507064449.25809-1-alex.kiernan@gmail.com>
References: <20220507064449.25809-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 06:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165356

OpenSSH 9.0 uses sftp by default as the transport for scp, add in
sftp-server so that this works as expected for users, rather than being
left with a confusing "scp: Connection closed" message.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
index 975faed5473b..b63ea2b13731 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
@@ -158,7 +158,7 @@ FILES:${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES:${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 
-RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
+RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RRECOMMENDS:${PN}-sshd:append:class-target = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
-- 
2.35.1



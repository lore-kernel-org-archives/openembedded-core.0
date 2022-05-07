Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5267C4332F
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 11:22:26 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.8960.1651922543757691940
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 04:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YvRbuB2Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id y3so18653046ejo.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8OYxPAIMJY38stDyFP6IoKNBJ0gGa9n2CqP2Msm70Do=;
        b=YvRbuB2YLjlaP8AW1HNHR8CwLf0RAJ9uqgq61r7DMs51BFbmF6wXcJy9Fv4LomxDI2
         inkFurlFlPlvANplh8dPusXv26zU00fMIRq+HoL+GrZvRs0gUAITZQYuk2ArNdAA03hf
         jvjI4EB6p4v1C/LJ84SXcqg5pQst0B1iw5w0OJgJbbcf74dVF9OLHHiq6/NeEDD3ZppT
         Z1BojAox4+3u6vwTiTSlxHSnXWGN8RG9N4FmJgC6hLF8Z3J94awiU2J4dhOSk8f7YgAR
         w3hQ7AZK0LW512ajBf8Hl4McgRMsIv90BPSVjhVhvmFDMS2RmU0Q2vV1M1eX+nyHgGdB
         huOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8OYxPAIMJY38stDyFP6IoKNBJ0gGa9n2CqP2Msm70Do=;
        b=60FRG1UCehXR9RVqOp/tlWBQN3HfQ5aZoRCiX8zUt+5vDczunmtuwKHnJYfgjEo+Je
         KYdEao2U5wYKHCDqK8HLcIMWg2HBg/vH9hTxjbNTa2/Y59N5cdOw9i+j1znscqzwLT2o
         y13yH7hl0QlFn1Zodo30NpNEwNLsVpe9lUtxajwvWgpnlamke5HcqsM5i8sYHl1gGkff
         6U1iTcnXTTv/vIofRsTYVvskfZNVIqj0SJPztldwOEWE8EaNk/afWtYo66gY7hKQYCmy
         UmYaXPPjWZhOlWW9ECGFDZQdLtkpsIDo/uGMdeAsq9vooZ68iXP5irAspvuh3EHGdmhP
         bm+w==
X-Gm-Message-State: AOAM532wYN1zdkk0KQn9ibNsULRqUnluH53ufwRGN0ch8P/DKbBzt6v+
	6Utju1ut4Qqa5oz40bKVKJSj22WO5LA=
X-Google-Smtp-Source: 
 ABdhPJzwiaR/oypjvebBF5+0KBDSMubKv+RxebyKJRPhM9tLEW7liypsvHSwz/DqVrhItnONhcLmRw==
X-Received: by 2002:a17:906:fad6:b0:6f3:9ea7:1d49 with SMTP id
 lu22-20020a170906fad600b006f39ea71d49mr7013789ejb.635.1651922542196;
        Sat, 07 May 2022 04:22:22 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 gz12-20020a170906f2cc00b006f3ef214de8sm2898577ejb.78.2022.05.07.04.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 04:22:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 4/4] openssh: Add openssh-sftp-server to openssh
 RDEPENDS
Date: Sat,  7 May 2022 12:22:12 +0100
Message-Id: <20220507112212.16408-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507112212.16408-1-alex.kiernan@gmail.com>
References: <20220507112212.16408-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 11:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165363

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



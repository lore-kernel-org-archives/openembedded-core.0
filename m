Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8F7CD1299
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 17:11:19 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.18272.1712337074796044220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 10:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfzB1PcK;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7d5bbef1111so48761639f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712337074; x=1712941874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//ATV0kenVxY+YpO+VCbMhoOJAY6Blm9llqGM2OpOvE=;
        b=cfzB1PcKZDMWiZtNm/xDhO4+BvKYKjpUiwuPVX0B8QwQrT+yt+Wx/SCnVyUK1VS8rf
         7jUYgfbYQqismuXsm4oC1Zvn36HSAJ4is4NZlEsIPplZj/DwVMnosMnT03aKWDQ0ET4J
         uLGxuBvGa3cf/0xUd0mVEUjieECsqBGJcMcg7lIMQqsqoeC2QyDnjTAK0hyWMaQRNwFe
         uPNgT5g8jmuRxmDLVfAybNJ+3PT6KgyrFX4YAq8P1BflSzIXY16/xVOlMUqsqauFM+Gt
         7FwNCfwYkFioU7VhfZZ/PPRDYNzCDDsvSGbpBotDgxRO5Qw+trAYI+DK9jJ7bRamXJoE
         ZxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712337074; x=1712941874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//ATV0kenVxY+YpO+VCbMhoOJAY6Blm9llqGM2OpOvE=;
        b=DOyB/ZOV3fHRqeA+YUuOMDhRXg2GGjjLOO85md1TQQwkXsRrRBvzOyxsYm8muHijWj
         kUn6Pm8wmW7NoPatbjym8FhDKIswrIy+pJl0VQnWijRCiZ1LY7/mXCDtpyoZvCF+FJAh
         KNA5vczdr1s4FS7CIjSrduZeMq6MXTOhoPYmsBkIDgGMDS+t4pE175lmLCwnRNROJdFv
         3dF+sJfKxXU6CxANY/jGf9kAiKJw6FokExnxBDanZrDsaW+/GVVmdBTjSElyAO09/gux
         Wn5N5TZin9Q7DlR0yMxTytp7mIErE9CT9qN88s5MHpkb1gGylvXRJpHj8DTZ+XaXHjxf
         a7kg==
X-Gm-Message-State: AOJu0YzwZVZt6uVajl7PjFUGTZTPJbz8fTMuaS1mBXah2CHVyhrxHiuH
	ejMkPt9A88Qa8qTzoh1PZ9ZAwvzLNzmRg260HBsbEfaYDujo2nVbwjHGBFEL2zk=
X-Google-Smtp-Source: AGHT+IFBSROifMFeRNq+VIHBhu2ExeIfkBBiZ/EoMcJRlwkhPTIirMIN5V8svymrCefa/SGjtyHjLg==
X-Received: by 2002:a6b:c8c1:0:b0:7c8:b470:74af with SMTP id y184-20020a6bc8c1000000b007c8b47074afmr1961450iof.8.1712337073761;
        Fri, 05 Apr 2024 10:11:13 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id dv10-20020a056638608a00b0047be708f348sm683438jab.18.2024.04.05.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 10:11:13 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] openssh: add fido2 support
Date: Fri,  5 Apr 2024 11:10:56 -0600
Message-ID: <20240405171056.3300551-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 17:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197987

From: Dan McGregor <dan.mcgregor@usask.ca>

OpenSSH supports FIDO security keys in both the client
and server.  Add an option to support them in oe.
This change requires a new recipe that I've submitted to
meta-openembedded that has not merged yet.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index edd8e8c2d18..d941664b417 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -58,6 +58,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 # systemd-sshd-socket-mode means installing sshd.socket
 # and systemd-sshd-service-mode corresponding to sshd.service
 PACKAGECONFIG ??= "systemd-sshd-socket-mode"
+PACKAGECONFIG[fido2] = "--with-security-key-builtin,--disable-security-key,libfido2"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
-- 
2.41.0



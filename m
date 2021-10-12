Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127ECC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 15:44:57 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web09.15899.1634053496072657801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 08:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5HMe2EF;
 spf=pass (domain: gmail.com, ip: 209.85.166.177,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id g2so21037949ild.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FDY4KZvsXrZq7ucBta6WrEtlAVamGFUL3oU1q4dARgg=;
        b=S5HMe2EFtbk1FqWLjgqaLnnX+8paVCigndIVcXKumM7XFTYdgys9SEKz/99/1ELnkQ
         sdjIZ2FCM0z5Nku195KieBsMjrUnwLtI158HVSTz/ROVOT7ZmrTDrirYEQQqfdJ6UKKG
         6bXjXoLfMCvSxOaJgYoEpZRoC70vQX0OY2MmWETW7BhKJOqLtG+tAHGNLUUcTY6EN896
         VMfqofT2iFvVgdUCRnsNaiRXz4X0DQXEP34EzZ1HvXOY76NG3/M1VftWetWG4U3XoI2O
         +UNwj9lhBa2sH/Aav2qJ1m1RrEm3BTOuDot2ueZ1sNupZ8GHq8MOfGieM5rvB+Schl+2
         TYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FDY4KZvsXrZq7ucBta6WrEtlAVamGFUL3oU1q4dARgg=;
        b=RqaRtlx6lSZmExeC7gM6zQSlYceG+bihR6cEhNa/lbd5DJ91Y5i8tvG4zBqO5e7vyf
         EzInuAweNM+NH95FqaPKu3rFBQTp1zbYmoPt7LG6jBmk4aFAK0mZ2+aol5OQFxv4tIUF
         MQVgIT1WQGjxOdOBsB7Bk2xUJWmMAz1CiMWNsuRiSymgWph3ZaNSANXLFAhbiDiBOwkk
         Afvep50B0aGubWPgL0R8h5NxZ8VCSO84Q18LtEKJi5Eg+ANhsBoCQKoJafs4Vq1XGsMI
         uxV2YCU4lkFJs2hkuvSKWuTX4eDad2XmvxHkMolFt5n6MU+lh08FIgEqjHNwpnl7DRYX
         PZ6g==
X-Gm-Message-State: AOAM531BXXqfgWDG9vGrwDumNfcJU/B6CD5Pb7fLm4iFQqQyKpzdNV/9
	+uEtMiBzWnfKw+JWjKNRVX1aC2/V93Q=
X-Google-Smtp-Source: 
 ABdhPJxSzEuupqqriShHn+azGZu0M/cwyzxXF5Gn69tc+RxpU+5OBfF87CQdBQCNCha1AAAzZs8vhw==
X-Received: by 2002:a05:6e02:1a0a:: with SMTP id
 s10mr6906731ild.76.1634053495406;
        Tue, 12 Oct 2021 08:44:55 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa
 (204-83-204-143.prna.hsdb.sasknet.sk.ca. [204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 h2sm5594942ioh.14.2021.10.12.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:44:55 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 3/3] bitbake.conf: Add gpg-agent as a host tool
Date: Tue, 12 Oct 2021 09:44:50 -0600
Message-Id: <20211012154450.1279395-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012154450.1279395-1-danismostlikely@gmail.com>
References: <20211012154450.1279395-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 15:44:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156884

From: Daniel McGregor <daniel.mcgregor@vecima.com>

If gpg is used, it will find the first gpg agent in the path, this
may lead to issues where gpg comes from the host, and the agent
comes from a gnupg-native due to package signing. The versions
being out of sync causes gpg to fail.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f3ff5b776b2..e9ea3f2c9c6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -498,7 +498,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "aws gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
+HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
-- 
2.31.1



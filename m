Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED95C4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.70859.1669472175674810279
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yYMl5Aoz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id x66so6477838pfx.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QwLrrw76aaTG5kN/kwnQyWiXHAgdwl5WjDnGwD1EqQ=;
        b=yYMl5AozHUyb9xJjKuuUGZBUaH+2L6uG4kCyPylFSFPBD7pM7kEENaJC5CjE17IVyH
         xUa7zs/tOxHjAA4NqC8aOzq/slox+nJhhN7UBHrVmXr+z5eo4NTegG8KOEnPcQXqVbfe
         kKa9nIiylNZ3bVcyeHO0PttSxVtNUmcsljKOqEjG8QDmWgunYUYHHytesXYGbAE2pzXV
         TrkGQB8NBhVkqxL2AlF2QP3OXk2Kj7N4phcyokVAmZEfHCClh2GP+Hw2ls0qeR+x0Flu
         geiSpcNXvXGIiaFmHqeQjhD2AIj3NkdtZB8rvYXq3QjXKTN0n+Vgy36xLevkE+H9NyPX
         Gzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QwLrrw76aaTG5kN/kwnQyWiXHAgdwl5WjDnGwD1EqQ=;
        b=I0FH3SD58wORaPkfWAdiAUHGsSh2nEv686Qqq4Khaq6eCWm69glBDlFcQx64HS6Fqx
         X941mOUgKaiRlcbgYfsoReF9gOdq3Vhr08K7jZOhJVFUGZTnQzObAqcRm3mIJHlubRk7
         xrrgI8/EcZTDGB4e76vDacYGm8RGA3Edv6dH/hcolZCik42u9dJgs/uIj1D5MuFoEn66
         iKJeNw+8vZZKlXVbIHnWfBwH52LK1qaYSeNWoByOAYi+BKYT97dqMToNyVTFRzfRV00B
         Ld7guPIE3JgDdhxVj9ywu/7SlbzzUf/Tkzco0gxZ7nqwhfhY0C/OVuDZRgW4Ipogit3t
         6RTQ==
X-Gm-Message-State: ANoB5plMMYpV4kE37OrN6MCs4Ace3l95Y8Cd8f307i/8NcFn85c4Qr5U
	n655gUKtoxgRtx9bMmEmoCoJwZSzU5yzFnn/3vM=
X-Google-Smtp-Source: AA0mqf608lwIz4v+Ryd8KzAFlhBgyiuJdNdRg9OWuBRpAJnOQbVsjr3LqxD+q1Za6wKMS209bl08QQ==
X-Received: by 2002:a63:5d21:0:b0:46f:188c:3312 with SMTP id r33-20020a635d21000000b0046f188c3312mr19680221pgb.562.1669472174725;
        Sat, 26 Nov 2022 06:16:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 34/37] sanity: Drop data finalize call
Date: Sat, 26 Nov 2022 04:14:38 -1000
Message-Id: <2be6815946e87a670c809e7fa6e7034a84693e45.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173827

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This call was effectively like update_data and no longer did anything
in bitbake. Drop it as it is obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d3eb4531aae28a07cb7e52ed5fe1102445d2effd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sanity.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index a52f2016cc..8ec99716c1 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1005,13 +1005,6 @@ def check_sanity(sanity_data):
     if status.messages != "":
         raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
 
-# Create a copy of the datastore and finalise it to ensure appends and 
-# overrides are set - the datastore has yet to be finalised at ConfigParsed
-def copy_data(e):
-    sanity_data = bb.data.createCopy(e.data)
-    sanity_data.finalize()
-    return sanity_data
-
 addhandler config_reparse_eventhandler
 config_reparse_eventhandler[eventmask] = "bb.event.ConfigParsed"
 python config_reparse_eventhandler() {
@@ -1022,13 +1015,13 @@ addhandler check_sanity_eventhandler
 check_sanity_eventhandler[eventmask] = "bb.event.SanityCheck bb.event.NetworkTest"
 python check_sanity_eventhandler() {
     if bb.event.getName(e) == "SanityCheck":
-        sanity_data = copy_data(e)
+        sanity_data = bb.data.createCopy(e.data)
         check_sanity(sanity_data)
         if e.generateevents:
             sanity_data.setVar("SANITY_USE_EVENTS", "1")
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
     elif bb.event.getName(e) == "NetworkTest":
-        sanity_data = copy_data(e)
+        sanity_data = bb.data.createCopy(e.data)
         if e.generateevents:
             sanity_data.setVar("SANITY_USE_EVENTS", "1")
         bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity(sanity_data) else bb.event.NetworkTestPassed(), e.data)
-- 
2.25.1



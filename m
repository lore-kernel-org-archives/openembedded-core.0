Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4C1C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:29:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2510.1636054189616114222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WiBAw/44;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id c4so10245513wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLeBhLkdNfPu+41lAuayKEJ8/reSZKpOfV5nvg0fxWI=;
        b=WiBAw/44KrxvNysI0JQtR4YP+G2r0kKGBJv1bK329d6SUlWEFgRbguzEgJOpmm2d8y
         zKRLrbCpyjeR9fvrwyPhXQsOq2xcBAtKf1JZKJlE0ZHQrTFGroo4av/eal/EIK9y2MQ2
         GC2sHQGjLdni5IPLeAFj0jOoookBh39vgtVAakaVpeZfyieoLwRvVmkwuTYLVhCTg2do
         6nY7sOHxvExUd3snrFebVPdtwyhhPKq2gH387Kbh4/RS1AyvMuRYW/tpPPjWe0CQVZLs
         T69EyND70+Jvy9AHQn8K8nTiKudPMEqUZyKOYA0GuL/Gnt1aW9Eb48K4d18UgX4qjpT1
         9r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLeBhLkdNfPu+41lAuayKEJ8/reSZKpOfV5nvg0fxWI=;
        b=tLKtlzgBZvWTm7Hme6qCUPTvQQDm0jtjNHCQVgB3Gup7cZ/GJSNYBcu5YMVNXy3Rf0
         7tpef5oXdBe1wZCueYJ2p+7AjJ0SQ3uOgTvrO4qrTNAHL+1EaQ8dQlwt+SKWxKy/5wak
         3CuZ9NMw7Lmfj0vThS/cU7g+kG+1Zrz7pJxIHt94LRNN3f/K5nuHvIDItt45ciT4fiOP
         IxnoWDluSm8KiSlnww3/zYxJwP6k/kTOwDplx8W9XkYfGRpIDIfMCGo+49YFiX9WWuLS
         MPB6nCiMZkjDWck0kdykLnADfuWAlhV/NYzySjnSxX0Ep9uN5bdc2deqGAtd6uCq4i9u
         YkNQ==
X-Gm-Message-State: AOAM5313hFcfhNXz9CAdPl3DBRK8hr6P4VT0/Ar1VjDSFLoYMOtGGWS4
	b+71UL3miRLF4leYEqfYp4QRUYcr8wg=
X-Google-Smtp-Source: 
 ABdhPJzhxbwc4MphmF746UpvieRl0WRqYFgMqldvXr8KVXRhn3r8DAu8OgmC1XEj3Mk63Gip9cgIWg==
X-Received: by 2002:adf:959a:: with SMTP id
 p26mr66310101wrp.342.1636054187869;
        Thu, 04 Nov 2021 12:29:47 -0700 (PDT)
Received: from CTW-01195.. ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id
 s24sm5632478wmj.26.2021.11.04.12.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:29:47 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] bitbake: cooker: check if upstream hash equivalence server
 is available
Date: Thu,  4 Nov 2021 19:28:20 +0000
Message-Id: <20211104192819.88251-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:29:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157859

When the user specify an invalid upstream hash equivalence server in
BB_HASHSERVE_UPSTREAM notify the user that we can't connect the server.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---

v2: make it a warning instaed of fatal

 bitbake/lib/bb/cooker.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 194595ce8b..2b92744998 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -388,12 +388,22 @@ class BBCooker:
             # Create a new hash server bound to a unix domain socket
             if not self.hashserv:
                 dbfile = (self.data.getVar("PERSISTENT_DIR") or self.data.getVar("CACHE")) + "/hashserv.db"
+                upstream = self.data.getVar("BB_HASHSERVE_UPSTREAM") or None
+                if upstream:
+                    import socket
+                    try:
+                        sock = socket.create_connection(upstream.split(":"), 5)
+                        sock.close()
+                    except socket.error as e:
+                        bb.warn("BB_HASHSERVE_UPSTREAM is not valid, unable to connect hash equivalence server at '%s': %s" 
+                                 % (upstream, repr(e)))
+
                 self.hashservaddr = "unix://%s/hashserve.sock" % self.data.getVar("TOPDIR")
                 self.hashserv = hashserv.create_server(
                     self.hashservaddr,
                     dbfile,
                     sync=False,
-                    upstream=self.data.getVar("BB_HASHSERVE_UPSTREAM") or None,
+                    upstream=upstream,
                 )
                 self.hashserv.serve_as_process()
             self.data.setVar("BB_HASHSERVE", self.hashservaddr)
-- 
2.33.1



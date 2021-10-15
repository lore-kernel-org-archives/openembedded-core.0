Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73B8C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:47:40 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.4693.1634341659633785906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SYLyEauq;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i12so28970775wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GQ5k4K4SgwPH+mM7UnpcRnqZp35QTIuFxipv4Pmkn3Q=;
        b=SYLyEauqJB3UhR47UbvPXeUN2syp2yph5z3ZZjCD7/SDEAgo61tBzY3l+bGdCGkRlW
         pKhct4esd2fZuESNe3JsIXXAEKlVEY190XQfkgVJFvu/z+OWyOQ8Mof1fvgJ7qza0ZYs
         ZErIVAxCULis/uG45X3jSMXKqz6c6OgHTJC6LIPCy1fFJoptZnyfPVRQO5/roy+HtvjK
         QfPEdNn2jJHsn19GIc2EaftqYls72acuAajxorZ+zKhacB40MbMAZf6tl2t5+mtern1r
         SJ6kLJwFQ3bg4UnRBpoWTxi/lu/CFW3tSZmXjqolk0Ng8Be9YOQw23/PZZyhLqv3Y2mg
         N1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GQ5k4K4SgwPH+mM7UnpcRnqZp35QTIuFxipv4Pmkn3Q=;
        b=ZrdTCq5U5t3SQYwe2yYaQY1hoUdZ+APihn7wxDzpyBrhaVLNNXahMX+vRF3JYCV9G+
         nMrEokVBB37OxN/LOLzhgtcRPUPV+VBaySwZSdZPxp6Wyrpc9xJtR7ZVCVu47sPsdDTS
         U4Hc99ZWWoTei6xP6mS2BOr0PbCX/E/I1WuyZcv2SQW+KPqQN2lP47wB75zSCfFRfIad
         cfpxxtGV+K4cz472m9goUk7ID3EmGNyq3PqJzeoccLEuNiYP6CtFN7YIya7JHWbAySPs
         CXAEYzP1uFKEmMqYBhSttwhQ4olirQ9GWqtOx1vA/cDjzIEkkZm23zTKPj6rSMa+EXPD
         0k3A==
X-Gm-Message-State: AOAM530Cevpbk0L/8UoKIBsQPSKScTmupaSEQ7i0lync0daM/bE4A0ie
	zwAV7YqHgsnQjnzn8xLf6evYlyF1XA4=
X-Google-Smtp-Source: 
 ABdhPJxIcDlEplybQwiyC55Cg/kd2m0oBYqxEvLIbprCFmiUfNcBmaihlb8EzNrUy5jzrP0bEvItGg==
X-Received: by 2002:adf:a48f:: with SMTP id
 g15mr17333777wrb.259.1634341657843;
        Fri, 15 Oct 2021 16:47:37 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 e1sm6372986wru.26.2021.10.15.16.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:47:37 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] bitbake: cooker: check if upstream hash equivalence server is
 available
Date: Sat, 16 Oct 2021 00:47:28 +0100
Message-Id: <20211015234728.338196-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 23:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157010

When the user specify an upstream hash equivalence server in
BB_HASHSERVE_UPSTREAM abort if we can't connect otherwise the
user will never be notified about the problem.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 bitbake/lib/bb/cooker.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index af794b4c42..34603c5ea2 100644
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
+                        bb.fatal("BB_HASHSERVE_UPSTREAM is not valid, unable to connect hash equivalence server at '%s': %s" 
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



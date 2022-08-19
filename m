Return-Path: <tomi.belan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35927C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 15:21:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.4388.1660922465659062654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z9nCic/Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: tomi.belan@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id q2so3941743edb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ZkCKKcErzjv4B8K7VIfCzkTaIQns+lKxDqwGAGOo1OQ=;
        b=Z9nCic/YhmKu2qDtvjzR1OXY7s+NGkL0mo11/NKKl7k+32IscyXFytq9z0gHJI1w+0
         GNOxpZz82Q26qShrwzQLLlEYHTgL3ejgpkR2UrvV4UP62ajPFsX9Sh7+28MTy8q2PLdu
         F5meg8eHnbx+DgLrE0sy/bw9bJ/GiW/rpo47OsgVZdj8e9TT9/tEQFr3g1V/OsqMTP91
         adWrM711TdXrcpJBVZgRwvAPBWknGheX1fLLz/WI5K6RG4PfDRuoZwgdiazo6ZLNbr21
         Xg4+dS2jUp/YSOI9O+TQve9dr6DLHe0cswL3f3hRuCCnGOK+TH3M89pE3bQtWqYUbCsm
         fDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZkCKKcErzjv4B8K7VIfCzkTaIQns+lKxDqwGAGOo1OQ=;
        b=TCmXnFOxnefTp+RQeq9tvqHoE7LAGQ81x/mrgffo69SO75a1XRWR5h1JvsJNamNFMx
         Pj7nZ9cTu9U4YUf66nO2Qw4dN8h6CdpCUTDuhvbk5cg6lHR/Mh1bYgmTWpyRdlkb1fYT
         YdUNKu738vtBu6OJObvW1+yBr5Ja0xzNfvWP+FbUZaQSfdKWVZS+bUXSroPKM+d4tJNo
         qguyGPZXVBnjmlC+ol6W1R0wqayr0datsDbGtXrgVB8d3GZ7EwhiIS85xtHzuSTLB3Vq
         T1CVb0QwHvsosmfUcSUnWQyyf5QHiw05eUjxrfITBErNXiWUspuhLVVvgU00gYH3/7HG
         0cFA==
X-Gm-Message-State: ACgBeo2PxJ6XrHJj8XoAwWYyG8yfR1hvPoKdf1erTopkSm/dKoA4xDt3
	d8K7C0/JvlKPry8jN9Vdp5ddLIqqIZk=
X-Google-Smtp-Source: 
 AA6agR7WUrsZnibnXX2m2FeqrKWH7bdEy0pYZySdFZ3uXo1vPnDhyWHeLoTowPyXcSiiFJQWAe4YBA==
X-Received: by 2002:a05:6402:5202:b0:43d:d2ff:5109 with SMTP id
 s2-20020a056402520200b0043dd2ff5109mr6384311edd.88.1660922463710;
        Fri, 19 Aug 2022 08:21:03 -0700 (PDT)
Received: from smnd.sk (deuterium.smnd.sk. [193.87.13.210])
        by smtp.gmail.com with ESMTPSA id
 g20-20020a170906539400b0073c14e7589esm2143844ejo.161.2022.08.19.08.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 08:21:03 -0700 (PDT)
From: Tomi Belan <tomi.belan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomi Belan <tomi.belan@gmail.com>
Subject: [pseudo][PATCH] ports/linux: Remove build dependency on libattr
Date: Fri, 19 Aug 2022 15:20:21 +0000
Message-Id: <20220819152021.26298-1-tomi.belan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 15:21:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169635

Apparently <attr/attributes.h> was only included in order to get ENOATTR.
pseudo does not use any other functions or structs from it.

More about ENOATTR:
https://git.savannah.nongnu.org/cgit/attr.git/tree/include/attributes.h
https://github.com/rust-lang/libc/issues/1356
https://github.com/golang/go/issues/753

Signed-off-by: Tomi Belan <tomi.belan@gmail.com>
---
Hi. I'd like to contribute this patch to 'pseudo'. I'm not familiar with
git-send-email so I hope I sent it to the right place and it looks good.
Cheers!

 ports/linux/xattr/portdefs.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ports/linux/xattr/portdefs.h b/ports/linux/xattr/portdefs.h
index 068d39a..beab7d0 100644
--- a/ports/linux/xattr/portdefs.h
+++ b/ports/linux/xattr/portdefs.h
@@ -3,5 +3,8 @@
  *
  */
 #include <sys/xattr.h>
-#include <attr/attributes.h>
 #include <stdint.h>
+
+#ifndef ENOATTR
+#define ENOATTR ENODATA
+#endif
-- 
2.25.1



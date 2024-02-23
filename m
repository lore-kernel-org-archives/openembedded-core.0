Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE41C54E51
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.8982.1708689707167090497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZWenUI5v;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so86625766b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689705; x=1709294505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uykDh6tidqiAhfxLvh+iRdpFFA/dtrPIiixnnGiCnN8=;
        b=ZWenUI5vb8wKyqhsY4dg27YILOxz95SnAV4Ya0cZ0FKdeDd60emM1z6UIQoCBrDY2d
         mARCST/4+t2+YSPA690Ybfeh4amxLJX3z5u2PlmOFlmihgm0WoVIuG1YjxIhn2iKwK/z
         G66aRvBB0XREgBUFZswueO1Jwh+wcoa4lDaCZybe8ltBr41IKzH6FypP9DVTMuwnaT+w
         frX9P6JglM1sWnNnVkl75bDiBtTOPEBzzoTf6346HkBSBb8ggMsUKwL5jUsMkSeaNloQ
         eYM/tlp5LxrB9yPcD2mRLT9gntj366s89tWrKx33upnD5Zyvx05g+5r4YaeRf5vXUhnT
         XLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689705; x=1709294505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uykDh6tidqiAhfxLvh+iRdpFFA/dtrPIiixnnGiCnN8=;
        b=YlXacQoCxtSqmKq9otQ7DHiLa1S8PP52nTIP4icKvS43zZ8/RV7Czu95a8BLXg0K08
         BeRzcn/VL/IdapDB22LlOC+UdZatsq4WCU3wsCIe+D5CovE4KVjLRpkwcUAw+0CXHZ8/
         OnlndiKzw0u4l6GaGR35QIoV8Ly51KaqeLR/CMqJbicCwkJ5eu3C745nF6Yvp/sUpPGb
         kafSWNJfCl5/TH1zmxKMC7INOi3M6MT37lHn4Lv1QGNFuUKnsmv6iQzGdc7gRbv9J33+
         ldEdOAg5bVwXsEF3dPkOa/lDw2x3UfktuVi+Yy9TG3y9oGiKIcueHmjs1Myrz8Hc0Lxu
         dGSA==
X-Gm-Message-State: AOJu0YwEkrOAGLzlZySxJ6Ij31nRtx1Jb2UVSujq3GKSfBI62LewFqBs
	HY1xAxEluEiWY7+OgS2fMez/Gulx2Mx4sSMXXlKOQub+I6QD+Kj2Ld0n+nLV
X-Google-Smtp-Source: AGHT+IGMNq4pVLfPjVKTMieSeWHklwYPU5lULRyQ1IQgJx+wfWgWyCDOdcxaPl1khgtLkw6aANcl/Q==
X-Received: by 2002:a17:906:3413:b0:a3f:9971:bf73 with SMTP id c19-20020a170906341300b00a3f9971bf73mr493785ejb.55.1708689705628;
        Fri, 23 Feb 2024 04:01:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 06/10] lib/oe/sstatesig.py: add an option to make a unihash cache copy
Date: Fri, 23 Feb 2024 13:01:30 +0100
Message-Id: <20240223120134.3713127-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196066

This is already performed in eSDK creation; the change allows also
making a copy with a standalone 'bitbake -S unihash-cache-copy targets...'
command, which is useful for replicating builds on a different build host
(simply coping sstate objects is not enough if they need to be discovered
through unihash redirections).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aa891ecf0a0..e2582917fbd 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -146,6 +146,10 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             sigfile = os.getcwd() + "/locked-sigs.inc"
             bb.plain("Writing locked sigs to %s" % sigfile)
             self.dump_lockedsigs(sigfile)
+        if 'unihash-cache-copy' in options:
+            cachefile = os.getcwd() + "/bb_unihashes.dat"
+            bb.plain("Writing unihash cache to %s" % cachefile)
+            bb.parse.siggen.copy_unitaskhashes(os.getcwd())
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
 
-- 
2.39.2



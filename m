Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9446C25B79
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.9479.1715082406610108761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WtTR5Gz1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59e4136010so280269866b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082405; x=1715687205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D60eP3TaT3Vsq4Bx85RYVlPWdsP28ojmQ/3ZERdDwYo=;
        b=WtTR5Gz1WAggrNj2k+2q/umsi3GRsFiMTn1iYZ17D0mTwxBkMGzgyXU44agx61gtXk
         ugj/rjrDH2WHCmvBOmwfeufqLHE/kYFd4A/Y9pg+Gl+nf5IE8FnCDB7C0C7Tkhh/Klzy
         cgFjbeop6XeXOUwudfVLqVElj8yw4atzZvP6YG5KB3gMucSo599xaUXd90xAC7KPNvCu
         t0D3P32U8ktko2zkaEtOoif2MLjlPa3ayWrMdd6uW44P3edJrPqpz2p1MthpeOUTtHdp
         dAh7hgPKPY6WBOK1yJPlDrAR97Pj4KjVVpSldRt5VDAxnAtV6iyG5mO+ELOoSpknVJiK
         aykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082405; x=1715687205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D60eP3TaT3Vsq4Bx85RYVlPWdsP28ojmQ/3ZERdDwYo=;
        b=dpcaCvxS36Evg3wZW5bvcgm3lXTI2vz2bk1DOOrc5SL7SYyToqgdx3IHioeN1iHw0U
         nYb4OInC1mecKkFb7KMsOXljBC1VK29PkihkVKtK2EwzIeth1IHJl2r1RlyT+p/FEtP1
         lhURCRLS1b+W0wNdzEXkQVzMZUX/Sen2VbWlYdWXRUdNbHv4gnYvTHOGqQy/HtK4ABHg
         NlRDjQADO9WJd7tyYAM2V/IL623U/hr/ExXNmIY9qLCkUnVpLYhl/bgoV5s234Nu3cyu
         2kMA1LwRFo8FqdEF/ZpOs2Wcuig4VECiON6PgmflzBICY29zgi9mf7A78YwtulxN7WjE
         gSkQ==
X-Gm-Message-State: AOJu0YzPa8zvuTBJZpgTmQOQbHJF9K2d0JxO2hnTTzOuIju408FI6HEv
	P+p8WJ1zA0gHV28oRian+vDzvxo0dDW1PKY76QFiKxa1xB8zcmUQA82v6Q==
X-Google-Smtp-Source: AGHT+IE2MegRAHfgJpvnS+StM7PzJ8J8ounvRW92gXGp9A5aziRJAwGQn7E8lSqcPQf7ijRbsMn9JA==
X-Received: by 2002:a50:d61c:0:b0:572:9dbf:1de5 with SMTP id x28-20020a50d61c000000b005729dbf1de5mr7530767edi.40.1715082404918;
        Tue, 07 May 2024 04:46:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/9] lib/oe/sstatesig.py: add an option to make a unihash cache copy
Date: Tue,  7 May 2024 13:46:25 +0200
Message-Id: <20240507114629.2591882-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240507114629.2591882-1-alex.kanavin@gmail.com>
References: <20240507114629.2591882-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199088

From: Alexander Kanavin <alex@linutronix.de>

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
index a46e5502ab3..5dfd180e7f2 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -147,6 +147,10 @@ class SignatureGeneratorOEBasicHashMixIn(object):
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



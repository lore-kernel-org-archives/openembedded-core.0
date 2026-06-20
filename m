Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA80CDB46D
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:37 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6024.1781960435185380227
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p7T4+Xj8;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629d80fa08so2847052f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960433; x=1782565233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbTvyVAIyeVgLUCo6/zmfMFDvdAHxLGLHzAZU3/Cyp8=;
        b=p7T4+Xj8AeLB1D21lWaiZSLL2z81lZB1a9xoFK7vTrNGG8z1oc9nWaAtwTd9qde/Ep
         I4RrkgTuswDOC3gv4llIIxsDoP+hZKlxMzRWK6biM9l+IwRDxyP++YqBBiY5M+N6au4u
         jxJVfKpFNGuwgrtS9nsr5mnLhIzianbrOuhOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960433; x=1782565233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbTvyVAIyeVgLUCo6/zmfMFDvdAHxLGLHzAZU3/Cyp8=;
        b=eQSQjqW3eRFg52sty/NGcSDhJ9ZQ3rfDR1YiFnNTw3Go5BmiLVZejrjg/uPCQNTkBj
         6bf+EvHF44TZvIoObXllhvXlw/qoxIbTgw+ROgnePL96rZc5Z9rA4trR6XHcJUtvXiDs
         sD+lrt614DZ2yHo5li5+/7EXXzWYmzbAvEPJrbdA+e5NopmAGN5s8hEYihhS87HZFsFR
         P2XMyPY6Yg/EFw84mzBUBV6n9XFba+URqBpG41UQGfYH5uLuezzsr2oWDxvIAlWrxt4a
         dp8aC9KuuwoB5wZ2xYly9vWnThJlMngotTR0VxBpJGSmcdVmfEUBROoofs83OtLuPExG
         /WRQ==
X-Gm-Message-State: AOJu0Yx9vsh/J5XAP1wTzqHmLkkcdhje7byPW4BxosPBtiQKhM2UJwAQ
	67APureLfuPaVl9PJEq4GnmIaFWky0uibEOagPO3iUMUhKaQ2XYs6biy+GqCpHwPp87mM6QAVU8
	IOWt6
X-Gm-Gg: AfdE7ck9ZgHIuait8dqE8SULL8PoKTxA3D6zRET1PLbyNmqRupQCb6NkYpsmwMb80y9
	4X4R2g370efnnv2NQdsyI4jRU7tXPK4UBvzKoysk+Vd1IXW3cyy+OMC15CY+edrvZBu4sGh5WzT
	0D0Qf3S9mi9VGPhPOWRWBojoWlF+Te9nCto/Une2dmCGO9+aAn27hyq3LrQyOzjq8AcGer1PZlX
	VRIudY+tlKnN/feWvbamVJRZNNJhB3Z2qGlShH3oouj9nWIp3rshV51t1NFAD8I036b0ujYJCl3
	breazlZX+Mvvd1uP04YdB3WwKfIqjDNyLpvE0gC7SoFmFShLgIA0ZeH/AhonD1oPGQ7X+LgC79A
	CG2TOhUM0kfchFC39ec7EAsfKnLH5EXrYJZ2uT86X3AKNK0KtCWl8xqa1zDiQ7h22Jn2w09J+l8
	b4t1z2KS5z8StgTEuXNVSN1/H54Lgzytt8jzyYGR4ZSfr4Vg4jvNP7bzoSqzkj/Ui2tBhKAk/Gw
	di6qTgL1Nlh8qrW
X-Received: by 2002:a05:6000:1448:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-46506385549mr13327150f8f.7.1781960433370;
        Sat, 20 Jun 2026 06:00:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/36] sstate: Improve confusing debug message
Date: Sat, 20 Jun 2026 14:59:50 +0200
Message-ID: <b5a2e0e857470ff557025c28b593bacecb424bd4.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239245

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The entry being removed is a file, not a manifest, so improve the debug
message to reflect that and be slightly less confusing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
cherry picked from commit 47136a5068245348bbe186a40d4b6b7d0664e22d)
([YC: This is part of the fix for [YOCTO #16281]]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 1d41d9bc207..434557db77f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -478,7 +478,7 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
         entry = entry.strip()
         if prefix and not entry.startswith("/"):
             entry = prefix + "/" + entry
-        bb.debug(2, "Removing manifest: %s" % entry)
+        bb.debug(2, "Removing file: %s" % entry)
         # We can race against another package populating directories as we're removing them
         # so we ignore errors here.
         try:


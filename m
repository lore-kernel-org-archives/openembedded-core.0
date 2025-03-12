Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE255C35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:37 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.4575.1741809396925887860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=r+5R40Lj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so455897a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809396; x=1742414196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqaGDWL1LA4bzyNnKe0URkDxVdSOOF7B0ZbEAFVf1jo=;
        b=r+5R40LjSwhtIE23nzTlADSJov+fkpG5yFVU+KO4jLv23QZSzNwSAcASw30KTT1LMm
         mmPOTmATXEOXs+IHv2/dBL20zqXcAuCksYN77RQTV12ULEKD1gpV8xR/H/y10kVdmJB0
         B1rxZxjyFPN6Ai3MA0mZAPrWDpEGsEm7X8NbnbuLOeRK4ygMayIUGNuQeFzTw3SO9Feh
         tvVxiWKOi6wsIhmf6fjEmFDmDzs1YwD3rw2LHPWrQ+ChLE6K08rIMHRSgn81Zo6Rj81W
         IrBC5cprxAkG7h+a+o3/WgIhPjHV8H+Lw8+8xmvIQwtcZ0DROc0tPZ1qsJCe6PljlOBO
         X1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809396; x=1742414196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqaGDWL1LA4bzyNnKe0URkDxVdSOOF7B0ZbEAFVf1jo=;
        b=PHUo03AB8pJGyLHMgJPv2H0/rGmKhnVM5XJLsgKErd79zctrwP290GoA673oMCQIhk
         /18KvB0ndCB+hW9CyV88ob4qxIGzL3SYl+NxYrMu/06NcMEdQtwigxHpyIxSv81cH9BY
         94qgsLVTq3OdRrwiOFwilMDMlDOy354RSDpbQVOFzLl5v1bMqTYXYLI5CD6/RxXOy7H9
         +R5uJRC1gGjIjA7dqTgVs5Pz5IxxCfqDKYVAohQZOPWnN3jh2PDAdlRJLFlvPJAHI1yC
         zLV09BRiH5TZlp/JdxUIuwytyk2MP2RhUULAi64E6v2WRmI9NKdYPJCkClAEAvG1r+cG
         ORwA==
X-Gm-Message-State: AOJu0YzK8IbceB3zu43wG7fg+kJI6CP9bN9h507nhn/taU2QCtP66F66
	PW9MtTpITTx1AQpbjiSD0uizlj+X8uuzRyiJXnZLJKJScCV2QAO04gPZryk+lOACmzYX9upvvMz
	Q
X-Gm-Gg: ASbGncvwUKPoBKkG6IyqDKk2NFtCaxW1FRlSa9MSit95jjm38DTzlZ85pJW/0eQ0pju
	FVNUVdGGharDeKdxkL2rMI0lZn6yzLSmzlnsx29HbXH+/jUktRRp/o99kf6AtI7llKa/k77w1wr
	WmPon7oWb+SZ69rEhNCPnAvjSVRawwMf9vNGO3iJOBHZBDPNxrzeyeDHMYHQyiQ/wRw2Q7v2GMr
	IRIAb6oI5J9iOONhoIqbCMrVBkGYYzYWSa0mOqfuvzN1bstPy10PwQLXL6h2DwGEGNw0s+yfQ2b
	0NQVzvkSeOb4PsUSZr5sKB7ouRLHPpYCMjs=
X-Google-Smtp-Source: AGHT+IEfFOEvaXkrnu/K6sqFpy1G4nntIUfSmrdaxtcYalWJ4O04lkAmXK7cUJp/vi0IRW7NtczH7g==
X-Received: by 2002:a05:6a21:7116:b0:1f5:8479:dfe2 with SMTP id adf61e73a8af0-1f58479e277mr19184497637.6.1741809396230;
        Wed, 12 Mar 2025 12:56:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/28] xserver-xorg: upgrade 21.1.15 -> 21.1.16
Date: Wed, 12 Mar 2025 12:55:47 -0700
Message-ID: <60d1d54a1c23f007434a1f2c1940fd8ccabe656f.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212719

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix

  * CVE-2025-26594
  * CVE-2025-26595
  * CVE-2025-26596
  * CVE-2025-26597
  * CVE-2025-26598
  * CVE-2025-26599
  * CVE-2025-26600
  * CVE-2025-26601

Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.html
     https://lists.x.org/archives/xorg-announce/2025-February/003585.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5491688a045e52b2a1a00d04b746ed6af456784)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
index 080e6d220e..38c81f2372 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
+SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0



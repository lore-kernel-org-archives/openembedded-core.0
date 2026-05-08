Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9020ECD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8243.1778224358806807045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KquZvWcH;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44509921fbcso891956f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224357; x=1778829157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E07ZQJTxwGeu9iWf0y32FayURW9NtCp2PfUG0wzyEjA=;
        b=KquZvWcHDroRkTW8bw5VLzrYHgGHXxlRIksGd/gE7tM5H0I63M7VKQ0oxp+/YkU/X7
         X3rQUpelHuwdoMz/xNBr/LWaa3oKevQz5YVxjsn49aa9OEAKYQ60vw5pwHaBGDjmJeFP
         zWokQma4WlfNuFDqxeJ+tc8sMdWGN/snH9wPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224357; x=1778829157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E07ZQJTxwGeu9iWf0y32FayURW9NtCp2PfUG0wzyEjA=;
        b=W1TI+Wp57yc5dLIuQkuTqTwieVt+eZlvNi9FOcW5Bu20ZVsl+a28XP9ELiIQe7WcIV
         bsaCCaJxC7rjgos6ZgsGq7BY27Wgv99jbiNIglTAC9KuUm8C7Z8gwJ3tMe8RzbJx0X73
         7qx1HHY3YXXhEV778sgnptPoj+YAX+F7bVGZXHTH3HUcdaouDn4eHqsxzBBdicSeAYfL
         FvcBkDG0V8KTQCGAvQot5DOIv4mghlbYxvU3PCeo7pPHCuwtqB2FJTRF/Nq4vzn0Or8+
         Csg2j/aj/F+BPpEQ4hhO13K0hJqw5mXNWWlSaPLtmyqQppOVGSXqrjft1JP5qJezwu3O
         OXFQ==
X-Gm-Message-State: AOJu0Yx8nly9aRl0DG9gInKeUd4A/zGziqTgp5epMkC+smn6P2jTQdv5
	lO/669Mb17YQ8NHyFInGYdL/DyaT4lSjWL9ONo1vz31N3oTefDOK9Y4DAWl/DMXYhvXz0nyCJ1y
	dwn5+It8=
X-Gm-Gg: Acq92OEs1hr24fe/71PezL8TSw2M3bBe7rjB4b8ix7M+dP0+QaSMKr9hfHJaNQEHQRq
	sS+GKUpr4PDjLjlsmpMgk6OSyxpLkb61OkY6qetrcMwMfot4ehSya3RbBb2vvSyknGZ7rePvbVi
	inWRH+B7WxpmdlisHqaBgzC0bdnFMJaWVizdKxqzux+4dUpEVvfz67SFW8CmP6txz9obegpKiup
	epYHXXzoptImMnDP7B8IqSylwuJQpzQzQVXnF8pNQ84qLDBJALNlwkQc4Ri0VYpFOI1dXa/dDCE
	DhleRADEa8imWiBG8XrwyeTbvLP5WITlGSoE5x1wDvG2qriW0ON/2egjJg1kBA3vjqJQeoPdc30
	LndmrNqHuOe3kwzqVZ48t7wUob893jPb4V9jP+ZMQUM74KS4ZNf5Qruv2HJIVX8Qnmzqz7Z8Zgb
	KQtT9pyFtWfn5XRuZN8aiyLDVbX7Q4BDkwRN6RXSj+QIPN3QiMZPQpdEGp6jKKevZCqTzDPg+A7
	w0aJtaB9FqxwyfId9fklRfOqd0=
X-Received: by 2002:a5d:54c9:0:b0:43d:73d4:b34 with SMTP id ffacd0b85a97d-4515b525080mr13030894f8f.16.1778224356829;
        Fri, 08 May 2026 00:12:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/52] mirrors: remove inactive sources.openembedded.org URLs
Date: Fri,  8 May 2026 09:11:29 +0200
Message-ID: <a6891d24293b28238571fc9bd4fcc3d18778e81a.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236678

From: Antonin Godard <antonin.godard@bootlin.com>

It was confirmed these mirrors were inactive in [1]. Remove them.

[1]: https://lore.kernel.org/r/b9c4ddd5ae72ae21ee0b6e12fb1a1f63661c685c.camel@linuxfoundation.org

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a90ba800f50eed62032ce32261f92f7b77e1181)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/mirrors.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index c8ceb9f5c4f..6f54b257f2c 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -36,13 +36,6 @@ hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
 https?://.*/.*  http://downloads.yoctoproject.org/mirror/sources/ \
 ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \
-svn://.*/.*     http://sources.openembedded.org/ \
-git://.*/.*     http://sources.openembedded.org/ \
-gitsm://.*/.*   http://sources.openembedded.org/ \
-hg://.*/.*      http://sources.openembedded.org/ \
-https?://.*/.*  http://sources.openembedded.org/ \
-ftp://.*/.*     http://sources.openembedded.org/ \
-npm://.*/?.*    http://sources.openembedded.org/ \
 ${CPAN_MIRROR}  https://cpan.metacpan.org/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.edge.kernel.org/yocto/uninative/ \
 https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.edge.kernel.org/yocto-sources/ \


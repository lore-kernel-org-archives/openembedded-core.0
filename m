Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F707C44512
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:18 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5813.1783591637000892889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zhzlQJva;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c7902f47so12975915e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591635; x=1784196435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h8BGweVKLAK2jp88CuzujD4VIOxjC7CxdeK7L6SNjCo=;
        b=zhzlQJva1s//IgP+WQNhelVh8RelGVY8UkyeYyXHp0OIbaOyle0ep59oraCQ2Be1Z9
         uRKR4s5Ls3F7hBdwkfkP2yb23kp9IHv9Ji/G9iRByTctJBsiMs4Dtl4PIbteg3psCW+I
         zhRT3ke84QDo5iV+mSq9saR/OhPJ0uPr9k6h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591635; x=1784196435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h8BGweVKLAK2jp88CuzujD4VIOxjC7CxdeK7L6SNjCo=;
        b=Aw0pxZ/sI7Q5Yur0BPRIUNQuIO89/F5cL7z+0KvgewWwGlhs3y8XbMM5dX0cm5+uJY
         czCgeFG83ym/2/8ujEf2dGIfvuVgDOCkaPlpseId46QI9KdWPxtQPhm5TePQu+Yv1e9m
         LaVaEbFOWSdxo5akjqZgmKGLCFGCqnt2GeKlh5/ZfrxXW5c8jmyPACy//CqwSD0+Itf5
         LZC8/RgBgVdcNPAfGEiWwnEhzliMOiH/0Uyz1jqRQI8pRp0PBuYpfkHHOfP021WhgJuY
         KZbccWTr1bD0LDoP0woSCyFA2r7jzCFJc8PEun5LIgsStEHGDUO0P9ptg25Q9uqqyv5A
         OIgw==
X-Gm-Message-State: AOJu0Yyd1WKviIUbwiVzbDVkTF3u5A5nf7J+HGEOf44V7EXw2Nln2c9X
	38xs4i3QPO/d0uQHYknlJy9VznbJlq2iDPdWinXct87U/fS590zRpWMMMV+UrsqYrINZ5nfQRwu
	t5p+O26Q=
X-Gm-Gg: AfdE7cnysxIsEkOaHaKly+r5p9xGjY/B908OyDsvBR3zF7cUeNaagVJnl1lE6iRioxj
	4KC1oZshYpknjTaOl/HnLI3Nkf+Cf2uplGlBxeHmC1zF0pQvfgmNgLxj4qGGpvWR4+d8d51OdhN
	pTb9tpjmLORRCjRVypbChezAhEx8fM9SSIx72Rdx3vXNx6paZH616ggjEVWqm8OhYvNV0Jd082K
	Havcy2pAwiHafJUYmGdbW3wqDY1xR5O5rpWB9TdT74Veki5PRiSYgOhmcarQJsJVBwwE8632Kil
	iDkHBMnSEHqANnlCYtyH+E6vQiVLdese6Xt7C/lQDWnXmgqqa3fpsVp6e8gH2Q0EU7cGAEpLI1w
	eXoawFecXooMnZNqIvyMiGs+cN1amXWjOaTg8/IRZR5gmbgwmz/QC/89yIKNIQ7pBF85ar4uBTN
	E0+7tSFzA5p0myrtudxv4ngMJkqbKUA+GX3GfaT0TdqpDE9tcnm4pqs+JzQL9zRE5t5bTwFf0qQ
	cXM1/CLEgrzeAuPhw==
X-Received: by 2002:a05:600c:1d0b:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-493e68432c5mr62154355e9.14.1783591635149;
        Thu, 09 Jul 2026 03:07:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/25] openssh: CVE-2026-35387 patch also fixes CVE-2026-35414
Date: Thu,  9 Jul 2026 12:06:39 +0200
Message-ID: <bcc34529fab97dc9e17ed51a38f52af23f85593e.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240570

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

The openssh commit fd1c7e131f331942d20f42f31e79912d570081fa fixes 2 CVEs:
CVE-2026-35414 and CVE-2026-35387.

CVE-2026-35414:
| OpenSSH before 10.3 mishandles the authorized_keys principals option
| in uncommon scenarios involving a principals list in conjunction
| with a Certificate Authority that makes certain use of comma
| characters.

The match_principals_option() function is fixed. Before this fix:
When matching an authorized_keys principals="" option against a list of
principals in a certificate, an incorrect algorithm was used that could
allow inappropriate matching in cases where a principal name in the
certificate contains a comma character. Exploitation of the condition
requires an authorized_keys principals="" option that lists more than
one principal *and* a CA that will issue a certificate that encodes more
than one of these principal names separated by a comma (typical CAs
strongly constrain which principal names they will place in a
certificate). This condition only applies to user- trusted CA keys in
authorized_keys, the main certificate authentication path
(TrustedUserCAKeys/AuthorizedPrincipalsFile) is not affected.

CVE-2026-35387:
| OpenSSH before 10.3 can use unintended ECDSA algorithms. Listing of
| any ECDSA algorithm in PubkeyAcceptedAlgorithms or
| HostbasedAcceptedAlgorithms is misinterpreted to mean all ECDSA
| algorithms.

The rest of the patch allows to correctly match ECDSA signature algorithms
against algorithm allowlists.

The full explanation can be found on debian repository:
https://salsa.debian.org/ssh-team/openssh/-/commit/ae190b6440b7c599d759527965334eeb49cc75b3

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...CVE-2026-35387.patch => CVE-2026-35414-CVE-2026-35387.patch} | 2 +-
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/openssh/{CVE-2026-35387.patch => CVE-2026-35414-CVE-2026-35387.patch} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
rename to meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
index c4806bd9935..4839d76fa80 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
@@ -14,7 +14,7 @@ Reported by Christos Papakonstantinou of Cantina and Spearbit.
 
 OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
 
-CVE: CVE-2026-35387
+CVE: CVE-2026-35414 CVE-2026-35387
 Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa]
 Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
 ---
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ea158b56b41..4193bc8a5b4 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -35,7 +35,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984_CVE-2026-35386.patch \
            file://CVE-2026-35385.patch \
-           file://CVE-2026-35387.patch \
+           file://CVE-2026-35414-CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"


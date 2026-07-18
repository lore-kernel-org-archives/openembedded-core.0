Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02941C44530
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2630.1784364811185429919
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jwF867FA;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so58597645e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364809; x=1784969609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QZ9xPG19fW3vP0fPMh+heEh+YWw2GYpCKapJFVssA1w=;
        b=jwF867FATlSEsw7kKmRKmHroMTUYn+aS9PMER8mzXdKtoZrj4q2h0/dATspnh/2HSs
         3M9RkaBDjshFifrPFxNQXKniCNKejmvYsNWPtI55E7/QR7wDVDoVxswda0yGVk19wUv1
         iZ5fII8JJIZJ7ywu7sZ0YLGIGBwtkeMMHx1mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364809; x=1784969609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QZ9xPG19fW3vP0fPMh+heEh+YWw2GYpCKapJFVssA1w=;
        b=ccjbctgOuKVqY9sOv4iyD7HeA8yo4WU8dBygZEiZpZeGp5f3aYnfi0+3sfmR56LzVl
         JBnKhaXpXG7NBQc6hRKjBkxC/wL3aS6iLBC78s8LTO66CzKSycEQ8HNinKpeNFbxDlbC
         bBgGmOV1bMS4o+lFICTrlNXEnNECpmW6biNfTy8pUNOrEejxS5D6fr1nWozF0y4PkkI7
         d0994r9v5WFR7U3pV16gTYa+mkoNwiAtHUjmq0TuLrD2wzh6WqZ4CUSk67Uz2OW5nAG0
         bD6PdVuUXoNEvT+o/obquaz/YkFd/okWY9pO4/0uhQrB+j1PNr5kQAtTqJqT8uRcF/Y2
         mcKA==
X-Gm-Message-State: AOJu0YyM24wKTIq08YqwgUMzBhQTXjOEhVVWlPz6VllWwPrfttUKNZpN
	hCbxW+ovuI+Ru9DkxQV2IAXT7z7S4Pim5b84HYd+4wrBSY+seuUVjnF/zmNZ1F497UZ2lwt2PkP
	OdfcDs2M=
X-Gm-Gg: AfdE7cl+YdsA7a2I4AgKCFRNDIrb8JdgyexuAYsVU4UWmTS0ogXb9NKTg3/Whs096Aq
	6jh8JkPJ7rlgN8eRNIRXokHcpTulP5DL/7RNY8dqHGYYzcfDqB/ICJ0UN9sbeVt7dYYwsvoB3uR
	a0ylaYJRFlEQ/zoIM3EpIq5OGfmajFevJdV38Ij+siw7LzyaVd87a1zbDya0My/jQWg63hVlWgp
	GmI3RG6CkU13ArrS1FuuAHNVXqs4ZUqMsfRj/XuXYa37EZu6xWJ9oOOOACcrze7knWG+tdw7H6D
	f8oj5cI4/Myk0H0/HoqYmhQsFaZaNhJPlvUTv4Ia96ulFfUVzpoZxsIMrWEnsl3E+odLZi6nzRr
	xa+gGekhu3tl8JBV5PfjKZSDdkkqlUQjUrfwyeOHYOUpMEobpkYTncqfs3VAw5DQZziOVz1iEW9
	W+8f65pPIG8wyCx1TcjE1/EUf/5+VLYQ+7bGT327QC7ABZ+Y/giPuTHBJYuh2TQpPDSaP2GvPHc
	FTw0+AfXEyHO5bqcQ==
X-Received: by 2002:a05:600c:5887:b0:493:b56b:c45c with SMTP id 5b1f17b1804b1-4954a40d424mr48703115e9.30.1784364809410;
        Sat, 18 Jul 2026 01:53:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/17] flac: fix buildpaths with doxygen enabled
Date: Sat, 18 Jul 2026 10:52:53 +0200
Message-ID: <5390d8d48d3412d3450ac2afe7d335fcdbf579dc.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241251

From: Peter Marko <peter.marko@siemens.com>

When documentation is built, buildpaths errors occur.
There is one path to S and one to UNPACKDIR.
We can have a single sed rule to fix both.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9905d3d66c13045e2c422a36cafc8ce11db37c01)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index 2f43b4e84b2..a667ea9f625 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -44,6 +44,6 @@ FILES:libflac++ = "${libdir}/libFLAC++.so.*"
 do_install:append() {
     # make the links in documentation relative to avoid buildpaths reproducibility problem
     sed -i "s#${S}/include#${includedir}#g" ${D}${docdir}/flac/FLAC.tag ${D}${docdir}/flac/api/*.html
-    # there is also one root path without trailing slash
-    sed -i "s#${S}#/#g" ${D}${docdir}/flac/api/*.html
+    # there are also some root paths in API titles
+    sed -i "s#${UNPACKDIR}#sources#g" ${D}${docdir}/flac/api/*.html
 }


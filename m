Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3439CC48BF7
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:52:40 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.16962.1708084356324859604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ezfne/4N;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so266507966b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084354; x=1708689154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBhXLLV3dRsG/OR5TSIuX3UTVzCbbXcEDhkGoZln/u0=;
        b=Ezfne/4Nuk5eklHd4KsAV5e7uH85+TUvQXY9w3qmasO4/DoIlJrG7SQ3zYO/Nm1GT3
         pSdLvweqrPQQLxtHuhCfISnjT1TQgCifdcNv/x2S+wMUiQ0IgLhDaVnJeeBg3zZkqTT2
         r50Z5Ye3mc6VHu9hPvrvdNeH+3EYh+2QRY5OZ3g28c8JXCDGAUvYt07i/DMTCv4KRqU1
         xc7QTs8hlqQL9FtxiJTNGqNltRs5Qscs8htXT2y/YO/5jby6rFd6iQKoZApAIxiF02KM
         vfi+mKSHtOquvQhipe4A4K92LIcRuCM+88+Uz/micXN8TUn42jN9BSgGBBrL+6O26VlT
         1p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084354; x=1708689154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBhXLLV3dRsG/OR5TSIuX3UTVzCbbXcEDhkGoZln/u0=;
        b=jVVwfs29LqhQqYUORWa/SSrpIqKgGDlQZ4K86dKil0GgcvOvUd3OVFBACIRzX8vS7P
         Lq+v7tr916R1pFiyP+cHxdm8bRdM0rNF2yFTRCxgX/CzFc0BEzJpDI6A4ItwDPqcqTiD
         fn5n6DHJYgE4CFU56j0nbE5G1d6uMjTIUvDdp+jiNBn2dlGQMFOFhgad5Bc2aQR5HRb4
         jct/Hkl9weL1CMLT7zU62jZHafukFULVEub8WJGQjB0T3JmR9RYAsc2FsfIUJXxClRsb
         y76FihC21XGetaIFAee3CDQel4SDDp1CkkBnSos3E2dbxKIzwO8HF5ePl+ISybJaLg3K
         c8MQ==
X-Gm-Message-State: AOJu0YyQvPi6DSqzVZ/y55Lze1qdtWRuqEzkZSw8diMQl54Kdnx9980F
	7/h59raXennfjfrLCE/gJgVZVCo08xYBLBLspRW1uEekessF7RBOOpsyKAOx
X-Google-Smtp-Source: AGHT+IHLCP7j2McPx2X0Ij4Byf8CfIQ4W2DIJbB2HjwCnMhyFjERPcjEW+ccPExKvMpWK8v2FOhVEQ==
X-Received: by 2002:a17:907:9873:b0:a3d:e22d:3d3d with SMTP id ko19-20020a170907987300b00a3de22d3d3dmr887814ejc.60.1708084354638;
        Fri, 16 Feb 2024 03:52:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906d11000b00a3dbd16d1b0sm845788ejz.54.2024.02.16.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:52:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] scripts/oe-setup-builddir: add support for configuration summaries
Date: Fri, 16 Feb 2024 12:52:20 +0100
Message-Id: <20240216115222.3545462-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216115222.3545462-1-alex@linutronix.de>
References: <20240216115222.3545462-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195760

They are handled exactly same as conf-notes.txt.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 678aeac4be5..dcb384c33a6 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -57,6 +57,7 @@ if [ -n "$TEMPLATECONF" ]; then
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
+    OECORESUMMARYCONF="$TEMPLATECONF/conf-summary.txt"
     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
 fi
 
@@ -98,6 +99,13 @@ EOM
     SHOWYPDOC=yes
 fi
 
+if [ -z "$OECORESUMMARYCONF" ]; then
+    OECORESUMMARYCONF="$OEROOT/meta/conf/templates/default/conf-summary.txt"
+fi
+if [ ! -r "$BUILDDIR/conf/conf-summary.txt" ]; then
+    [ ! -r "$OECORESUMMARYCONF" ] || cp "$OECORESUMMARYCONF" "$BUILDDIR/conf/conf-summary.txt"
+fi
+
 if [ -z "$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
 fi
@@ -108,6 +116,7 @@ fi
 # Prevent disturbing a new GIT clone in same console
 unset OECORELOCALCONF
 unset OECORELAYERCONF
+unset OECORESUMMARYCONF
 unset OECORENOTESCONF
 
 # Ending the first-time run message. Show the YP Documentation banner.
@@ -124,6 +133,7 @@ EOM
 #    unset SHOWYPDOC
 fi
 
+[ ! -r "$BUILDDIR/conf/conf-summary.txt" ] || cat "$BUILDDIR/conf/conf-summary.txt"
 [ ! -r "$BUILDDIR/conf/conf-notes.txt" ] || cat "$BUILDDIR/conf/conf-notes.txt"
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-- 
2.39.2



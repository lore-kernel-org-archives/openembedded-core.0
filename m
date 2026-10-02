Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966DACA5FE6
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 21:11:31 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4384.1790975486526966544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 14:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=AX2/O79O;
 spf=pass (domain: ossystems.com.br, ip: 74.125.229.42, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510b42f4e3so24564eec.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1790975486; x=1791580286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unPfHQKPNG/yl0B+rNugMCMsJ239gIqYNQy+hVhHV5Y=;
        b=AX2/O79OgKCElzPFev3OFix/gPJybZe0QM/8Qn7u5Iq8sUmL819rhYiW5ziy2iEWlT
         NgGaMvI1PWCh7KGTX963yQLBQZ7IgaU/3ax0pFMZDOU029AnDSK3Q6SaP80pochliKh2
         dfyu2P5rWdyeZrCuweVJy5VJmaODKfrD+PGaOiiDlbYsO2k1eqZApEJ/oCdx3aGFzlNU
         30/o26BYXe5hHS+NfNGhZJxEjuT3XDMfWKqmxTEINSVpjfFpHdXmZ9+maOOWeF6U5PMW
         ZR/8ZrdWR22haGpVM2eI7mk6OAYSby5zyw7RSkBIgrRWRVo6DStxSfv7QMddvxf+c2Uc
         Uy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975486; x=1791580286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unPfHQKPNG/yl0B+rNugMCMsJ239gIqYNQy+hVhHV5Y=;
        b=mqVb4YKNDR3ZnBxuP1n91io0j71CDc6bbAwuha/d5DZaKkGNy3Kb/zsUB+h5I663xT
         lYTsR8HvvHn+3wJc3Faby/c6xj6BibetmwKVnOmzBBcWNRFGDJadJg4ribk4RyDw26Gd
         Nw46YD2U131LXcAIXdRRfxyUDnhZkSKZAA5w6gXUnaKx0uNqLzxhRqE0M/LqPzKI/BOj
         qvIylbnDYDzQmDPpE1NaJsMUmGIkW5aEsVGB0ms9wxRiheC2rCUx01WPZD6hW7XGz6xq
         YsK8DPZXAHdHFNFHHa3QNdJx+FEN2Oll726Ear9H7tQPetdwv3IWMBK4C0ImjpU8XsGp
         oDMw==
X-Gm-Message-State: AFq9FYKvtLtSiABPegXDo8p56cJZ/pMtmOX2vw0btrHvVAOUvAPHCBdn
	sPdgfipqxSvaWFiOpVDxvN0Plxi6i6TlEAEDxF0kjfUfAEirq2Xg25H4IIDeZJJ0pIaDlJda+Rt
	2RCgR
X-Gm-Gg: AYBFou3e/izgePcbq/8y+WYbkKn+SAWqh/pNHZyavZgadfMkc3wHxAFSj1j24LE1S/c
	yM1cjDfO7t8YI3KgCdvgl+H9MNPD9xpYgJSX8ATXlyfPShr5k/Bbhmf4d0zVjU0MROFHuozOozx
	owcNCY16Fk/y82A0hJb8xfZD22wRK1IoCOttFBqzI5xeuBtIYedxP2iKlqp8DJFOl6JDs3LR1Vf
	Fa539hf7WfkaGiPHyx6nKO242jBoJVRE0uBJoyj2TO5tzND4WCCSGMURR/SkjpMPGdLnJ7TSKuk
	W2ImkGDDp7mbvZhKgZngUXfNRYGAxtkndmwXw7cDEPd6DqZJpUSZOOTGzGsftCL2bJ4q+Z3V69e
	Z0PCqe6im17aMCYBa3KrbVh7/p4PFfl4CEocrMTuyigTEtmHkWOprVKgNa9pBc/UR7KBO87fbRh
	2dyYlnh+rcBkT+2n4Ls+j90uI1Qr5oxpUEU31LcCgbaMIePf7MGBBSgwAlGjBLb6Baw9iqV+ULZ
	oujPmZp0BKzj0GF/1roPwlUXJxoig==
X-Received: by 2002:a05:7300:fb91:b0:34d:4a08:5ec7 with SMTP id 5a478bee46e88-34f14488744mr7039335eec.1.1790975485857;
        Fri, 02 Oct 2026 14:11:25 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510850f86bsm5428890eec.11.2026.10.02.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:11:25 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 1/2] clang-cross: Ignore how TARGET_ARCH is computed
Date: Fri,  2 Oct 2026 18:10:36 -0300
Message-ID: <20261002211037.745952-2-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002211037.745952-1-luciano.dittgen@ossystems.com.br>
References: <20261002211037.745952-1-luciano.dittgen@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 21:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247137

PN = "clang-cross-${TARGET_ARCH}" hashes TUNE_ARCH's expression, so
machines on one TARGET_ARCH but different tunes (e500mc vs e5500, e5500
vs e6500) give clang-cross-powerpc different signatures. Use the
vardepvalue gcc-, binutils- and gdb-cross have had since 39bfa0dd32.
Found by yocto-check-layer test_machine_signatures (meta-freescale);
verified with bitbake -S on p2041rdb, t1024rdb, t4240rdb and 64b boards.

Signed-off-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
---
 meta/recipes-devtools/clang/clang-cross_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-devtools/clang/clang-cross_git.bb
index 2ec15dd1df..0ce631efa1 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -9,6 +9,9 @@ SECTION = "devel"
 
 PN = "clang-cross-${TARGET_ARCH}"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 inherit cross
 
 DEPENDS = "clang-native virtual/cross-binutils ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'lld-native', '', d)}"
-- 
2.54.0



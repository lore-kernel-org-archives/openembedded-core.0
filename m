Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B51CCA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:14 +0000 (UTC)
Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18024.1790786303535499756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=InRB2X3U;
 spf=pass (domain: baylibre.com, ip: 74.125.230.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9178b9b7ecfso20718366d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786302; x=1791391102; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPDueFhla+lTzSOqVde9jhkNnn3/wWjR1B1JYKHG+NQ=;
        b=InRB2X3UBDgRFuwUEQuZacq9UlL7lU5NQ57mcHOnWh9mePpJ/9EWxlwXXs+S5DE33J
         IKdjF3Qcu1xsXNjaO6D3NOnisKvTwto9r7SDE/+5pislOhDPv30ZuMhX+U3A+nru+gI1
         bRjUowotRW4ZYUXB3nwQNcx78uywAkrMiGOlCLrNx0kwCwXveFLkaDErr796qBkTN/Ji
         YcPc+/yUwDildrXSkjNskl6rJdYCklU1g0STiXTsPJmq/cMAvKvVMhxvyafg3S4s4ewT
         t0BXz2GZbXWmA+LqM79H8qJfAhib5HsxM7638UZJcgCqn2JTR2IlqVL+t4SdNqC8/2iM
         qwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786302; x=1791391102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPDueFhla+lTzSOqVde9jhkNnn3/wWjR1B1JYKHG+NQ=;
        b=PxO0fR1IjDG0SyIeSljNIUhmHtyBXg8+qLNC3xpev4ND4AYQAg8J7WBaasgHIWsn+7
         TG3JzouQNf4+Cn9e1Kc+MvQSa8fh9BTixiLvl93BlFriQbjvAuNASDIc9rt0pWtzX3jC
         lPX+5VEm0hwmwxwE70m2ZQih3xhH2IMvRs9Npf1QSPBZHbSxis96onwbQncmSgq5JA4a
         dmy8fH6uPWuKa+47inSHQkg6i1vw4ZxLXASGdLaaMZC8M6+W5zlhPeqEW4GvCU4jhTKJ
         iJFOuPa/jgGKU2rzjgCSk5FyU/TqDEB4qgr1j+4/Zx8D4jcSnSQ+WIp7QlD9DySqMsOK
         1NYg==
X-Gm-Message-State: AFq9FYIY8dW+64I3bqG/mHMMl+gyq3v/Bmu5JQ8uB3X4Ey6P6sNup7Ff
	i1H5nyEzb4LQ53FlRczqS0eO4Z/Z5fUDEnAylPq7f4kco+FqD1KhG8U8/rpMh2Zcsg8=
X-Gm-Gg: AYBFou1LhMGb1dYfS8KVDhpKrN5f92xnTRznEuEQcBhtX/sg1yLfZSjNxTYq5PgEkxW
	y2Xu/8I6E8pvZPuZDtIrQLLrrRLyMjQcQgYUDgkK9I9Rn3Y1MefBUpQrwDl6hEaXi8+AO/mpodK
	BHmLlDgNI4WhAXHzvUZN43ke9PotZEe7smJuvbtHII+iAoMh5tTZUTTeW1xbFRYmtymDGJBEx67
	2GGaStO4Mz3znk84XJRSIJi9ABbfMzKaavPagNDq48uSDNKyV1UGUjTl7H9t4iGyca0D5pwp+jz
	MGuVb+OwiIkqYPDUAYWwulyb19lhXsQNxFHjejUSqZcdmjlIYIQLV7cJsiHYdtYlKe7aaXUNePf
	/95pl59sn0HD8S+2aoRXvQ+hZcAf8pkGW6vwiVZm5QGt8Ghm+j+R2k8I4zssVyWkIPSI3D2COIO
	/RO+p888i95MYFApoyQH06tDjnNmoVcNIZ5YO7NNKYB1LOjassyBztZANyAKUr6nY8mCqYD7Ls1
	YgI9RMF9bIyC51HSCzQcFS02bPt+vpvZi5FO++xkZSZovIMHDPeXw==
X-Received: by 2002:a0c:f209:0:b0:914:5531:1a0c with SMTP id 6a1803df08f44-917a0e7b2d2mr31792286d6.38.1790786302290;
        Wed, 30 Sep 2026 09:38:22 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:20 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:08 -0400
Subject: [OE-core][PATCH RFC v2 04/19] meta/lib/oe/tune.py: support profile strings, add rva20u64
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-4-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246984

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 7fda19430d..fed593e9af 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -4,16 +4,25 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+# RISC-V profile name -> equivalent ISA string. These are determined from compiler output, like:
+# tgamblin@alchemist ~ $ riscv64-linux-gnu-gcc -march=rva20u64 -mabi=lp64d -Q --help=target | grep rv64
+#   -march=rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd
+RISCV_PROFILES = {
+    'rva20u64': 'rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd',
+}
+
 # riscv_isa_to_tune(isa)
 #
 # Automatically translate a RISC-V ISA string to TUNE_FEATURES
 #
 # Abbreviations, such as rv32g -> rv32imaffd_zicsr_zifencei are supported.
 #
-# Profiles, such as rva22u64, are NOT supported, you must use ISA strings.
+# Profiles are supported for the names listed in RISCV_PROFILES. Otherwise, you
+# must use ISA strings.
 #
 def riscv_isa_to_tune(isa):
     _isa = isa.lower()
+    _isa = RISCV_PROFILES.get(_isa, _isa)
 
     feature = []
     iter = 0

-- 
2.55.0



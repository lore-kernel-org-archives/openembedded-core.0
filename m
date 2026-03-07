Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629B4FC9ED9
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 06:46:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4556.1772865973653454593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 22:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y2RH33wp;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3598e7155bbso4243461a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 22:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772865973; x=1773470773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BwUqcd/kAy1wpwr3Joyum/A4aWTlpv0WzknZPZZgg4=;
        b=Y2RH33wpJMmZ9ePC/3c/fwlHCRJ0yy38BZpR9UCqMRC0AoAM4JozEJL4x0ThmWA/EC
         b3RYaVXt0onFqFSkeDphH7XBHIVPX4/ZbR/R5ZVaOy7y85xdOnP1mt0gaqiLXu6M9lzg
         0vJeXCq1YO1k/WTayRR02P/YzX/+QSbtln+oO37xwEarA6EQ1plvlznajtA16nYT/obj
         Xr/e2F7Fmij9uTN3ChxhiJqpcR0hBZ3GwIb8ZoyPQTF9znfP5R2TQM5U9kPERzJ3Nkqh
         jNx5vi7MljC0ncBzyr2sXW8vPlW9Nhgp7HoD9IwUyPFN/SKGnc/s5uFmSPtw6cHcn4I+
         czbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772865973; x=1773470773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3BwUqcd/kAy1wpwr3Joyum/A4aWTlpv0WzknZPZZgg4=;
        b=S3/9SOzBGqCDtfqfYW1L3RYCMKyNMiHBMpiBTK5oRKLF1uMKhTc55+2W1+BmboOFVK
         Ih+BjeKUi8Pwlou3wl1gU2HXT4rAKpaAnIWGXe4YVksJRKr1KGKnDf5YCppdbSVNRJVu
         rHcy6Oj3xuTA29SwWJpNjz+wmgM6xpwQlnPmlP0+IF3m2yF8wGYKR+OkI+fyEeEiPtRG
         N4wK5Pl4n9ZM0lTyoYWRIzCM0LbB122WZU/W4d/pAwDFliaHTznOKwXpow5RF50iwGZs
         ZJRSkhtpEoJMfG7gnfjENPlI3QvBJ9m9W474JvSpnunyREe397+pcRsc4NpYMbyjxioQ
         Y8hQ==
X-Gm-Message-State: AOJu0Yz2Cbat4300Evw4tHwDs3tm3pIkwye2t3GY2YErD88DNSAkTWWr
	1zTbwB/puUBCZD/MnvwfRTretF5gQE/J2U+sGwNj2Euer9bG/ws9Szw/jthXMCWU
X-Gm-Gg: ATEYQzwhJgsu8PtdwzAxl1b5fFVTq49o5ywBmz5aqqVfuKg1XB3OXDFycgCwM0cZ466
	/QVWVojoVMiJkL2dT7axCrZwN6LyFiWgjWOAFjoObFnYo4b2SbBpd0iKR/mEvazqujLs+wgtcb0
	E3ULvbWDyJ/pVSylrVd/4hqArYq2sJWR2aJplvXDQda+ZArmBORlDIYBQDpTzaJoEEIjDpiUkiG
	9pu4GoFJZgpr8JgaKgnSp2nj8MlDUNatkw5wRNK66CZL+6JtFeqH796T3EQ0VLgUwghstDtdkTE
	UbI+q31iWf7URj07YbPpvNHgjfaSEjl3NMBBKhfJZfBDI06wj7uBIhgzDxaVLrDXWS+qtRMTh6g
	wfsvG0WmOAVcwfW+aY6OscFJKA/D2aRu/fgXa40EPP0ur+NW44f+W5uZBNPcNVFqdoc1KZOkmhx
	mm0bXvDvs5RliroXwYso1Cx1reP4w7wRd+QQ==
X-Received: by 2002:a17:90b:5544:b0:354:bfb7:db0c with SMTP id 98e67ed59e1d1-359be2ecb6cmr4327757a91.22.1772865972747;
        Fri, 06 Mar 2026 22:46:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d50ebdsm7053261a91.5.2026.03.06.22.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 22:46:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 3/3] tiff: ignore CVE-2025-61143, CVE-2025-61144 and CVE-2025-61145
Date: Sat,  7 Mar 2026 19:45:40 +1300
Message-ID: <20260307064540.1257672-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
References: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 06:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232606

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

These CVEs are for tools which were removed in v4.6.0[1]

[1]https://gitlab.com/libtiff/libtiff/-/commit/eab89a627f0a65e9a1a47c4b30b4802c80b1ac45

Details:
https://nvd.nist.gov/vuln/detail/CVE-2025-61143
https://nvd.nist.gov/vuln/detail/CVE-2025-61144
https://nvd.nist.gov/vuln/detail/CVE-2025-61145

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 777783d7cc..07540692fc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -29,7 +29,7 @@ CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://secur
 CVE_STATUS[CVE-2023-3164] = "cpe-incorrect: Issue only affects the tiffcrop tool not compiled by default since 4.6.0"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_REMOVED_TOOLS"
-CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961"
+CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961 CVE-2025-61143 CVE-2025-61144 CVE-2025-61145"
 CVE_STATUS_REMOVED_TOOLS[status] = "cpe-incorrect: tools affected by these CVEs are not present in this release"
 
 inherit autotools multilib_header


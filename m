Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3879CCC6B3F
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 15:39:46 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18705.1775144382765851105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 08:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VOjuDWqV;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso1450861a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144381; x=1775749181; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhIhiQvP31gUmQEjfTlAwNlzol2iO4Drs9pQaOxg4t8=;
        b=VOjuDWqVoZsOsAmbgIJYzRyx+dduB59Se9yptm+U1OGdyGmuDmOS0wiX7GmaKkVM77
         tTWJApWW9ifmGUhA1CYkzSVDNCJMPcAvkttYUtake/EVO4fHHT+JeKDxIaiUvvRrwrWk
         i3Nv2Er/Bvq1/jB6XcPPM5964UZu0gJchtLjWpymOfeSBFXD51EGJJkjM+KTeKpp8b/o
         5Vj8aiDMufokbC/HkYBEoeFnBgdrxsADTqNhC9+Of2urYjhJDXDl+Tmcj+xf5aLEW/lV
         tHoOCBNjg7ZFtAldQ0wbgpmfpRviFObYRg6buCFzZhZBI6aY+NzQxSOV+SjQ0uikt7ro
         X46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144381; x=1775749181;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhIhiQvP31gUmQEjfTlAwNlzol2iO4Drs9pQaOxg4t8=;
        b=rwzqTSsZLNl17XpWhOpwYWjj+w5x95KQ0vCKoHgTsnO8H0j0IHlGpRF8GhtE3Od+sN
         rxfzryG9Ma9dyzJSsyKSmsuslf6SwEsIwjDPeF3nDWoWz6y3g4fM5q60sLn905i+Rs/U
         qgwCQLXYd/cRavYOzfeiYaT9o/jIPIFMHIYLlgXIa1bVKvqK4+4XH6lW4e4F1fjkDk48
         jSENWRc4a7PwU7VyQcrR/On7fAH10aQjS4WpQGShtmC+KPn2/ShHgTBvflCQ49cRnme3
         rN+pc++5FZihsMFFR6wOcqD3vC83viCMIsU9YCEAZevfsDpQvyMoGn0zHK2rV+KS7UiS
         n1Yg==
X-Gm-Message-State: AOJu0Yw23WPOyiALdfSRFmlWM0oSvAtrUMz47iOLtpf+wbPlWcqZcX4+
	dn6ty9SZNsaSCLWIsKnRrcoAObNRz7mIFzNGiU1W+eCXppEpaYu9g+c4
X-Gm-Gg: ATEYQzxOvDW+REamt4YbdgevmSqZFcoFxrBC4wcmT4zm1jjwa0b1Qd4h1CPVetBPCBn
	AtQUbGaJsgc7arbiCONHN65/aoGetm69eSjk2LjKmz/Xe7nLG7X6hLqDaMQJpV63lO4wuJ6pT7I
	LZUK2Sapym7qexLylKLZpAbcglXYIkNBNEI8hHPwLwj+9FNvEcwz+Q2CuyGyQXZqUmtggi4+rP0
	EY2CaADuk6pAo8ijc8LUj4Qce3JXb2vBucW03IoslEvzsfmUYoCyLbowUYYkiUL6xveseH7hF2a
	GpgcsuYIMitFGMAf7t1JHlZsF6ULC7mn6OKktibs6pingizC5Jrvf+r76QxMTGwMOQdt8U2XMBQ
	ZowFSu3yqwQvbBAMerNFe3A0LIWlFZ5Qo5O436VT+sdulc6KcHzQSD0ZmE90YWAKGK0w2Qadkn/
	O6PlG3QcSZ4rGnRRmWh4HaPp6XWs407GtQY35lUR6R
X-Received: by 2002:a17:907:c922:b0:b9c:3ba2:2dbd with SMTP id a640c23a62f3a-b9c3ba2335cmr181698766b.53.1775144380611;
        Thu, 02 Apr 2026 08:39:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:fb7f:9298:379f:1206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff130fsm101831066b.47.2026.04.02.08.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:39:40 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH v2 0/4] Slight code cleanup - remove dead code, fix typos,
 unify patterns
Date: Thu, 02 Apr 2026 17:39:36 +0200
Message-Id: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALiNzmkC/42NWwqDMBBFtyLz3ZQkPqj96j6KSMyMOlCTklhpk
 ey9qSvo57lwzt0hUmCKcC12CLRxZO8y6FMBdjZuIsGYGbTUjaykFkgGe+uReuOwfzke2Zo1WwL
 1UCps20utasj+M9DI76N97zLPHFcfPsfVpn7rP9VNCSlqU7ayGZqyknibFsOPs/ULdCmlL8lkT
 eDCAAAA
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144377; l=970;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=Gba0/pFqgiNtKULrR8zJAnGPazfnMCc79tmke97Ehfk=;
 b=XQMmyyVSc+sXVy6hh2umSr4qGEe4oUoSiaMIh20TXPC22Xts7NFLm32vJpjRn6Z4p40HIPPUc
 uPkUcSRpBVsDomufTkXhYahsHtDf4apPvaq8OjdBsgr5sb+2JR7it06
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 15:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234539

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Changes in v2:
- add commit message bodies following patchtest failures
- Link to v1: https://lore.kernel.org/r/20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com

---
Adam Blank (4):
      lib/packagedata.py: slight improvement to code readability
      package_pkgdata: fix typo to stop calling undefined function
      sstate: remove dead code and unify path operations
      package: update the comment block explaining 'emit_pkgdata'

 meta/classes-global/package.bbclass         | 3 +--
 meta/classes-global/package_pkgdata.bbclass | 4 +---
 meta/classes-global/sstate.bbclass          | 5 ++---
 meta/lib/oe/packagedata.py                  | 3 +--
 4 files changed, 5 insertions(+), 10 deletions(-)
---
base-commit: c56990178b31b893fbf695eaf6b67de501e9d2e9
change-id: 20260402-dead_code_and_unification-d2b31d998515

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>



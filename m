Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F186FC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:01:46 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.112957.1738663301155353809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=RAQhFOUE;
 spf=pass (domain: foundries.io, ip: 209.85.208.45, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so8343437a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738663299; x=1739268099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGQku5bIuQdtHNDHmGvwEsWxSe4llQyEXjeCq4u8HuM=;
        b=RAQhFOUEyYcumG9OEpQSl2bNpPcGktixF7gcUwDmr587/ifiQZgX99MOW3YHjl6kW6
         3zRJJADL3+chsh+ffrK2Y+wwAcIniuk3EBxInA+R+gf56Jkng/dtFqRukITaH/NDyCav
         Z1VzosgH04SM+lMSizQq1K4qMj5ZAt8e+8A+QtX03LpBx+J4ukBfIgr01wpvJBXhX59P
         kDxD1J7l92+U4dL87b56cXc49DVqCwEvHcyE3qSyV9QaZLK8vdlDeDeviCvNN0SJh6Ec
         uOVlUBqjX+l6s5C8DsnQIn3Cse0PP41hYXM42kr+sYD56tpXsHg/06X7SsNtzPiPLvvP
         OaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663299; x=1739268099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGQku5bIuQdtHNDHmGvwEsWxSe4llQyEXjeCq4u8HuM=;
        b=NE6wnt3tpEuOaJXwTX0c+lrHEIE3za2ad3vZQEVm7xqWgpj0IvANmfgkQdxVhnLM8A
         EAX1pInduX8vjAfwCHGrV+800IJeMkF+KzlpoGZOC1OMHWDM5DSvYv+WirrQ2ZdEMpVi
         wOqgHUgcuJtBV5kC5HBrFMBHU/z/SwSQaf3iG2K4vv2joesjFqybPat1g3EdvAwwPfy3
         KVraZgqXgMdX78xaf6Qni/Kbn5wHPLLzBu9937WHMnOB0+0oYyb4uMa4UfvNrNmiX7rt
         QzFw+3kDGnYPtmBiKaMukIb+KcGjds+KX0IkmKjD5aytx1tg9NRjfpienUXLPZoKzdnx
         TCxA==
X-Gm-Message-State: AOJu0YzrUfU+Y6lwz8XPlSDkp3rEHKBZuosXDJmCzvGpVzCv91T/IgiU
	GXw1UVceuRoS8MPiwErZjxQXZdelJKBgfQxxDYsE5uVjBacPwLAMV6CPkpCG0wT85L7cV/+Ht1X
	hpGENug==
X-Gm-Gg: ASbGncsJvsKyglc2BRuRH1+3lCaQIxMkuvT8lInDFOlXtM7EksVlhV9CU4FmaHrSqlG
	P+nubDZLUM8K3sEGFu1wIBd474xvlEq1tDzEyAEqbTib0mEgtDToBPNL59DYBQAs8+ihHPZpfcA
	mDIHd2gL0MrfEsNiTOOJZAd4sO1mwEfxnYQkoaED2q/MsrDw76wr3Q+UvsOWnNdfao/RCAwdjgt
	rUno5+Cw0PwOBKJ5fQI58Br+/OsKBHbfSLTP4vJE3cxFbFDRClEFJUP0xmwkLR2kkHLjte1xMHj
	qVQCHGCsGXy3konHtPjoLuo=
X-Google-Smtp-Source: AGHT+IGeIqRR53uEgNrACMIFQxoN9ICXvC1DoJsZQuXf7ti3VX1lACoaFkeA/QgB5+ECvzMwLtiFdw==
X-Received: by 2002:a17:907:7f1f:b0:ab7:b8a:7640 with SMTP id a640c23a62f3a-ab70b8a7664mr1719617066b.46.1738663298920;
        Tue, 04 Feb 2025 02:01:38 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff724sm899065966b.105.2025.02.04.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:01:38 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH 0/6] Fix markdown style issues
Date: Tue,  4 Feb 2025 11:01:08 +0100
Message-ID: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210755

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Fix markdown style issues using markdownlint tool [1].
The list of files:

$ find . -type f -name "*.md"
./README.qemu.md
./MAINTAINERS.md
./README.OE-Core.md
./meta/lib/patchtest/README.md
./meta/recipes-devtools/rust/README-rust.md
./meta/recipes-devtools/perl-cross/files/README.md
./SECURITY.md

The `./meta/recipes-devtools/perl-cross/files/README.md` is skipped,
as this should be addressed in the `perl-cross` mainline repository
first.

[1] https://github.com/markdownlint/markdownlint

Igor Opaniuk (6):
  README.OE-Core.md: fix markdown style issues
  MAINTAINERS.md: fix markdown style issues
  README.qemu.md: fix markdown style issues
  SECURITY.md: fix markdown style issues
  patchtest/README.md: fix markdown style issues
  rust/README-rust.md: fix markdown style issues

 MAINTAINERS.md                            |  2 --
 README.OE-Core.md                         | 17 ++++++++--------
 README.qemu.md                            |  8 ++++----
 SECURITY.md                               | 16 +++++++--------
 meta/lib/patchtest/README.md              |  8 ++++----
 meta/recipes-devtools/rust/README-rust.md | 24 ++++++++++++-----------
 6 files changed, 37 insertions(+), 38 deletions(-)

-- 
2.43.0



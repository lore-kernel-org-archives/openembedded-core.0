Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D56C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12400.1784134073809371073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IsYvY6oS;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a2c1edb210so1302368eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134073; x=1784738873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ9wBQng0hCIeeARECFLh9POpoisr5tJoqzK/vKvPDc=;
        b=IsYvY6oSasAj7wo8VWFsLt6S4Tdo1TwtgS3AsFEsKRWaFqD9J3++BTlF5xTQxo1auX
         EF60F7RRLPgCPcjqdQC6iuSrZtxJKLUsrYSwIUUXNZq24lbIzltUs/750gskbrR/UXZm
         mk7TlNUVFCXTeeQDUHrBvDTrmMdRjN3amsaSOKmgEG4mth7J/eG3vhi67f3wc4Gv07Yc
         urVjrZRgBIanscaAZj6D84G5dNRWtLVTmbP8S945QAGEJZgZMXiv0GSCQIYLX6Qa/q9U
         yX3xKep1T+dgaWne+K4UGByEe468evDiz5CXtYxSF/do3BgfI4Ub1/28dFf9zHtF7vqB
         ZRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134073; x=1784738873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ9wBQng0hCIeeARECFLh9POpoisr5tJoqzK/vKvPDc=;
        b=OCgM5yscF4XwDggwZkxVYhpBfI0walfsjIbOJYp3ULfIV7prtC4X+UCylHA+x0DoTX
         weLNAiKdX2dU/q0GU6tRI9bbuYvSid4Pdg/yzOSwfE31pvsuG0vy0KFX5PBluaMDviE8
         l9dNT5dOhv7s/srZ/HepzsgvjEoIPLfBWNEexpZUiqXjV1Z3gLcSzGAlRFTWCNUTs2e8
         5QVyZ5b0v+de7zNKUDusA3e4Pl8wgOprMAifysTgp5gU4oIcI5nbL0opqV7RU0zR9u2p
         jA6iMJtgRc5V0zield7uwBcdJaoah+mtCEEPo2h33GqFHEBWR3DUhow9g7LVe5PHqHfT
         A5cQ==
X-Gm-Message-State: AOJu0YyBx7BpDDVuZTKadgz+JPHFkEp0eZ1JLrIB9WGYdAuiOKTOcVEl
	IrKw0Panu1g8AzfwhD56nE2LHbd/H9aBZExKwzmfARbh1UC3MAcCj0mGjLPCnw==
X-Gm-Gg: AfdE7cnSdeLMYrz8oHewhygT5By8mCZd1XPY8YZcztR2YA4wMNmoXpJdCvL4EZYqcI8
	MHv4MCOc5qFV20r1OB4almXjcjBx3D4eedvkg+vtJF9857BOkIGdv/jbIgA0ft+CWeZz6yBDe2N
	xBHHo2ZmyZn7EibKcBwSYMgOALHIfa77AMwM41Oh5WckmRIndp02bHF/FRg8RSd43lBjrPbAtBk
	vY3tJQX6XVikggWUUtDvQ+rnNFHhWSPGpNdbgyDaJdkW17OX8/Ny7YGWpS7D+ELo1frFUFCI+Ti
	1gOtbii2HugAp9a1P3xu5AfJe+82ppNtciPtQ68cYdATS43wNo8M0k/9ZvyoQW+q4nHfS664wJR
	9Vyp18RunrDpaX2o/xJPY1mlMzQnzjlV1ShrjAvmMA9lPxw8mH7EnS5OuGWSFxFDSszjCD9Zobt
	3yTiyvWH3s
X-Received: by 2002:a05:6820:4b94:b0:6a1:92af:acb1 with SMTP id 006d021491bc7-6a3da02de6emr1922437eaf.47.1784134072929;
        Wed, 15 Jul 2026 09:47:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:52 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 15/25] libgit2: Replace deprecated SPDX identifier
Date: Wed, 15 Jul 2026 10:45:11 -0600
Message-ID: <20260715164739.364323-16-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241008

GPL-2.0-with-GCC-exception is a deprecated SPDX license identifier.
Replace it with "GPL-2.0-only WITH GCC-exception-2.0"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-support/libgit2/libgit2_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.4.bb b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
index e46e5d49fd..10999f972e 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
+LICENSE = "GPL-2.0-only WITH GCC-exception-2.0 AND MIT AND OpenSSL AND BSD-3-Clause AND Zlib AND ISC AND LGPL-2.1-or-later AND CC0-1.0 AND BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
-- 
2.54.0



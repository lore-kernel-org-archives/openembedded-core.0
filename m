Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7377EF428F6
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:54:20 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6997.1776318854934420036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PDYktTgx;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2d891442388so7498712eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318854; x=1776923654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGHk2L0dI1AkZZ4myTuFNsAK+R5zaYW0KySLMq+GigY=;
        b=PDYktTgxoWDM0dpIc2sB/1knmE9YF/eUr0IJmhzLmNBhqnhE9b0caYkWhewVVnmmFU
         /6EHEgdayMaLveHrHgj3QEOvP11xDBIWAF0WXbnrp0WC28LEeXvCs9XHSkoRRilRdK9/
         1JHIMLzUz7LxiDwxINcHOH6b61pk2K9a1xVyvKFwuet+dvHqAcswlhwridU1sUZzblEh
         djArj2OlZLdggsOOo+ujcxWv20eqlp2dAd2cvB65/g+Q+eO6Lwk10uUwtrqMP6rGo/ol
         hqhojZ3B5VMSCf+0XrWziaPLKJmQcNo8ta4UhAR4yh+CjET6HUj4ikxplFhraf6Ptk/I
         JoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318854; x=1776923654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cGHk2L0dI1AkZZ4myTuFNsAK+R5zaYW0KySLMq+GigY=;
        b=aH9X7GewSCgK6xnX1lMRJtbv5LqE/wtVyaiRGpF0n6OG2KFxBEp1970QwBzZwl0MLF
         0kML5IHVDklGZwr5jn/rVPO2Hx+o7iJWSn18MUMvlARtRx+Nbp3gJWq+nAScUe84wtjG
         Y0naYIlQmhM02oA8fymTifF9zQN31BqKEtwPBc+XNDqVgHjZJFquv3o7b+PHnqxrZdnQ
         6Qs9Uf9/0b1ed3dQAQdlHDxHQEYR0/7x63a6ZOfuuBYLWHOLv+du/fNLgyXDGPC7Rgx8
         9k/2kHju0mWNrXrbf4KdP0sLrGMSnAaa+c8Y5+M6AIXZ+pCiOeSRihz5r0pC3MIOSKql
         wGRQ==
X-Gm-Message-State: AOJu0YxOAXqupzhsw/w7GANJvPIZXo8Z3Gvm61tWfDMr0qqXl16xaHCy
	hUftQyxtaYCdZhFqsZnums0Xb3kw5EvtD6nu9+/xZX+ftVQoIOhtuKXa4AkxBfhX
X-Gm-Gg: AeBDiesFO3kUyFldx79TIlxoH/SCRUdL9bTnMFf2FONKCaZHQ2nUWbO932nczrkwQtN
	SOUtDe0AqgI0kyLr+P0XktJgGK8cpKcX1z3njTwCjGdhvm+EXpnrKE+o6U8ZQvawib1u1QUqwiA
	q2OYp+PD0ZDfp3siZfVlIqF/iyhZhqdh+T4nNikf/YjNrLiQI/z0+ffUbnIMdhz4m8S7rGx/03W
	y6RmGFqa8xlQzpDsg3kc+6I2mHol4wK/38d1uHT8OLX8Utvz9a6NGZq5+JKvTwU5TdHXqcZwKP1
	H+kHZo3+baZ+1+L8qH8r+oW4oksS0JgAGDNEFCTGtrnuyU1/a3y8x2sDCDNF2AWfYY87q/N4BOn
	M+ARDvEE4dYOJOkHUcwF3BbZvRYji3u2sGKVzWPnV41Usb7ia1L4FEZbu4fcjkVem6uJqS3wEBk
	DhVuFozEQHFsx1tYendVwzB/v8VTIjIkTyIqw7ARnKUyYRql6bnlSEib1z5usVjZH1S0XVZQk8E
	NR4jcy1W2aPessko87hZ10+Hht5gpS28BrnAAXlcVOqiuQ8KRJHZPsVLSuaupfNChAw4/vf38Mg
	Kj3u9MMgkvHGjurjcpM5SCsQ0IetFvwPdMnfKv9cGXMNjH1jkPs=
X-Received: by 2002:a05:7301:1988:b0:2c6:31f0:a018 with SMTP id 5a478bee46e88-2d589aa4243mr15152885eec.22.1776318854052;
        Wed, 15 Apr 2026 22:54:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm6060212eec.14.2026.04.15.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:54:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 4/7] python3-pdm: upgrade 2.26.6 -> 2.26.7
Date: Wed, 15 Apr 2026 22:54:04 -0700
Message-ID: <20260416055407.795016-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
References: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235336

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.6.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.7.bb
index 72f6415dbc..5e6cdcb4cf 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "771f95b9a484f9eb34dcf8d851be6ff95333e4f3c46189f9004cfd5cc2e925f9"
+SRC_URI[sha256sum] = "0a96a6fb4d60dfeacc1f68bf77efda39503833f6c01866cc8700ea403f0183b7"
 
 inherit pypi python_pdm
 


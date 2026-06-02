Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8530CC5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:09:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19839.1780387795196674999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 01:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z2oBpavw;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1669732f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780387793; x=1780992593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvs2azMN7yisZecQfkhbniR0bHPnxY6ni2sWxV4hH9s=;
        b=Z2oBpavwYHyZrSW1lmnNER7VRxV8Uw34eJ7heQV0UDpvmw0KQh0xzSU6azVpljv0/c
         phYnj44QTpnEj5mOE7ne91cBnvIzdjCHr5AJMT7RT2JG8mQisSp/CabyFr7/PwyV4kP/
         TXTPOpLCJV/yVkP+b3GDLRjHjdf0PmkXmU6Y70Ry7cnD8Na1HHKs4oTNfRo2E7nG6+ft
         qXuRCs4/UDCoQ0h7bLMWe4LdZczg7eArKuKFhoc/ToGjhlnY8Jx8roYMsKhiNV3sWUNO
         /a/96YFL3xjnOwoaIClLkarHp1ngxX0eWlYA/kOyGNM8Se1SWIJYqN43TCZydWkqgI5c
         T1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387793; x=1780992593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvs2azMN7yisZecQfkhbniR0bHPnxY6ni2sWxV4hH9s=;
        b=LSRYr+TC17Kza72yg2SABlmTt3iXyuJlToUHkhmR2gDUUFono8PEMkCIuRd3kGhLOi
         SdXIx8GnRnpFwZMl5qjA5vSMQK9po2oFoio9w3p/Zi4BZnODCYltXsSjPMcP/FIfddzE
         oua2wHQd9NHG2I35hhxFKfTH0NRsLWWsTNxEu6uBAhcb26HMiOBMejbfUA0vwv7yBi4b
         CMSZFjX1W3mjmx272pxWAAx/u2V+il+9FwC8SQNV8GQze1Ofpdci3oXG3ltfPVrYs8GC
         8bk1mGoEbQt1bhv2ZtOuMfe9OOF0TVTXRmfqjAUHpdrbxcEQNwq66CX4DBuRwGm5SQ59
         CZ/Q==
X-Gm-Message-State: AOJu0YwJ/6b9AJ/tIZFHEUNLMfaiHDP/GwmcFzyLUIz/1r7IS4SxUUir
	piWLAlcvlK4qAt9J5zZhJiNZzP/4xHdiO0QAPY+HKcn2vqciE51dGfRH9jy14Q==
X-Gm-Gg: Acq92OGuR2EjVpg/C8OEnPtbfHv2jH70z1/3PNp2qet0w36u5/NjWzbf82ZRn5rTE6I
	t8XVYM8GaFC0/7erpwbf/JwLaf9maCJOSZ+ExBUz23UVe+Wh5po820ZhRDA00oupPXQQfEDWGbP
	fcA3UZBkPX4vmpa8dRnlESq/+YKrJrtp0Ctx145dIggxqQWB9Ek/kaz0jvdInYfXHYLeb20NXz4
	RmY7uhXaHtz7fH/VEdNznrL2ATV8y36IQIkYRZIFY7cV0pqZ7B36o2i42MDgTL5pw2nK4wpsY3w
	P8Z4sJbA5/bZQOAnfkJePD7RMabEE3JFJptpOI6X1faBv1iPc1H46idT9TLNaP1OAcZIXzBFwNt
	ZvVH2d6fhGKnzWSojNc6o2XnJIZYPbRWRfek98wmcVjp9bQakqnVZisgZs09otKvDwExImVxaMK
	toFSb4z2mFq2SLDhDxpRPnmp6PpWNh6IEWF9mEzbu09uDz4G3xgdRgfBTNs5fZUxX8ilPMSGFEd
	bZLaYM3LdDW6N19mkEd
X-Received: by 2002:adf:f690:0:b0:45e:ed10:8dff with SMTP id ffacd0b85a97d-45ef6b7fe7dmr19942540f8f.24.1780387793508;
        Tue, 02 Jun 2026 01:09:53 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0403sm32659008f8f.6.2026.06.02.01.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:09:52 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 3/3] python_setuptools_build_meta: clean the build directory in configure
Date: Tue,  2 Jun 2026 10:09:40 +0200
Message-ID: <20260602080940.1053865-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602080940.1053865-1-martin.jansa@gmail.com>
References: <20260602080940.1053865-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238016

From: Ross Burton <ross.burton@arm.com>

It's not currently possible to set the build tree to be somewhere we
control, but we know it will always be in the build directory alongside
the pyproject.toml so we can [cleandirs] that.

MJ: this was later reverted in a532cb50151d773c1c351ffccf4d47a37f26f8aa:
  This is not needed: setuptools.build_meta does the build under a new
  temporary directory.

but the builds in scarthgap aren't using new temporary directory yet,
so this is still useful there:

Just rebuilding python3-tqdm in the same TMPDIR after cherry-picking this:

$ buildhistory-diff -p buildhistory build-minus-1 | grep PKGSIZE
python3-tqdm/python3-tqdm: PKGSIZE changed from 3309408 to 426880 (-87%)

$ wc -l python3-tqdm/4.66.3*/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD
  297 python3-tqdm/4.66.3-old/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD
   41 python3-tqdm/4.66.3/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/meta/classes-recipe/python_setuptools_build_meta.bbclass
index 4c84d1e8d0..046b4ffb74 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -7,3 +7,7 @@
 inherit setuptools3-base python_pep517
 
 DEPENDS += "python3-setuptools-native python3-wheel-native"
+
+# This isn't nice, but is the best solutions to ensure clean builds for now.
+# https://github.com/pypa/setuptools/issues/4732
+do_configure[cleandirs] = "${PEP517_SOURCE_PATH}/build"


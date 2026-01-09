Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46A2D232FF
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:07:09 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11935.1767971227722418430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QH2N9qi+;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2f2c5ec36so483265085a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 07:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767971226; x=1768576026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuEbOjDj3tIaG7oW2FI8ZA4dvVXfxvhgDhaKzZH0YZA=;
        b=QH2N9qi+IzzA2naa+yXI4ra59Ayqg912ZtfflddKH69w/DU8+ywgZWck3Vb2gg1Cok
         FuYOyC8hqJC+kL3KZsuDrKMADha3gzzMCMFZ9rwZPNGrCypDw2B5vfZDTXea4CgweW5C
         u8RGmVa5SksPJD6T/EZ/4dGnpDNWcp/tgzl8qNbCAGTxUmCUo/kR/pzPYFDM0DGd7f5J
         /n0GQ0NyZvDq63lS+9e1RNzrILgwwb5yIT2s9RuaqRPJkXU24+K7XRDtiPzLpt5KYgMT
         sfCTi4QKjSL0SjO4NsiqbmhXSdJKYZDb1XX4i6C7J7f8tH/R917oK/qecfLh89epEHxU
         RSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971226; x=1768576026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xuEbOjDj3tIaG7oW2FI8ZA4dvVXfxvhgDhaKzZH0YZA=;
        b=VX+HE8FYs8kBrMUR0seQGa6b6CKWBowK6AtH9VMSzU/uywKLW3p3Lc19OP+ennXm17
         xEbZ3xnmR18WViubgZpH+TqAWf0OLzCmS9/j3x2GKFESlwoL5busWUxlHCPQeNvgwWHq
         /KWmxIe98vSu+FM839ryUzUhnEQwRM5Ps0ZF6fgjtYiRwJaasIeXXX3RA651UOqWs4c8
         5G8qZhumWnWE2Y5a0WgH+JKZxD7utRwL/2dxwietvOQuqKIhhaMkX2ijy05EvsyEACM9
         wJkUmE1YETtRzzEMOaeJydm1yaVt0gnbeU9BvI0VCp+fFT9E+6uICA/GHCoyLGx7kJi6
         OurA==
X-Gm-Message-State: AOJu0Yy4kAap75K89YUOAEHpg39mgOBL4Pyf5XakoPQ5Z5GEN9Jt2BZ7
	L/xWqSNejLPJqv9Ea/l8SCqHNKB1jbmsEfg5ZRRRXYOYlJTN5/x/RkFjzGbCPxNfPRAFCC9aJf5
	wWhqBA04=
X-Gm-Gg: AY/fxX4beKiVq6LIb/8iEFTV0NnyQ3Qd9EvwYWJjwpfYy5uN67k7mMBXhsXPAnQMVzD
	OtKZ+RvEjWnxbyHwKFcKEj2G/gzGvsFXDQE6usaxDVptG4IG99pIkuP47tV7oGwyW1baOQZkrRT
	6D4FqC8c0RUFtcdKFNuyATUXuorx4dA0kng8zkThtSt4twBRKwOAJ5lldRe+FU5kAovE4z4hvnl
	gE2Ze3KTswrHRwBK9TvimeEmzp59mYdJqd1jlHm8+MxGmI6Xrk2mzEEYWli3NDrbmwkdUvcfLdK
	bcJojKoiwzCl64O0bL+9jrOEEKD+4+dEirXMdREoYetYfcFCStkCs+whXGD20bygrpISff6jpHd
	2lNWGhS8ph2G8+sEtcbwu7WdL1csPs4SBa4/Uuh7FSv4W14TSQhmyGCQpol813CAQdcA2BQnR7Z
	zfl1nwCLx8xN+2IOQ=
X-Google-Smtp-Source: AGHT+IHb0oTwSNeip6zVLL/opjXFO2Vcyza4VkKW8TPoH7JhRSMH7uYsp9foHknHbJYSmrEuD+sSHg==
X-Received: by 2002:a05:620a:1aa3:b0:8b2:e179:feb0 with SMTP id af79cd13be357-8c389421bcbmr1236081185a.86.1767971226059;
        Fri, 09 Jan 2026 07:07:06 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b8b21sm811334585a.16.2026.01.09.07.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:07:05 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6 v3] python3: add _ast_unparse to core
Date: Fri,  9 Jan 2026 10:06:51 -0500
Message-ID: <20260109150651.469332-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109150651.469332-1-tgamblin@baylibre.com>
References: <20260109150651.469332-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229132

Without this, we will see import errors for modules that use
annotationlib like so:

|../../python3.14/annotationlib.py:487: in __repr__\n'
|    return ast.unparse(self.__ast_node__)\n'
|           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
|../../python3.14/ast.py:622: in unparse\n'
|    from _ast_unparse import Unparser as _Unparser\n'
|E   ModuleNotFoundError: No module named '_ast_unparse'\n"

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 691fb22202..ff84f2d305 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -188,6 +188,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
             "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
             "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_ast_unparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
             "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_colorize.py",
-- 
2.52.0



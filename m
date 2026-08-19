Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD213C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10402.1787155059732649845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pBIOo5mN;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fde295992so39934f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155058; x=1787759858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zvx85DhwSfih1LZc0Oug8j/wqyKIcLb981Z3xs2SuPs=;
        b=pBIOo5mN0kDSUWOxbvoc+plGRAInfGAEWTfrmsQDSVQ5WbVGKIcIST2szdtl4WLFC4
         gCrFGFW7vbeOhhLUrSzYZvlTgY9BG/aaTeO01q2lfHj/4ffPrMwiZRACypVog/yVZzse
         S3Tu3crhrC6xtQUNqaDCVIk2+7lJtu0UrWcmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155058; x=1787759858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zvx85DhwSfih1LZc0Oug8j/wqyKIcLb981Z3xs2SuPs=;
        b=nzpBXTb0fiuhSPFE1bchPliGfl6UWPhWLI8m8vaaV0RQdW7AuGahbFp9U2LEHW80bI
         gLZE4l3OornXIXF+j32E3M9aLLlzELaTS/Z+RUkzEl64nR/cNCnkiy9d1i212BFsWKI5
         jU3QUCwuY/mio0cF87i1GfEoPVxGEPbatxJ/i4Uo9g84K3e2Yyts2HW3HACcx4KmKgwO
         P3/LuzyqKcArijy9ovNXBp/8p/OzOBkhIZsUxVv9hnnV8Z4zqELCPJNu0Z9kzLm1DFw9
         mNGKsYXO9TtuWJW5HGlnRJDAFCgLjQ+xEIscc26+FsfAf8FdKko3CbaR0p+gP1jSCS1r
         LaMQ==
X-Gm-Message-State: AFuF++kPBcBi15iPHyKRsrlau5gQc5l70bdpkxjLMXrsMi9FKIqGWLvv
	FjnEZvnGfLc84XSBt39F/ynNdAVMQ5IS/UA6iQHhdZ5n42IBDQ3LhND3U7jOYdzDQhc9Ervs6eM
	3x0sjxgg=
X-Gm-Gg: AR+sD10bUOBmunxNsskAm05V+yZY5YvlaotHOaQiUTQSmR/Uhdt8mwOfYq473USAN0m
	SPEDFmTekcTZy0s/EjrH7vRjcacBWIsx8ih9Vgigz70lkw6s4iwk+I26at+F9HKD7Osx/7kam3k
	TjQ2Xz8DtflrSKqTLfeV1KTDnmg+AJH7V3y0ZAoIHr8tcc4jGH+cb+7bKv7qVxRnGg/ZH7IrRpQ
	NRkggCw+8YTGks3OuJJp42MYGKPK8daZyiu/NsbCRKc0nPc3gwb76f9Phh//6f0IDtBIiO/PeGk
	47d/uQilgRpV6McIJCMU43Wy+p13wePvVRlxVH7svVgfCCppOMpkEg7q8YflwoLZ3yQa2dRULBw
	LrGjs/E1Ewqifk0j4oQKFJx/hz8VgJZyWjwXax401nG10ogGDAUdCYmD5goKshd7rm1u2ajS0Sw
	O32qOMufqkZQTeGISJlief2Q8m6+G/xar3Rrz1CRYI3AB4Oo0Cke0oAlOXOFEySMmT+kzmXC1xM
	zbK6lYsIKJAMzkO/ExqFPs0eFbwzMtZNXaddhMk4MBrd9snBTRr440RNvzaom4pEAHgvBHrnp/V
	qmQECiXGEF9/HMZwHqM7JZqlhUZvSCDbyaCDbiIV
X-Received: by 2002:a05:6000:643:b0:47f:ec53:1d2d with SMTP id ffacd0b85a97d-482b781c048mr277547f8f.7.1787155058007;
        Wed, 19 Aug 2026 08:57:38 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:37 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/37] python3-xmltodict: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:35 +0200
Message-ID: <5ab9b2a4aa3070945fc282d3ecabe632a614ce49.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243740

From: "mark.yang" <mark.yang@lge.com>

The CVE databases track xmltodict as xmltodict:xmltodict, so the
default python:xmltodict vendor prefix never matches and its CVEs
are not evaluated at all. Use the exact vendor:product pair.

Note: Original commit was for python3-xmltodict_1.0.4.bb. This is
adjusted for scarthgap where recipe version is python3-xmltodict_0.13.0.bb.

(From OE-Core rev: 918d1fd448ff96431197031e5adb1be658156bc2)

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2229426b729adf85780c23d38c85fc3cf090f6ba)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
index 9a308a29d2c..33bf49b1fcc 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d
 
 PYPI_PACKAGE = "xmltodict"
 
+CVE_PRODUCT = "xmltodict:xmltodict"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit pypi setuptools3 ptest


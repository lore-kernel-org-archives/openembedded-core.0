Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781F4C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:48 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.91303.1749571779480594337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zk+Xf+HN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3121aed2435so6089468a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571779; x=1750176579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXw/fuThC8JVIfyfChfy47qEztM9bbiMlBaYxWH7yaQ=;
        b=zk+Xf+HNpxoWWdoPbB/eHSCM/3NfwSTXmJ759lEnMr+G3cJen307f0VbDBlFxMQZF4
         ZaAt+p+xsM5HEHVwH5JULKBsArsep+aX5FWCmjVFrf89kICTTKSIxqRmbOZywhw/yYpu
         qLfhS1jSPzT4nFpdiTJZINsNEr7B/9/XGJtdyN+cxEF5Z8IhQ1QdeOXjAk9scwcg8u6i
         0lzcBI2O1/vsoARAJgWBxKEOVTqMhSnnDP1umvrrXFdH2BbmUw+gTt9rS/G7Bw+nlMO+
         d1pcdoMOKgwmpF+i7MzgmUhlIS6hXKupKUnXj2CFeM8/JF0A5aWjZsvlPy0ZXZir2fuX
         ejbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571779; x=1750176579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXw/fuThC8JVIfyfChfy47qEztM9bbiMlBaYxWH7yaQ=;
        b=mjVy2AamkRjZ6329vHYnb0Ivyok/l0L9K+VR97cUggzGzwkaQUmGjiJECNH2qTZjNy
         XSPhYCB4PHWrXN21myco3BlZ2Kvlmly8PH4NHI5bC/nmGHie3kv6NFKVpoOXZqkJtYYi
         rNhTIo3A4aVsPpb8ZzbmNjjyadd4eA3P8eES8gWAIG4u6pwLFeW8msTC5NFjfT7Ywwe5
         DHQ757RjurUha0s3oWWlvP5r1LPo8uiJj0XJnOSVwCAzw41oCvz7rRiwiYqbpCrLkmGC
         l+r95ZzPWf2/WCvD+Ixn+3LFLojw5bTRWJzyxOtAEiP9SVsIXPGHrQEavYfueciVjrBJ
         xtiA==
X-Gm-Message-State: AOJu0YznXykhetewHjlQyViVRpVgAdqe/4gC6K3UOKDO4BhiNpbq6m7s
	zK/x+kKN4/dl4MidJdIB3dd3nqoNO6ki5R7GPIeOsoRhdsAXgvL05p2J1F0dtkV7ykVwWJg58Qp
	eeYpL
X-Gm-Gg: ASbGncuudOrNYYVIMLRwQgUWgP673ijIRsICO6Z+Hi1KY6sFOilrHSVssYamOXRUJSI
	Suv4SULP+P3dJ/I1cQiuZlepFa0V8hu0Ks6e9+zZm8STfIoX6qn85P1KacDryUTGFEZYbZpeyZE
	tcKrNP0VXFPYTF1ccnzp+HqF/RFpfescLZ+Yi8ZDIAUBRSWqfDwNwhhCbjamBBEWzZtN3r1aPp2
	LO3Fz/ZnyfD1VMOuUIDObTSgV1wTVAkv+Le1VFkexWbgTj0LeDRtMWYg9Tk9x7k4hhl2215oJlc
	BDyzgb/+pEfVrDLy5ORLHe/3A0UHodl3OiUn6LuRFaG8fJsQ0gI0dg==
X-Google-Smtp-Source: AGHT+IGs9Q6oqkkLuWu0LBf3D8itK0Ab3shLPr6HNu3mO8XQqTWpfwyMSxXc8gKp6DObzttcZtmx4A==
X-Received: by 2002:a17:90b:3fc5:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-313af2077admr148495a91.23.1749571778721;
        Tue, 10 Jun 2025 09:09:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 29/32] python3: remove obsolete deletion of non-deterministic .pyc files
Date: Tue, 10 Jun 2025 09:08:42 -0700
Message-ID: <75758dc92003892edc32cccb3c830926b5c4942a.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218398

From: Ross Burton <ross.burton@arm.com>

These .pyc files were non-deterministic because they used frozensets[1],
but this has been fixed in 3.11 onwards.

[1] https://github.com/python/cpython/issues/81777
[2] https://github.com/python/cpython/commit/51999c960e7fc45feebd629421dec6524a5fc803

(From OE-Core rev: c8c391ed3e0598a3bea7bc0981126d870315063d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.13.2.bb | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 7c36fd92ed..0f0505c66c 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -235,20 +235,6 @@ do_install:append() {
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
 
-
-        # Unfortunately the following pyc files are non-deterministc due to 'frozenset'
-        # being written without strict ordering, even with PYTHONHASHSEED = 0
-        # Upstream is discussing ways to solve the issue properly, until then let's
-        # just not install the problematic files.
-        # More info: http://benno.id.au/blog/2013/01/15/python-determinism
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
-
-        # Similar to the above, we're getting reproducibility issues with 
-        # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
-        # so remove it too
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
-
         # Remove the opt-1.pyc and opt-2.pyc files. They effectively waste space on embedded
         # style targets as they're only used when python is called with the -O or -OO options
         # which is rare.
-- 
2.43.0



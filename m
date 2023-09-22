Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FA9E7D0CF
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 06:33:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.15849.1695364410398108092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 23:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hp15Zz8I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4053cf48670so4770175e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 23:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695364408; x=1695969208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRBlzCL7NXhUzoTyR/ebvKy7+xLcA3S5hGkUGQ6IPLc=;
        b=hp15Zz8IKpYN8LgcpJYg6KvhrHPK3L9x9VwQtindFZsTCCkSxGf9FtWu16//i99Cu6
         cNUCbg+c7cRKWeaOcl771WoatVhn/geU84IrqpZmuIMkj5oB4bozzK6rusGuHzjSomOI
         7uLHW8xQLSN4RB+yVhBj0sY5HrT2u9o1QXSoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695364408; x=1695969208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRBlzCL7NXhUzoTyR/ebvKy7+xLcA3S5hGkUGQ6IPLc=;
        b=IlQC6fC5dc4C9TFZVI4GMMhNr2212A27vWZJmfPFWBT1BOCvWTID9wDw5Qf2qBNWnN
         WqrEUtUFxlvigkf8NMNoUJ1no4IrnZS//tOn8JUANN8vp6Li66DHdn8G+1Fq+z8MxLMc
         jEbHTst1hau7Z7KKa1df5JRKssRKaWQ0k1LuhgG95m+E58bf3NOjwQ6JMNmfpvxbaTHm
         hPr5QjTyCyu4JbrnhHY3lUQ4+FW859UQmiNU0O6vHSDtzFtlZ7MVvv7KZMos/iVI0mGr
         xwc10KGdbj+GeVOgk+1zQdBxHt+oJv9BIcHcy6LAhYB5KgGPoEGpwFeIMcrD2sMbIm+Y
         ETDA==
X-Gm-Message-State: AOJu0Yxi1chQAV72JV8ktD/JXIfTYtdx5lMlTiwPgcXwFU9aG4ST3bz8
	Prng60ficv8nB350lX7WPiiCKjZQm3wTQpwrF2A=
X-Google-Smtp-Source: AGHT+IF+IJWRejp616IPipgpPiosJ3Jx4rca61H/t49Ls0SEFN7JwPU4AT1Az3JbGPh7TEgtFiIGOA==
X-Received: by 2002:a7b:c5ca:0:b0:404:fc52:a3c6 with SMTP id n10-20020a7bc5ca000000b00404fc52a3c6mr7248245wmk.25.1695364408247;
        Thu, 21 Sep 2023 23:33:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id s16-20020a7bc390000000b00401c595fcc7sm771756wmj.11.2023.09.21.23.33.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 23:33:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] lib: Import packagedata oe module by default
Date: Fri, 22 Sep 2023 07:33:27 +0100
Message-Id: <20230922063327.1386509-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188039

Variable dependencies for functions in the oe.packagedata module were
missing as it was not present in BBIMPORTS. Add it as the fact it was
missing is likely just historical oversight from base.bbclass history
and the dependencies are useful.

Add an exclusion to bitbake.conf to ensure BB_NUMBER_THREADS doesn't
change task checksums.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf  | 1 +
 meta/lib/oe/__init__.py | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

v2 - add exclusion to avoid oe-selftest failures

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 67577c8fe7e..7be5cbc992a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -977,3 +977,4 @@ oe.utils.get_multilib_datastore[vardepsexclude] = "DEFAULTTUNE_MULTILIB_ORIGINAL
 oe.path.format_display[vardepsexclude] = "TOPDIR"
 oe.utils.get_bb_number_threads[vardepsexclude] = "BB_NUMBER_THREADS"
 oe.packagedata.emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
+oe.packagedata.read_subpkgdata_extended[vardepsexclude] = "BB_NUMBER_THREADS"
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 47be7b51d79..da7cbab3086 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -7,6 +7,6 @@
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
 
-BBIMPORTS = ["data", "path", "utils", "types", "package", \
+BBIMPORTS = ["data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
              "qa", "reproducible", "rust", "buildcfg"]
-- 
2.39.2



Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA226C47DDF
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:06:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.13145.1706018815833732613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 06:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xqqCobWU;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e8d3b29f2so51885335e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706018813; x=1706623613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vwRUfwlkYcPYED+3WTHvDXPVkS26U+I5JAn0EEsEjs=;
        b=xqqCobWUMGdxzhGZANJvz+bFI9utm7BJhLeRTteY9zco3zPOQoiV5Xqo6z6ZFeT44M
         bn4ir0aVubVfoBXYhDYJvvgfgyGtMpcjPUm6iku2YpZFy6hVlq0sqTHRbqPjvTY2u2R2
         LnIe9D2EMqEPf81JxI4rNiMVRLn/IJtBCPiZ90RRvio0yyxVYknaJXDbpP8WVQjP3WbM
         +wAS5d3GwIdlR9/MYqBy4qmYKWZao+ISa7i6fIF6UYkx0NK1cGwZXO1CmwXxdcRlTy7Y
         6ERZ+jCUsiCQJasensRMPnQ1qetklw24YRf2iO9wPP/CZHw99p8MjJF9Yp9PVaZFhJKq
         e0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018813; x=1706623613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vwRUfwlkYcPYED+3WTHvDXPVkS26U+I5JAn0EEsEjs=;
        b=ngcMD6LVuDCUlsfZx1idHgxoo4bMWb2PpvfktlheiZcBDTxdmTXIa/8E3NBW5xix14
         cFXr6npWeJKotdBVN9iHg3mdRKIDPMbIyPc7Q3Z0rjm+2rPDFXrtw6jBFpa5fZyWnqYb
         jraDPYOFBy7v8DTZKzx12DGgBS5QNuXCOoaKgPhIp1PJeUEWWJddgKpprCiAPqKmz2tM
         n1AtD4tMBj3qkljjnL8QqJL7Lru+/ehfYADDKZmWNt0fozK5avVtv4jCJcO8rMheHsjo
         nWw6Xiq5wJmngDk1DK1u9NcpjCttGg2P9jTOESAkADq7iX9J3L+YAxsCWc0MdKsAUAmh
         S3ZA==
X-Gm-Message-State: AOJu0Yybeke0/w+ODBqFhiEmc56hDQJbl4Kg34zPo51wiB7cyfsu0Cw9
	KgkLXW6OtDUvOHDyUhxZPc7JnfacsyT820tOuRj5g+a/0WEmLgYHFhqkrnxp8sOUlPlOpfsL0+b
	TBNY=
X-Google-Smtp-Source: AGHT+IHG19MWQpyE0a1uebyFksTzfsyz8OBreiFzy8PyIKQURCvsbQy7xIS2HxfM3wR/NUcl4dgzYA==
X-Received: by 2002:a05:600c:3212:b0:40e:49ac:e4a6 with SMTP id r18-20020a05600c321200b0040e49ace4a6mr131810wmp.171.1706018813650;
        Tue, 23 Jan 2024 06:06:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q9-20020adff789000000b00337d6aa3912sm12998447wrp.10.2024.01.23.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:06:53 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 0/3] devtool: modify: add support for multiple source 
Date: Tue, 23 Jan 2024 15:06:48 +0100
Message-ID: <20240123140651.930307-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194237

Hello all,

As we discussed in #15162, I tried to implement a devtool unpack tracer.
I did manage to get a list of files unpacked after do_unpack and
manually copy them into WORKDIR but: 
- unpack tracer just tells us the url and the unpack dir, but does not
  directly give the unpacked files. Of course we can get the list by 
  looking at files in the temporary workdir directory at the beginning
  and the end of unpack, but I guess we can also do that without the
  unpack tracer mechanism
- the issue we are trying to fix here, is to get the secondary sources.
  We can obviously use the unpack tracer for that, but the main source,
  and local files (file://) are already correctly handled, so we would 
  end up handling different parts of SRC_URI in different location..
  IMHO the unpack tracer should handle all the src_uri entries itself
  but it means a more global code refactor.

Moreover, it turns out that the issue we are trying to solve was already known
and externalsrc class can handle secondary sources. The fix was
introduced with:
  da1bcf08089 - devtool: add support for multiple git url inside a cargo based recipe <Frederic Martinsons>
We can modify the problematic recipes by adding "type=git-dependency"
on the src_uri entries of the dependencies (secondary sources).

So, I am sending a patch to automatically add the "type=git-dependency"
on secondary sources when a recipe is under devtool control by modifying
the SRC_URI inside the append recipe (in build/workspace/appends/)

Doing that, I tested my work with the bzip2 recipe and found another
bug on do_populate_lic dependency. I added a patch to this series
because otherwise the selftest will not work, but it can be applied
separately.

Cheers
Julien

Julien Stephan (3):
  externalsrc: fix task dependency for do_populate_lic
  devtool: modify: add support for multiple source in SRC_URI
  oeqa/selftest/devtool: add test for recipes with multiple sources in
    SRC_URI

 meta/classes/externalsrc.bbclass        |  1 +
 meta/lib/oeqa/selftest/cases/devtool.py | 26 +++++++++++++++++++++++++
 scripts/lib/devtool/standard.py         | 20 +++++++++++++++++++
 3 files changed, 47 insertions(+)

-- 
2.43.0



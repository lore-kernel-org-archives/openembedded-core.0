Return-Path: <charlie.johnston@loftorbital.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F5AC07D5A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 18:15:20 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.102426.1701108911802702802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 10:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@loftorbital.com header.s=google header.b=pJ08/nCd;
 spf=pass (domain: loftorbital.com, ip: 209.85.166.170, mailfrom: charlie.johnston@loftorbital.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35cc155a467so5191375ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=loftorbital.com; s=google; t=1701108911; x=1701713711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ozPmlEypyJ1TPm4+1M9SUpa/GJ2JYbtbxxPQlIpGOmQ=;
        b=pJ08/nCdOFTNNdYZyH1+cJgAcvQSEO8XWnmQmGXYprZbBOHoWdMUETRiZ+FFs/d960
         TUhTOi3FvHMinbyvTbKVQCFqGbfvU3hXK36GlohWgZj9IvM7Rr4fLZFftw0529701D+y
         kzqPAH6LvUnH06//FKGoFnRaf4dlHJAocFhXLwnLSXpBjsBa3mI0XmeVXaOjfWw/jEA6
         3aIMqZRJMXH98n6/Po7C2VZ4cAt+4Ty1bRCTcE7DpIqkOPS64wGb1TwjH+ou96VtSyE1
         84/2+TawFRXtpy4/Vg3BJwsZWlSnt0v2SfJD8vMERIq+2XNKzsQvitjeyVz1nKP8cRAS
         Denw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108911; x=1701713711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozPmlEypyJ1TPm4+1M9SUpa/GJ2JYbtbxxPQlIpGOmQ=;
        b=uO7sKWQWI8lTR+ZDjx3pcOcieOadiakRgfRTzMZ3TW2wAF6dgel7zXhwxibM+u+xup
         2PMAzM65KaU7+xNNL9Fwrx4/Vo05QNdG0fPDiyVin6odxsdIMHOYu17/18mnbzOJfdlb
         eX3E6eN0Baic/e4FcIH+AMHo8buL/IDoMWftoHJxtsW2XNzJEmTDoZEYaNpPvi8eLU79
         nZvbe6utCmQ7KfhCpT+gho/jOf3wCFm6+FP+MPf2/dJ42cNiTGtylgS/Vqv9pcizohe5
         5D9COhX0wo4vBiesdEAvVtymsV46ON2qInHZ8eJxeSscHDcXRGQH2yICc/jDHTpZNKsi
         MsOw==
X-Gm-Message-State: AOJu0YysqoCrkR/O9sEWFJjXs+1TQCFWBIlVgyk7b4pEYR0LYuzFXpJB
	ayn9RTgsvO3YrQovlLdEnbJEk6lQ1X0roErNe7KAdw==
X-Google-Smtp-Source: AGHT+IHP4qmbevBxa1+dPpQyl0IHBxwppwX2E4OMA71LeMps2kV4hcGgAn1qpN96x/VR+8gLtw68Tg==
X-Received: by 2002:a05:6e02:184a:b0:35c:b83c:309a with SMTP id b10-20020a056e02184a00b0035cb83c309amr8422471ilv.18.1701108910906;
        Mon, 27 Nov 2023 10:15:10 -0800 (PST)
Received: from localhost.localdomain (71-211-94-90.phnx.qwest.net. [71.211.94.90])
        by smtp.gmail.com with ESMTPSA id k14-20020a92c9ce000000b0035b0ad262e2sm2979636ilq.47.2023.11.27.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:15:10 -0800 (PST)
From: Charlie Johnston <charlie.johnston@loftorbital.com>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Johnston <charlie.johnston@loftorbital.com>
Subject: [PATCH] bitbake.conf: Add gsutil as hosttool for gcp fetcher.
Date: Mon, 27 Nov 2023 06:12:38 -0700
Message-Id: <20231127131238.1129053-1-charlie.johnston@loftorbital.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 18:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191316

The gcp fetcher uses gsutil to check if the file exists before
fetching. This change ensures the tool is included as a nonfatal
hosttool so that it's included in the build environment when
available.

Signed-off-by: Charlie Johnston <charlie.johnston@loftorbital.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 983987cf7e..e7826e7af9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -543,6 +543,9 @@ HOSTTOOLS_NONFATAL += "scp"
 # Used by Mercurial fetcher
 HOSTTOOLS_NONFATAL += "hg"
 
+# Used by gcp fetcher
+HOSTTOOLS_NONFATAL += "gsutil"
+
 # Link to git-lfs if present
 HOSTTOOLS_NONFATAL += "git-lfs"
 
-- 
2.39.2



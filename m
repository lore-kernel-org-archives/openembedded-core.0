Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1787CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:46:50 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.89572.1756849610232675939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gJDty9cJ;
 spf=pass (domain: konsulko.com, ip: 209.85.216.43, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-328015abe0bso348921a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756849609; x=1757454409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8dSwV/2RgcRiN5VIPePinqZb5C9UC8HNg6cU59vkZ4=;
        b=gJDty9cJgLNyTGEdYkxhW2jnpQ1IimfmI8fo1yoYiiv6U4JswWF3aw6i9feRhqoyo/
         egqgMhfhnv4XnFgMcox+Lu22DheLiAaxgq2845P6dYlnSOsyJ8XZbH+cWASpXqha08Do
         LS6oGxtkPfrKumZsj9uKFohIpOofRGuQplsiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849609; x=1757454409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8dSwV/2RgcRiN5VIPePinqZb5C9UC8HNg6cU59vkZ4=;
        b=mM9PbPtve2gpSG31hMqDZoHXtWxsT1KWFaZB5inPcD367FhPAZQjHOJqhur2L46+sG
         muhgGB5VrV5bs81eQuOHIHt5iTZqf+5HCu9YiDf5/9gPjNL2YSic6CVOQ9ZDWgoFS/bX
         79jTLT68NI6iJT9ayfvur0OcosZOfz18Ch6zDelBeEM+CSmVphNIn9ylRzpnnhnlb61a
         XJBdbcq/sE39jMoLoChU3nkdyvsE4do8ogzpGG1LcxUGnokJ7UNB5DAt//X9ZxaA2lJN
         GX7ldPgAAmUAbGFcw/eKTOiGALgUeixtFrifBQZ7HYY99ylpq6wVpsV6yb1cwF0hqWzn
         +I4w==
X-Gm-Message-State: AOJu0YyxQhOg1uhya/aAySL8/IpMRRh9kZzNZLqcQw/YTZAZsziNPYAD
	H7Xgmi+19Z67Dj/mkOe86iWmTRf1xwzAm8S0PB1cYO+wAbm4fgudpt1zVT7+l5hKa6z1QyUNttj
	diYuuxm4=
X-Gm-Gg: ASbGncvtVENMe/iufuPS6uZnwEznxp0p1YlV+jct0iPf03shan/fTPsYictm1swbW8F
	LVh8wh/xLmRdqFY0gVmHAY18Cy4OYdTR+lEvbCOsW9nbHoN4FWkTJa2CQIqrn+rvNAG23oq6Mm2
	uwRvbGAQL3Lf6AxLWp4k2A4FMEgDlOazt7SPZmhwALahG/pulTwS5dKCpzQnhNhUWgHkeY8GUfi
	ynUkCpPZ24QeqFOGTsybNcOr02KBeJQp4FUnzI0oFqknm2jolpq6Se41CVu1RHCg9UbjGbIXci3
	1qv52JY6ZshQ238iPoOmPWDIDSVkaYQIcqidj3hIJl0HT4+NfqEhGLFxLVBiBH7FvhugB2NSfOr
	OWKdOBfdo0/iIMxB6FXhjJ6y4yBAfsHqOqWVr22EqiHHMsMt7uKVARsucb8fmWw==
X-Google-Smtp-Source: AGHT+IEyf6CdLDOiffhXNHr0KM+xOAlIUhBGWYDaZMB/KXNLjqaPNEkdElbJDmhJVvUa1R2xZx73fw==
X-Received: by 2002:a17:90b:48d0:b0:328:126:352d with SMTP id 98e67ed59e1d1-328156b8386mr16660272a91.10.1756849608981;
        Tue, 02 Sep 2025 14:46:48 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3096d1esm12772875a12.45.2025.09.02.14.46.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:46:48 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] python3-typing-extensions: upgrade 4.14.1 -> 4.15.0
Date: Tue,  2 Sep 2025 14:46:27 -0700
Message-ID: <b068fb15c23d22a7b70bac4f925e033aab64969d.1756849390.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756849390.git.tim.orling@konsulko.com>
References: <cover.1756849390.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222750

From: Tim Orling <tim.orling@konsulko.com>

Release 4.15.0 (August 25, 2025)
* No user-facing changes since 4.15.0rc1.

https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-4150-august-25-2025

Release 4.15.0rc1 (August 18, 2025)
* Add the @typing_extensions.disjoint_base decorator, as specified in
  PEP 800. Patch by Jelle Zijlstra.
* Add typing_extensions.type_repr, a backport of annotationlib.type_repr,
  introduced in Python 3.14 (CPython PR #124551, originally by Jelle
  Zijlstra). Patch by Semyon Moroz.
* Fix behavior of type params in typing_extensions.evaluate_forward_ref.
  Backport of CPython PR #137227 by Jelle Zijlstra.

https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-4150rc1-august-18-2025

Comparing Changes:
https://github.com/python/typing_extensions/compare/4.14.1...4.15.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...extensions_4.14.1.bb => python3-typing-extensions_4.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.14.1.bb => python3-typing-extensions_4.15.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
index 32edb656db0..3e3ce33ca8d 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 PYPI_PACKAGE = "typing_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36"
+SRC_URI[sha256sum] = "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
 
 inherit pypi python_flit_core
 
-- 
2.43.0



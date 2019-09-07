Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 18DB97F4A2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:55:39 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q21so6334473pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=7sI36a1KsaJeWE5LMBUMq/0HtWKQLp992fDPGGANtpw=;
	b=E1H9uu77Z0ax8vnmYSizmqbRUern/fnfZEv9kxZBuo/nsPMTGTEWp3oXP2oWvbWvli
	uaHDwl8PK6NAIiGkQAk6tYCS0vmAu82HU1eMgemJ4dGT+0eoQV4peIp8WUXFK7C4tw7U
	B/BfBMZtOtVzQXMEQw/Bn8LFUyvEgEoVqtVwdkmJMHOTaugdlwIWZLWi2Zur/ljVvkSR
	f/qHKwpp00vsU/0lqdcVnODagayGRYacPNDc0sNtMHrkuPxqcts1d6f/T1z/cNgv14Tm
	dRz64PgWV2BpwG7niwwtmiYE7hB5Lfb8BWaxuajDOic+sd8YitKGQt1oFzlfc/Wyw+Qb
	hKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=7sI36a1KsaJeWE5LMBUMq/0HtWKQLp992fDPGGANtpw=;
	b=j/r5qq7NqbSTBu5yiS2WUZegK/kNN4ruy3gk6ZqT7VUnMr5PgLeTAV/d87Dl7f3EQ3
	5Jh6Xea+ZeHTsKVUSOPg8/25hB8sQO8K1gydz9BC9/ySmikxZ7cYl2VoaUrteVQ43hCA
	LgMePF3SIPzw2RhD4GzWBqJKL0l1DdQoG3LOMzNadFR+IEIwu0O17CqH9WDj8ePBIPtJ
	52oOVTORqnsjDcsKGKy9CoBrJ2jLB6g9oMEl7TUDiZwTbV1rMpBJEshGdaZ79di22w/M
	/SQ/RnTEGCgqdM3wLGVZpUgcctnOuxomLfQtAh+qBfmrSxuffoivQX4vj1DU6RnLG8lx
	pTPg==
X-Gm-Message-State: APjAAAVIp7xXPZ9cqavxLqglEF8kP8lyBpc7Ma8ZRwdg4iefC90+Dpx+
	bFaDZA/sPn1rWEZUVrwbv6kr6jvAxgyEgA==
X-Google-Smtp-Source: APXvYqyaFb4EOhGx8UcZ6GMTsI89U9uzlyE+PTCf2MGeumm/3cswtSlqOZMRegp5Czfbh/kmyiZ9wA==
X-Received: by 2002:a17:90a:bb86:: with SMTP id
	v6mr2590008pjr.84.1567860940784; 
	Sat, 07 Sep 2019 05:55:40 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	j1sm9500878pfh.174.2019.09.07.05.55.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:55:40 -0700 (PDT)
Date: Sat, 07 Sep 2019 12:55:06 +0000
Message-Id: <20190907125506.17536-5-nathan@nathanrossi.com>
In-Reply-To: <20190907125506.17536-1-nathan@nathanrossi.com>
References: <20190907125506.17536-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 5/7] oeqa/core/decorator: Fix super class modifying subclass tags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Sep 2019 12:55:40 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/core/decorator/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index 1a5ac40134..1a82518ab6 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -70,7 +70,8 @@ def OETestTag(*tags):
         expandedtags += strToList(tag)
     def decorator(item):
         if hasattr(item, "__oeqa_testtags"):
-            item.__oeqa_testtags += expandedtags
+            # do not append, create a new list (to handle classes with inheritance)
+            item.__oeqa_testtags = list(item.__oeqa_testtags) + expandedtags
         else:
             item.__oeqa_testtags = expandedtags
         return item
---
2.23.0.rc1


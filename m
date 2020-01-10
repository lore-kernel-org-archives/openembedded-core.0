Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 809B77FFAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p17so2706228wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nWEvMb31zZprItTBNRZdPGtI6hZQqsdX5y3MKqiMOEU=;
	b=m1+oZCqLuap1qanTXg15l32xgZujQ+OemyihnvFoDfeBKeM2By7nhEJmSIlWWPb77V
	vXF6LC/z6DOSG+7eM+/e1qXyHLNLHtuWyfvzEW12R3zfKDrYA239VZuFO1hPS8MVH3Fs
	Hu3UYdtBWJv7mhdCHbk0FrJ6/mmNyGHkv600r2Va6o2aNBwpS3Zzy0s+NxAcFo0MxkSN
	8+fXZTeE1UnV+Eh9UlGHWWM36FqqZV9t1CKYfN5nXYY/so0Z5cAgTZDPjDOAz6g4VL1m
	i/J83rssvjTgLxE9j2Ise1qej9qnbtra6HV4eoDfvllldiKhsFXu5cj1WdvV+dk8GpiY
	7k7A==
X-Gm-Message-State: APjAAAW0TsSq8EJlwqX4MZdDkVn9aEl2zCIJ6aoRKhEtoxqn4RwbB1p9
	RY/5bp364yivubvrLlVZVoNa8EBi
X-Google-Smtp-Source: APXvYqxdQ8sEl9Z8ciuuZ2OEbNaLJiQ/VgVe/V54rAukV9+QLPppqqkfZDo9kRHQDnDYfW1IFoeMJQ==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr5143121wmg.86.1578675193097;
	Fri, 10 Jan 2020 08:53:13 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:12 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:50 +0000
Message-Id: <20200110165302.27426-5-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 04/16] site: musl and glibc have glibc compatible calloc()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

calloc (N, S) returns non-NULL when N*S is zero,
and returns NULL when N*S overflows.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 0bcaea2732..baab03c588 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -1,5 +1,6 @@
 # general
 ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=yes}
+ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index bbf2f9c72b..d8ff44327f 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -1,5 +1,6 @@
 # general
 ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
+ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
-- 
2.23.0.rc1



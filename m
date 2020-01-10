Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D33187FFA7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q10so2452880wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YyLYqSwwEgEKExj3EfoKsP/cwQKsRIwgVO0hYNmS21o=;
	b=SBUawew5gHxSHoBM3bL30+KE48PK3Dx8Eq6FsEQsvxNsnStYhMWcJKtdCOmj1HT8vY
	IVsCmMAwzpZKrNOrfSHC8if5/KNz7xU/qF3wmV0G8I18PlXtqzUlq/8M2Jkqkiz9Y2cm
	Bdwf+UMIm8Oz83qg8HJ3+EZDSmbEPFCSB2NcFri9M5k9R8aCVZUzrqg8faEP9yyacdSf
	/Hf96PZaC3joq8V9YtYBmQ9UGJPCOCo63VKAXRMRfkAoVYotxAmY8NLTlg6QH4GdpzLN
	9UE9mPdzKS8En3prvTea94QQCevSzV5YS4+H1bVvEH2XjwKox6185+bZtUPrKW+tGN/p
	nLWQ==
X-Gm-Message-State: APjAAAXPYKOYbUHwFqvIRJPg8tbOchphU9pJdT/XF987lmyeE+TeOt8z
	/NXUwD6bU0QTTpFuzazf7vJX+aHg
X-Google-Smtp-Source: APXvYqwWOq5mn/Q0DxzVHZ9UDzChqIEGPMO9RKkUkZgJBWnaGjApwb+Kkt7CEYqefgVdOLLhkkEuPw==
X-Received: by 2002:adf:e887:: with SMTP id d7mr4404619wrm.162.1578675197392; 
	Fri, 10 Jan 2020 08:53:17 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:54 +0000
Message-Id: <20200110165302.27426-9-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 08/16] site: set getcwd() test result for abort()-bug for glibc / musl
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This coreutils (gnulib) test checks for an abort() that existed
in glibc before 2.4.90-10 (in 2006) in certain conditions.

Neither libraries exhibit this problem today.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 1f6175ba93..82a70b0f3f 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -29,6 +29,7 @@ ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
 gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index c8113755aa..2785c66a5c 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -34,6 +34,7 @@ bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
 
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
 gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max='no, but it is partly working'}
 gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
-- 
2.23.0.rc1



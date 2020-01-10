Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3737FD08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so2683060wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1lTEUTPwdzUvd0sWBMLrczTO1vlfNOVK0qdEOAu5KS8=;
	b=YfGF1tg7A/1w+VWLu+rSwiy9PFM43iuprD+fVY+3ImR9iXQ8tjjiOldzZcqq7LF73q
	5tCrA9FTOfQ4c/YWmjrFPHVlQgeLFqUdWmtyXestDnlFiUlDHik9YjT+Nkr6QZ9aBjPH
	mpUscOB6WbhUIDoYp6mHxAXYZcP/Ae26ImXrpt9lctxmFAArzQ3kWYae2wzmG28dctrs
	y4VAJ5Nkdmag41hyBsc3DZx0aT80yZcOtVJbc+QZgvZ02g+ZSjvoUa4PLQU6pisuQ1xa
	n+4Se4MoG7kocrDVveLjctJcSD6gcb+KEg6JiWNhbx/qABnf6OvWIQdMl5Y1WoFuJHay
	Lenw==
X-Gm-Message-State: APjAAAUFhO2YU8EP+z5eRJ9HT/vjrksnuE8CSGyIW8H0utP/n9AuG54w
	Q77tZglgne8OUlxuW0Nuw7dyJ4dD
X-Google-Smtp-Source: APXvYqyYYqnL+cljErrCGYyTlyOixuiIY2zFNxs/qqe+EnhP0Y47/mHKqA5f1ghHJtvnx4U3wzNEvg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
	19mr5497210wmg.20.1578675198789; 
	Fri, 10 Jan 2020 08:53:18 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:18 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:55 +0000
Message-Id: <20200110165302.27426-10-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 09/16] site: musl and glibc have working getgroups()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

recent coreutils (gnulib) assume yes when cross-compiling
for gnu (glibc), but don't know about musl.
For coherence, just set the result to yes for both.

Note that the old coreutils (from meta-gplv2) doesn't
assume anything and instead that recipe hard-codes to yes.
So behaviour with yocto when using meta-gplv2 is actually
better than when using the latest version (when using musl).

This patch rectifies this shortcoming.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 82a70b0f3f..496b8a4bcb 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -32,6 +32,7 @@ fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
 gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max=yes}
+ac_cv_func_getgroups_works=${ac_cv_func_getgroups_works=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
 
 # glib
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 2785c66a5c..ec068ff673 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -37,6 +37,7 @@ fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
 gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max='no, but it is partly working'}
+ac_cv_func_getgroups_works=${ac_cv_func_getgroups_works=yes}
 gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
-- 
2.23.0.rc1



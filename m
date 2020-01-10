Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B43647FFB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so2440651wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3v14iQ3YgGnF87D6p54MXM7MFEJSsLmArdXIT5nilfI=;
	b=nEd41g+0POSPt4kHmP6kHYyH3HYdxsJqOKRQYFK91NYYqb8BAiyS0APYaWaLdmm/c5
	qeQ/MrhVA1U4ArwFUThKwXFOjbhO0Fpkf3/qjJ0okf/QyETg0LDzdr1sqSZoXw2NAu/V
	Bp6yLAQei9ywx+11x4NB4yHC1jt20UasnjisXYVqO0DCLq+u64ta8du860fUaOH61U1h
	xY8xqB47Yh7hI6uNyT1t2mNV6TbFSUvJ60vDTQLw6CSA6BrCUiB6r+d7AXZXEeSB/DQN
	whx4HRQlmN2rzB0DihWKn42UPJjFMyovgsK1plgdAj10+wvU6vJ39W2iLN3DQG/NEteK
	42xw==
X-Gm-Message-State: APjAAAVLcI/3+m/+8DevEEBtXyCMttFVIe/ju60DyQ6/+KUR+XyLaQOs
	w2VVgacc6Cg/8qkPaVsTincRUuku
X-Google-Smtp-Source: APXvYqxVRImqjA5RM4o/IqAZmzNqe8e4yXRrttJU30rPWggT7qmu9MBLBK3JOxCTWw+RVfsOjgFqdQ==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr4370331wro.45.1578675196306; 
	Fri, 10 Jan 2020 08:53:16 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:15 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:53 +0000
Message-Id: <20200110165302.27426-8-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 07/16] site: set getcwd() behaviour for long paths for glibc / musl
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In glibc, getcwd() handles long file names properly, on
musl, getcwd() only works up to PATH_MAX directory depths.

Configuring the autotools (gnulib) test result here allows
coreutils to compile more optimised code for both platforms,
rather than being pessimistic and re-implementing everything
itself.

The difference in behaviour is because both do the kernel
getcwd syscall (which only supports up to PATH_MAX), but
glibc implements fallbacks for longer paths, while musl
doesn't.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index e5085f518f..1f6175ba93 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -30,6 +30,7 @@ ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
+gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
 
 # glib
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 0c9d21e0b7..c8113755aa 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -35,6 +35,7 @@ bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
+gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max='no, but it is partly working'}
 gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
-- 
2.23.0.rc1



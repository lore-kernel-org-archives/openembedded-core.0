Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADC377FFB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so2434760wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k5AqPo1w7ni4q0YAoAcpyuKGbKJmb9xg+ESvrtkSh+s=;
	b=MsvMPz9a1CBu64y6ZWaUJaX7r2ZZuQw7zHdDogwjS1s1n10acePnTmn18UM9Y0L4iD
	19fBRnbP44p9utx9sTybjNS4nqDo+/JqCljAoX0KG+vlYHUwmZ9UYdWSHPxe6MkdaI18
	+3d338wqkQGgb30LEk/iW2OIDHSuhoNgc1Ai+OtuEej3AY535U8oS/FGv1oWFsF+O5EG
	F6dPhLhANEsvkz/YMhgzc2qmSvehZ9oCeG8xWoMr5PYrAikfOVK3BGhkQHMP/CqSDpTw
	hl+ISvg1KwAmetqDAvo1O8hEKqI1QQKxbdFCFBXRtmC9FBQ1HpmpRPQ1xw2zyquNgIw3
	HyNw==
X-Gm-Message-State: APjAAAWynZMfX2yoR19Qo8ulgin0MvE0yaElT+xPV+LFtwsPSUOGjm0q
	4BwB+ZcG6sT7KJueFKBc+/8bUJIm
X-Google-Smtp-Source: APXvYqxMcW8Cc7NNzE0nDp4AaI7qAKrVbSfKYvdpGOH2FfdQRDeNr4LLdm9Vj0kWLwYA02T2xp+KPw==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
	l9mr4730675wrx.304.1578675192104; 
	Fri, 10 Jan 2020 08:53:12 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:11 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:49 +0000
Message-Id: <20200110165302.27426-4-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 03/16] site: musl and glibc have working mkstemp()
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

their mkstemp() passes all tests from the gnulib m4 macro
gl_FUNC_MKSTEMP.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 1443f8e528..0bcaea2732 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -28,6 +28,7 @@ ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 024b6ba1e5..bbf2f9c72b 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -36,6 +36,7 @@ fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
+gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
 ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=yes}
 ac_cv_func_posix_spawn_works=${ac_cv_func_posix_spawn_works=yes}
 
-- 
2.23.0.rc1



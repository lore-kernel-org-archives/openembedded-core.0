Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1167FFB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:27 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z3so2481223wru.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RaAZU/SU1NfXTs/6YXckgbU47OJpYDuwT0azsEXZbz4=;
	b=dvvt/btLZyEnNROGcVSoQcQulKRBx4TAXBvBmPnJOg1Qpu0PoNsfoVR0s1t564p8/Y
	1MS45jXezsxC33S+ktBrarpRbmVPVYbb4xL57NHi/ynbX/JgE381lbmLpLqB9GMUfEi5
	LFDt3g4eUl4OWQqUyqMphmGSg17ZvSTyCe4qU8/RxdIMJIkagh8/Vmbo/BWvj0vLKqIe
	pd9p4jCJHEoQpGgFqtlVBwWPBcHx0ajnEecSFBJ01eYMZ58XDkKG89BpqVGWIXcj/8f+
	mvQbYnDWaBmO2gCZp6L1SGFS0pGtHtK0am2SfOdYdBsnuGzIs2FyB8KAkx/SdcuI3216
	/mCg==
X-Gm-Message-State: APjAAAUK6l52i3Gg0O8Q9fzA71feU2MCxtrqaslI8ZltvwN1VXmUsQlJ
	9GxFMpR1qkLxTILAkOAoRJ4znlJg
X-Google-Smtp-Source: APXvYqyJ7BpxM+qL+q0qwjgcDDXb+NqVY2YI48oLKVqglfW9mnskyfvfcuqGtQslI6T1DCWI3kdQVA==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr4564084wrp.236.1578675207673; 
	Fri, 10 Jan 2020 08:53:27 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:26 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:53:02 +0000
Message-Id: <20200110165302.27426-17-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 16/16] site: musl and glibc have working mktime()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This coreutils (gnulib) test tests for various bugs that only
exist in ancient versions.

It defaults to assuming buggy behaviour with its own implementation
when cross-compiling.

musl and recent glibc (2.29) are not affected.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 4795d7852d..a0680bc44c 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -36,6 +36,7 @@ gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max=yes}
 ac_cv_func_getgroups_works=${ac_cv_func_getgroups_works=yes}
 gl_cv_func_nanosleep=${gl_cv_func_nanosleep='no (mishandles large arguments)'}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
+gl_cv_func_working_mktime=${gl_cv_func_working_mktime=yes}
 gl_cv_func_working_utimes=${gl_cv_func_working_utimes=yes}
 
 # glib
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 398eeacb99..4be8d002d6 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -45,6 +45,7 @@ gl_cv_func_strtod_works=${gl_cv_func_strtod_works=yes}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
+gl_cv_func_working_mktime=${gl_cv_func_working_mktime=yes}
 gl_cv_func_working_utimes=${gl_cv_func_working_utimes=yes}
 ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=yes}
 ac_cv_func_posix_spawn_works=${ac_cv_func_posix_spawn_works=yes}
-- 
2.23.0.rc1



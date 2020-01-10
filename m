Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 22B207FFBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b19so2726844wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uRjsBdF5DZamtNqxxrxtQ9d7/Dx67pwwCFXqQ4X8nEE=;
	b=B+ixpi6z31HzKhACbLNbIIWU1xjp3F3LQgzKVo8aqmRRF1d1GRZKCh8t/sh1hnLvx0
	jLZybzyyTnb0cx3pHfWkYJkFCDS/kw4sZgJMNuJMce+Yk8dMarM4dT23mLakyQaHESNd
	vVzaXC9iUBKoiBo7ujHOsK2sGwLmgMm51rdResaomU7vohPHYbIduKnIamplx1OsFehv
	be1n+J2NEBQxUGdfsDQPZivs09f+YAN4MQPOPnZoYJMmCw7nslJwRepPZLS72ZZIpgDy
	dTxiWWkzWUv68WLhNdqRLWbHjjZibmO9s8NSIyF97elYu5TXbGmMEBtfTRh9y7/yBA3E
	elXQ==
X-Gm-Message-State: APjAAAUvb5nYH3QCArT/V1n/SaAKXll0k5zX7c0ytm63G/7cu8e8uPIN
	tdSYEA4LjQrfhVHfxCPQgvxf7qXj
X-Google-Smtp-Source: APXvYqxZpUDx9dsoOCehVjIpaVFz1OajLSrE6BL3W+9CveyHtW3Z2d/UM00iOdwuFO0CTxUQgnYrcw==
X-Received: by 2002:a05:600c:2283:: with SMTP id
	3mr5487521wmf.100.1578675206627; 
	Fri, 10 Jan 2020 08:53:26 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:25 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:53:01 +0000
Message-Id: <20200110165302.27426-16-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 15/16] site: strtod() works in glibc / musl
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

autoconf has a test for strtod(), which assumes non-working
when cross-compiling, but it does work in both musl and
recent glibc.

coreutils (gnulib) does some additional tests on top of that,
but assumes working glibc when >= 2.8 when cross compiling.
It doesn't know about musl where the additional tests also
work, though.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 1a28a271ff..4795d7852d 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -15,6 +15,7 @@ ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_type_uid_t={ac_cv_type_uid_t=yes}
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
 # bash
 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=yes}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 386991d2c4..398eeacb99 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -15,6 +15,7 @@ ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
+ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
@@ -40,6 +41,7 @@ gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max='no, but it is partly wo
 ac_cv_func_getgroups_works=${ac_cv_func_getgroups_works=yes}
 gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
 gl_cv_func_nanosleep=${gl_cv_func_nanosleep=yes}
+gl_cv_func_strtod_works=${gl_cv_func_strtod_works=yes}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
-- 
2.23.0.rc1



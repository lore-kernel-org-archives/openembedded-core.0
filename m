Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 060EB7FFA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so2728836wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XyLDyVPLz5XUzzbIhf6xu6jT7rsDddqORm/T4joZ6Dw=;
	b=HzDDwaoTDUDjG67EeC62qBhi/KrnG16H20QKNJZtbxHRcb6Hzi/hkbSv3dssZpT95/
	mvIgldGR/WoI3ivH8umzshSltt9DAxn0it5VtrI2awNd+9Vg04GI3jARh39uioEwemQd
	gPUU3mDDBgOHglc0Bg2JPlJ7AjM2H02qSAPCbzoB113N6gjPwDONfCQBU+2hGPxA9mR2
	YBMafeHThjRkvj2d66yQKahiyHDMkX4TGwB6a2LG/EdKYUKjGmTL8oseHIGRwkRAdLeq
	nEbrq7HHyyVpwmhqwTHpouAgC8TTsagMqb7FiixBxu374sSI/lz7P3qJ5uR0LM6+IrPm
	LWYw==
X-Gm-Message-State: APjAAAVqcM8/wPrp5bX7oomPLGmXcAamt99Y3tmeW/9OWYJ2sbM0Ibbq
	PdaXBwQ8ITGqkc029AmDNU+SkX6+
X-Google-Smtp-Source: APXvYqx5W6d/r+oDnvhGGus4VpjJoJdMJ/zJdu+J3ETzFx/qhpg9X/yLxVtixeoPoMk/nU7YHFMrHw==
X-Received: by 2002:a1c:61c1:: with SMTP id v184mr5296234wmb.160.1578675205592;
	Fri, 10 Jan 2020 08:53:25 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:24 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:53:00 +0000
Message-Id: <20200110165302.27426-15-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 14/16] site: set nanosleep() behaviour for glibc / musl
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per coreutils' (gnulib's) autotools test, nanosleep()
misbehaves on glibc (2.29), and works fine on musl.

During cross-compile, recent coreutils assume brokenness
when compiling for linux, which pessimises musl.

Set the correct result for musl, and for coherency reasons,
also specify the result for glibc.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index ca55d48e72..1a28a271ff 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -33,6 +33,7 @@ gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
 gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max=yes}
 ac_cv_func_getgroups_works=${ac_cv_func_getgroups_works=yes}
+gl_cv_func_nanosleep=${gl_cv_func_nanosleep='no (mishandles large arguments)'}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
 gl_cv_func_working_utimes=${gl_cv_func_working_utimes=yes}
 
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 1e7efbc311..386991d2c4 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -39,6 +39,7 @@ gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max='no, but it is partly working'}
 ac_cv_func_getgroups_works=${ac_cv_func_getgroups_works=yes}
 gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
+gl_cv_func_nanosleep=${gl_cv_func_nanosleep=yes}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
-- 
2.23.0.rc1



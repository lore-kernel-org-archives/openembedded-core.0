Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id D62387FFBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z7so2440911wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F2w/KiuR9xA8Jf7o+wQhq340xfh/kYIE8t4VzLBbY0w=;
	b=GH/ILj3LxB0+p0boF+1JrS+I7QyVvW/0wPifeLtv8TU5r6ygdnWTBddwafi7Hr/cEw
	amIJsuMjRU58Sm1C4/UBIhybOuL0I2rakBp8uNPu7G+PgwHIFl32o+M3edzmIJazOivO
	CcozsvyIW7dHUD9fc88F3tvYPNa4dugzQm14/EmIiinKVwBzCSKCbEdgdBQniEp1iRPE
	T82UIDGV+pOJFv+BlHD2b6ugcPxN8iPjwfw9AP6yhtRuGczFo8Ci6a0XytYUFXlytg2b
	GXrcYx+GB4asNtGBCuhiVIQzX3IiEKjgQZJszMcOMEc8TbsFYNWniV0U2//L6vLYks7L
	g8+Q==
X-Gm-Message-State: APjAAAXH3v//ruFuUMDsaVx7oqAUAal8wlkOXKExB4MkDIZR7G+0psBH
	XQgzpLfPYagI/G/7hP/L3cwDuzHp
X-Google-Smtp-Source: APXvYqwUHjd2hst4WPJApeLD1++mODIuntYZVDEf7GuuNT0VbbaJLPsgNOetEBXhZUbjgSFhB/abxA==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr4575958wrq.134.1578675201446; 
	Fri, 10 Jan 2020 08:53:21 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:20 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:57 +0000
Message-Id: <20200110165302.27426-12-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 11/16] site: musl and glibc have working utimes()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This coreutils / gnulib autoconf test is for a broken glibc
implementation of utimes from 2003-07-12 to 2003-09-17.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 496b8a4bcb..ca55d48e72 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -34,6 +34,7 @@ gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_getcwd_path_max=${gl_cv_func_getcwd_path_max=yes}
 ac_cv_func_getgroups_works=${ac_cv_func_getgroups_works=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
+gl_cv_func_working_utimes=${gl_cv_func_working_utimes=yes}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index ec068ff673..1e7efbc311 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -42,6 +42,7 @@ gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
+gl_cv_func_working_utimes=${gl_cv_func_working_utimes=yes}
 ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=yes}
 ac_cv_func_posix_spawn_works=${ac_cv_func_posix_spawn_works=yes}
 
-- 
2.23.0.rc1



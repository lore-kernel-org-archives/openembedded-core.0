Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F81660A88
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 13:30:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r15so529440wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 05:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hONuvKGqE1q7eCurFkGLjELWEV9I6ntEpid7otrrssI=;
	b=rFBLoawKLSUi20kekd5bggYck8z33QdgPXEbXpaoY5/EW3AXLbuR6Do+Ol/4/jlK1/
	hdIWl2kB/lVTSuyOOeyZ3i/4pH0MMyUe1mDKgDmjdF/7roi2TcHDxH0A9iHPrOERbVwx
	emPBcIdfIUOrioUQAfjshyjeu7jDUhh65pKy9MqZcn88YqhXQlFxez8LJYgTcAWwpfe+
	WD82nQvOMQY147pTqfOMiJ0yKYHhSm8ZJ+9fDQuhcFZTAdGGOQ8FBxhm1NaQNtUu+u0D
	EO0HvbEBQQa3kyxK51/oqyfcMXWKjUR2OIHIckRtGV5mAzOzMNw9ApLLRprptq4WB8Io
	uxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hONuvKGqE1q7eCurFkGLjELWEV9I6ntEpid7otrrssI=;
	b=RO3H6onG3eXyg6ElxhFCKD97oueBakvKbDVW14XERqysYdc56UU/qITjpFnmzLgTkz
	dUNlKSvtADBvBGhZ8zaT0WUSrdiMmcqs20AW3CNzZkBk9eKNPnSV68blxKDPKI7UI+fx
	YhKa2f4byXDIus5RBOHUg5hrqPeAXtS7csGlTqRxhdzZl+h3MtGr1vzU+qjnXkVrA4Zd
	ELN0zcSYcbIDaXWTmia2aoeXRI3AJ//OBd+YMZc1WynlJip41V1WIp9kh/h3+a7b8N+e
	Lv/XSrxsRNM/R79NFyyPx6mYKdJSgG3EK42tm7eJ52kA/oKC9HkT4WAPqQb8BX7/4dv0
	PCiQ==
X-Gm-Message-State: ANhLgQ1teNznv1Ct3574A+OXefiBj1kTpUrzKrwQ3AhV+P94Myw4yMts
	IAeSiJmsx5HpqZZhuRGDw92j8wMA
X-Google-Smtp-Source: ADFU+vviU2q9WFSZYHHlbR+5UdR1B3DQo2lh76uk+1mZWjywpRhA5XmCK1bpHJ+oU9/5Aurb1OFiFw==
X-Received: by 2002:a5d:4ecb:: with SMTP id s11mr9888284wrv.83.1583587808597; 
	Sat, 07 Mar 2020 05:30:08 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	i7sm37636424wro.87.2020.03.07.05.30.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 05:30:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 14:30:06 +0100
Message-Id: <20200307133006.21223-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] openssl: fix perl shebang in c_rehash
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
X-List-Received-Date: Sat, 07 Mar 2020 13:30:08 -0000
Content-Transfer-Encoding: 8bit

* passing PERL=perl breaks c_rehash calls from dash (works fine with bash)

  dash doesn't like
  #!perl
  shebang

  PERL="/usr/bin/env perl"
  unfortunately just passing PERL like this doesn't pass do_configure:
  Creating Makefile
  sh: 1: /usr/bin/env perl: not found
  WARNING: exit code 1 from a shell command.

  But passing it as:
  HASHBANGPERL="/usr/bin/env perl" PERL=perl
  seems to work.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index d4871fe973..a1a53aff3c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -123,7 +123,7 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
+	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
-- 
2.20.1



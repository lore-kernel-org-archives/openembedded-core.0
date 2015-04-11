Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6488273D36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:01 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so37829146pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AP6HBYRYiHtB/Qdmyvre8ud/rGDV6yHa+lLaDD/sUTw=;
	b=vZZrIWNNKFMmwbJ0N4kMdBsL/2Bzny3DQMMNJmieT6hAkn0OJfMBy1tqTJtzw5CFC6
	JE393efwfHTYH5CemKaViiwroadg91THVhxIgF1lByPmgnRvNRgUp5vUYHyXfLGocJSn
	AvZPOJVPWc5OMst+5kJU0l+fPOXewJFAJcolCJ6F+Odxtfrt32XFqHzfhKxYv/xSBo/3
	A0z2yFkGRrPH8tcrL2FTdr+Gckda4e+7niUrOWx6rW9yp363LPPE4yL0FZOYIhXeCNla
	iLLdZGF3v2x6IyP3On2NO0aYEOy9GdQy8p7GdguW5NitcZn6QnhF6VZ7c0aVkPa/9JIW
	WNIQ==
X-Received: by 10.68.132.194 with SMTP id ow2mr7136321pbb.51.1428715262601;
	Fri, 10 Apr 2015 18:21:02 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:40 -0700
Message-Id: <7a740cb2794d437107399a32af3144b92fdab269.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 09/17] perl: Fix build for musl
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:01 -0000

The changes are covered under "${TARGET_OS}" = "linux-musl"

Change-Id: I24a1a8e07abb35c7e3d64b372addfb3bd6f7731c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.20.0.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index db65202..d100ff9 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -165,6 +165,29 @@ do_configure() {
                        -e "s,-fstack-protector,-fno-stack-protector,g" \
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
+        # Fixups for musl
+        if [ "${TARGET_OS}" = "linux-musl" -o "${TARGET_OS}" = "linux-musleabi" ]; then
+                sed -i -e "s,\(d_libm_lib_version=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdio_ptr_lval=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdio_ptr_lval_sets_cnt=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdiobase=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdstdio=\)'define',\1'undef',g" \
+                       -e "s,\(d_getnetbyname_r=\)'define',\1'undef',g" \
+                       -e "s,\(getprotobyname_r=\)'define',\1'undef',g" \
+                       -e "s,\(getpwent_r=\)'define',\1'undef',g" \
+                       -e "s,\(getservent_r=\)'define',\1'undef',g" \
+                       -e "s,\(gethostent_r=\)'define',\1'undef',g" \
+                       -e "s,\(getnetent_r=\)'define',\1'undef',g" \
+                       -e "s,\(getnetbyaddr_r=\)'define',\1'undef',g" \
+                       -e "s,\(getprotoent_r=\)'define',\1'undef',g" \
+                       -e "s,\(getprotobynumber_r=\)'define',\1'undef',g" \
+                       -e "s,\(getgrent_r=\)'define',\1'undef',g" \
+                       -e "s,\(i_fcntl=\)'undef',\1'define',g" \
+                       -e "s,\(h_fcntl=\)'false',\1'true',g" \
+                       -e "s,-fstack-protector,-fno-stack-protector,g" \
+                       -e "s,-lnsl,,g" \
+                    config.sh-${TARGET_ARCH}-${TARGET_OS}
+        fi
 
 	${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
 
-- 
2.1.4



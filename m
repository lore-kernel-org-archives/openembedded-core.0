Return-Path: <dev@codyps.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD25B71DEE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 19:20:52 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id h41so32629938ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 May 2017 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Lz4sndk/hOACkNhy/q5djDGsV1uOBVn6D72sikifiCg=;
	b=LsCnwh3vlPIjLIKpxj3HTyWMfHwN+UYrFz6QJ8XsnCp1tczMJqbu4MmWE0JMn2l4za
	2CvHQYHKDM1m5LUNXHS6Zj1tm3RcR4HtdrTCdkRHumkHzuYxLU5dgDjfmC84M66Paj5D
	SH/9ZP9+s19P+JLU1SDJdk9WYu1PBSNnUd/6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lz4sndk/hOACkNhy/q5djDGsV1uOBVn6D72sikifiCg=;
	b=g46RsREoQzIutzjwGaikya6K9bPwByzULuRWrbwM8K5PGe4Ii1CEOzGOqVF6i8Z+Ye
	dO03OUwficETd3tw1V83U+dLsFL2m8IKkkG9i3pTjZkounbkktkll9PIUVG3m6y+y0nB
	IOgT9C8mhwKAu8AlEbUjS2VPGKxfj216lHGlBuSCLhrpiTEJLYyOtbEH8nCKeWcUSNOx
	3mE/HGTCtjz/ADh8YHJXIXKEw7oQn4+ZVMarC0htpDOQPqxRrla1MwmlLgcQaPmgvqBh
	Vk5CGHAWjADzhxvIPDcEaUZXTy6fE/XjV1A8a3zZV1HiN0d/pcOPGMoh0Xpg44U0XpKR
	ilFg==
X-Gm-Message-State: AN3rC/4lHMmB/RijukguX19BMC0LrX3axJjabwShYN+m2NyfX9hUNktw
	jRLJJIPbOUqziA==
X-Received: by 10.107.11.97 with SMTP id v94mr28018838ioi.183.1493752853690;
	Tue, 02 May 2017 12:20:53 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	v89sm8041488iov.49.2017.05.02.12.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 May 2017 12:20:53 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 15:20:35 -0400
Message-Id: <20170502192035.13988-1-dev@codyps.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] binutils: package libbfd seperately
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
X-List-Received-Date: Tue, 02 May 2017 19:20:57 -0000

Some tools (my issue was with 'perf') only need the libbfd component of
binutils, so we can save space in images by splitting it out.

Previously, instead of `perf` pulling in `libbfd-VERSION.so`, it pulled
in all the libraries and binaries from binutils.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 7efe13fdf6..068dce8ee0 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -21,6 +21,10 @@ EXTRANATIVEPATH_append_class-target = " chrpath-native"
 
 inherit autotools gettext multilib_header texinfo
 
+# Split out libbfd-*.so so including perf doesn't include extra stuff
+PACKAGE_BEFORE_PN += "libbfd"
+FILES_libbfd = "${libdir}/libbfd-*.so"
+
 FILES_${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*-*.so \
-- 
2.12.2



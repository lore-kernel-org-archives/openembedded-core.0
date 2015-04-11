Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9D973D3C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:20:56 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so37827522pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JKMDh6/9UGAA+Z1i4FHxucr9Frbc1hBihGPxtMcdhlI=;
	b=JNjyU3v37VgRbs+XPAda0kkmZHpMzjR2zMAnoDiOV+v7NOE3COIVpAGlowfTzKDaHW
	TPotUV6X1nEYImBizY3OWQMKKxtri7+GDr9Trd4rM/nVZM52ZnAQLJCqjH3fFBq6fCLN
	1689QoOFTsFT26sfPBr9h9GtieQQs0/aU06R5ukq42DXUMnapLe6Z9Pa9qjRRfQPlxkU
	tnDPmOvOr75k53DXQkWCf8pVXdCTYOTW2FKA4MuOHVgdkYxmbVspCvmULgnnZPHIsWTk
	kUb+FvXBsOGVXuUZOfqwOojKS/ZriAIPanY4Fp+r1bBG93twIL/GFiNeQoz2E8fYZP4E
	LtYw==
X-Received: by 10.70.90.100 with SMTP id bv4mr5497090pdb.53.1428715257897;
	Fri, 10 Apr 2015 18:20:57 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.20.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:20:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:35 -0700
Message-Id: <28ab39bc028dfc01c6a66a5b535cd619d33dfa78.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 04/17] ppp: Add extra include dirs
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
X-List-Received-Date: Sat, 11 Apr 2015 01:20:57 -0000

Just run configure, the configure script is not really
a autoconf generated script so just run it

Include path is needed to be there since
the headers from it are used during build in subcomponents

Change-Id: Ib1f24fd18bc8564e3c74ab834b7cf0fdf955d0e1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 92ca0c9..4219d45 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -43,7 +43,11 @@ EXTRA_OECONF = "--disable-strip"
 # Package Makefile computes CFLAGS, referencing COPTS.
 # Typically hard-coded to '-O2 -g' in the Makefile's.
 #
-EXTRA_OEMAKE += ' COPTS="${CFLAGS}"'
+EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${S}/include"'
+
+do_configure () {
+	oe_runconf
+}
 
 do_install_append () {
 	make install-etcppp ETCDIR=${D}/${sysconfdir}/ppp
-- 
2.1.4



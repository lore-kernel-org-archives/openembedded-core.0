Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 29E0A72E43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:08 +0000 (UTC)
Received: by pdev10 with SMTP id v10so8553938pde.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oBJMUCmbF+JYdYEXZJL0TGGjZtgDzxEYBxVW7DyvrAo=;
	b=ABltpHfMk+1gc329rcRaP/jiO9Eqi+FaceWlxwJLhNfOrxzEqHlm/brZpfOIpEwkju
	81m6f0Auk2J3n9cd6WOmjpuix32hUlVvTn+PJGbrP5EkHQHAJLeAgFr5QSSC/9m+YZLB
	XZvIhQHTQ90CDZqtn9dv7GgmVfnYoZM/kGoRxhJu3cbZuzCkfOWCddJ1P1BbQlWeLH+/
	4z/6zu1NsgtLqtjm+SZZziKc4w/Nnkv17+44AfNuO/eQLZfqjXxs+GFWhfEIo7kJ9WFk
	U+d8rJTA/KqLuUNIwtb7ZclHymI/FxlNk5Y07ktIGlFdsDc2EHFnWb76G6hIgOWV+36k
	3Lag==
X-Received: by 10.70.45.231 with SMTP id q7mr6926202pdm.32.1423152310038;
	Thu, 05 Feb 2015 08:05:10 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:36 -0800
Message-Id: <7337002b94c658a555647dd07328939fe31f63f2.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH 28/61] dpkg: fix host contamination
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:09 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Force dpkg to use "tar" on the target.

The dpkg configure script looks for gnutar, gtar, and
tar in order. If it finds gnutar or gtar on the host
it expects to use that as its tar program on the target.
Without this, if gtar exists (as it does on my system) then
dpkg will consistently fail on the target with an error about
gtar not being found.

(From OE-Core rev: 45bcb1ea92f244df4745aca6f9f9556c43e9b6ce)

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 929906d..92d4020 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -37,6 +37,8 @@ EXTRA_OECONF = "\
 		--without-selinux \
 		"
 
+EXTRA_OECONF_append_class-target = " TAR=tar"
+
 do_configure () {
     echo >> ${S}/m4/compiler.m4
     sed -i -e 's#PERL_LIBDIR=.*$#PERL_LIBDIR="${libdir}/perl"#' ${S}/configure
-- 
1.9.1



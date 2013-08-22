Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 01EB26B91D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 04:31:57 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so1374263pdi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 21:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZHC48dKej+pik8Z8OD+9HVWaHT4LtghfFzRgYdnWAxc=;
	b=Wi/8brh5AwnZcU/6aJ7lcvpPMMvF24uAX2Euebx0EyZ2gNk30ulY5yJmYHCgqDGoF/
	E1AwLRSDvRTuO2mnBCZhblJxYe++aWfjhimN9OeRN2MSYfvQ6SSW7C+A3Ed88KHkyQHf
	HuFIg+xwGKMadNzJC30i8Li6J64RVpVQpvf7S3ockbs0KxNbLf+q+Aauqd7AjeaKPH+d
	mFex6fBbU0WdL/bT3qO3wfVlafdiRox/42GY1KENc3YLXwL9kILwwGQRwGKpZcP9tLmN
	QlktJeBaDtV4oyytn+Kqdv4gzzF5LUoqzkAYmHjAsN/n5pUgpaK8k9Ka5fD711k9u+RG
	ijdQ==
X-Received: by 10.66.139.166 with SMTP id qz6mr3327865pab.88.1377145919038;
	Wed, 21 Aug 2013 21:31:59 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	hx1sm12017781pbb.35.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 21:31:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 21:31:16 -0700
Message-Id: <9d36baf7297cc82be41f869cfe2abd079c7ef02f.1377145501.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
References: <39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377145501.git.raj.khem@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] glib-2.0: Specify libiconv when building on uclibc
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
X-List-Received-Date: Thu, 22 Aug 2013 04:31:58 -0000

We use GNU libiconv seprate package on uclibc
specifying this makes the configure clear of not
trying to detect glibc/iconv and then also finding
libiconv in sysroot and confusing itself with errors like

| gconvert.c:66:2: error: #error GNU libiconv not in use but included iconv.h is from libiconv
|  #error GNU libiconv not in use but included iconv.h is from libiconv
|   ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
index 3ba49b6..0918bf5 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
@@ -44,6 +44,7 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             eglibc-charmap-invariant \
             eglibc-localedata-translit-cjk-variants \
            "
+EXTRA_OECONF_append_class-target_libc-uclibc = " --with-libiconv=gnu"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
1.8.3.4



Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3D5170100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:09 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y5-v6so1750909pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wwoZ+zJEUib7r5LSjqQ7QQ8KcdJefoSJZCHveB5y5/I=;
	b=nkf6u1tUH5nOIohU0MoR3fq+AiEjaO8KrZmCBPrKWk6iyzKQnn9qZ7wsgaA9Acol90
	05mRtG5byOee1sHLdpUHZ886+jH8bMmSUCnoOvubH4MYcq1jMJt+ckaNVIGqVWxlqA+4
	GW9nMb47YWHSFEZg+w+vr3upkw1XqWg8O39pn9OW1ykmlBj3ZzTZL2uZOrP2ebiy4FrI
	ZLg77/Uepwhq6Z5fQhiN7J28TUZmpb/MwOMVW0VwexZK4hcLd3UQ4ODzJCfSyI6S8Za2
	CkN/DmezkGxcIpdbZbqhTc2cGbiu2fEc9FntfjFL8c1Ap6IQAhTXgYpSz0GydUutDpF1
	EkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wwoZ+zJEUib7r5LSjqQ7QQ8KcdJefoSJZCHveB5y5/I=;
	b=ZnvyBhuWhPK9hza6ag0ejtc2G9bGB9MwFyfo6ADDk++Hhj9tc00ypsCIB+mr7rWZQ+
	jIq7oEKO1FxcpUIiRKAWjJiaCn3Y1qCiGyf2K0NO8tjPtZJCKGEEa+V4HJX8nkTWD24P
	tAAdx/kRtO/bXHp3cuqIil7nFuLDHNgFzMBpgI2sm1+uKkIBkpPCKpLgz3qs0wqh4u2j
	a5I40ku+sH/e1JKaAKIrTTOYvBUgZ925dhgyUX27UdbL/w5lyCDGCViec/DHEQXQdh0V
	JAndnOt+CocFQt7lEXSXwijTNs+QynpjhBAaaqYoyEE1rsu9CAi0lVDghSkr0FV3a0fa
	pwMQ==
X-Gm-Message-State: AOUpUlHNHj2Ml2Kyn4sMgo1QYWmSTY9bcxsvoBrQr2BWrG2V5Zz1MfqI
	s0fiVlTazGCsrl6EuGF1u2OLD+CX
X-Google-Smtp-Source: AAOMgpdqCV0DZjh4+lpziM/i+e2I9tq9jQqeNamwBiUjh6marLzq8kSm8zMTq3lTYNxUWCasjbhEzQ==
X-Received: by 2002:a63:b349:: with SMTP id
	x9-v6mr14458596pgt.337.1532399950902; 
	Mon, 23 Jul 2018 19:39:10 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:52 -0700
Message-Id: <1532399935-32296-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/9] openssl_1.0: avoid running make twice for target do_compile()
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:10 -0000

Currently target builds call make twice as part of do_compile(). It
appears to be an accidental side effect of needing to only pass
CC_INFO on the make command line for target builds, since CC_INFO is
only referenced by the reproducible build patches.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 58627b0..9e5e7ec 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -210,16 +210,16 @@ do_configure () {
 	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=$libdirleaf $target
 }
 
-do_compile_prepend_class-target () {
-	sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
+do_compile () {
 	oe_runmake depend
-	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
-	oe_runmake CC_INFO="$cc_sanitized"
+	oe_runmake
 }
 
-do_compile () {
+do_compile_class-target () {
+	sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
 	oe_runmake depend
-	oe_runmake
+	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
+	oe_runmake CC_INFO="$cc_sanitized"
 }
 
 do_compile_ptest () {
-- 
1.9.1



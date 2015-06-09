Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6C19E7589F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:09:34 +0000 (UTC)
Received: by wifx6 with SMTP id x6so25613534wif.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 12:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HEeUp3BMRj6ue2d9mkVxJSbl0lT7YHhB6pFQ//skybA=;
	b=hAnsY3lbXuM1M0c2yiQ4fpp02ZocNMNhMGb43vYml568McYM9jFrcjYOCaF46ERx1k
	1XglBhXy740XQ+HSQjhjIAcLq8WY3AxZ7vL5bV6GzFC9NmRP3vVjthGTyIi/KZlebh6i
	c77i8cCEBQVcDc38hZkJf+EkLYLek/+zEyVqSTU3cTq/EJdxlXv/r/+cb2RzOIxo3/SJ
	j712rAbfyVAmyPOiK0R5xKXmjBvCsN5iN7Gc19Sf+ecumMZktb4ceV82dp1t5HO7yUQr
	iASlScj3xsJjucVDM6PWOqfPqn8qNjdyEB1KZXUaRsmUPlBDJ3w7OefaTLgjHGkKq0fv
	1CKQ==
X-Gm-Message-State: ALoCoQkoEfiujX3ikDq0MdO8rxYwC46sROUXMd9OZfWRMnOFqzrWmxyaX46IOH/MU+lXyU0PPj2C
X-Received: by 10.195.13.113 with SMTP id ex17mr43867070wjd.17.1433876975223; 
	Tue, 09 Jun 2015 12:09:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	wi1sm10826811wjb.41.2015.06.09.12.09.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 12:09:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 20:04:55 +0100
Message-Id: <1433876695-28247-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] neon: build the test suite to verify neon links
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
X-List-Received-Date: Tue, 09 Jun 2015 19:09:38 -0000

Without building a binary it's impossible to tell if a library will link
correctly, so build the test suite in do_compile().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/neon/neon_0.30.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/neon/neon_0.30.1.bb b/meta/recipes-support/neon/neon_0.30.1.bb
index 9245244..fd170bc 100644
--- a/meta/recipes-support/neon/neon_0.30.1.bb
+++ b/meta/recipes-support/neon/neon_0.30.1.bb
@@ -20,3 +20,7 @@ inherit autotools binconfig-disabled lib_package pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
 EXTRA_OECONF += "--without-gssapi"
+
+do_compile_append() {
+	oe_runmake -C test
+}
-- 
2.1.4



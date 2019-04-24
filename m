Return-Path: <tom.rini@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 14F467D68D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 21:09:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h4so27066332wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 14:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y8R64glQC3biGN2dSLABgzarf5pTKzQpTzUOriPEXYQ=;
	b=kct/9rc/QTEH3BAWqs9NQFexT0bWxIN+FvOmAIWEo3o4nTU8xqFLd/34pOzIqIqrik
	kpOUbBGQoT4EXEs6ZbtSVTLAmK7VwIefZVnh1SUxg7iUDiweSvx7rriWBkmIvIsFWKOn
	fDwLTaQc1Gd0KN37ZRQBj6aPwnhydnezX6uPdS2I2fH5nPonVOe9912SsFrWUtmMk7YF
	lF9Oc4c+yLE6hLSZlmKywixF2yVzHYV6dsQcjNydXZE6Okd4MQHIAjKGklH4nf73jivE
	5CNwz5fJCU5za4N5l1wQihVbqWAflmdPb9muC4Oy2k170AqZwmL/P/ZLvgsFi+Cfk0qr
	8C5w==
X-Gm-Message-State: APjAAAUOi5aTNydncQaCtCIMzZ0Tprpr9xj/qwU3k/OMy0ej3Mybsemn
	0zIrKA98IhHtVuiuaWd3Hn8Skyo=
X-Google-Smtp-Source: APXvYqw5CrCAE5Z4OfpfUxosv0n7NleQ+hdsf6fxNCkTRPLQbUtJSN6SZfVdq09+oZyacZ5vzago1w==
X-Received: by 2002:adf:e703:: with SMTP id c3mr21544203wrm.98.1556140140612; 
	Wed, 24 Apr 2019 14:09:00 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	a17sm11302609wrm.53.2019.04.24.14.08.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Apr 2019 14:08:59 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 17:08:54 -0400
Message-Id: <1556140134-15963-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555869425-7613-2-git-send-email-trini@konsulko.com>
References: <1555869425-7613-2-git-send-email-trini@konsulko.com>
Subject: [RFC DO NOT APPLY][PATCH 3/2] vim: Add a work-around for some locale issues
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
X-List-Received-Date: Wed, 24 Apr 2019 21:09:01 -0000

We do not support fully / correctly the certain locales.  Attempting
to use these with msgfmt in order to update the ".desktop" files exposes
this problem and leads to the compile failing.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-support/vim/vim_8.1.1198.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-support/vim/vim_8.1.1198.bb b/meta/recipes-support/vim/vim_8.1.1198.bb
index d7b864ee8b94..6b17a3c90e68 100644
--- a/meta/recipes-support/vim/vim_8.1.1198.bb
+++ b/meta/recipes-support/vim/vim_8.1.1198.bb
@@ -36,6 +36,16 @@ do_configure () {
     touch src/auto/config.mk src/auto/config.h
 }
 
+do_compile() {
+    # We do not support fully / correctly the following locales.  Attempting
+    # to use these with msgfmt in order to update the ".desktop" files exposes
+    # this problem and leads to the compile failing.
+    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
+        echo -n > src/po/${LOCALE}.po
+    done
+    autotools_do_compile
+}
+
 #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += " \
-- 
2.7.4



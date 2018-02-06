Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 119DE784E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 12:00:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i186so3235757wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 04:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=beiLA6j7tQpaLgemJpEl0lPu0rLauM8pTQyIvn1VAIE=;
	b=1gbR46oo9LEznFeGhAR9FOJmFTUoqOZCkfuoO02Lhupxkanjbx+0rASeNd30XFsSu7
	JwGscxUJbHMfN0TfqdGIuI5eOOPapCPaPIKC4jFgkhdO/ijPkpFpeSZKCfruZziMrYGP
	VINAq0wpY6CjjPhH/vWmSg7ycifiMVG3OMh6iIBw1+FOK0Bp0QfaFI2ToCEPFV4R9n7U
	QX0ZuWeSlqXwvy2mEPgz+GV7MsTIfsF3Gv27aeenrosAlrdKPj6vVipR8tRfe6Z9p5mt
	JVbFBCAQYiEY3Ap1jyM7FhC27ojDxSs0o4sPjckapcHjDBSJ/3iUzvCgswuN/YN5GTlN
	LTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=beiLA6j7tQpaLgemJpEl0lPu0rLauM8pTQyIvn1VAIE=;
	b=IK0N5KwioAKAMHvQNIzfyGggCRF23trLj6hxwq1vfnXh4AZ+zX8Kt5IA3zAb3czpMl
	C+wURoJm4mZ9GnvDtboXZI0+XXPmXfFbzvCnLx6EkJt7lXvmUwGe/tQVytyb/ShwR8cN
	9RQU2PTtEo4yBQHwue30bm2787MtmgfJ/EEqzOUylO4e3gAAhx1r89AGBvIzD4bBRz/D
	UD6d+1x8q8j+3isxGwJmt8Kl3eekUbmc4IzsIqQvFjU+u4kfSiV8VbzF3u4jtgnPgPPO
	U6fypKlqaNT0qXFFLL/oLTgvxcoqbQt3/r4ueooyO0OyUy6/tsMNzYYZ6Fg+lwn+IQwL
	NIlg==
X-Gm-Message-State: APf1xPDB6ihyymUv6cczMqnYclOxhEdXK40/zkYsyespHfndHccdy+Li
	PlFFSuIPQ5cMHQ5slfbvBDWlVYKt
X-Google-Smtp-Source: AH8x227gfikfQsyzh9+kMk2O1piFwZFX9D6BZhz/iIrDAPJ3JQEi7Nw69z72o6vcYJcSvQ4eW4RMgg==
X-Received: by 10.28.99.137 with SMTP id x131mr1580843wmb.12.1517918420553;
	Tue, 06 Feb 2018 04:00:20 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 7sm8327657wmq.42.2018.02.06.04.00.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Feb 2018 04:00:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 11:59:52 +0000
Message-Id: <20180206115954.1780-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180206115954.1780-1-ross.burton@intel.com>
References: <20180206115954.1780-1-ross.burton@intel.com>
Subject: [PATCH 2/4] expat: remove old workaround for expat tarball
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
X-List-Received-Date: Tue, 06 Feb 2018 12:00:20 -0000

Back in 2010 the expat 2.0.1 tarball wouldn't unpack correctly with old gzip
releases (prior to 1.4).  The fix was to explicitly depend on gzip-native to use
our binary instead of the host[1].

We don't ship expat 2.0.1 anymore, and even Centos 7 ships gzip 1.5, so this
workaround can be removed.

[1] oe-core 0ff62b0462f3f64672bd4704de9a192eb1a730d1

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/expat/expat_2.2.5.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-core/expat/expat_2.2.5.bb b/meta/recipes-core/expat/expat_2.2.5.bb
index f7a5b36ac74..bce59298e5b 100644
--- a/meta/recipes-core/expat/expat_2.2.5.bb
+++ b/meta/recipes-core/expat/expat_2.2.5.bb
@@ -18,11 +18,6 @@ SRC_URI[sha256sum] = "d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d47335
 
 inherit autotools lib_package
 
-# This package uses an archive format known to have issue with some
-# versions of gzip
-DEPENDS += "pigz-native"
-do_unpack[depends] += "pigz-native:do_populate_sysroot"
-
 do_configure_prepend () {
 	rm -f ${S}/conftools/libtool.m4
 }
-- 
2.11.0



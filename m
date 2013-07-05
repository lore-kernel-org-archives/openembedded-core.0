Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 627556AFF4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:29:11 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so1162264eae.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9EsG7kTtjXjq59/47Uh1Kvob1B1oxYxWfZPzKf2oAqQ=;
	b=jFHGUdnx8Bad5pq7RMJSAME1tS316LwfAs3u2/Q+ETEvIrFTFRIb6cgCZH+j/jW1uD
	JkOtWCDk38ZQ94Posa/0M+RAL72wXPujRbRIs/MNVXSjsf73W2Rm9JHenk/sDK0a6Nzh
	6nmatZ0M9+HZKWiN2W6hQYacBzjJV7I9EnDYvkJqxI6i/nS///leh75vtXDGwOxyna23
	vW+oJXckQ7fRp76nlyP2Ftp05aeXjkMhePjR400pWOdqAYAWgZFxlyod8dUGHLJsa0hj
	lzWuKKqDI/EFpReXaEy1kraXIFPvF9GXPO/10j3+1hZXVw9yFf2XHB4GOh7cN04O/Zu1
	FEIA==
X-Received: by 10.15.31.9 with SMTP id x9mr9332794eeu.103.1372987752175;
	Thu, 04 Jul 2013 18:29:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm9654587eeh.11.2013.07.04.18.29.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:29:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:29:00 +0200
Message-Id: <f74731158fdfcc9399a32a4e1616652fad1a512d.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
References: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 8/8] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Fri, 05 Jul 2013 01:29:11 -0000

* eglibc-collateral.inc inhibits all default deps, but do_package needs
  objcopy:
  ERROR: objcopy failed with exit code 127 (cmd was
  'i586-webos-linux-objcopy' --only-keep-debug
  'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so'
  'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
  ERROR: Function failed: split_and_strip_files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index f4cb814..fc51022 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -5,6 +5,11 @@ SUMMARY = "Locale data from eglibc"
 BPN = "eglibc"
 LOCALEBASEPN = "${MLPREFIX}eglibc"
 
+# eglibc-collateral.inc inhibits all default deps, but do_package needs objcopy
+# ERROR: objcopy failed with exit code 127 (cmd was 'i586-webos-linux-objcopy' --only-keep-debug 'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so' 'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
+# ERROR: Function failed: split_and_strip_files
+DEPENDS = "virtual/${TARGET_PREFIX}binutils"
+
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
 # to decrease initial boot time and avoid localedef being killed by the OOM
-- 
1.8.2.1



Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id A35C671BF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:50 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id p6so4910168lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LrDWoqDHPP9ijJ1dnSER9ylo0OGQsHv7g5lNkHVMNt4=;
	b=IVvqF+pNjyg3Dbzin8npgEiWMrIkS2khMm1S/5vnbkGj/6iQFeQ35O6DkEu0wqC4ub
	12prfkxmlHGPOkRIEyotfp3tZ4Jf7jp2FBEa//pClAPz2ZMXWEMLdFeO5pxpY6b5vujQ
	vH8fVaZNBzWJYMN5GIiVcKZUUQ99MOx3F37eDA///9G3c5bahvv26kxMZm28h6tg05c/
	+OCVRUb5NT2U8NtTe9LNyS++j+cCfsuk4Br0bg0qX72Gwt1xXqmGxKKD/YJMNMYLHVrl
	bggQLW/9YllFvzlnLWUl9Wgdi9J68UlNneEpqeDg6NDqucaZlt3JFeHEVDYjpNgTB/1T
	uJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LrDWoqDHPP9ijJ1dnSER9ylo0OGQsHv7g5lNkHVMNt4=;
	b=uoLpe2j0EFRMaTPDifl1K6ZTmU5zCkinXk+qgdvevtILl3fMlj7fER42O3I4G7Hc9u
	7EGQs29VjFD3cwJWL0nyWqIctu7O6j5lCT8BO5CKf7QJeVGOclebj/guQWDeua4IlvKo
	K/3jRgFDxkW4j/i4DsO3mwjfEArhK36Vdcl+5uh/M3rj/bl/Gdxc8xSJdZ5rVTwaDoqh
	8rwfbNEi/QkD1w/hUx2jFNPKVRjj1UyQF2P+JVY/PuNYAg+YvJ0JOHLP7/KRwDLbqk5t
	7c9jB+VDE3JTPHjUCXZRMas6t7VwAOxZujhWFNjFxCEyojgUoBYkV4Il21y5tV6UbaNu
	YqtA==
X-Gm-Message-State: AA+aEWZDHj6XajUt7JEvmAuQ/IDS74SNJNrQwYSDb4cjsgslZe+r47rb
	nUJp+z9MfNkrsLjjZpPSxTCsMzej
X-Google-Smtp-Source: AFSGD/VLup2sH5Pa8W5vP2x+ympzFfX7tLk+v/z0YgR5J9QcrrlK3tV8frqub3/Vxzm5JRQJPdsIXg==
X-Received: by 2002:a19:4345:: with SMTP id m5mr2328728lfj.142.1544810150990; 
	Fri, 14 Dec 2018 09:55:50 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:50 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:37 +0200
Message-Id: <1544810082-22164-9-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 08/13] openssl: Skip assembler optimized code for powerpc64 with musl
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:51 -0000

This code is written for elfv1 ABI in mind and linked as such: disable
all optimizations at the moment when building for powerpc64 with musl.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb | 1 +
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
index 6518dac..9d67053 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
@@ -81,6 +81,7 @@ CCACHE = ""
 
 TERMIO ?= "-DTERMIO"
 TERMIO_libc-musl = "-DTERMIOS"
+EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
 
 CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
          ${TERMIO} ${CFLAGS} -Wall"
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 042e023..5c4e69c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -35,6 +35,7 @@ do_configure[cleandirs] = "${B}"
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
 EXTRA_OECONF_append_libc-musl = " no-async"
+EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
 
 # This prevents openssl from using getrandom() which is not available on older glibc versions
 # (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-- 
2.7.4



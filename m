Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 26FB97F7BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:29 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id b137so16998507pga.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RhEKAWNY5AMIZkoBv4P+Bp6zOPX9pfwGk+x6ueE9Va8=;
	b=M5e0uqPlxtfFkpaSUd+d4/nfsKjvdklm3sLRLQ6z3slcMjVYKDhpgrz7Yex4eTZpFw
	MRkUPnSxGboMI7OJlFdnVU7I7XcYP8rCXhWrXgHhu39UEi1TBNKJUCKhLXtCqaIvpMSf
	lv7dJo1iXWrWBdJfs8rZpUBkwQvK4SzJf/R2A/9EkWS5rWwrES7bwigIvE8qoOfLIfic
	I424XDHyqENOf/PYlUerPljA+qMWWFwgnYyndH3vleLHcvCPJnqJmj85dNRaBO5oimB/
	LuQdnNFD4NDfd9CCOrwSIcbfg+P6zrcGD+kn1mZXzDaXJzixMxzIsas5VWpMBKho47FA
	k7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RhEKAWNY5AMIZkoBv4P+Bp6zOPX9pfwGk+x6ueE9Va8=;
	b=BEGtClkMZopbQOqCGySQGm7Exn+LS+gIBN86yKavNyN5ikyRcIjwZRbbzESILP2bht
	flXx1PNY54MhqZWNNUS0qShYNklMca2Fh8CaYFDftjWA1Ff1RshNCQQEpjd7B+S6Emn6
	jgMvYLG6xmGAJ5TXEEXi32sAsweU4UKXmfKvfULUpoaegBMd73lsq0JW+v3bxYagOFHM
	JvE1FBPOFfQNHtJ5Uc6dX8N+KVaHQpB6G67cdafNt6bCRC8+0smFH2BTokLSRvZ8ZIyk
	2eHl19xK040Wxp9Z3RHcubmlsYOfa9QCI8dWfkY8we6j0mPyAoAUCIzjLBBdY1dgV8Tl
	4zMw==
X-Gm-Message-State: APjAAAWM4FFJmc1K+ipQEWemPa6LdGCRrUDMWH4uoSjnzrkjnw7gdz1q
	QQ0DvIXfJvG1CZNEzUtBYi5bFr03WNY=
X-Google-Smtp-Source: APXvYqzwacionnJ5OqnY4g4YGBLVb0NMmTxRg7psEA7JJLjkHZ/Lu4cXPjPnhmXx7xYx7pQzUUn7AA==
X-Received: by 2002:a62:1944:: with SMTP id 65mr69228425pfz.151.1577645069869; 
	Sun, 29 Dec 2019 10:44:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:43:57 -0800
Message-Id: <20191229184415.19514-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 01/19] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:29 -0000
Content-Transfer-Encoding: 8bit

Use PCRE, this enables using posix extended Regexps on cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1fa82363b1..8262217fc1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -106,6 +106,7 @@ EXTRA_OECONF_append_class-target = " --enable-setpriv"
 EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
 EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
 
+PACKAGECONFIG ?= "pcre2"
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 # inherit manpages requires this to be present, however util-linux does not have 
 # configuration options, and installs manpages always
@@ -117,6 +118,8 @@ PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_s
 PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+# PCRE support in hardlink
+PACKAGECONFIG[pcre2] = ",,libpcre2"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
-- 
2.24.1



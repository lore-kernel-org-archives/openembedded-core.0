Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1D675A31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:59 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id uo6so404044665pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=f3R2YLlcW8GLz9LSqS7Zh8ZeZdHouNkfbKxX91cGTJA=;
	b=qFlVCiUT+K+8Sc2JMkVfGXZ/M7CCdJR9759nlsaNKIRFC8LOyOjnOnAqcfSP88n3zv
	A7YC9Z0K14+XEQpd47fIlEupa2zwUF22GjSeyvjdK4foEM4eWFVpMxaUcXT7If1zynTp
	d/lQ9l6m1DARufVV14eDgp+qrlQ37xPTikCWhyKRnkhI+Yb4afcPRilQMgQk4BCf8fq3
	cSqqwQ1Vi/knTiXRMD3/xwI/e0k+7vohtcWjZSKREKmYY8JRlahEMXAZOJapiMBwhyZN
	PSsRfedkoE38D8GH3UABwgEznpe4wP9JKLm4ifBEWVVY2g9Hxc5ERA7ElDZstnrR8VQ9
	1Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=f3R2YLlcW8GLz9LSqS7Zh8ZeZdHouNkfbKxX91cGTJA=;
	b=fmY/oIz3N969+PR4F6lt7Ni2S6VVk9RIXVk2QbHS0ElnjGGNIB33jYsoxW1+NwEVml
	fLWKWsR4a5q6XUQ81+UJtmYuIzUjC9DM/rsioWhj2hwRpmQKzj9oy1RJeXOkkG5Q2l5s
	+CSk5qX7cmu8oAQ7+DBNs4b+koS+ueIQarrEEvPhdD+i2dC8+ezbIyBtziGvaJnSnfgZ
	UYfmMOmgnRii9lhJyrRUwGW3aUcptHrUpgpxRgbitVizgq6471CjNvX4Dgywu/ea0TfO
	NiR+FIA6C9S7ACuTO/D+wo0bxItBq2fdMzMfZuNy/fdRPMyKNrz4hyH5ZnxyGJHVUmin
	Nm4Q==
X-Gm-Message-State: ALoCoQlrunr96fbLgxQtAW1AbbSW9AxXdsPnDDoZ1FYSQw7AJunnIvNMJnWqGpIrP4PN4cO5CalvWP8T2QKoo7Mwnnw0PZqGog==
X-Received: by 10.66.177.193 with SMTP id cs1mr28641733pac.132.1453030680565; 
	Sun, 17 Jan 2016 03:38:00 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:38:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:40 -0800
Message-Id: <5608b3b10fe2c4561d01f0fbc7e37b7fd0ebf269.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 67/73] gpgme: Define __error_t_defined on musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:59 -0000

Configure looks for error_t in errno.h and musl does not define error_t
if its not defined then configure emits a definition to be used, now we
also use standalone argp implementation from glibc on musl based systems
which defines this in argp.h as well so now we have it defined twice
and errors like

|
/a/builder/mnt/build-oe/tmp-musl/sysroots/raspberrypi2/usr/include/argp.h:40:13:
error: cannot combine with previous 'int' declaration specifier
| typedef int error_t;
|             ^
| ../config.h:257:17: note: expanded from macro 'error_t'
| #define error_t int
|                 ^
| 1 error generated.

are seen. argp.h definition is conditional on __error_t_defined which is
true here so lets define it on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.5.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gpgme/gpgme_1.5.4.bb b/meta/recipes-support/gpgme/gpgme_1.5.4.bb
index 1598377..f2211f1 100644
--- a/meta/recipes-support/gpgme/gpgme_1.5.4.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.5.4.bb
@@ -27,6 +27,7 @@ PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
 FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
 
+CFLAGS_append_libc-musl = " -D__error_t_defined "
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/gpg-error.m4
-- 
2.7.0



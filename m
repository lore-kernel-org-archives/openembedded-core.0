Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 62A4860F3D
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:20 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m13so3102449pjb.2
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5s29XuWpVCzzvMgTnnYXKOkwiM7MCDsNC2wxZHCGkrk=;
	b=J0M/BZcUC9XAkEqpoy83Rj3hxsHNHeJ1ouLxI0UZjzWPNQ6H4h5ZUFdsRjXmv/uBCs
	jqaS0J/wbSbilbF+PEZkYpiiqySbSEgDh1Sgc3Nky0bHSwU9h35dE+bkLERf9b2peo3s
	suAFaeBoZn/xvYBBqSvnhcI5hBH+aKG0gK1QMO58luWk2oLicphx4bUfmehektvgGtyO
	5zDIrAEFpVecz75pxA6K1Xz5O34gJQYUL38r281YWV1AfoOGVdAlqreTT031N3muNCuE
	NKcAnfxIcnb8LeqYPY3BuDQn+iQWQxR99FAXVlmvuGaG2L+g0KqgQK2uFJQg05P6/A0d
	Q4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5s29XuWpVCzzvMgTnnYXKOkwiM7MCDsNC2wxZHCGkrk=;
	b=h/JhTFGebY7W7hMhxJ+e+VDlOCYBXGMlV+EmDGBgMXbrQUkofF67MGsn1AauIs1gmf
	mod2FeaLCtV7TEFr9PcmJvGqEyN0yLkhq+dsst/J3GmjDxWnJgnAl7PElrOeNKXQv1OF
	fL/pQ+PRLjO+mEZeQ+KuMDqC1bRbvwZQxrViHr+YB0aXqnQUmoWN6KxNM8U5QFfnIanm
	e0RkwvrUFjKo5qGST6zyZrJsC9jJJPIUvuehfG1gHwr1XJsESX5xqXMC/1pq/GtFgFQ1
	uFgTnG2VPgEvqjJWIm7fp6V6lGGuk4N7IxBC6KD6dR30mQOdLj9TrEOcAaUzsAU9dHl9
	ZCzA==
X-Gm-Message-State: APjAAAX9p2EySgIWhduahGxFfY6FnTbSWSPGETk28E/DZVfddsbmkjr9
	KLN3xbGmEVO7sqLTGYxoqDAkwW6m
X-Google-Smtp-Source: APXvYqwEMN1KMEide/liFuer1AjI/WpSqF6SjIyi0H5xBNzh8ysSuVX/B9RKWvkGE4REZtpYIsTO1Q==
X-Received: by 2002:a17:902:504:: with SMTP id 4mr8051134plf.276.1581264621303;
	Sun, 09 Feb 2020 08:10:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.20
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:50 -0800
Message-Id: <499694d329221008111fa86dca0a0957f549b880.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 22/29] openssl: Fix reproducibility issue
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There was a build architecture leaking into the target ptest which
could vary depending upon host. Remove it as its cosmetic.

[YOCTO #13770]

(From OE-Core rev: 37db519eedb7eb5cd4f14d05f30f5d580aa7458d)

(From OE-Core rev: c31c676319812e6fc036741db2ab8e16eccff723)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/openssl/reproducible.patch        | 32 +++++++++++++++++++
 .../openssl/openssl_1.1.1d.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducible.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducible.patch b/meta/recipes-connectivity/openssl/openssl/reproducible.patch
new file mode 100644
index 0000000000..a24260c95d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/reproducible.patch
@@ -0,0 +1,32 @@
+The value for perl_archname can vary depending on the host, e.g. 
+x86_64-linux-gnu-thread-multi or x86_64-linux-thread-multi which
+makes the ptest package non-reproducible. Its unused other than 
+these references so drop it.
+
+RP 2020/2/6
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: openssl-1.1.1d/Configure
+===================================================================
+--- openssl-1.1.1d.orig/Configure
++++ openssl-1.1.1d/Configure
+@@ -286,7 +286,7 @@ if (defined env($local_config_envname))
+ # Save away perl command information
+ $config{perl_cmd} = $^X;
+ $config{perl_version} = $Config{version};
+-$config{perl_archname} = $Config{archname};
++#$config{perl_archname} = $Config{archname};
+ 
+ $config{prefix}="";
+ $config{openssldir}="";
+@@ -2517,7 +2517,7 @@ _____
+                           @{$config{perlargv}}), "\n";
+         print "\nPerl information:\n\n";
+         print '    ',$config{perl_cmd},"\n";
+-        print '    ',$config{perl_version},' for ',$config{perl_archname},"\n";
++        print '    ',$config{perl_version},"\n";
+     }
+     if ($dump || $options) {
+         my $longest = 0;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 458ae7daf4..169824a8be 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://CVE-2019-1551.patch \
+           file://reproducible.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.17.1



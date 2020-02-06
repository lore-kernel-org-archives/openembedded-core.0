Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 126FB60B06
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 22:48:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so363194wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 14:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GahCMAbm23vrGX1hySF7tzhlZ7djTUmGWyrAGVVKoIo=;
	b=L78EgaVwieRIQn4xLHnGt/wgdP/vj4X6wJcVt/mB6XInyShx59Fl/frfWEiH37g164
	6/IKvL95UZSnGVmLAhGNG/P/PZwK/HQSt1KqY2xOUAi1pxv3LlvcB+sO/sSOOaspJmZj
	G5R6qoCGePs2UwV3jD8Zcz/mmtrn5r9a01Abg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GahCMAbm23vrGX1hySF7tzhlZ7djTUmGWyrAGVVKoIo=;
	b=TD8TSZiFoJG1FqQIbj793oV2/6d613cic33Du8bLhpIfD1z95gW5gnb5mxV3gBQE6h
	k5lpfBUK4OSw0TuKPfh43Zn0grDMOzMXSSuVFJ1TdPXH+cgou8oJiu9G6KsHro0Xh0JM
	zWBMeAV0ptaDaL+deC59OclcAln+dVp697si7mMG6CeqqSMyUW4ldO+57WiPO7JgsaLv
	TOXhM5mJbp2jbfy8eB6zEuKxgX7B1rMvUwp6vE1q+4i4+Q4TuyzfIOlr/T/x6WopCaiH
	HbBScEKPAKT27mEb++iFnjqeS2nzVkxfTzE6NNl5V5oaS10Na4XPXI/rwzP+yeWccF3z
	W9ig==
X-Gm-Message-State: APjAAAWZlchmK3kL25wFOwIvhcTKR8r1XLiAlT+faps8sbX1bTiWksGn
	p0m66A0PK9mWsgkcj5DH4iyLqAwJYHI=
X-Google-Smtp-Source: APXvYqwcUXPW41Cgw8V1Mta9xuPZtOlNhuQzykYSKjmc/2LzzP3ZvXqPXeRL2eKfYIOozhV51eBAVA==
X-Received: by 2002:adf:f103:: with SMTP id r3mr240557wro.295.1581029331192;
	Thu, 06 Feb 2020 14:48:51 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z3sm898181wrs.32.2020.02.06.14.48.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 14:48:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2020 22:48:49 +0000
Message-Id: <20200206224849.17737-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] openssl: Fix reproducibility issue
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
X-List-Received-Date: Thu, 06 Feb 2020 22:48:51 -0000
Content-Transfer-Encoding: 8bit

There was a build architecture leaking into the target ptest which
could vary depending upon host. Remove it as its cosmetic.

[YOCTO #13770]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl/reproducible.patch        | 32 +++++++++++++++++++
 .../openssl/openssl_1.1.1d.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducible.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducible.patch b/meta/recipes-connectivity/openssl/openssl/reproducible.patch
new file mode 100644
index 00000000000..a24260c95d0
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
index 7fd0f9a269c..c2ba005f47f 100644
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
2.20.1



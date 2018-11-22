Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8F166C5BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 14:05:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p2-v6so9210684wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 06:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1eaMLy/OvgJ/fjKWzv8e3CQRjkMkjWcKtUjDDHTCGr0=;
	b=fCPz/+bZRIROlYqg2XEgwcJXk6O1vzgBHHB0/pS6GvRdaqxMZRbiPyoeiGHepCatwK
	7U/E1iQtOmAdXoRox/kasmp2hwmRaxWZ9f78QUqIXssd5/bemMtEcvA4HFULH5t1C9ms
	rXhSgyJpfO0UQ5zU/mambxjJtE/CURrNP1jjB3DBra6E5Ihw6otms02vCZP65TrvAwKm
	B3GhL/sv0M/qIHjcCLnxwS7rCJyCwc0EgJc0dUUSwA1MWrUYUv4fEX+VstZnTRXeOVaM
	yRQK+7vBacyvteeK5ImYxXOlX7ZOiV/5/WeLNZ63nNbAmkMcdglpRWe2rHnHvrA6riCy
	rq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1eaMLy/OvgJ/fjKWzv8e3CQRjkMkjWcKtUjDDHTCGr0=;
	b=XDt8DmOn6FvoAqAPHsONthoXrhUE0f7giGPeM/AznujVGfDpzGwQ+gix0PY7eqqzqQ
	NMHMIXWs2L7uWpFHigYF8UIHZbI/FopL/LpZl1/xLVRePoSOXq4Q7yv84JzzL4PfdUVO
	5hehLJ6nIaOo4GYb6ff9/6GNjyNfH/ENG8euSJ5U++bTM/vz+jzGafObe3+haD6pkGJb
	H/5+TeLm+y04WUe73YCHBUZvUBTWTWcrfza1rkVjdiZ3m+pvGtdVA2lZU6Xs/683jD44
	WVC6CrzlBSIV73JW9GOOHW0MiL09TjVHxf7yvL5cwb66q9Yenvzkid6f8viLM1hQyuTh
	Mtzw==
X-Gm-Message-State: AGRZ1gJW0KeJ4nrCwiJsHD07IVj6npmDNHXIimLItEgvSK4WgLX1bfzk
	jt+Lx1JREnwsFl5fUSJQhFjBuqXSZvY=
X-Google-Smtp-Source: AJdET5f+3LtXWQEi1V51br535NFMIiFbqMvhM4ztbZiCs9+6Fe+VuyAGFHhNo031FgXBQUCIZ8gfpA==
X-Received: by 2002:a1c:ac85:: with SMTP id v127mr8910898wme.62.1542895522043; 
	Thu, 22 Nov 2018 06:05:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 133sm2318362wme.9.2018.11.22.06.05.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 06:05:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 14:05:16 +0000
Message-Id: <20181122140516.10420-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181122140516.10420-1-ross.burton@intel.com>
References: <20181122140516.10420-1-ross.burton@intel.com>
Subject: [PATCH 2/2] openssl: don't disable the AFALG engine based on host kernel
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
X-List-Received-Date: Thu, 22 Nov 2018 14:05:22 -0000

Whether the AFALG engine (use of hardware crypto via AF_ALG) is enable or
disable depends on whether the host kernel is 4.1 or above, which has no bearing
on whether the target system supports it.

Remove the complicated logic and simply enable/disable as requested.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../openssl/openssl/afalg.patch                    | 31 ++++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/afalg.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
new file mode 100644
index 00000000000..7c4b084f3df
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/afalg.patch
@@ -0,0 +1,31 @@
+Don't refuse to build afalgeng if cross-compiling or the host kernel is too old.
+
+Upstream-Status: Submitted [hhttps://github.com/openssl/openssl/pull/7688]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Configure b/Configure
+index 3baa8ce..9ef52ed 100755
+--- a/Configure
++++ b/Configure
+@@ -1550,20 +1550,7 @@ unless ($disabled{"crypto-mdebug-backtrace"})
+ unless ($disabled{afalgeng}) {
+     $config{afalgeng}="";
+     if (grep { $_ eq 'afalgeng' } @{$target{enable}}) {
+-        my $minver = 4*10000 + 1*100 + 0;
+-        if ($config{CROSS_COMPILE} eq "") {
+-            my $verstr = `uname -r`;
+-            my ($ma, $mi1, $mi2) = split("\\.", $verstr);
+-            ($mi2) = $mi2 =~ /(\d+)/;
+-            my $ver = $ma*10000 + $mi1*100 + $mi2;
+-            if ($ver < $minver) {
+-                $disabled{afalgeng} = "too-old-kernel";
+-            } else {
+-                push @{$config{engdirs}}, "afalg";
+-            }
+-        } else {
+-            $disabled{afalgeng} = "cross-compiling";
+-        }
++        push @{$config{engdirs}}, "afalg";
+     } else {
+         $disabled{afalgeng}  = "not-linux";
+     }
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 8d5d4b146e7..5d19910941e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0002-fix-CVE-2018-0734.patch \
            file://0003-fix-CVE-2018-0735.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
+           file://afalg.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.11.0



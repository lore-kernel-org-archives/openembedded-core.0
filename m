Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.6526.1601504065904487133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=06xegRLi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id m34so2106991pgl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ny3CoK0gu6TQpRFfLLEgBZ47Pl8g5KbzNggo0XqSASc=;
        b=06xegRLi3llZpsVCxs2y1n6OrHs4syDYqNXH054HQxYRPoNnRW8T0bKBfT3J9mIRhQ
         xa3Qc+dFjmJP93eRAbA1mpj6QkQqcvQ1CSYXbXE9zojhuxM12qsttGtq0aHbH87V1Q9H
         ATBiPhmvi1next0l+uf1infytfkBUq25y1NJiGbtEtAHCA6Owy6iA9pgZKVrOPbyxz/2
         Pk+tMoFvCeTyrgdeFgFtFAB5GjBBzr4sSiDPpfVJhgCdRl8U9x12FvruWr7+AIzMviDW
         DLDB2NKAMGfj4E1gvReFlA1C4HRMHRQZyUV2tUqhFj/Tnh6zKN5v1fgtD0Ke0KE2pqPu
         FGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ny3CoK0gu6TQpRFfLLEgBZ47Pl8g5KbzNggo0XqSASc=;
        b=IvejRIXv9LoPePvaCUpyHWUoJDRu+oxy/gQo1nfs7HmTf0n9jgpJmZmoubRCmr9LbL
         HyG6lavBaYVYgT9JTgxKmX/Dktv+sYzh1676eVHM9iAlK9f7gAkgtDIks5BD9DrKh9c5
         AthsnKhQ5KgOn76m+yDc7sjmvjO5BzS0NxkQUdjDlSY3A3/wEg2Nf+ftnU9JyUtBBStc
         Amo4fIoB2gWYQe9nW+tzPfjirccZSDRvt5o69eC1cMptufunKuN8EDZYDbMu49DrN1PZ
         SLzd4mE0m7clHqxFm839z1BCuVnRX2IM/CZCgqef/XTSpOaWVCDQXb/oBU8OM4qH+PAm
         7oPA==
X-Gm-Message-State: AOAM530HhmLTYzCEiWsb8vcf0I4FtKySbCPSrmwdYR0BQzejHiEq4Y7c
	Afs7OeHZYFAG9hSaZXUjMTyR5d8AV2Hh8rzGH1U=
X-Google-Smtp-Source: ABdhPJyvAdBjqXefSDSwn/Tk78za5LZi5648FZ96VC0VDOKJDsO5OdDXGiwlNVmvnECv3SMgeckKpQ==
X-Received: by 2002:a63:5c19:: with SMTP id q25mr3587506pgb.17.1601504065026;
        Wed, 30 Sep 2020 15:14:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:14:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/41] buildtools: Handle generic environment setup injection
Date: Wed, 30 Sep 2020 12:11:24 -1000
Message-Id: <b62ced32772d21c689998c5995f31550db51466d.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently buildtools has its own hacked environment setup. We added
capability for generic script fragements but this code was never updated
to use it even if several components it contains needs it.

Remove a hardcoded variable in favour of the generic scripts to
avoid bugs in this area in future. The others should probably be
migrated to environment files in future too but there isn't such
a file for those at present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb210cee4bd71614dd108027e6d5aa8f8d451b27)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 77e1fa23cb..44d658687d 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -67,16 +67,19 @@ create_sdk_files_append () {
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
 	touch $script
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
-	# In order for the self-extraction script to correctly extract and set up things,
-	# we need a 'OECORE_NATIVE_SYSROOT=xxx' line in environment setup script.
-	# However, buildtools-tarball is inherently a tool set instead of a fully functional SDK,
-	# so instead of exporting the variable, we use a comment here.
-	echo '#OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
-
+	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
+
+	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
+
+	cat >> $script <<EOF
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
+	for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
+		. \$envfile
+	done
+fi
+EOF
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
 	echo '${SDKPATHNATIVE}${libdir}
-- 
2.17.1


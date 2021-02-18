Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.34.1613667414375642829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QK16zKWJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id o15so4372085wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d4cCb0pFBF0blK86V4My36Nnae2n92fKqNGSGGumtVI=;
        b=QK16zKWJqO5o0B8my5isulp2jaORiBlIvyVeqk0dPl+AgdxPnJot3axZaPd3YUZuPH
         iq3bagshjge/irFiMl+8SVRG1VKXrQMBaXEgOkRtIvw2d3bd+k2pTEwU2sAVHMorKyhe
         Y6PJ5S/I2PsOQtokb3Bz1JM5PqF22kOSE6bxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d4cCb0pFBF0blK86V4My36Nnae2n92fKqNGSGGumtVI=;
        b=ICnrEedRso/D224geezlA+zubjZ/zqvKLaDn295O816eapWiHrSxLHy81gvcmRlJO3
         w8vQqFhfLmc9LeJNQ9vnVIiB08bI/4EtBs095H8yL8f+3MBAbZeBLRvKe76x+UXJT5so
         M5iSb4YG/f036Ps3rcdUzLGlvKpY1QATD/oZbHaD/ycJ/7TUouRHmX0irY8hFKI8ZNOz
         eLXnAtPFdIS8kR7qz3X6nX3TCf+Bql+ek5aFqg+OGd55w0dU+XPkQpzvlkZrzSY+VdwG
         /GeSj/15/chX3iKRAff3UCvZx3O5UBNDXaEItnOQSASDx7M6u1+pF4xZnWWFbEJ1N3qs
         nTWQ==
X-Gm-Message-State: AOAM532VGftw8zTVzJlA2MqTHR0KvgefQ4vQMIrlSauR2rvwaOl5oEpj
	ddObe6QONIbuWBc0Pwpebj/Z56q6FypS8Q==
X-Google-Smtp-Source: ABdhPJyq2+mijGcwqR3ICTXA4ZadBjOf7QGFKqfj2kWCUtuZ0Z/IvQ7VCcD3XiRLql09S2Pr+0zdDg==
X-Received: by 2002:a05:600c:414a:: with SMTP id h10mr4472544wmm.144.1613667412697;
        Thu, 18 Feb 2021 08:56:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:52 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] git: Fix determnism issue
Date: Thu, 18 Feb 2021 16:56:46 +0000
Message-Id: <20210218165646.2109894-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/git/git.inc           |  3 +-
 meta/recipes-devtools/git/git/fixsort.patch | 31 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/git/fixsort.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 544e23c844a..586a305b278 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -7,7 +7,8 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           file://fixsort.patch"
 
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
new file mode 100644
index 00000000000..07a487e8ca6
--- /dev/null
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -0,0 +1,31 @@
+[PATCH] generate-configlist.sh: Fix determinism issue
+
+Currently git binaries are not entirely reproducible, at least partly 
+due to config-list.h differing in order depending on the system's
+locale settings. Under different locales, the entries:
+
+"sendemail.identity",
+"sendemail.<identity>.*",
+
+would differ in order for example and this leads to differences in 
+the debug symbols for the binaries.
+
+This can be fixed by specifying the C locale for the sort in the
+shell script generating the header.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
+
+Index: git-2.30.0/generate-configlist.sh
+===================================================================
+--- git-2.30.0.orig/generate-configlist.sh
++++ git-2.30.0/generate-configlist.sh
+@@ -9,7 +9,7 @@ static const char *config_name_list[] =
+ EOF
+ 	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
+ 	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
+-	sort |
++	LC_ALL=C sort |
+ 	sed 's/^.*$/	"&",/'
+ 	cat <<EOF
+ 	NULL,
-- 
2.27.0


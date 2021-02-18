Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.1686.1613676138357437398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jum/bxWq;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: jatedev@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id e15so2229183qte.9
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 11:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e5d6mCgOTpe8/wyoaMsloCjppqUvxxSIGfXYe0xTO6Y=;
        b=Jum/bxWqTv52EpLYswTcC9FqKxY5giDNzAkfMMh8pf6CSFK0wK4p/cnWYxpTd8OHNV
         18IeFzpLPfHmqeZOJxyb1ApeNIyf7iFGoaWA5gyi0nrTzMMAGdM6i6X/OsFP+QMwqMtY
         69PBtRI//Jt+MhRpoexaQWfAvsXcAvvud4sMno83dCZCmdIN3dDrVjIX7G5zEU+JQ3yP
         1p8F71kaS6OuCf3N6I4QbHzmdbTZWddv4+WJTGMiXptDJlrI52iBHeZagTaYfB8CnVQo
         /C+BjYH9kQM8Mtl8va6OxSM/Ca8jC/eh9xkWTO3qbZLrRIvkdyl08dS1ZQ+09jD/fH4J
         NqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e5d6mCgOTpe8/wyoaMsloCjppqUvxxSIGfXYe0xTO6Y=;
        b=C4OLi60qS3WIV22G3tSfYzRr3VxBlnSS7JUaays519DafnJQ2UY9/XP4xEvdwRlEBA
         f9CBnBIwDgGf6eVmHEkq+nrNj5DclJ+Me/fDUKwACZcwF0MTm7iohOn6EhqztWk+o05s
         Q+gQrN1Kh3GrNGTX0WyLlBJTtCaGbew29lNtdUBY79gUDMVEd3/HfMJRPDM3vBytMuKB
         rKjLdCQX1UdEJuj4RrsXZ8hsBF3i/fErJLlFi/dP1+1xvAoBIpqF0qSbkUEmeZ5kFNmu
         zZXdyu80IBfZhFzN7WGn3qIqu3MJnJen0lRu3htWFUNINXphrusu3f8uoFV1g2xFVmwI
         h7bQ==
X-Gm-Message-State: AOAM530RtFtrfXbDPe9tyPnJuzPWnUIAwHHrirIYwyoNLbRq3gtBa1FP
	hsp4f4JBoqTSI/hlJ/yav1priI6ZaTA=
X-Google-Smtp-Source: ABdhPJziynD8jkT6MnaIMLBn7/pX5Abdu0S+q/vk+BGtObYBZere1ph7KTZ0OVEABEmW8pXIzan6tg==
X-Received: by 2002:ac8:1c6a:: with SMTP id j39mr5909925qtk.326.1613676137281;
        Thu, 18 Feb 2021 11:22:17 -0800 (PST)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id l12sm2674438qtv.41.2021.02.18.11.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 11:22:16 -0800 (PST)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH v2 2/2] iputils: Use STAGING_DIR_NATIVE for setcap detection
Date: Thu, 18 Feb 2021 19:21:38 +0000
Message-Id: <20210218192138.39449-2-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218192138.39449-1-jatedev@gmail.com>
References: <20210218192138.39449-1-jatedev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Search for setcap in STAGING_DIR_NATIVE to avoid host contamination. Add
DEPENDS for libcap-native to supply this if we select libcap for
PACKAGECONFIG.

The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
/bin/ping and other executables.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 ...ort-for-setcap-in-STAGING_DIR_NATIVE.patch | 39 +++++++++++++++++++
 .../iputils/iputils_s20200821.bb              |  5 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch b/meta/recipes-extended/iputils/iputils/0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch
new file mode 100644
index 0000000000..fcd60fa673
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch
@@ -0,0 +1,39 @@
+From 701d390a6cdd9f1ff201b315400d4a32e990a2c8 Mon Sep 17 00:00:00 2001
+From: Jate Sujjavanich <jatedev@gmail.com>
+Date: Wed, 17 Feb 2021 02:13:34 +0000
+Subject: [PATCH] Add support for setcap in STAGING_DIR_NATIVE
+
+Upstream-Status: Pending
+---
+ meson.build       | 3 ++-
+ meson_options.txt | 3 +++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index aff75a2..f2babbc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -215,7 +215,8 @@ config_h = configure_file(
+ 	output : 'config.h',
+ 	configuration : conf)
+ 
+-setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
++stagingdirnative = get_option('stagingdirnative')
++setcap = find_program(stagingdirnative + '/usr/sbin/setcap', stagingdirnative + '/sbin/setcap', required : false)
+ if cap_dep.found() and setcap.found()
+ 	perm_type = 'caps'
+ 	setcap_path = setcap.path()
+diff --git a/meson_options.txt b/meson_options.txt
+index aade675..418e004 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -66,3 +66,6 @@ option('systemdunitdir', type: 'string', value: '',
+ 
+ option('USE_GETTEXT', type: 'boolean', value: true,
+ 	description: 'Enable I18N')
++
++option('stagingdirnative', type: 'string', value: '',
++	description: 'Directory for native binaries')
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 8b63a23c61..feb97d5086 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch \
            "
 SRCREV = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
 
@@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
 PACKAGECONFIG ??= "libcap rarpd \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
+PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap libcap-native"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
 PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
@@ -38,7 +39,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-EXTRA_OEMESON += "--prefix=${root_prefix}/"
+EXTRA_OEMESON += "--prefix=${root_prefix}/ -Dstagingdirnative=${STAGING_DIR_NATIVE}"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.25.1


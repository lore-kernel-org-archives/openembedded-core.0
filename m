Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.12312.1613757224848904052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cdsYbwRR;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: jatedev@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id s12so2344356qvq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3rOBKxV4OFolikk3EWZjxhO8lY1MX9z5ymMRAL4AVlc=;
        b=cdsYbwRRZCbFkyhb098Ia3RqcF+grdpmA6I8zAcdyNkWLx92bM6DbI9cSmD/G27vXE
         39iJHtM+YTXwZE1hK60RIUYqoiztIbSDEWM4TSf1pjCpj+L4I92ztrvYY8JafhCx1Q2i
         802ivE7dn3qPufg2J/pfknAUNj6ZSgA6UWwUG0aK5XDLVJ3HRn2S8lv5fjcCCJm//LHr
         HQYr7dXfivy2kcLLOdJjWbD60ECA6fjL7ep61eZl7vkBTo1W3uampCXGUKz2LzzsrMDW
         sghe0QAPhhVUBkGT4Fw4OHlOPblFNaX5RfZPDSL0gmBw9QIpbYi3kFGS4IBXvhGeSy7b
         uhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3rOBKxV4OFolikk3EWZjxhO8lY1MX9z5ymMRAL4AVlc=;
        b=o2VsmaBmlI5RW4VWN7LHkKsguHaPglkqbhT6oOCK3CcTxqg7IOgiUbncDlSCx3pXNF
         SCfbOP5kj65o1dCy9oufClVAjZMIwvReQXm2gKtLJ6odV/u2Ggjp3HbH26pP7SoX5xAp
         WUH6l/8QqKHiZYF7e4XpCWz2lu+Fs/EqmkVAzKPm35biIID1vWuTPOXmFiSv1Z4K6F2b
         X0bhehzWPI9WIUT776vAt4xzHEvLpkw6k4glzcTUn8HJVGbAPB41bUWjKOCt6PxL3dhr
         ur06ajYWXGQu9CQfKK6yALfODw5K0Tkoog0gNdlTKFcQ2bkZKjSGNNbBss23r95mjkfV
         LNJg==
X-Gm-Message-State: AOAM533qIRWJovWidmWyf/KMTmdID93SCTOd7Z8PhO11EtS1VERoWDmt
	L8jPA4NXAgQtCiVx9NK+WhQAaxRWAAiygA==
X-Google-Smtp-Source: ABdhPJzWP93Z4L5CXKKVhpt6rL7rCo+b5xTE/lNzVEc3VoOn02iGoCWIzArDK1bCYruwUJ1Rh868HA==
X-Received: by 2002:a05:6214:a8a:: with SMTP id ev10mr10469663qvb.39.1613757223749;
        Fri, 19 Feb 2021 09:53:43 -0800 (PST)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id a16sm5659694qta.69.2021.02.19.09.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:53:43 -0800 (PST)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	quaresma.jose@gmail.com
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
Date: Fri, 19 Feb 2021 17:53:07 +0000
Message-Id: <20210219175307.46218-2-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219175307.46218-1-jatedev@gmail.com>
References: <20210219175307.46218-1-jatedev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limit setcap search to PATH for cross builds preventing host
contamination. Add DEPENDS for libcap-native to supply this for
PACKAGECONFIG libcap.

The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
/bin/ping and other executables.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 ...tcap-search-to-PATH-for-cross-builds.patch | 33 +++++++++++++++++++
 .../iputils/iputils_s20200821.bb              |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
new file mode 100644
index 0000000000..b09cdb5f13
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-for-cross-builds.patch
@@ -0,0 +1,33 @@
+From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 2001
+From: Jate Sujjavanich <jatedev@gmail.com>
+Date: Thu, 18 Feb 2021 21:35:03 -0500
+Subject: [PATCH] Limit setcap search to PATH for cross builds
+
+Upstream-Status: Pending
+---
+ meson.build | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index aff75a2..16bbfb6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -215,7 +215,14 @@ config_h = configure_file(
+ 	output : 'config.h',
+ 	configuration : conf)
+ 
+-setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
++if meson.is_cross_build()
++	message('limit setcap search to PATH')
++	path_setcap = ['setcap']
++else
++	message('search for setcap in PATH and admin dirs')
++	path_setcap = ['setcap', '/usr/sbin/setcap', '/sbin/setcap']
++endif
++setcap = find_program(path_setcap, required : false)
+ if cap_dep.found() and setcap.found()
+ 	perm_type = 'caps'
+ 	setcap_path = setcap.path()
+-- 
+2.30.0
+
diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 8b63a23c61..31fe1acdaf 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://0001-Limit-setcap-search-to-PATH-for-cross-builds.patch \
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
-- 
2.25.1


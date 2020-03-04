Return-Path: <jpuhlman@gmail.com>
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
	[209.85.167.169])
	by mail.openembedded.org (Postfix) with ESMTP id D8AC26188E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 00:24:12 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id p125so272169oif.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 16:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=WjBWeFvAFfQJzJVq4wGjllcik5wzuol6a3SIgMOmdGc=;
	b=jpbtD2JWJoWQre1XPDyd6P/NeMdbNdqmzJzQ/Oeeaq7vqz4BL+/kviVHyDuU3ULHRT
	B9VkA12ljSIObEp7YBYoGzXIjPgKB450Y5bMc6GT5lisa+OwGURdM+Me8NrlVh8iaG0r
	z/qasBll48Suj63pkRWgeaUl7IauF1JFC0mgGvMGmbvcIlCCH58sR42s6GVDLu+crDPJ
	BNA2hM7ncqYoAE+l/YWlxXd3rqLPSy6p8yGHVyrrAdmMJycMqtz6WsgMggx9rBCdLRp7
	bMI7uaFpUQjPJ+OmqkwuOoZU03dJZDOeFWAvaJsBf4K9ZK54K0sI2y/vLAmDzFO9RvA/
	1fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=WjBWeFvAFfQJzJVq4wGjllcik5wzuol6a3SIgMOmdGc=;
	b=PgJTZIEMIfaPmzi+eWPgV76hgITlLoWVGJCw09ZzljZ8Ho4OjI9jw11N8OMlUTLrp/
	PFgK92J3KO12TF59lSyZNXnLgsiheQ/hlK86zhM/S7u8EIlh0Amsnp8kRfWixUTw6acY
	y8WvLP3z4/amNiHZeP2TxtKTnLsHIUeGMOXnjzOExGk13a5sZ4lI3xBT1BLUkwAhJuO+
	OyTRJeEs8l/r83r8kzdCquJWi6RsShFDAOht1ve+592I5AcRsDMW+sxYOPRPnJqJESlt
	gFdWnmkGYnprslXQc4zEds5Iy3wKLPg8P1cN2fV6/OW1fSENzRKgXRkeyg3BH8sJQcu3
	tk3g==
X-Gm-Message-State: ANhLgQ2Ce3Ei1eKyWxkjnlPVNvJ7i7pjanwRWWQ7fEQYXw50M/PnolsQ
	oEqxN+/uS12dbGfIkvRy8/Ci4m2OaIM=
X-Google-Smtp-Source: ADFU+vsKv/Eg3RbTOwahkdp8r3Ar2NGEcAr82/fMfQp3yXrU5Q2MemuJ9vCBHfmDpETl+bypQeFdaw==
X-Received: by 2002:aca:d954:: with SMTP id q81mr48972oig.157.1583281453323;
	Tue, 03 Mar 2020 16:24:13 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	q21sm1939355otf.18.2020.03.03.16.24.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 16:24:12 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 42F202A0681; Tue,  3 Mar 2020 16:24:11 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 16:24:09 -0800
Message-Id: <20200304002409.10056-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] python3-native: Should not search the system for headers/libraries.
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
X-List-Received-Date: Wed, 04 Mar 2020 00:24:13 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

The specific issue here is rpc/rpc.h, but its likely more general.
/usr/include is searched for rpc/rpc.h and if it exists on the
system, it changes behavior. If you are using the extended buildtools
tarball on a machine that has /usr/include/rpc/rpc.h, it will decide
that is good enough and not continue to search. nis fails to build
because /usr/include and /usr/lib are not part of the include/link
paths for the buildtools tarball compiler(nor should they be).

This makes it so python3-native will not build if you are using the
extended buildtools tarball, but from a larger issue perspective it
is building in likely different ways depending on what machine it
is building on.

libtirpc is already a depend so we shouldn't need the hosts rpc/rcp.h.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 ...Don-t-search-system-for-headers-libraries.patch | 29 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.1.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
new file mode 100644
index 0000000000..acf8e1e9b5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -0,0 +1,29 @@
+From 85e8f86ad2b7dec0848cd55b8e810a5e2722b20a Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Wed, 4 Mar 2020 00:06:42 +0000
+Subject: [PATCH] Don't search system for headers/libraries
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 9da1b3a..59782c0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
+             add_dir_to_list(self.compiler.include_dirs,
+                             sysconfig.get_config_var("INCLUDEDIR"))
+ 
+-        system_lib_dirs = ['/lib64', '/usr/lib64', '/lib', '/usr/lib']
+-        system_include_dirs = ['/usr/include']
++        system_lib_dirs = []
++        system_include_dirs = []
+         # lib_dirs and inc_dirs are used to search for files;
+         # if a file is found in one of those directories, it can
+         # be assumed that no additional -I,-L directives are needed.
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/python/python3_3.8.1.bb b/meta/recipes-devtools/python/python3_3.8.1.bb
index 77968528c7..5e3c29cb4c 100644
--- a/meta/recipes-devtools/python/python3_3.8.1.bb
+++ b/meta/recipes-devtools/python/python3_3.8.1.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 SRC_URI_append_class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
+           file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
 SRC_URI[md5sum] = "b3fb85fd479c0bf950c626ef80cacb57"
-- 
2.13.3



Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87C5A7E74C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 19:09:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v14so702097wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6a3cb+aVD6f1YPSIKFNJVSI+i1tMibJsSH/wgXDXUfY=;
	b=CByOm4ZwUs+pzFW4oc0eOevLeXMnWEChpTVkcNxIHenC/byp1b7friV3flItr023wp
	yDGgwZLRAR9fNDshg+VFDi2PdGT6dlSOq8l+UprVHMcD4TOjRiZ/DKy7sTHsF3ka7Hen
	3WqV15yoQ13oKoo0ZYcIxvTEOlw5F2pTg4vMqZVaJ+LC8eD+1g7isgfnkpP0KB2OScSZ
	TiHMcgPD68bx6NporODziFxcP9AGAsqoD1YhhwGTgH4Ygj3tj0enYFt9taS/WCEnpt9k
	XJj7ofqmehTYLCOg3cDWJTIg2zZg/IVLwhJP7Dgsk59nCmjmpkfMtwVIP/Kvc27n5PwG
	60Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6a3cb+aVD6f1YPSIKFNJVSI+i1tMibJsSH/wgXDXUfY=;
	b=JzPoFSfuaPX98ntzAg4sViMAEVTU0zY0ZmIHy4loRgCEkf21dUiMKU3CdWmcRVNawG
	dsCjFlR/bjae14SXpoO4gkLZDCvIeRmKI8xUe7LZUpUAQGlByVpswycqMuKkmwTaOtrH
	E4BkVJqHlAHs2hDmizYIgmnuOkzb3Y3imguNH7ICJTaXNGlVke3V5A0GDwLY10XcbnCb
	GwFJ58u5HPrpC1Mw9ktn5HWZrHH7ho0k9sxfFgb+Dy4bgiTazfWdWxG6Sf276WGsGT1h
	QvvVzPhTVOHAEZcscJth3WeBjck0SVxBCjUpHmp5Xbm9KwmaTTvx7GljsozRxulx8p68
	GCjQ==
X-Gm-Message-State: APjAAAUEy7Dg23oLzhY1/CCtOgD5aDUdBP3RijJ8M755W/ZpGgVrz0L2
	oK6aMf+MsLE6/0+oZgqJMtxxng+R
X-Google-Smtp-Source: APXvYqx6g1lrP/M0kNoznlXxeWfcz5fJ9v2I88kC6s2z9eDkr4qKA60zr9c8MgzqixakZAxwMYxGww==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr35901753wrr.56.1560884962895; 
	Tue, 18 Jun 2019 12:09:22 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	n14sm10694943wra.75.2019.06.18.12.09.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Jun 2019 12:09:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 19:09:28 +0000
Message-Id: <20190618190928.14232-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
References: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
Subject: [PATCH] serf: stop scons trying to create directories in hosts rootfs
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
X-List-Received-Date: Tue, 18 Jun 2019 19:09:22 -0000

* since 1522f09a4d serf: cleanup recipe
  serf.do_install fails in builds with multilib enabled (with
  libdir=/usr/lib64 on host where /usr/lib64 doesn't exist)

DEBUG: Executing shell function do_install
scons: Reading SConscript files ...
PermissionError: [Errno 13] Permission denied: '/usr/lib64':
  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 158:
    ENV = os.environ,
  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Environment.py", line 965:
    variables.Update(self)
  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/__init__.py", line 227:
    option.validator(option.key, env.subst('${%s}'%option.key), env)
  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 60:
    return PathVariable.PathIsDirCreate(key, val, env)
  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/PathVariable.py", line 101:
    os.makedirs(val)
  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py", line 221:
    mkdir(name, mode)
ERROR: scons install execution failed.

* I don't know how exactly --install-sandbox is supposed to work but
  in this case it's trying to mkdir /usr/lib64 on the host rootfs
  which is clearly wrong and if I set LIBDIR together with
  --install-sandbox then the install paths are prefixed with $D twice
  in some cases (not for includedir and empty libdir at the end).
  So in the end I think it was an issue caused by the custom path
  validator in serf's SConstruct, removing that stops touching host
  and the installed paths (including the paths inside libserf*.pc)
  look correct

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ories.without.sandbox-install.prefix.patch | 34 +++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.9.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch

diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
new file mode 100644
index 0000000000..bfb2f5a2aa
--- /dev/null
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -0,0 +1,34 @@
+--- ../1.3.9-r0-bad-double/serf-1.3.9/SConstruct	2019-06-18 15:49:19.968961108 +0000
++++ serf-1.3.9/SConstruct	2019-06-18 18:53:21.412337151 +0000
+@@ -51,17 +51,6 @@
+     """
+     return (key, '%s' % (help), default, None, lambda val: _converter(val))
+ 
+-# Custom path validator, creates directory when a specified option is set.
+-# To be used to ensure a PREFIX directory is only created when installing.
+-def createPathIsDirCreateWithTarget(target):
+-  def my_validator(key, val, env):
+-    build_targets = (map(str, BUILD_TARGETS))
+-    if target in build_targets:
+-      return PathVariable.PathIsDirCreate(key, val, env)
+-    else:
+-      return PathVariable.PathAccept(key, val, env)
+-  return my_validator
+-
+ # default directories
+ if sys.platform == 'win32':
+   default_incdir='..'
+@@ -77,11 +66,11 @@
+   PathVariable('PREFIX',
+                'Directory to install under',
+                default_prefix,
+-               createPathIsDirCreateWithTarget('install')),
++               PathVariable.PathAccept),
+   PathVariable('LIBDIR',
+                'Directory to install architecture dependent libraries under',
+                default_libdir,
+-               createPathIsDirCreateWithTarget('install')),
++               PathVariable.PathAccept),
+   PathVariable('APR',
+                "Path to apr-1-config, or to APR's install area",
+                default_incdir,
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 92cd5ca061..25ccd79e00 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -6,6 +6,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch \
            file://0003-gen_def.patch \
            file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch \
+    file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch \
            "
 
 SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
-- 
2.17.1



Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <z.p.gaal@gmail.com>) id 1T7yTn-00086n-L1
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 02:55:59 +0200
Received: by wibhn17 with SMTP id hn17so2399958wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Sep 2012 17:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=aTRnZ6feQJ4A0JOhrSHO/fOZp4UZpDaqEr+ArEliDjw=;
	b=UhDy8oeHFRCj698lqDy6YlZ3s0w8mZDhivmQeUSrfugXGTNlsAFEd099aW+QtVfb5v
	WzAgCUNrwHuApJANJ93VEmHGfGemYXmWm4s9/sUOB2tSs+DmR6uNCnaTRy/wJwI8Ext2
	RLsbRJ2rfDm+gZBXFJC1XvZ+/wuyMfjGlO7oX9yJAknZLmHRlhIalY7E+lflaCarVL6y
	okeIsWq3ZAaLsye4g/V3VZORCxcm0dhdjnebVYLUj9acOt+flY2hxXF1i6wVcPgfrpvS
	w9qlmUbVpHCC33JVj9t3s3mD9Ghy8aus0oNzvILbHpqb9si3JT8Cu5C6V71mBqEjy0tf
	8ZOg==
Received: by 10.216.243.10 with SMTP id j10mr7366248wer.211.1346546621099;
	Sat, 01 Sep 2012 17:43:41 -0700 (PDT)
Received: from [192.168.0.13] (BC2411C1.catv.pool.telekom.hu. [188.36.17.193])
	by mx.google.com with ESMTPS id
	cu1sm10178329wib.6.2012.09.01.17.43.40 (version=SSLv3 cipher=OTHER);
	Sat, 01 Sep 2012 17:43:40 -0700 (PDT)
Message-ID: <5042ABBC.60502@gmail.com>
Date: Sun, 02 Sep 2012 02:43:40 +0200
From: Zoltan Gaal <z.p.gaal@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5037C7E3.9080000@linux.intel.com>
In-Reply-To: <5037C7E3.9080000@linux.intel.com>
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Sep 2012 00:55:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm new to oe, and I've seen there was quite a big discussion about the 
gles support in mesa.
Now libgles-omap3 has the mentioned conflict with the mesa-dri as both 
provides virtual/egl. I think a patch like this would solve the issue:
(mesa-dri is required by xserver, and libgles-omap3 is the accelerated 
gles driver from ti, which also provides egl by nature)



diff --git a/meta/recipes-graphics/mesa/mesa-common.inc 
b/meta/recipes-graphics/mesa/mesa-common.inc
index cfe4a37..074dc5e 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -17,7 +17,12 @@ PE = "2"

  DEPENDS = "libxml2-native makedepend-native flex-native bison-native"

-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
+PROV_EGL = "${@base_contains('DISTRO_FEATURES', 'egl', 
'virtual/libegl', '', d)}"
+PROV_GLES = "${@base_contains('DISTRO_FEATURES', 'gles', 
'virtual/libgles1 virtual/libgles2', '', d)}"
+PROV_GLES1 = "${@base_contains('DISTRO_FEATURES', 'gles1', 
'virtual/libgles1', '', d)}"
+PROV_GLES2 = "${@base_contains('DISTRO_FEATURES', 'gles2', 
'virtual/libgles2', '', d)}"
+
+PROVIDES = "virtual/libgl ${PROV_EGL} ${PROV_GLES1} ${PROV_GLES2}"

  # for mesa-dri and mesa-xlib
  FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -41,14 +46,20 @@ EXCLUDE_FROM_WORLD = "1"
  # ie mesa-dri could be empty and mesa-dri-dev RDEPENDS on it
  ALLOW_EMPTY_${PN} = "1"

-PACKAGES =+ "libegl libegl-dev libegl-dbg \
+PACK_EGL = "${@base_contains('DISTRO_FEATURES', 'egl', 'libegl 
libegl-dev libegl-dbg', '', d)}"
+PACK_GLES = "${@base_contains('DISTRO_FEATURES', 'gles', 'libgles1 
libgles1-dev libgles2 libgles2-dev', '', d)}"
+PACK_GLES1 = "${@base_contains('DISTRO_FEATURES', 'gles1', 'libgles1 
libgles1-dev', '', d)}"
+PACK_GLES2 = "${@base_contains('DISTRO_FEATURES', 'gles2', 'libgles2 
libgles2-dev', '', d)}"
+
+PACKAGES =+ "${PACK_EGL} \
               libglu libglu-dev \
               libosmesa libosmesa-dev \
               libgl libgl-dev \
               libglapi libglapi-dev \
               libgbm libgbm-dev \
-             libgles1 libgles1-dev \
-             libgles2 libgles2-dev \
+             ${PACK_GLES} \
+             ${PACK_GLES1} \
+             ${PACK_GLES2} \
              "

  FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"




Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE1856E245
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 12:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2PCVuPe010031 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 12:31:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xkr6M2vftgCS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 12:31:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2PCVijH010012
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 12:31:56 GMT
Message-ID: <1427286704.14020.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 12:31:44 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] python-pygobject: Disable parallel make install in native case
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
X-List-Received-Date: Wed, 25 Mar 2015 12:32:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Comments within the commit describe the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
index e7f17ff..f4359bb 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
@@ -12,6 +12,19 @@ SRC_URI = "${GNOME_MIRROR}/pygobject/${MAJ_VER}/pygobject-${PV}.tar.bz2 \
            file://obsolete_automake_macros.patch \
 "
 
+# libtool-native doesn't have fixinstall.patch applied which means
+# that libs get relinked at installation time. This triggers a 
+# relinking along the lines of:
+# gcc -L/tmp/foo/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/lib -lpyglib-2.0-python -o .libs/_glib.so
+# where /tmp/foo is DESTDIR and pyglib-2.0-python may be installed/reinstalled
+# at the same time as the gcc command runs.
+# If this happens between the handoff between gcc and ld, you can see:
+# /bin/ld: cannot find -lpyglib-2.0-python
+# Adding a dependency rule like  install-pyglibLTLIBRARIES: install-libLTLIBRARIES
+# would be ideal but automake can't cope with that without manually 
+# defining the whole function. Give up and disable parallel make in native builds.
+PARALLEL_MAKEINST_class-native = ""
+
 SRC_URI[md5sum] = "aa64900b274c4661a5c32e52922977f9"
 SRC_URI[sha256sum] = "7da88c169a56efccc516cebd9237da3fe518a343095a664607b368fe21df95b6"
 S = "${WORKDIR}/pygobject-${PV}"




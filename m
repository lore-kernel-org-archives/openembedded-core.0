Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 531F77320F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 15:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u34FGjbf010818 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2016 16:16:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id icFZ4hgDoVnm
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 16:16:45 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u34FGga4010815
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2016 16:16:43 +0100
Message-ID: <1459783002.7348.152.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 04 Apr 2016 16:16:42 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] buildtools-tarball: Add texinfo (for makeinfo)
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
X-List-Received-Date: Mon, 04 Apr 2016 15:16:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Initially I was reluctant to do this however makeinfo is a dependency
of the buildsystem and only adds around 400kb to the buildtools-tarball
so it likely makes sense to add it. This allows people to use
the project on older environments.

Need to enable nativesdk-texinfo but this seems straightforward.

[YOCTO #8990]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 8ad4e91..9e05390 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-make \
     nativesdk-wget \
     nativesdk-ca-certificates \
+    nativesdk-texinfo \
     "
 
 SDK_PACKAGE_ARCHS =+ "buildtools-dummy-${SDKPKGSUFFIX}"
diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-extended/texinfo/texinfo_6.0.bb
index a8702cf..8638bb1 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
@@ -79,4 +79,4 @@ FILES_${PN}-doc = "${infodir}/texinfo* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"




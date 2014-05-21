Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D259560196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 16:50:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4LGoUHX028863 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 17:50:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j8GH_nVwFikw
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 17:50:30 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4LGoO5w028797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 17:50:25 +0100
Message-ID: <1400691017.17834.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 May 2014 17:50:17 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] taglib: Force a disable of the floating dependency on boost
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
X-List-Received-Date: Wed, 21 May 2014 16:50:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

taglib appears to depend on boost if it finds it in the sysroot. Force
it not to do this. Someone with better cmake skills may be able to
do this in a neater way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfAAoundation.org>

diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb
b/meta/recipes-support/taglib/taglib_1.9.1.bb
index 0ecb444..0421f61 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.9.1.bb
@@ -24,5 +24,7 @@ EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib',
True).replace('lib', '')}"
 do_configure_prepend () {
 	rm -f ${S}/admin/ltmain.sh
 	rm -f ${S}/admin/libtool.m4.in
+	# Don't have a floating dependeny on boost
+	sed -i -e "s/atomic.hpp/atomic-not-exist.hpp/"
${S}/ConfigureChecks.cmake
 }
 




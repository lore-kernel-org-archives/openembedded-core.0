Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70B54713A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5ImVvZ028485 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:48:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F56_3wnjn8Qi
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:48:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5ImS6X028482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:48:29 GMT
Message-ID: <1415213343.23396.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Nov 2014 18:49:03 +0000
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] perl: Enable rebuilds to account for configuration changes
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
X-List-Received-Date: Wed, 05 Nov 2014 18:49:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If configure/compile was rerun for perl, changes such as libdir changes
were not being picked up. To fix this we we add "make clean"
functionality, if the makefile is present.

We also in this case need to delete the .so file, else some perl modules
try and load the target arch libraries leading to build failures. I'd
love it if there were a better way to do this and am open to better
proposals but this was the best I could find, not being a perl expert.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index ec01765..ec4d214 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -117,6 +117,16 @@ do_configure() {
         # Make hostperl in build directory be the native perl
         ln -sf ${HOSTPERL} hostperl
 
+	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
+		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a -e Makefile ]; then
+			${MAKE} clean
+		fi
+		find ${S} -name *.so -delete
+	fi
+	if [ -n "${CONFIGURESTAMPFILE}" ]; then
+		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
+	fi
+
         # Do our work in the cross subdir
         cd Cross
 




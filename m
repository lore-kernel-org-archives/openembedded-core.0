Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCCb3-00088m-Hw for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2013 18:21:25 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23HCP7U006124; Sun, 3 Mar 2013 17:12:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nG1wWhxGxSsj; Sun,  3 Mar 2013 17:12:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23HCHdW006121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 3 Mar 2013 17:12:20 GMT
Message-ID: <1362330269.4325.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 03 Mar 2013 17:04:29 +0000
In-Reply-To: <CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
References: <ly628a8z00.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] libgcc: Mark libgcc_s as executable to ensure its stripped
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
X-List-Received-Date: Sun, 03 Mar 2013 17:21:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

libgcc_s is not marked as executable and hence it doesn't get stripped. This
means its about 1MB larger than it needs to be. There is no good reason it
shouldn't get stripped so ensure it does and mark as executable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 47669a2..6a0931f 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -57,6 +57,9 @@ do_install () {
 	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
 	# so that cross-gcc can find it in the sysroot
 
+	# Ensure libs are executable else they aren't stripped
+	chmod a+x ${D}/${base_libdir}/*
+
 	mv ${D}${libdir}/gcc/* ${D}${libdir}
 	rm -rf ${D}${libdir}/gcc/
 	# unwind.h is installed here which is shipped in gcc-cross





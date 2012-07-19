Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrqrX-0005GD-Ex for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 15:33:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JDMT4T002515
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:22:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32466-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:22:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JDMJd2002509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:22:20 +0100
Message-ID: <1342704143.7940.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 14:22:23 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] staging.bbclass: Don't stage doc/manpage/info files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 13:33:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is no point in having doc, manpage or info files in the staging directory. They
just bloat the sstate package size and waste time as they're copied around.

We never used to stage these but it crept in when we started staging $datadir. This
patch corrects that so they're removed and stop making it into the sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index ee5a025..6540349 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -51,6 +51,8 @@ sysroot_stage_dirs() {
 		sysroot_stage_libdir $from${base_libdir} $to${base_libdir}
 	fi
 	sysroot_stage_dir $from${datadir} $to${datadir}
+	# We don't care about docs/info/manpages
+	rm -rf $to${mandir}/ $to${docdir}/ $to${infodir}/
 }
 
 sysroot_stage_all() {





Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhiXu-0006wS-B6 for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:35:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FDVAM8021557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 14:31:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21164-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 14:31:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FDV5Tp021551
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 14:31:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 14:31:02 +0100
Message-ID: <1310736662.20015.1232.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Performance datapoint - impact of static libs
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
X-List-Received-Date: Fri, 15 Jul 2011 13:35:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Before:

real	104m1.135s
user	415m57.560s
sys	61m31.180s

With "--disable-static" being passed to configure (changes below):

real	99m46.645s
user	383m32.390s
sys	60m42.170s

So static libs add an extra ~30mins of processing (7%) and ~5 mins to
the overall build time. Not as much of a gain as I'd have liked but
interesting none the less.

The changes were effectively:

DISABLESTATIC = "--disable-static"
DISABLESTATIC_pn-sqlite3-native = ""
DISABLESTATIC_pn-openssl = ""
DISABLESTATIC_pn-openssl-native = ""
DISABLESTATIC_pn-qemu-native = ""
EXTRA_OECONF_append  = " ${DISABLESTATIC}"

in local.conf with a patch to the openjade-native recipe to not install
the .a file using oe_libinstall and a patch to apmd to fix a libtool
related compiling bug in its makefile.

Cheers,

Richard





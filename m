Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R7n3V-0005cG-Ps for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 13:39:33 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PBeP9H006938; Sun, 25 Sep 2011 12:40:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TsyoW2eNKjsG; Sun, 25 Sep 2011 12:40:25 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PBeJXK006934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 25 Sep 2011 12:40:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 25 Sep 2011 12:33:56 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316950444.8185.14.camel@ted>
Mime-Version: 1.0
Subject: qt3 vs qt4 issues
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
X-List-Received-Date: Sun, 25 Sep 2011 11:39:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been looking at the qt3 failures on the autobuilder. It seems there
is some kind of contamination between the qt4 builds and the qt3 builds
and I'm not sure what is or isn't expected to work there.

We're doing the following in the build:

a) Build core-image-lsb (includes qt4, builds qt4+qt4-native)
b) Wipe out tmp
c) Add in meta-qt3 layer
d) Enable sstate from build in a)
e) Build core-image-lsb-qt3 which adds in qt3
f) Bitbake determines it needs to install qt4 for the image but 
   nothing depends on the native qt4 tools so these are not installed
g) This will build qt3+qt3-native with qt4 in the sysroot but no 
   qt4-native
h) We see build failures as qt3 seems to want to find bits of qt4-native

If qt4 and qt4-native are present, qt3 works
If qt4 and qt4-native are not present, qt3 works
If qt4 is present but qt4-native is not, qt3 fails

How do we fix this?

An easier reproducer is something like:

bitbake qt4-x11-free
bitbake qt4-native -c clean
bitbake qt-x11-free


Beth: As a work around, you can do:

bitbake qt-x11-free
bitbake core-image-lsb-qt3

as two steps on the autobuilder and the builds will work. This might be
what we need to do for this release.

Cheers,

Richard





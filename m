Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9FLr-0008Ie-CR for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 14:04:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TC5QUr024455 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 13:05:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pNwx-+3I3jFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 13:05:26 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TC5JJC024445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 13:05:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 12:58:54 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317297541.12332.85.camel@ted>
Mime-Version: 1.0
Subject: help2man
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
X-List-Received-Date: Thu, 29 Sep 2011 12:04:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The more I look at and think about help2man, the more it looks like
something we just shouldn't need/use.

In summary, it runs a binary and captures its --help output. This rules
it out from being useful in most cross compiling scenarios, i.e. all
target packages.

In the -native/-cross cases, we don't really care about man pages.

I'm therefore thinking we should really just drop the dependency and
symlink help2man to /bin/false. The missing script in autotools should
then just silently touch the man page files instead of regenerating
them.

I tried to figure out which recipes actually use help2man:

$ grep HELP2MAN * -r --exclude=Makefile.in 2> /dev/null | grep -v missing

and against a core-image-sato this gave:

libtool
libtasn1
gettext
automake
autoconf
flex
bison
m4

which isn't that many recipes to go and beat up manually if necessary.
It certainly doesn't warrant a global include in autotools.bbclass IMO.

Cheers,

Richard






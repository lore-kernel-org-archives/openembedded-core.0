Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZ9WD-0000NR-In for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 00:34:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LMUSqu026779
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:30:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26616-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:30:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LMUGZi026770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:30:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 23:30:00 +0100
Message-ID: <1308695400.20015.53.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Patterns in the hackery various classes need - Need API change?
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
X-List-Received-Date: Tue, 21 Jun 2011 22:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've spent quite a bit of time recently staring at the insanity that
some of our core classes have. That code generally works so people like
to leave it well alone but when you look at some of it, there is some
nasty stuff going on.

Taking cross.bbclass as an example:

  # Save PACKAGE_ARCH before changing HOST_ARCH
  OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
  PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
  # Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
  OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
  BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
  BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"

nativesdk.bbclass:

  # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
  #
  OLD_PACKAGE_ARCH := ${BASE_PACKAGE_ARCH}
  BASE_PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"

Then we have the code in base.bbclass and bitbake.conf which plays with
MULTIMACH_ARCH which as far as I can figure out is totally broken. I
have a patch I'm experimenting with to just remove that variable out.

Bottom line, we really need the machine/tune/architecture files to set
variables which we don't mess with and derive all our others from these.

The machine/tune/architecture files really need to specify two things
which in today's variable terms are:

a) The TARGET_ARCH value which is really the broad architecture
b) The BASE_PACKAGE_ARCH which is what things compiled with the tune 
   flags should get packaged as.

The problem is we need to change TARGET_ARCH under a number of
circumstances and BASE_PACKAGE_ARCH defaults to being derived from
TARGET_ARCH so that is also easily "broken".

I'm seriously considering coming up with two new variable names and then
having bitbake exit if the machine/tune/architecture files don't define
these. We could then likely simplify some of the core code and make it
much more plain what was going on. Something like:

TARGET_BASEARCH = "arm"
TARGET_PKGARCH = "armv7a"

Would this be too painful for people or something we could do? Most
people are likely using the core tune-* files which should make this
transition a bit less painful...

Cheers,

Richard







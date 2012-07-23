Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1StD6E-0007tx-HJ for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 09:30:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6N7JBm1001602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 08:19:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27737-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 08:19:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6N7J0at001596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 08:19:03 +0100
Message-ID: <1343027945.21788.81.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 08:19:05 +0100
In-Reply-To: <D9D7124626ED1E43963D86B2657D5CCD03A17E72@FRSNPREXC1.usr.ingenico.loc>
References: <D9D7124626ED1E43963D86B2657D5CCD03A17BC8@FRSNPREXC1.usr.ingenico.loc>
	<1342796791.21788.30.camel@ted>
	<D9D7124626ED1E43963D86B2657D5CCD03A17E72@FRSNPREXC1.usr.ingenico.loc>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Broken gettext/gdbm
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
X-List-Received-Date: Mon, 23 Jul 2012 07:30:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-23 at 08:50 +0200, Matthieu CRAPET wrote:
> Hi,
> 
> $ bitbake gdbm -e | grep ^DEPENDS
> DEPENDS_GETTEXT="virtual/gettext gettext-native"
> DEPENDS="autoconf-native automake-native libtool-native libtool-cross gnu-config-native virtual/gettext gettext-native  virtual/arm-ingenico-linux-gnueabi-gcc virtual/arm-ingenico-linux-gnueabi-compilerlibs virtual/libc"
> 
> $ bitbake gettext -e | grep ^DEPENDS
> DEPENDS_virtclass-native="libxml2-native gettext-minimal-native"
> DEPENDS="autoconf-native automake-native libtool-native libtool-cross gnu-config-native  virtual/arm-ingenico-linux-gnueabi-gcc virtual/arm-ingenico-linux-gnueabi-compilerlibs virtual/libc  libxml2-native gettext-native virtual/libiconv ncurses expat"
> 
> Note: We are using our own external toolchain.

That is an important detail!

> I wasn't clear enough in my previous post. It appear to be a circular dependency.

A circular dependency on what?

> Since my update I have this log:
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for virtual/gettext (proxy-libintl, gettext)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/gettext

Have you tried setting:

PREFERRED_PROVIDER_virtual/gettext = "gettext"

?

> When I just try to build gettext, It wants to build gdbm.. which depends of gettext too.
> 
> gettext-minimal-native doesn't have config.rpath, gettext-native has it.
> 
> But config.rpath is taken from ${STAGING_DATADIR}/gettext/config.rpath" and not ${STAGING_DATADIR_NATIVE}/gettext/config.rpath".
> Patching "meta/classes/autotools.bbclass" would be a proper fix ?

No, that doesn't sound right.

I think the problem is that the system is thinking virtual/gettext is
provided by proxy-libintl. Adding the line above should convince it
otherwise and then things should work better.

Cheers,

Richard




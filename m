Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBmfo-0005sA-Lu for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 13:31:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3IBT1xC011828
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 12:29:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11661-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 12:28:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3IBSsoE011822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 12:28:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>
References: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>
Date: Mon, 18 Apr 2011 12:28:45 +0100
Message-ID: <1303126125.5518.118.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Is BBCLASSEXTEND in .bbappend supposed to work?
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
X-List-Received-Date: Mon, 18 Apr 2011 11:31:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-18 at 12:55 +0200, Koen Kooi wrote:
> Martin did some Xorg cleanup in meta-oe today and we're seeing some strange behaviour.  The recipe in question:
> 
> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ cat recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> BBCLASSEXTEND = "native nativesdk"
> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ 
> 
> Bitbake-layers tells me:
> 
> INFO: libxrender_0.9.6.bb:
> INFO:   /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> 
> So the append is getting picked up, but bitbake gives me:
> 
> ERROR: Nothing PROVIDES 'libxrender-native'
> NOTE: Runtime target 'libnss-mdns' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libnss-mdns', 'avahi', 'gtk+', 'gtk+-native', 'libxrender-native']
> 
> This is with HEAD of bitbake master.

I did some experimentation here and this looks like bitbake-layers is
seeing the file but bitbake is not. If I touch the libxrender .bb file
and then run bitbake -DDD, I see the file mentioned in the logs:

$ touch recipes-graphics/xorg-lib/libxrender_0.9.6.bb
$ bitbake libxrender-native -DDD | grep append
DEBUG: Appending .bbappend file /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend to /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
DEBUG: BB /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend: handle(data, include)
DEBUG: LOAD /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend

Can you confirm you're seeing that? Admittedly I just hacked a local
checkout and I'm not using meta-oe.

Do you need to add *.bbappend to BBFILES in layer.conf ?

Cheers,

Richard





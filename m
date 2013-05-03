Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UYI9g-0002pk-Nj for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 17:44:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FS8gb006087; Fri, 3 May 2013 16:28:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZqjZHuGFPa6P; Fri,  3 May 2013 16:28:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FS2S7006083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 3 May 2013 16:28:04 +0100
Message-ID: <1367594760.5379.157.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Lazzari <dlazzari@leapfrog.com>
Date: Fri, 03 May 2013 16:26:00 +0100
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0FE6C9AF83@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0FE6C9AF83@NAEMMAIL01.na.leapfrog.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Custom tasks not running when dependency changes version
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
X-List-Received-Date: Fri, 03 May 2013 15:44:17 -0000
X-List-Received-Date: Fri, 03 May 2013 15:44:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-04-28 at 01:14 +0000, Daniel Lazzari wrote:
> I've got a weird issue that I just can't seem to figure out and need some help on. In our custom layer we have a bbclass that has 2 custom tasks, like so:
> 
> addtask complete_metadata after do_package before do_package_write
> addtask create_other_package after do_package_write before do_build
> 
> Now this is inherited by a recipe B which depends on recipe A. If I build a rootfs image, then change the version (PV) on recipe A, then build the rootfs image again, recipe A rebuilds, then recipe B rebuilds, but it rebuilds without running my custom tasks. There's probably some task flag that I need to set to make this work, but I can't figure out what it is. Any help is appreciated, as always.
> 
> BTW, I'm all the way back on the denzil branch in case that matters.

We have recently found a cache issue in bitbake with regard to addtask
handling. The fix is now in master:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=6db202532122b213ae6cfce9a49ac9fad2db20f5

You can workaround this by removing tmp/cache/ to ensure bitbake
correctly reparses things when it should. It may be the problem you're
seeing, it may not but its worth a try...

Cheers,

Richard




Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBMZh-0005Vq-DC for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:16:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8B93XJE007880;
	Tue, 11 Sep 2012 10:03:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05711-09; Tue, 11 Sep 2012 10:03:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8B93Pnm007874
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 11 Sep 2012 10:03:27 +0100
Message-ID: <1347354207.2122.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Sep 2012 10:03:27 +0100
In-Reply-To: <20120911080334.GD3465@jama.jama.net>
References: <20120911080334.GD3465@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: DEPENDS_virtclass-native = "libpng jpeg" not extended to libpng-native jpeg-native
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
X-List-Received-Date: Tue, 11 Sep 2012 09:16:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 10:03 +0200, Martin Jansa wrote:
> Hi,
> 
> in meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:
> 
> DEPENDS_virtclass-native = "libpng jpeg"
> DEPENDS = "libpng jpeg expat gtk+"
> 
> BBCLASSEXTEND = "native"
> 
> Did it work (at least at some point of time) that DEPENDS for
> libwmf-native were expanded to libpng-native and jpeg-native?

I don't think that has ever worked. Its assumed that if you're going to
use class overrides, you put the right thing in place.

> Because now it does not:
> OE tuna@shr ~/shr-core $ bitbake-diffsigs
> stamps.1347348593/nokia900/x86_64-linux/libwmf-native-0.2.8.4-r1.do_configure.sigdata.315a83efebb27040d6bf0aaead16671e
> stamps.1347348593/om-gta02/x86_64-linux/libwmf-native-0.2.8.4-r1.do_configure.sigdata.0f8349ada0c8a18a6d6ed7b7841ec955
> Hash for dependent task libpng_1.2.49.bb.do_populate_sysroot changed
> from 640001ee0530e51ef0aefb300c34f7dd to 7ba7d74a27e1e0af253ddac00a2be1c2
> Hash for dependent task libjpeg-turbo_svn.bb.do_populate_sysroot changed
> from 3fe6eae3a6fd1af40233d548680c5bab to ff852ac3d5e826ff74e68b5ddc4ac3e1
> 
> So native recipe depending on target checksum -> rebuilding with each
> MACHINE switch.
> 
> I can fix it by:
> DEPENDS_virtclass-native = "libpng-native jpeg-native"
> but maybe there is more cases like this and this could be checked by
> native.bbclass or something like that.

That is the correct thing to do, the code assumes when you write
explicit class overrides, you mean what you say...

Cheers,

Richard




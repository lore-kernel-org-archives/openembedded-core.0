Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaVCA-0000pR-L7 for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:27:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDGKE8N011268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 16:20:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10868-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 16:20:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDGK5Op011256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 16:20:06 GMT
Message-ID: <1323793205.25491.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 16:20:05 +0000
In-Reply-To: <1323791273.25491.2.camel@ted>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>
	<ed69ab4404b203386817674220400f9ca3a27343.1323688579.git.xiaofeng.yan@windriver.com>
	<1323791273.25491.2.camel@ted>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/7] gtk: add demos to the configuation of gtk+
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
X-List-Received-Date: Tue, 13 Dec 2011 16:27:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 15:47 +0000, Richard Purdie wrote:
> On Mon, 2011-12-12 at 19:28 +0800, Xiaofeng Yan wrote:
> > From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> > 
> > Add demos for checking whether gtk+ run over directfb successfully or not.
> > 
> > [YOCTO #1674]
> > 
> > Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> > ---
> >  meta/recipes-gnome/gtk+/gtk+_2.24.8.bb |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> This broke the builds:
> 
> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/198/steps/shell_14/logs/stdio

To update, there is a clue in the error if you read it carefully:

(process:18554): GdkPixbuf-WARNING **: Cannot open pixbuf loader module file '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache': No such file or directory
| failed to load "./apple-red.png": Couldn't recognize the image file format for file './apple-red.png'

Note its looking in "nightly-x86-64", not "nightly-mips" so this looks
like a relocation issue in gdk-pixbuf rather than a problem with this
patch itself.

I had a quick look on the autobuilder:

$ grep nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib/ * -r
Binary file bin/gdk-pixbuf-query-loaders matches
Binary file lib/libasound.so matches
Binary file lib/alsa-lib/smixer/smixer-hda.so matches
Binary file lib/alsa-lib/smixer/smixer-ac97.so matches
Binary file lib/libasound.so.2 matches
Binary file lib/libasound.so.2.0.0 matches

so we have a hardcoded path in gdk-pixbuf-query-loaders. It also looks
like there is an issue in alsa-lib.

Cheers,

Richard




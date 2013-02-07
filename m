Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U3aR1-0002g9-PE for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:00:19 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17MmlZD002712; Thu, 7 Feb 2013 22:48:48 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BXxeXkHaFOH1; Thu,  7 Feb 2013 22:48:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17Mmd9M002709
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 7 Feb 2013 22:48:42 GMT
Message-ID: <1360276986.10722.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 07 Feb 2013 22:43:06 +0000
In-Reply-To: <5113CA88.9020508@linaro.org>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
	<a306516e1af55efcd93563779e389448e16c97d3.1360055640.git.laurentiu.palcu@intel.com>
	<5113CA88.9020508@linaro.org>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] add fontcache.bbclass
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
X-List-Received-Date: Thu, 07 Feb 2013 23:00:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-07 at 16:38 +0100, Marcin Juszkiewicz wrote:
> W dniu 05.02.2013 10:34, Laurentiu Palcu pisze:
> > All font packages should inherit this class in order to generate the
> > proper postinst/postrm scriptlets.
> > 
> > The scriptlets will actually create a host intercept hook that will be
> > executed at the end, at do_rootfs time, after all packages have been
> > installed. This is good when there are many font packages.
> > 
> > [YOCTO #2923]
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> >  meta/classes/fontcache.bbclass |   47 ++++++++++++++++++++++++++++++++++++++++
> 
> > +${@qemu_run_binary(d, '$D', '/usr/bin/fc-cache')} --sysroot=$D >/dev/null 2>&1
> 
> What about platform which do not have qemu support? Like AArch64...
> 
> | Configuring libpcre-staticdev.
> | Building from feeds activated!
> | Running intercept scripts:
> | > Executing update_font_cache
> | ERROR: Function failed: do_rootfs (see
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/genericarmv8-oe-linux/linaro-image-sdk/1.0-r2/temp/log.do_rootfs.23211
> for further information)

Ideally the intercept code should fall back to running the postinst on
the target if qemu isn't available. Patches welcome to make that happen.

The hard part is this is an "allarch" recipe so we can't disable this
conditionally on aarch64. We can disable all intercept scripts I guess.

Or we make these packages arch specific on aarch64 I guess. 

Cheers,

Richard




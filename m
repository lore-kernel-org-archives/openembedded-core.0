Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TR0Fp-0005U0-NF for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 14:40:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OCQj4L002675;
	Wed, 24 Oct 2012 13:26:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02323-03; Wed, 24 Oct 2012 13:26:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OCQZ1q002668
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 24 Oct 2012 13:26:36 +0100
Message-ID: <1351081595.22340.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Oct 2012 13:26:35 +0100
In-Reply-To: <20121024121629.GE3269@jama.jama.net>
References: <20121024121629.GE3269@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gconf-native backends broken when reused from sstate?
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
X-List-Received-Date: Wed, 24 Oct 2012 12:40:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-24 at 14:16 +0200, Martin Jansa wrote:
> When building foxtrotgps I get this error:
> 
> | GCONF_CONFIG_SOURCE=xml:merged:/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/gconf/gconf.xml.defaults \
> | /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/gconftool-2 --makefile-install-rule apps_foxtrotgps.schemas
> |  /bin/mkdir -p '/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/foxtrotgps-1.1.1-r1/image/usr/share/foxtrotgps'
> |
> | (gconftool-2:13082): GConf-CRITICAL **: No such file `/OE/jansa-test/shr-core/tmp-eglibc/work/x86_64-linux/gconf-native-3.2.3-r12/GConf-3.2.3/gconf/../backends/.libs/libgconfbackend-xml.so'
> |
> |
> | (gconftool-2:13082): GConf-WARNING **: Failed to load source "xml:merged:/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/gconf/gconf.xml.defaults": Failed: Couldn't locate backend module for `xml:merged:/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/gconf/gconf.xml.defaults'
> 
> First path points to wrong sysroot (/OE/jansa-test/shr-core is used only
> on builder from where i get sstate-cache with SSTATE_MIRROR) and the
> other paths to backends are using even WORKDIR.
> 
> It's not really foxtrotgps fault:
> sysroots/x86_64-linux/usr/bin/gconftool-2 --get-default-source
> xml:merged:/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/gconf/gconf.xml.defaults
> 
> Anyone seen this?

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/gconf.bbclass?id=d3343f7307290e14eb90226a510de350b1cfd8b2

Does EXTRA_OECONF have "--disable-schemas-install" ?

Cheers,

Richard




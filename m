Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RNkKD-0001t3-Sm
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:58:45 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RNkED-0007J1-UB
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:52:34 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 11:52:05 +0000
In-Reply-To: <a3bc0652da3fe9a2e90444030b4a364871c47549.1320750179.git.xiaofeng.yan@windriver.com>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
	<a3bc0652da3fe9a2e90444030b4a364871c47549.1320750179.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1320753153.22985.699.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 3/7] cairo: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 11:58:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 19:15 +0800, Xiaofeng Yan wrote:
>  #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
>  require cairo-fpu.inc
> +CONF_directfb="--with-x=no --enable-xcb=no --enable-directfb=yes"
> +CONF_xorg="--with-x=yes --enable-xcb=no --enable-directfb=no"
> +
>  EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} ${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
> +EXTRA_OECONF += " ${@base_contains('DISTRO_FEATURES', 'directfb', '${CONF_directfb}', '${CONF_xorg}', d)}"

I don't think this can be correct.  That will force X11 on for anybody
who isn't using DirectFB, right?  I think you need to preserve the
previous semantics for building without X.

p.





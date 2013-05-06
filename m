Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>)
	id 1UZRAm-0007uq-Dl; Mon, 06 May 2013 21:34:09 +0200
Received: by mail-vc0-f172.google.com with SMTP id m17so926442vca.17
	for <multiple recipients>; Mon, 06 May 2013 12:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=+f0d62hCx7U9e6/2RrqLhGzr4OKNCq82Wse+ZKY1bQI=;
	b=jE8BwuWjQBbaOJQ7VCHH5V6jcD0XjMiBr6i32+cXiJu9NQcbvSp/7VnEN8ihhiP4h+
	eplgUlKBBaUmf+vu4+mB1aIOwtEYJPb7jl2pVq+z5nwtKs0IQfIA9owAK2nOa9ojvpdM
	mlfvhyiKufloocwDoijfyazxG2c3DvZpDImhLPi7mJ6Oi8u4c6FfA9us+gZIlYoknpgP
	1Rur12fWz+X30lZ8ENq3sfq9f9GO0NwTNUUeSU7EcbZlg9MOlxoWxhvhXTZp6gW9f2/l
	6EkfS0jQsOye2c4TRKW8aAaHGSxdlqbKAkWlto+aEMRndqEwQKAXpi94qgZmKHLKlRBM
	ONrQ==
X-Received: by 10.58.243.102 with SMTP id wx6mr2684548vec.26.1367867768162;
	Mon, 06 May 2013 12:16:08 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Mon, 6 May 2013 12:15:48 -0700 (PDT)
In-Reply-To: <5187A0D3.2080607@herbrechtsmeier.net>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<5183C9CF.3060304@herbrechtsmeier.net>
	<5187A0D3.2080607@herbrechtsmeier.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 6 May 2013 20:15:48 +0100
X-Google-Sender-Auth: lb_wAt4qAxjwvB6ylSPWTEyb1Sw
Message-ID: <CANyK_8fT_rvPPo4LJz2BcSD-ra8435m4GefggL0jgeFC1kLxRQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Mon, 06 May 2013 19:34:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've done a 'bitbake world' and masked off anything that failed.
Failing logs and other things along with the local.conf and
bblayers.conf used are available at
http://www.paulbarker.me.uk/yocto/poky-raspberrypi_20130503/

In summary:

maliit-framework: do_compile (looks like glib deprecation warning
which -Werror turns into an error)
maliit-plugins: depends on maliit-framework
gypsy: do_conpile (as maliit-framework)
navit: depends on gypsy
gtkhtml2: do_compile
qcanobserver: do_compile
mesa-demos: do_compile (vcos_platform_types.h: No such file or directory)
packagegroup-core-tools-testapps: depends on mesa-demos
llvm2.9: do_compile (vcos_platform_types.h: No such file or directory)
weston: do_compile (vcos_platform_types.h: No such file or directory)
gperftools: do_compile (Error: selected processor does not support ARM
mode `dmb')
gst-plugins-gl: do_configure (error: GL or EGL is required)
omgps: do_compile (as maliit-framework)
packagekit: do_compile (undefined reference to `g_thread_supported')
omxplayer: do_compile (vchost_config.h: No such file or directory)
luajit: do_compile (sys/types.h: No such file or directory)
mplayer2: do_compile (mad.h: No such file or directory)
openmotif: fetch failure
lzip: fetch failure
mg: do_configure (Looking for term.h... Not found!)
tk: do_package (QA Issue: tk:
/work/armv6-vfp-poky-linux-gnueabi/tk/8.5.8-r0/packages-split/tk/usr/bin/wish8.5
contains probably-redundant RPATH /usr/lib)
claws-plugin-gtkhtml2-viewer: depends on gtkhtml2

I'm building Poky for Raspberry Pi with pretty much the default
options. There's a couple of installed but not packaged warnings in
qa.log which can be found at the above link. I've also included commit
IDs for each layer used and where I've diverged from the master branch
I've included patches. Most other info should be available within the
directory I've linked to.

Let me know if this is useful.

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk



Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A12526B1C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 21:30:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2013 14:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,671,1367996400"; d="scan'208";a="365685403"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2013 14:32:09 -0700
Message-ID: <51E46A13.6070506@linux.intel.com>
Date: Mon, 15 Jul 2013 14:30:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
References: <CALbNGRQZe5Qso_hK3BPUi3qEbRaq+1t-as_E1LsGSf8exUnV5Q@mail.gmail.com>
In-Reply-To: <CALbNGRQZe5Qso_hK3BPUi3qEbRaq+1t-as_E1LsGSf8exUnV5Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gdk-pixbuff-xlib missing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2013 21:31:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 07/15/2013 02:10 PM, Andreas Müller wrote:
> Hi
>
> while playing around with libreoffice, configure complains for missing
> gdk-pixbuff-xlib.
>
> I checked: although I have 'x11' in 'DISTRO_FEATURE', gdk-pixbuff-xlib
> is an empty package.
>
> The responsible lines in gdk-pixbuf_xx.bb are:
>
> X11DEPENDS = "--without-x11"
> X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11',
> '--with-x11', '--without-x11', d)}"
> X11DEPENDS_class-native = "--without-x11"
>
> I got two questions:
>
> 1. why not
> X11DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11',
> '--without-x11', d)}"
> X11DEPENDS_class-native = "--without-x11"
>
I believe that this is because the original recipe was defaulted to 
--without-x11 and the person adding the linuxstdbase code just preserved 
the behavior

It seems we should really make this a PACKAGECONFIG with the 
PACKAGECONFIG using the linuxstdbase override as default.

Patches welcome!

> 2. (maybe this answers also 1. - but I would like to understand): what
> is linuxstdbase (image) about
>
This one I can answer better the linuxstdbase is a Distro level override 
enabled when building an LSB based image, it's set in poky-lsb.conf.

It enables building certain packages with flags or settings that will 
pass the LSB compliance tests.


> enlightenment appreciated
>
Hope that helped
> Andreas
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


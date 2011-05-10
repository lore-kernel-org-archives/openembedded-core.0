Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJt3z-0001JC-Cu for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 21:57:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AJt169010010
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:55:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09491-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:54:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AJsq1K009997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:54:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimcGCLPFM0ShJPyaDqm+X8PaX1DXQ@mail.gmail.com>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
	<BANLkTimcGCLPFM0ShJPyaDqm+X8PaX1DXQ@mail.gmail.com>
Date: Tue, 10 May 2011 20:26:44 +0100
Message-ID: <1305055604.30391.291.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/6] conf/distro/include/default-distrovars.inc: Create set of default 'distro' variable values
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
X-List-Received-Date: Tue, 10 May 2011 19:57:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 16:26 +0200, Frans Meulenbroeks wrote:
> Some minor remarks on the default-distrovars.inc contents:

To quote the email prefacing this patch series:

"""
I did dump a load of "default" variables into default-distrovars.inc,
I'm not calling that file finished, I just had to draw the line
somewhere and start a discussion about this :)
"""

but we can have this discussion.

> 2011/5/10 Richard Purdie <richard.purdie@linuxfoundation.org>
> [...]
> 
> > diff --git a/meta/conf/distro/include/default-distrovars.inc
> > b/meta/conf/distro/include/default-distrovars.inc
> > new file mode 100644
> > index 0000000..ab26a30
> > --- /dev/null
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -0,0 +1,43 @@
> > +QA_LOGFILE = "${TMPDIR}/qa.log"
> >
> Should this be here? I would expect the class file that uses this to have
> this as default and/or have this in local.conf.sample.
> This does not seem too distro specific

If this is unset, the logfile isn't generated at all with the current
defaults. I don't claim the current defaults are correct but its a
separate patch if we do want to change the defaults.

> > +
> > +IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
> >
> Hm, again something that is probalby not distro related. And why only for
> _ext2 and not eg for _ext3 or for _jffs2
> Personally I always stuff this in my image recipe

Left there pending a review of where various image sizes are set.

> > +
> > +OEINCLUDELOGS ?= "yes"
> >
> in local.conf.sample?

If its there, this can be dropped, yes. I think forcing it on by default
may be a good thing though. I'm not 100% sure that variable even still
exists tbh.

> > +KERNEL_CONSOLE ?= "ttyS0"
> >
> I'm inclined to put this into the machine conf. Is this really a distro
> thing?

No, left for compatibility pending cleanup.

> > +
> > +require conf/distro/include/preferred-xorg-versions.inc
> > +
> > +PCMCIA_MANAGER ?= "pcmciautils"
> > +
> > +IMAGE_LINGUAS ?= "en-us en-gb"
> > +LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
> > +ENABLE_BINARY_LOCALE_GENERATION ?= "1"
> > +LOCALE_UTF8_ONLY ?= "0"
> >
> Again something I tend to do in image recipes; then again this might be
> because I do not use feeds, only make images.

These ones are more distro policy and whilst an image can change them a
default is good in those cases. If there are defaults set elsewhere we
should review and pick the correct ones.

> > +DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi
> > nfs zeroconf pci"
> >
> Is this the complete range? I would expect all features to be enabled by
> default (and let MACHINE_FEATURES reduce that set)

Needs further investigation.

> > +
> > +DISTRO_EXTRA_RDEPENDS += "task-core-boot"
> > +DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
> > +
> > +IMAGE_FEATURES ?= ""
> >
> Has a var with ?= assignment of an empty string any meaning. Thought an
> empty string would be the default.

No, its not.

> > +
> > +# This is a list of packages that are used by the build system to build
> > the distribution, they are not
> > +# directly part of the distribution.
> > +HOSTTOOLS_WHITELIST_GPLv3 ?= ""
> > +WHITELIST_GPLv3 ?= "less"
> >
> I'm not sure why less is listed in the line above:
> the less license is not gpl (at least not less 443)
> 
> 
> > +LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc
> > gcc-runtime"
> > +
> > +# This is a list of packages that require a commercial license to ship
> > +# product. If shipped as part of an image these packages may have
> > +# implications so they are disabled by default
> > +COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"
> > +COMMERCIAL_AUDIO_PLUGINS ?= ""
> > +# COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad
> > gst-plugins-ugly-mpegaudioparse"
> > +COMMERCIAL_VIDEO_PLUGINS ?= ""
> > +# COMMERCIAL_VIDEO_PLUGINS ?= "gst-plugins-ugly-mpeg2dec
> > gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
> > +COMMERCIAL_QT ?= ""
> > +# COMMERCIAL_QT ?= "qmmp"
> > +# Set of common licenses used for license.bbclass
> > +COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
> >
> maybe the above could be in a separate license.inc file or so.

Possibly, setting these to defaults is good though.

> > +
> > +BB_GENERATE_MIRROR_TARBALLS ??= "0"
> >
> local.conf.sample ?

I regard local.conf.sample as things a new user cares about. I don't
think this fits that category. Its here pending the creation of a more
"advanced settings" version of local.conf.sample we've talked about
being created.

Cheers,

Richard




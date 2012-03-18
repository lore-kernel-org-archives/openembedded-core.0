Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9PCV-0003C0-OS
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 00:07:48 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2012 15:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="122274604"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2012 15:58:56 -0700
Message-ID: <4F6668AF.1020106@linux.intel.com>
Date: Sun, 18 Mar 2012 15:58:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
	<A4E92037-A984-4CCF-BDCF-E1020891494E@dominion.thruhere.net>
	<1332076702.5077.10.camel@ted>
In-Reply-To: <1332076702.5077.10.camel@ted>
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Sun, 18 Mar 2012 23:07:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2012 06:18 AM, Richard Purdie wrote:
> On Fri, 2012-03-16 at 14:53 +0100, Koen Kooi wrote:
>> Op 16 mrt. 2012, om 14:45 heeft Wang, Shane het volgende geschreven:
>>
>>> I built those recipes separately, built core-image-sato on qemux86
>> and qemuarm, and launched the image in the emulator and ran some
>> applications.
>>
>> So no checks for buildhistory changes and upgrade paths.
>
> For what its worth, several of us have been testing the pending patches
> rather heavily since they were proposed. They're not without issue but I
> think we've tracked down the problematic patches and those won't be
> going in (automake, pciaccess, alsa-utils).
>
> I know Saul is doing some proper testing but I also did some, mainly to
> experiment with buildhistory for myself. I'm hoping to see a lot more
> use of buildhistory by people submitting patches. I've attached the cut
> down output of this patch series and a lot of other pending patches
> against current master.
>
> In the interests of full disclosure, I did apply
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=099d5a1d4a41e6530d487ed08ab56d1b299b6142
> when generating this log. This:
>
> a) Hides RRECOMMENDS/RDEPENDS changes if its only a version change and
> the version increased.
> b) Ignores FILELIST changes in -dbg packages, they seem to contain the
> version and just aren't interesting.
>
> and I'll be talking with Paul about integrating some filtering properly
> rather than my hacks :).
>
> There is still a lot of noise in the diff but this helps a lot. I did
> scan through it and the ones that looked like they merited further
> investigation to me were:
>
> packages/i586-poky-linux/dbus-glib/dbus-glib-dev: FILELIST: removed "/usr/include/dbus-1.0/dbus/dbus-glib-error-enum.h"
> packages/i586-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf_xlib-2.0.so.0.2400.0 /usr/lib/libgdk_pixbuf_xlib-2.0.so.0 /usr/lib/libgdk_pixbuf-2.0.so.0.2400.0" added "/usr/lib/libgdk_pixbuf-2.0.so.0.2400.1"
This is packaged in the build I have, not sure what you are basing this one.

> packages/i586-poky-linux/gdk-pixbuf/gdk-pixbuf: RDEPENDS: removed "libxcb (>= 1.8) libx11-trim (>= 1.4.4) libxdmcp (>= 1.1.0) libxau (>= 1.0.6)"
> packages/i586-poky-linux/libarchive/libarchive-bin: RDEPENDS: added "libxml2 (>= 2.7.8) libcrypto (>= 1.0.0g)"
> packages/i586-poky-linux/libarchive/libarchive: RDEPENDS: added "libcrypto (>= 1.0.0g)"
> packages/i586-poky-linux/xf86-video-vmware/xf86-video-vmware: FILELIST: removed "/usr/lib/xorg/modules/drivers/vmwlegacy_drv.so"

This one also seems to be packaged correctly on my build.

I pushed my build history of a master world build followed by a MUT 
build to sgw/buildhistory if you want to look at it further.

Sau!


> packages/i586-poky-linux/xf86-video-vmware/xf86-video-vmware: RDEPENDS: removed "libdrm (>= 2.4.31)"
> packages/x86_64-nativesdk-pokysdk-linux/qemu-nativesdk/qemu-nativesdk: RDEPENDS: removed "libcurl (>= 7.23.1)"
> packages/i586-poky-linux/python-pycurl/python-pycurl: RDEPENDS: removed "libgcrypt (>= 1.5.0)"
> packages/i586-poky-linux/dbus-glib/dbus-glib: RDEPENDS: added "zlib (>= 1.2.6)"
> packages/i586-poky-linux/gypsy/gypsy: RDEPENDS: added "zlib (>= 1.2.6)"
> packages/i586-poky-linux/libgalago/libgalago: RDEPENDS: added "zlib (>= 1.2.6)"
> packages/i586-poky-linux/python-dbus/python-dbus: RDEPENDS: added "zlib (>= 1.2.6)"
>
> but all things considered, its not a bad diff given the number of
> upgrades. There was also a fair bit of churn in gstreamer:
>
> packages/i586-poky-linux/clutter-gst-1.8/clutter-gst-1.8: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugin-bluetooth/gst-plugin-bluetooth: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-bad/gst-plugins-bad-meta: RDEPENDS: added "libgstcodecparsers-0.10 libgstbasecamerabinsrc-0.10"
> packages/i586-poky-linux/gst-plugins-bad/libgstsignalprocessor-0.10: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-adder: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-alsa: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-audioconvert: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-decodebin: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-decodebin2: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-encodebin: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-ivorbisdec: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-ogg: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-typefindfunctions: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-volume-dev: RRECOMMENDS: added "libgstpbutils-0.10-dev"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-volume: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-vorbis: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/libgstaudio-0.10: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-base/libgstpbutils-0.10: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-base/libgstriff-0.10: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-apetag: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-audiofx: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-audioparsers: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-avi: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-cutter: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-deinterlace: PKGSIZE changed from 117444 to 142852 (+21%)
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-equalizer: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-flac: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-flv: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-id3demux: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-interleave: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-isomp4: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-matroska: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-multifile: RDEPENDS: added "libgstvideo-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-oss4audio: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-ossaudio: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-png: RDEPENDS: added "libgstvideo-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-pulse: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-replaygain: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-rtp: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-spectrum: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-speex: RDEPENDS: added "libgstinterfaces-0.10 (>= 0.10.36) libgstaudio-0.10 (>= 0.10.36) libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-wavenc: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
> packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-wavparse: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
>
> but I'm less worried about these changes and trust shlibs to get this right.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9G8m-0006hZ-Qu for openembedded-core@lists.openembedded.org;
	Sun, 18 Mar 2012 14:27:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2IDIUxa022757
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:18:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18260-07 for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:18:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2IDIK1F022749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:18:22 GMT
Message-ID: <1332076702.5077.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 18 Mar 2012 13:18:22 +0000
In-Reply-To: <A4E92037-A984-4CCF-BDCF-E1020891494E@dominion.thruhere.net>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
	<A4E92037-A984-4CCF-BDCF-E1020891494E@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sun, 18 Mar 2012 13:27:21 -0000
X-Groupsio-MsgNum: 19110
Content-Type: multipart/mixed; boundary="=-YrwykUWESlDt96LC2xhx"

--=-YrwykUWESlDt96LC2xhx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-16 at 14:53 +0100, Koen Kooi wrote:
> Op 16 mrt. 2012, om 14:45 heeft Wang, Shane het volgende geschreven:
> 
> > I built those recipes separately, built core-image-sato on qemux86
> and qemuarm, and launched the image in the emulator and ran some
> applications.
> 
> So no checks for buildhistory changes and upgrade paths.

For what its worth, several of us have been testing the pending patches
rather heavily since they were proposed. They're not without issue but I
think we've tracked down the problematic patches and those won't be
going in (automake, pciaccess, alsa-utils).

I know Saul is doing some proper testing but I also did some, mainly to
experiment with buildhistory for myself. I'm hoping to see a lot more
use of buildhistory by people submitting patches. I've attached the cut
down output of this patch series and a lot of other pending patches
against current master.

In the interests of full disclosure, I did apply
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=099d5a1d4a41e6530d487ed08ab56d1b299b6142
when generating this log. This:

a) Hides RRECOMMENDS/RDEPENDS changes if its only a version change and
the version increased.
b) Ignores FILELIST changes in -dbg packages, they seem to contain the
version and just aren't interesting.

and I'll be talking with Paul about integrating some filtering properly
rather than my hacks :).

There is still a lot of noise in the diff but this helps a lot. I did
scan through it and the ones that looked like they merited further
investigation to me were:

packages/i586-poky-linux/dbus-glib/dbus-glib-dev: FILELIST: removed "/usr/include/dbus-1.0/dbus/dbus-glib-error-enum.h"
packages/i586-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf_xlib-2.0.so.0.2400.0 /usr/lib/libgdk_pixbuf_xlib-2.0.so.0 /usr/lib/libgdk_pixbuf-2.0.so.0.2400.0" added "/usr/lib/libgdk_pixbuf-2.0.so.0.2400.1"
packages/i586-poky-linux/gdk-pixbuf/gdk-pixbuf: RDEPENDS: removed "libxcb (>= 1.8) libx11-trim (>= 1.4.4) libxdmcp (>= 1.1.0) libxau (>= 1.0.6)"
packages/i586-poky-linux/libarchive/libarchive-bin: RDEPENDS: added "libxml2 (>= 2.7.8) libcrypto (>= 1.0.0g)"
packages/i586-poky-linux/libarchive/libarchive: RDEPENDS: added "libcrypto (>= 1.0.0g)"
packages/i586-poky-linux/xf86-video-vmware/xf86-video-vmware: FILELIST: removed "/usr/lib/xorg/modules/drivers/vmwlegacy_drv.so"
packages/i586-poky-linux/xf86-video-vmware/xf86-video-vmware: RDEPENDS: removed "libdrm (>= 2.4.31)"
packages/x86_64-nativesdk-pokysdk-linux/qemu-nativesdk/qemu-nativesdk: RDEPENDS: removed "libcurl (>= 7.23.1)"
packages/i586-poky-linux/python-pycurl/python-pycurl: RDEPENDS: removed "libgcrypt (>= 1.5.0)"
packages/i586-poky-linux/dbus-glib/dbus-glib: RDEPENDS: added "zlib (>= 1.2.6)"
packages/i586-poky-linux/gypsy/gypsy: RDEPENDS: added "zlib (>= 1.2.6)"
packages/i586-poky-linux/libgalago/libgalago: RDEPENDS: added "zlib (>= 1.2.6)"
packages/i586-poky-linux/python-dbus/python-dbus: RDEPENDS: added "zlib (>= 1.2.6)"

but all things considered, its not a bad diff given the number of
upgrades. There was also a fair bit of churn in gstreamer:

packages/i586-poky-linux/clutter-gst-1.8/clutter-gst-1.8: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugin-bluetooth/gst-plugin-bluetooth: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-bad/gst-plugins-bad-meta: RDEPENDS: added "libgstcodecparsers-0.10 libgstbasecamerabinsrc-0.10"
packages/i586-poky-linux/gst-plugins-bad/libgstsignalprocessor-0.10: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-adder: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-alsa: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-audioconvert: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-decodebin: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-decodebin2: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-encodebin: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-ivorbisdec: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-ogg: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-typefindfunctions: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-volume-dev: RRECOMMENDS: added "libgstpbutils-0.10-dev"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-volume: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/gst-plugins-base-vorbis: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/libgstaudio-0.10: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-base/libgstpbutils-0.10: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-base/libgstriff-0.10: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-apetag: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-audiofx: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-audioparsers: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-avi: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-cutter: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-deinterlace: PKGSIZE changed from 117444 to 142852 (+21%)
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-equalizer: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-flac: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-flv: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-id3demux: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-interleave: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-isomp4: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-matroska: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-multifile: RDEPENDS: added "libgstvideo-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-oss4audio: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-ossaudio: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-png: RDEPENDS: added "libgstvideo-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-pulse: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-replaygain: RDEPENDS: removed "libgstvideo-0.10 (>= 0.10.35)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-rtp: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-spectrum: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-speex: RDEPENDS: added "libgstinterfaces-0.10 (>= 0.10.36) libgstaudio-0.10 (>= 0.10.36) libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-wavenc: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"
packages/i586-poky-linux/gst-plugins-good/gst-plugins-good-wavparse: RDEPENDS: added "libgstpbutils-0.10 (>= 0.10.36)"

but I'm less worried about these changes and trust shlibs to get this right.

Cheers,

Richard


--=-YrwykUWESlDt96LC2xhx
Content-Type: application/x-bzip; name="hist.bz2"
Content-Disposition: attachment; filename="hist.bz2"
Content-Transfer-Encoding: base64

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
pwoSB8qFesA=

--=-YrwykUWESlDt96LC2xhx--

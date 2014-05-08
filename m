Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5F14860167;
	Thu,  8 May 2014 16:58:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 08 May 2014 09:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1012,1389772800"; d="scan'208";a="528653836"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.94])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2014 09:57:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 08 May 2014 17:57:54 +0100
Message-ID: <2287383.nOAQ2ykZqg@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <20140508161908.GQ30955@jama>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
	<20140508161908.GQ30955@jama>
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 16:58:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 08 May 2014 18:19:08 Martin Jansa wrote:
> On Thu, May 08, 2014 at 04:07:19PM +0100, Paul Eggleton wrote:
> > On Thursday 08 May 2014 15:48:40 Burton, Ross wrote:
> > > Hi all,
> > > 
> > > Sorry for the cross-post but I want this to have a wide audience.
> > > 
> > > For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> > > meta-multimedia, and ensure everything in oe-core has ported to
> > > GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> > > unmaintained so we don't need to be shipping both versions anymore.
> > > 
> > > Everyone in agreement?  Should I expect any hate mail over this?
> > 
> > +1
> > 
> > The next question is does that mean for the "old" libav (which gst-ffmpeg
> > depends upon), do we move that as well or drop it?
> 
> libav was migrated to oe-core quite recently and there is couple of
> recipes in meta-oe, meta-webserver depending on it/ffmpeg so moving to
> meta-multimedia wouldn't be very easy.
> 
> meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb:DEPENDS = "libpng libav
> libsndfile1" meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:DEPENDS =
> "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec
> ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack
> libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3
> libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0
> libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib
> libtinyxml libmad"
> meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb:DEPENDS =
> "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl
> sqlite bzip2 pulseaudio" meta-multimedia/recipes-multimedia/vlc/vlc.inc:  
> faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib libdvdcss \
> 
> meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb:DEPENDS =
> "flac libav jpeg sqlite3 libexif libogg libid3tag"
> meta-oe/recipes-support/opencv/opencv_2.4.bb:PACKAGECONFIG ??= "eigen gtk
> jpeg libav png tiff v4l"
> meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb:PACKAGECONFIG[avformat] =
> "--with-libavformat,--without-libavformat,libav"
> meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb:DEPENDS = "libav"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:DEPENDS = "libvpx
> libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
> 
> meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb:PACKAGECONFIG[ffmpe
> g] = "--with-ffmpeg,--without-ffmpeg,libav"
> 
> But I would like to see migration to libav-9 which currently has negative
> D_P (mplayer2 already depends on 9*, but there are few recipes which fails
> with libav-9 too - see earlier world builds for list).

Yes, I'm just talking about libav 0.8 here - libav 9 would remain where it is. 
That might still be problematic though given that their PN is the same. I'm 
open to better suggestions, but I think we have to do *something* here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


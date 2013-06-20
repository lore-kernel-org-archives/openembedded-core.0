Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 138696AD44;
	Thu, 20 Jun 2013 10:51:21 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e12so4563890vbg.16
	for <multiple recipients>; Thu, 20 Jun 2013 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=BDXnOuANH8h74hDn5hF8O6FJtfDWPUBgVYxKBLvvwgY=;
	b=Ijb8HfyBwC3W+fUaW+qRQM72w5sLQBLGdldGxmVqYpTrWBsOBvi+qJ7KRs9qvPIhGQ
	RQ0PtHbXpMEXOGpSAIXn27wr54hS/lvug+VGX+exfCphsEq/MKiSpYwfJfZWA7cmZne8
	QGHZOwCEkj9NrvFOpRlGYruPJ/z3W6OS7IGxFHw6eJUNDGW9+5Hs04Pe7ugnT1d+dwDN
	N7YNoWUi4h8MnJG7JitoCuSMUyizLTGAREq0kL1hLaca/IG24igLZ1VUvnav16ECiZG9
	z1X8cDopIEAvWtAudI711sm0eZM+R/T2IwUnuBiJTxJhon9UhDQbnd7lTvaVSTNtEvAJ
	x2ZQ==
X-Received: by 10.52.121.42 with SMTP id lh10mr2278262vdb.39.1371725482768;
	Thu, 20 Jun 2013 03:51:22 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Thu, 20 Jun 2013 03:50:41 -0700 (PDT)
In-Reply-To: <1886786.nfT3SfR8Pm@helios>
References: <20121213174202.GE3356@jama.jama.net>
	<CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
	<3004132.t7dk9348rv@helios> <1886786.nfT3SfR8Pm@helios>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 20 Jun 2013 11:50:41 +0100
X-Google-Sender-Auth: 9yTCaOyf7zL2giVYT7sjgVSvQyk
Message-ID: <CANyK_8f+tsurm4_5GrdiXwEkak70YAhn3t51roeRydCTx9Mbcw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Thu, 20 Jun 2013 10:51:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 June 2013 11:25, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Thursday 20 June 2013 11:16:37 Paul Eggleton wrote:
>> To be honest I think ENTERPRISE_DISTRO needs to go. It's not even clear what
>> it should mean, and it's not consistently implemented. For things we want
>> to be optional we have PACKAGECONFIG; for items that have licensing
>> requirements that might be troublesome in certain deployments we have
>> LICENSE_FLAGS, and LICENSE_FLAGS
>
> Sorry, that should have read "and LICENSE_FLAGS already has a mechanism to
> prevent a recipe being built based on the current settings and report why."
>

I decided to do a quick grep. "ENTERPRISE_DISTRO" isn't found at all
in openembedded-core, and in meta-openembedded it's just in the
following places, after I've converted mplayer2 to using PACKAGECONFIG
instead.

./meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb:DEPENDS
= "virtual/libsdl flac libmikmod libvorbis
${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
./meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb:EXTRA_OECONF
= "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor
${@base_conditional('ENTERPRISE_DISTRO', '1', '',
'--enable-music-mp3-mad-gpl', d)} LIBS=-L${STAGING_LIBDIR}"
./meta-oe/recipes-multimedia/libav/libav.inc:DEPENDS = "x264
virtual/libsdl zlib libogg libvorbis libvpx libtheora
${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
./meta-multimedia/recipes-multimedia/vlc/vlc.inc:
${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
liba52 mpeg2dec', d)}"
./meta-multimedia/recipes-multimedia/vlc/vlc.inc:
${@base_conditional('ENTERPRISE_DISTRO', '1', \
./meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb:
${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad lame
libid3tag', d)}"
./meta-efl/recipes-efl/e17/enjoy_svn.bb:DEPENDS += "gst-plugins-good
${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly',
d)}"
./meta-efl/recipes-efl/e17/enjoy_svn.bb:
${@base_conditional('ENTERPRISE_DISTRO', '1', '',
'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \

So if we do want to get rid of this, it shouldn't be too much work.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


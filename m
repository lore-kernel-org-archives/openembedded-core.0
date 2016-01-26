Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8F10B77168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 04:59:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 25 Jan 2016 20:59:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,348,1449561600"; d="scan'208";a="36191077"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2016 20:59:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jan 2016 17:59:53 +1300
Message-ID: <2466348.b8R0cso7fs@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-301.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <CAMKF1sqqU+2DvonXYAk73Bbt_MSkQ4yB5U+_ExTaxod6T63d2g@mail.gmail.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
	<3155839.Pu1rtcj5m9@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqqU+2DvonXYAk73Bbt_MSkQ4yB5U+_ExTaxod6T63d2g@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] devtool: add configure-help subcommand
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
X-List-Received-Date: Tue, 26 Jan 2016 05:00:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 25 Jan 2016 22:27:27 Khem Raj wrote:
> On Mon, Jan 25, 2016 at 10:21 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Tue, 26 Jan 2016 16:17:39 Paul Eggleton wrote:
> >> Hi Khem,
> >> 
> >> On Mon, 25 Jan 2016 22:14:09 Khem Raj wrote:
> >> > > On Jan 25, 2016, at 9:53 PM, Paul Eggleton
> >> > > <paul.eggleton@linux.intel.com>
> >> > > wrote:
> >> > > 
> >> > > When you need to set EXTRA_OECONF for a recipe, you need to know what
> >> > > options the configure script actually supports; the configure script
> >> > > however is only accessible from within a devshell and (at least in
> >> > > the
> >> > > case of autotooled software fetched from an SCM repository) may not
> >> > > actually exist until do_configure has run. Thus, provide a "devtool
> >> > > configure-help" subcommand that runs the configure script for a
> >> > > recipe
> >> > > with --help and shows you the output through a pager (e.g. less),
> >> > > prefaced by a header describing the current options being specified.
> >> > > 
> >> > > There is basic support for autotools, cmake and bare configure
> >> > > scripts.
> >> > > The cmake support is a little hacky since cmake doesn't really have a
> >> > > concise help option that lists user-defined knobs (without actually
> >> > > running through the configure process), however that being a design
> >> > > feature of cmake there's not much I can think of to do about that at
> >> > > the moment.
> >> > 
> >> > this option is autotools specific. We need to convey this precisely.
> >> > may
> >> > be
> >> > involve autotools in the option name or something
> >> 
> >> Whilst not all non-autoconf configure scripts provide a --help option,
> >> some
> >> do. ffmpeg/libav is one example (and one where you really do need to see
> >> the output since there are a lot of options...)
> > 
> > I meant to add, even if configure --help doesn't work (or there is no
> > configure script at all) the header this subcommand prints will work with
> > any recipe provided that do_configure is actually implemented and
> > contains some actual commands as opposed to calls to some other function.
> 
> my worry is it being associated to do_configure, and we know that only
> a subset ( although a large one) is only using autotools but not all.
> So think about avoiding that confusion.

I'm not terribly convinced there could be much confusion. FWIW, I just looked 
through the other recipes we have in OE-Core that have a call to a configure 
script  that don't use autoconf (man, zlib, x264, v86d, ed, libpostproc); the 
configure scripts for all of these at least produce some useful output when 
called with --help. I then took a look at meta-oe (the layer), and checked the 
following recipes:

* concurrencykit - works
* ddrescue - works
* fio - works
* libvpx - works
* lzip - works
* nodejs - works
* mg - works (no options, but message is sensible)
* terminus-font - configure script is supplied without the execute bit set but
  does support --help
* iscsi-initiator-utils - configure script is in a subdir so isn't found, but
  does support --help
* netkit-rsh - works
* netkit-rpc - works
* netkit-telnet - works
* netkit-tftp - works
* netkit-rusers - works
* netkit-rwho - works
* netmap - configure script is in a subdir so isn't found, but does support 
  --help
* ntimed - configure script is dumb and takes no options at all
* tvheadend - works
* mozjs - seems to break devtool modify, but configure script does support 
  --help

So there are some minor bugs to fix, but of those recipes I tested there is a 
grand total of 1 script that doesn't support --help. Honestly I think if a 
configure script exists it's reasonable to assume that 
--help is going to print something useful; even if it doesn't there shouldn't 
be any major harm and you're still going to get a printout of the do_configure 
value in which you'll be able to see what options are currently passed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


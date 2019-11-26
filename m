Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 36C7A7FCC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 14:49:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2019 06:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="359183626"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by orsmga004.jf.intel.com with ESMTP; 26 Nov 2019 06:49:21 -0800
To: Phil Blundell <pb@pbcl.net>
References: <20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
	<fc3a26d7c77f2781cbad28cdb8fc71995ab5e327.camel@linuxfoundation.org>
	<20191121135942.h776ktsg6jwow4sj@pbcl.net>
	<32d99e6a-b196-6d1d-dac2-a0e1ccfa2c75@intel.com>
	<20191126115954.f4mlttmrp2ieahax@pbcl.net>
	<20191126120615.kknhw4cwolwfadnf@pbcl.net>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5d6a0cf0-3751-a961-215d-4dfe0344c51e@intel.com>
Date: Tue, 26 Nov 2019 14:49:20 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126120615.kknhw4cwolwfadnf@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Tue, 26 Nov 2019 14:49:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 26/11/2019 12:06, Phil Blundell wrote:
> On Tue, Nov 26, 2019 at 12:59:54PM +0100, Phil Blundell wrote:
>> On Mon, Nov 25, 2019 at 12:07:25PM +0000, Ross Burton wrote:
>>> If you can send a patch sooner rather than later for lrzsz to fix the build
>>> with modern gettext then that would be *awesome*, as this recipe is the sole
>>> blocker.
>>
>> This works for me and should resolve your immediate issue.  We can think about
>> a better long-term solution separately.
> 
> Incidentally, "gettextize -f" would have taken care of the majority of this.  In
> autotools.bbclass we have:
> 
> 		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> 			# We'd call gettextize here if it wasn't so broken...
> 
> and we then proceed to do a slightly half-baked partial version of what
> gettextize would have done.  This results in using the Makefile.in.in from
> the version of gettext that's in the sysroot, but without any of the other
> bits that gettextize would have copied and this is arguably the worst of
> all possible outcomes.  Actually running gettextize is indeed problematic
> because it has a tendency to require you to press RETURN on the terminal
> (and it reads from /dev/tty to avoid any attempt to subvert this check
> by redirecting stdin!) but I think one could argue that if we can't/won't
> run the full gettextize then we oughtn't to be messing around with any
> of the files that it installs and we should rely on the ones that the
> upstream package shipped.  That may not always work either, but I have at
> least half a suspicion that the current autotools.bbclass behaviour is
> creating as many problems as it solves.

gettextize is dead, autopoint is the glorious future, and I've a branch 
that is practically complete implementing that (ross/autopoint).

Ross


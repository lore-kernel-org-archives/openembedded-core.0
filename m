Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56060731AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:48:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 07:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="876543078"
Received: from lleszczu-mobl.igk.intel.com (HELO [10.252.17.67])
	([10.252.17.67])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2015 07:48:44 -0800
User-Agent: Microsoft-MacOutlook/0.0.0.151105
Date: Fri, 18 Dec 2015 17:48:43 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <B975AE11-BF84-47DA-BD21-7C2767267918@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/5] kernel.bbclass: copy .config instead of
	moving
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1450427985-12504-3-git-send-email-markus.lehtonen@linux.intel.com>
	<1450441360.8461.37.camel@linuxfoundation.org>
	<19CCFDE4-E8FC-4B6A-BFD4-BCB6E14922C8@linux.intel.com>
	<1450448292.8461.52.camel@linuxfoundation.org>
In-Reply-To: <1450448292.8461.52.camel@linuxfoundation.org>
Mime-version: 1.0
Subject: Re: [PATCH 2/5] kernel.bbclass: copy .config instead of moving
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
X-List-Received-Date: Fri, 18 Dec 2015 15:48:46 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 18/12/15 16:18, "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

>On Fri, 2015-12-18 at 14:39 +0200, Markus Lehtonen wrote:
>> On 18/12/15 14:22, "Richard Purdie" <
>> richard.purdie@linuxfoundation.org> wrote:
>> > On Fri, 2015-12-18 at 10:39 +0200, Markus Lehtonen wrote: 
>> > >  	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! 
>> > > -f
>> > > "${B}/.config" ]; then
>> > > -		mv "${S}/.config" "${B}/.config"
>> > > +		cp "${S}/.config" "${B}/.config"
>> > >  	fi
>> > >  
>> > >  	# Copy defconfig to .config if .config does not exist.
>> > > This
>> > > allows
>> > 
>> > I'm not sure about this, doesn't this trigger the kernel to see
>> > ${S} as
>> > being 'dirty' and cause other issues when you try and do out of
>> > tree
>> > builds with it?
>> 
>> That shouldn't be a problem as the kernel .gitignore ignores .config
>> (or '.*' to be more specific). There are other tasks that make
>> changes to the kernel source tree, as well, like do_kernel_metadata.
>> 
>> 
>> > It also means we have two copies of "config" around which can end
>> > up
>> > being different and confuse users no end :(.
>> 
>> Yes, I must agree. What do you think if ${B}/.config would be a
>> symlink to ${S}/.config? I.e.
>> +               ln -s "${S}/.config" "${B}/.config"
>> 
>
>I think I'd prefer we move the file over the ${B} and then symlink from
>${S} since that way if its modified, its mostly likely to be done from
>${B} at least by the automated code?

Hmm, what I suggested is not good (at least on its own) because menuconfig moves .config to .config.old.

Symlinking from ${S} to ${B} is also problematic for the intended devtool use case because removing/cleaning ${B} also removes our .config. Back to the drawing board, I guess...


Thanks,
  Markus





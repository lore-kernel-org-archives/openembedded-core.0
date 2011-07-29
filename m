Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmqEq-00069C-JV
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 18:50:33 +0200
Received: by gxk3 with SMTP id 3so2762331gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8IYBYcAmhkWF11YpuicqMSl1yL8M4NSxlZk/a3pOwKI=;
	b=sTqdU2BeBpvL5zW4kTMoXi8K914KFWF+76Rpc7+PihBiMWdCw1c1h/rGFDKCcw2TtM
	FTd5eyLnJUK0za56RmLII2cxbev7xuJx5l9y4jIdD38wAAgkdVV2LKdpHpi0xZGURZUC
	9DoICHy3fC/4Qck3CW10hgB0J1Xpk6CJUypDA=
Received: by 10.68.33.105 with SMTP id q9mr2813351pbi.509.1311957724737;
	Fri, 29 Jul 2011 09:42:04 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v2sm2105717pbi.35.2011.07.29.09.42.04
	(version=SSLv3 cipher=OTHER); Fri, 29 Jul 2011 09:42:04 -0700 (PDT)
Message-ID: <4E32E2DB.2000201@gmail.com>
Date: Fri, 29 Jul 2011 09:42:03 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1311946098.30326.489.camel@phil-desktop>
In-Reply-To: <1311946098.30326.489.camel@phil-desktop>
Subject: Re: arm tune files status summary
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
X-List-Received-Date: Fri, 29 Jul 2011 16:50:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2011 06:28 AM, Phil Blundell wrote:
> There are quite a lot of different sub-threads going on at the moment
> regarding the various breakages associated with the recent arm tuning
> file patch.  Here's a summary of what I think are all the current issues
> and their status.
>
> 1. bogus PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} in bitbake.conf causing
> rootfs construction to fail.
>
> Paul and Koen both posted (essentially identical) patches for this and
> it looks as though Paul's has been applied.  So, the original breakage
> should be resolved but it isn't entirely clear what this line in
> bitbake.conf was trying to accomplish in the first place.  I think
> someone still needs to conduct an audit to establish whether there are
> any circumstances where PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} does
> need setting to ${TARGET_ARCH} and, if so, make that happen.
>
> 2. endianness confusion in armv5/armv6 tune files.
>
> I posted a patch for this.  It doesn't look like it's been applied yet
> but it's in the archives for anybody who wants it.  Only big-endian
> configs would be affected anyway and I think those are something of a
> fringe pursuit.

I am testing this patch

>
> 3. eglibc unbuildable on qemuarm
>
> This is happening because qemuarm selects arm926ejs tuning, which in
> turn selects armv5te, and the current arrangement of tune files forces
> Thumb-state on if you ask to tune for a T-variant architecture.  The old
> "ARM_INSTRUCTION_SET" variable which used to override the ISA selection
> seems not to be respected anymore.  This is unfortunate because there is
> assembler code in eglibc which isn't Thumb-1 aware and hence can't be
> built under -mthumb.
>
> A short-term workaround would be to hack tune-arm926ejs.inc to select
> the TUNE_FEATURES for armv5e rather than armv5te.  But this is clearly
> not a good solution in general and, other than changing the underlying
> policy of inferring ISA choice from architecture name, it's not obvious
> what the right way of solving it is.
>
> This particular issue causes sufficiently gross breakage that I would
> have expected it to show up on the Yocto autobuilder run before the
> patch was merged.  I'm not quite sure why it apparently didn't fail
> there but maybe the autobuilder doesn't actually test qemuarm at
> present.

I have posted a patch for this

>
> 4. can't build ARM-state code for ARMv4T architecture.
>
> This is another facet of the above; there is currently no way to say
> that you want to select -march=armv4t without also enabling -mthumb.
> This makes it impossible to build interworking-capable ARM-state code
> for v4T.

yeah this is kind of fundamental problem. We need to differentiate 
between having thumb feature and really using it.
>
> 5. cortex tuning not working
>
> Various of the cortex files had a spelling mistake which would cause the
> TUNE_FEATURES never to actually match anything.  This is a trivial fix
> and I sent a patch for it yesterday.  I don't think it's been merged
> yet.

I am testing this patch

>
> 6. distros no longer able to select ARM vs Thumb state either globally
> or per package

My thinking is that default should always be ARM mode and then distros
can say TUNE_FEATURES += "usethumb" then tune infra can check for both
i.e. having thumb in machines and distros asking for it before adding
-mthumb to CCARGS
>
> This is really another manifestation of the issue in #3.  But the point
> here isn't so much that builds are failing, rather that we seem to have
> lost the ability to have a single switch that the DISTRO can flip to
> build the entire world (or individual packages) as Thumb rather than
> ARM.  For Thumb-1 in particular the tradeoffs are sufficiently
> complicated that I don't think there is ever going to be a globally
> "right" answer.
>
> I think that's all I know of.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




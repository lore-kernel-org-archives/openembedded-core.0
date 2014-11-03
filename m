Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0BB7068F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 11:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA3BWLBS007768; Mon, 3 Nov 2014 11:34:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D_qDdHuCfq_X; Mon,  3 Nov 2014 11:34:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA3BYkoG007795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 3 Nov 2014 11:34:47 GMT
Message-ID: <1415014521.5111.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 03 Nov 2014 11:35:21 +0000
In-Reply-To: <54575DC6.8040403@topic.nl>
References: <5452486B.6070303@topic.nl> <1414691238.7649.70.camel@ted>
	<545750AE.6080300@topic.nl> <1415009059.5111.5.camel@ted>
	<54575DC6.8040403@topic.nl>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Weird ALTERNATIVES and staging conflict.
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
X-List-Received-Date: Mon, 03 Nov 2014 11:35:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2014-11-03 at 11:49 +0100, Mike Looijmans wrote:
> ﻿On 11/03/2014 11:04 AM, Richard Purdie wrote:
> > On Mon, 2014-11-03 at 10:53 +0100, Mike Looijmans wrote:
> >> ﻿On 10/30/2014 06:47 PM, Richard Purdie wrote:
> >>> On Thu, 2014-10-30 at 15:17 +0100, Mike Looijmans wrote:
> >>>> ﻿I have this base script that builds FPGA bitstreams:
> >>>>
> >>>> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image.inc
> >>>>
> >>>> Now you can have multiple recipes using it, and as such, it seemed a good idea
> >>>> to add these lines to that recipe:
> >>>>
> >>>> +ALTERNATIVE_${PN} = "fpga.bin bitstreams"
> >>>> +ALTERNATIVE_LINK_NAME[fpga.bin] = "${datadir}/fpga.bin"
> >>>> +ALTERNATIVE_TARGET[fpga.bin] = "${datadir}/fpga.bin"
> >>>> +ALTERNATIVE_LINK_NAME[bitstreams] = "${datadir}/bitstreams"
> >>>> +ALTERNATIVE_TARGET[bitstreams] = "${datadir}/bitstreams"
> >>>>
> >>>>
> >>>> This still resulted in staging conflicts.
> >>>
> >>> This isn't surprising since update-alternatives only works for target
> >>> systems. It is not designed for operating on the sysroot.
> >>
> >> I don't want these files in sysroot, I want them on target only.
> >
> > Ok, that makes things much easier.
> >
> >>>> But looking at the contents of the fake packages, the fpga.bin has been
> >>>> renamed by alternatives (as expected), and the symlink will be created after
> >>>> installing, so how come I still get this?
> >>>
> >>> The "staging" code uses the output of do_install directly and does
> >>> different things to the packaging code path. We've never had someone
> >>> with this problem before. Binaries in *bindir only get installed into
> >>> the sysroot in the -native case.
> >>>
> >>> I appreciate that tells you why it doesn't work and not how to fix it
> >>> but hopefully that helps a bit.
> >>
> >> If I understand you correctly, the problem is that the recipe is trying to
> >> install things in sysroot?
> >
> > Correct, by default ${datadir} is staged. The easiest way to handle this
> > may be to define your own sysroot_stage_all function (or
> > sysroot_stage_dirs) which just stages what you need, if anything.
> 
> In other words, make  sysroot_stage_all into a no-op?
> 
> I've been looking at the staging.bbclass, but that's basically the best I can 
> come up with.

I don't know what else your recipe may need. If you don't need to stage
anything into the sysroots, make it a no-op, yes.

Cheers,

Richard



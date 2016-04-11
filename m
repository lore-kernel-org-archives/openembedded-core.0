Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 89B0F70022
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 02:29:40 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5G00AC36X1XV30@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2016 21:29:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
	a=HihYlcsHAAAA:8 a=ANNU2rCkuA_pxXnGUy0A:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 456871e5; Mon, 11 Apr 2016 02:29:26 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B003D161F8A; Sun,
	10 Apr 2016 22:29:25 -0400 (EDT)
Date: Sun, 10 Apr 2016 22:29:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Yang <liezhi.yang@windriver.com>
Message-id: <20160411022925.GM16135@denix.org>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
	<20160410190630.GI16135@denix.org> <570AFB23.9070507@windriver.com>
	<CABcZANk80jGAHW4uUFqoF2DkMqh7wL2TpOVvQbo4-w+XXmMQwQ@mail.gmail.com>
	<570B07DD.3080309@windriver.com>
MIME-version: 1.0
In-reply-to: <570B07DD.3080309@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 11 Apr 2016 02:29:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 11, 2016 at 10:11:41AM +0800, Robert Yang wrote:
> On 04/11/2016 09:56 AM, Christopher Larson wrote:
> >On Sun, Apr 10, 2016 at 6:17 PM Robert Yang <liezhi.yang@windriver.com
> ><mailto:liezhi.yang@windriver.com>> wrote:
> >
> >
> >
> >    On 04/11/2016 03:06 AM, Denys Dmytriyenko wrote:
> >     > On Sun, Apr 10, 2016 at 07:14:56AM -0700, Robert Yang wrote:
> >     >> It mismatched such as qemux86 and qemux86-64 which was incorrect, for
> >     >> example:
> >     >> COMPATIBLE_MACHINE = "(qemux86)"
> >     >
> >     > That will match qemux86 and qemux86-64 and is by design! It's a regular
> >
> >    I'm afraid no, please see my last reply, for others such as
> >    MACHINE_OVERRIDES, they never design to work in such a way, so I don't
> >    think that COMPATIBLE_MACHINE should work in this way. If you really
> >    want to match more, I think that you can set it as "(qemux86.*)" or
> >    something familiar.
> >
> >
> >That's an apples and oranges comparison. MACHINEOVERRIDES is part of OVERRIDES,
> >which has *completely* different semantics than COMPATIBLE_*. COMPATIBLE_MACHINE
> >is a regex variable more like BBMASK than anything else, and it's been that way
> >since we introduced it. OVERRIDES has nothing to do with regular expressions.

I completely agree with Chris here! And Robert, what is with this "I think it 
should work this way" reasoning? I'm arguing with you in another thread 
exactly due to this, where your only explanation was "I think that one recipe 
should only have one -dev package, I'm not sure whether this is right or not" 
and hence you summarize "it should"...


> Since introduced ? I did a grep in oe-core and meta-openembedded, it seems
> that no ?

Not really sure what you are trying to say here... Are you arguing that it was 
never used as a regular expression? I beg to differ and I can provide multiple 
examples for that:

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb#n8
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/images/arago-console-image.bb;hb=HEAD#l6

It was like that for 15+ years, since OpenEmbedded Classic days...


> In oe-core:
> 
> $ grep 'COMPATIBLE_MACHINE.*qemux86' meta/recipes* -r
> linux-yocto_4.4.bb:COMPATIBLE_MACHINE =
> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86)"
> linux-yocto-dev.bb:COMPATIBLE_MACHINE =
> "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
> linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86)"
> linux-yocto-rt_4.1.bb:COMPATIBLE_MACHINE =
> "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> linux-yocto-rt_4.4.bb:COMPATIBLE_MACHINE =
> "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> linux-yocto_4.1.bb:COMPATIBLE_MACHINE =
> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> 
> In meta-openembedded:
> vboxguestdrivers_4.3.30.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
> 
> We can see that the only one sets qemux86 but no set qemux86-64 is
> linux-yocto-tiny:
> COMPATIBLE_MACHINE = "(qemux86)"

Do you know that the world doesn't end with oe-core and meta-oe?


> And it really doesn't work with qemux86-64.

Well, then fix it by setting it to "qemu86$"

-- 
Denys


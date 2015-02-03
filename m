Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B677E606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:05:35 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1315YWa005990; Mon, 2 Feb 2015 19:05:34 -0600
Received: from weregild ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015020219053459-668351 ;
	Mon, 2 Feb 2015 19:05:34 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Notmuch/0.19 (http://notmuchmail.org) Emacs/24.4.2
	(x86_64-unknown-linux-gnu)
Date: Mon, 02 Feb 2015 19:05:34 -0600
Message-ID: <87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/02/2015 07:05:34 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/02/2015 07:05:34 PM,
	Serialize complete at 02/02/2015 07:05:34 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-02_05:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Tue, 03 Feb 2015 01:05:41 -0000
Content-Type: text/plain

Paul Eggleton <paul.eggleton@linux.intel.com> writes:

> On Thursday 29 January 2015 03:21:31 Richard Tollerton wrote:
>> Martin Jansa <martin.jansa@gmail.com> writes:
>> > On Thu, Jan 08, 2015 at 01:01:55PM +0100, Martin Jansa wrote:
>> > > On Wed, Jan 07, 2015 at 03:12:56PM +0100, Martin Jansa wrote:
>> > > > On Fri, Dec 19, 2014 at 06:08:41PM +0000, git@git.openembedded.org 
> wrote:
>> > > > > Module: openembedded-core.git
>> > > > > Branch: master
>> > > > > Commit: 89a29a3ad0742cd713e739d3d460be7711966679
>> > > > > URL:   
>> > > > > http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=89a
>> > > > > 29a3ad0742cd713e739d3d460be7711966679
>> > > > > 
>> > > > > Author: Richard Tollerton <rich.tollerton@ni.com>
>> > > > > Date:   Fri Dec 12 13:34:00 2014 -0600
>> > > > > 
>> > > > > font-util: Fix incorrect PKG_CONFIG_PATH
>> > > > > 
>> > > > > PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
>> > > > > /usr/lib/pkgconfig is always checked as a fallback; however,
>> > > > > PKG_CONFIG_PATH is currently (incorrectly) set to
>> > > > > /usr/lib/pkg-config in
>> > > > > the sysroot, which doesn't exist. On host distros where the font
>> > > > > encoding maps are stored under a different path than OE, this will
>> > > > > break
>> > > > > font builds, because ucs2any will attempt to read the sysroot's
>> > > > > encoding
>> > > > > maps with the host paths.
>> > > > 
>> > > > ^ Is this description of what the patch is supposed to fix or expected
>> > > > side-effect of this change?
>> > > > 
>> > > > Because all font recipes and meta-oe are failing since this change
>> > > > with
>> > > > errors like this:
>> > > > 
>> > > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bi
>> > > > n/ucs2any: Can't read mapping file
>> > > > '/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/s
>> > > > hare/fonts/X11/util/map-ISO8859-1': No such file or directory!
>> > > > 
>> > > > See http://www.openembedded.org/wiki/Bitbake_World_Status
>> > > 
>> > > I can confirm that reverting this patch fixes font-* recipes
>> > > http://lists.openembedded.org/pipermail/openembedded-core/2015-January/1
>> > > 00523.html> 
>> > Ping
>> 
>> ACK. Sorry, I could've sworn I saw the commit get reverted on
>> master-next, so I figured this was a lower priority than I indicated in
>> my previous reply.
>> 
>> This build is broken because my patchset was only partially committed.
>> "font-util: Fix incorrect PKG_CONFIG_PATH" (the patch you reference
>> above) was patch 2/3, but patches 1/3 "font-util: remove MAPFILES_PATH
>> override" and 3/3 "xorg-font-common: fix sysroot injection for encoding
>> maps" appear to have never been committed. See original thread at e.g.
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/58846.
>> 
>> Could you try rebuilding with those other two patches?
>
> If these did indeed get missed, could you please rebase them on top of master 
> and resend? Then we can resolve this once and for all.

Done (and sent), and my apologies, because this exercise has made clear
that I was wrong in several of the details here: None of the three
patches were committed; I was confusing one of them with 89a29a3a, which
was from a separate email. The confusion originated in 89a29a3a having
been committed after I had already withdrawn it, which I forgot about
over the holidays.

So, to summarize: I believe that applying all three patches of
"xorg-font: stop trying to use build machine's encoding maps" should fix
the builds, except for the font-util dependency described in that cover
letter, which I will submit patches for in meta-oe.

> Thanks,
> Paul
>
> -- 
>
> Paul Eggleton
> Intel Open Source Technology Centre

-- 
Richard Tollerton <rich.tollerton@ni.com>


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 784D1606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 18:57:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2015 10:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,507,1418112000"; d="scan'208";a="646288366"
Received: from bbodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.158])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2015 10:57:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Date: Mon, 02 Feb 2015 18:57:09 +0000
Message-ID: <3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 02 Feb 2015 18:57:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 29 January 2015 03:21:31 Richard Tollerton wrote:
> Martin Jansa <martin.jansa@gmail.com> writes:
> > On Thu, Jan 08, 2015 at 01:01:55PM +0100, Martin Jansa wrote:
> > > On Wed, Jan 07, 2015 at 03:12:56PM +0100, Martin Jansa wrote:
> > > > On Fri, Dec 19, 2014 at 06:08:41PM +0000, git@git.openembedded.org 
wrote:
> > > > > Module: openembedded-core.git
> > > > > Branch: master
> > > > > Commit: 89a29a3ad0742cd713e739d3d460be7711966679
> > > > > URL:   
> > > > > http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=89a
> > > > > 29a3ad0742cd713e739d3d460be7711966679
> > > > > 
> > > > > Author: Richard Tollerton <rich.tollerton@ni.com>
> > > > > Date:   Fri Dec 12 13:34:00 2014 -0600
> > > > > 
> > > > > font-util: Fix incorrect PKG_CONFIG_PATH
> > > > > 
> > > > > PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
> > > > > /usr/lib/pkgconfig is always checked as a fallback; however,
> > > > > PKG_CONFIG_PATH is currently (incorrectly) set to
> > > > > /usr/lib/pkg-config in
> > > > > the sysroot, which doesn't exist. On host distros where the font
> > > > > encoding maps are stored under a different path than OE, this will
> > > > > break
> > > > > font builds, because ucs2any will attempt to read the sysroot's
> > > > > encoding
> > > > > maps with the host paths.
> > > > 
> > > > ^ Is this description of what the patch is supposed to fix or expected
> > > > side-effect of this change?
> > > > 
> > > > Because all font recipes and meta-oe are failing since this change
> > > > with
> > > > errors like this:
> > > > 
> > > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bi
> > > > n/ucs2any: Can't read mapping file
> > > > '/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/s
> > > > hare/fonts/X11/util/map-ISO8859-1': No such file or directory!
> > > > 
> > > > See http://www.openembedded.org/wiki/Bitbake_World_Status
> > > 
> > > I can confirm that reverting this patch fixes font-* recipes
> > > http://lists.openembedded.org/pipermail/openembedded-core/2015-January/1
> > > 00523.html> 
> > Ping
> 
> ACK. Sorry, I could've sworn I saw the commit get reverted on
> master-next, so I figured this was a lower priority than I indicated in
> my previous reply.
> 
> This build is broken because my patchset was only partially committed.
> "font-util: Fix incorrect PKG_CONFIG_PATH" (the patch you reference
> above) was patch 2/3, but patches 1/3 "font-util: remove MAPFILES_PATH
> override" and 3/3 "xorg-font-common: fix sysroot injection for encoding
> maps" appear to have never been committed. See original thread at e.g.
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/58846.
> 
> Could you try rebuilding with those other two patches?

If these did indeed get missed, could you please rebase them on top of master 
and resend? Then we can resolve this once and for all.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


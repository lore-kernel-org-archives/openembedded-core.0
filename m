Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5C66060030
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 12:37:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2014 05:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,798,1400050800"; d="scan'208";a="553403794"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.206])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2014 05:37:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 04 Aug 2014 13:37:18 +0100
Message-ID: <14511164.eDDSBeL19z@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1408030254520.10897@localhost>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
	<20140802200959.GA22882@haswell>
	<alpine.LFD.2.11.1408030254520.10897@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Mon, 04 Aug 2014 12:37:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 03 August 2014 02:56:04 Robert P. J. Day wrote:
> On Sat, 2 Aug 2014, Khem Raj wrote:
> > On 14-08-02 15:57:00, Robert P. J. Day wrote:
> > > On Sat, 2 Aug 2014, Khem Raj wrote:
> > > > On Sat, Aug 2, 2014 at 9:34 AM, Robert P. J. Day 
<rpjday@crashcourse.ca> wrote:
> > > > > say, pkg_prerm() functions would never be written with respect to
> > > > > the
> > > > > variable ${D}, which would be relevant only during image creation.
> > > > > but
> > > > > i can see things like this in sysklogd.inc:
> > > > > 
> > > > > pkg_prerm_${PN} () {
> > > > > 
> > > > >         if test "x$D" = "x"; then
> > > > 
> > > > note that its not ${D} (bitbake context) but $D which is evaluated
> > > > in the context when the script is run.
> > > > 
> > >   i still don't understand ... what are the possible values of $D
> > > 
> > > here, and what would they represent?
> > 
> > At build time it will not be expanded by bitbake like ${D} is. but
> > during image creation it will be. But when doing on-device install
> > of this package $D will be empty. Its a way to differentiate actions
> > during image creation and on-device install/update/remove
> 
>   but the yocto dev manual states pretty clearly that pkg_prerm and
> pkg_postrm functions are *not* used during image creation. so you're
> saying they are? under what circumstances?

They wouldn't normally be. You could in theory issue some package removal 
commands as part of postprocessing on the image but I can't see much use for 
that given we have things like PACKAGE_EXCLUDE now.

Khem was simply correcting your reference to ${D}. I can only imagine the 
example you gave is just belt-and-braces to make sure it could never be run 
outside the context of the real target.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


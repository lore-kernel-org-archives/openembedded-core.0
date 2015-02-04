Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id EFFD06013C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 09:01:20 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1491K4V011358; Wed, 4 Feb 2015 03:01:20 -0600
Received: from weregild ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015020403012053-734755 ;
	Wed, 4 Feb 2015 03:01:20 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYkdvkjDPqQOAai1xcwoPVdX3PXMdPYRjq_Y09HrY3WBg@mail.gmail.com>
References: <1422924455-24732-1-git-send-email-rich.tollerton@ni.com>
	<1422924455-24732-2-git-send-email-rich.tollerton@ni.com>
	<CAJTo0LYkdvkjDPqQOAai1xcwoPVdX3PXMdPYRjq_Y09HrY3WBg@mail.gmail.com>
User-Agent: Notmuch/0.19 (http://notmuchmail.org) Emacs/24.4.2
	(x86_64-unknown-linux-gnu)
Date: Wed, 04 Feb 2015 03:01:20 -0600
Message-ID: <87siemaw4f.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/04/2015 03:01:20 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/04/2015 03:01:20 AM,
	Serialize complete at 02/04/2015 03:01:20 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-04_02:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] staging.bbclass: Install ${datadir}/fonts/ into sysroots
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
X-List-Received-Date: Wed, 04 Feb 2015 09:01:26 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> On 3 February 2015 at 00:47, Richard Tollerton <rich.tollerton@ni.com>
> wrote:
>
>> font-util installs encoding maps into /usr/share/fonts/X11. This path
>> may not exist on the host (many distros install these into
>> /usr/share/fonts/util) so they must exist in the sysroot in order for
>> e.g. `pkg-config --variable=mapdir fontutil` to work correctly. However,
>> currently /usr/share/fonts is explicitly not installed into sysroots, so
>> the encoding maps were not getting found.
>>
>> Fix this by no longer deleting ${datadir}/fonts/ from sysroots.
>>
>
> So the rationale for removing ${datadir}/fonts/ from staging is that it
> usually contains fonts, which are useless in the sysroot.  Removing this
> means that fonts get staged when they're built, which means pointless
> copying of data and adds to the build time.  In an image which has many
> megabyte of fonts, that's going to be noticeable.
>
> An alternative solution would be to explicitly stage the maps in the
> recipes that install them, see eg the tcl recipe that calls
> sysroot_stage_dir directly.

Thanks, I was not aware of this facility. I'll get a patch put together
using this (SYSROOT_PREPROCESS_FUNCS) approach.

> Ross

-- 
Richard Tollerton <rich.tollerton@ni.com>


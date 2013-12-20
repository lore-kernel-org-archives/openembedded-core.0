Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9D78360C12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 11:37:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Dec 2013 03:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,520,1384329600"; d="scan'208";a="427764789"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.32])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2013 03:37:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Fri, 20 Dec 2013 11:37:22 +0000
Message-ID: <4597272.5pSZ6hOFRs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20131220113238.GU3706@jama>
References: <1387534224-16453-1-git-send-email-joaohf@gmail.com>
	<20131220113238.GU3706@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Fri, 20 Dec 2013 11:37:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 20 December 2013 12:32:38 Martin Jansa wrote:
> On Fri, Dec 20, 2013 at 08:10:24AM -0200, Joao Henrique Ferreira de Freitas
> wrote:
> > Previous change (086ce22b88f5ef5f75a83119a32c8b3fdcfa296d) broke
> > the creating of vmdk images. This protects shell expansion variables
> > and let dd generate the image to be transformed to vmdk by
> > image-vmdk.class. ---
> > 
> >  meta/classes/boot-directdisk.bbclass | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta/classes/boot-directdisk.bbclass
> > b/meta/classes/boot-directdisk.bbclass index 3277666..4f26f47 100644
> > --- a/meta/classes/boot-directdisk.bbclass
> > +++ b/meta/classes/boot-directdisk.bbclass
> > @@ -88,10 +88,10 @@ build_boot_dd() {
> > 
> >  		grubefi_hddimg_populate $HDDDIR
> >  	
> >  	fi
> > 
> > -	if [ ${IMAGE_FSTYPE} = "vmdk" ]; then
> > -		if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
> > +	if [ "${IMAGE_FSTYPES}" = "vmdk" ]; then
> > +		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
> 
> IMAGE_FSTYPE looks really as typo, but what if there are multiple
> entries in IMAGE_FSTYPES?
> 
> OE @ ~/openembedded-core $ git grep IMAGE_FSTYPE | grep -v IMAGE_FSTYPES
> meta/classes/boot-directdisk.bbclass:   if [ ${IMAGE_FSTYPE} = "vmdk" ];
> then meta/classes/boot-directdisk.bbclass:   if [ ${IMAGE_FSTYPE} != "vmdk"
> ]; then meta/classes/boot-directdisk.bbclass:   if [ ${IMAGE_FSTYPE} !=
> "vmdk" ]; then
> 
> Maybe you can use this variable instead:
> meta/classes/image.bbclass:IMAGE_TYPE_vmdk =
> '${@base_contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'

I'd suggest not using that variable as it's an internal implementation detail 
of image.bbclass - just use a similar base_contains() statement.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


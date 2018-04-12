Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D7D74745D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 01:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5199C20B1B;
	Thu, 12 Apr 2018 01:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PSLhqv1aEBYQ; Thu, 12 Apr 2018 01:19:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B32E203A8;
	Thu, 12 Apr 2018 01:19:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 93BFD163430; Wed, 11 Apr 2018 21:19:02 -0400 (EDT)
Date: Wed, 11 Apr 2018 21:19:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180412011902.GG3228@denix.org>
References: <20180410143532.31916-1-ross.burton@intel.com>
	<CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
	<CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
	<CAMKF1srSW0=y7K3q+q-cUN7XXTnGiRV1e5Ag3PjC2tb12Htqnw@mail.gmail.com>
	<CAJTo0Lbon36HCngX2DFNtfrtZQP-nn2t=hp=_mAeHK-bYBpF6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbon36HCngX2DFNtfrtZQP-nn2t=hp=_mAeHK-bYBpF6w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use pigz to create .gz files
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
X-List-Received-Date: Thu, 12 Apr 2018 01:19:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 11, 2018 at 05:07:38PM +0100, Burton, Ross wrote:
> Woud be interesting to see a benchmark of a full build from scratch
> with host gzip vs host pigz...

Is pigz so widely used now to be available in every Linux distro like gzip?


> On 11 April 2018 at 17:03, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Apr 11, 2018 at 6:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
> >> Wouldn't that introduce a fun circular dependency if pigz-native needs
> >> to be built?
> >>
> >
> > interesting idea certainly, if it ends up with improvements in build
> > time, we could
> > add pigz to host dependencies.
> >
> >> Ross
> >>
> >> On 11 April 2018 at 11:53, Martin Jansa <martin.jansa@gmail.com> wrote:
> >>> What about using pigz for sstate-cache archives?
> >>>
> >>> On Tue, Apr 10, 2018 at 4:35 PM, Ross Burton <ross.burton@intel.com> wrote:
> >>>>
> >>>> Since pigz is no longer a drop-in replacement for gzip (oe-core 1624b7b)
> >>>> the
> >>>> image creation has been using gzip instead of pigz, despite still
> >>>> depending on
> >>>> pigz-native.  Fix this by invoking pigz explicitly.
> >>>>
> >>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>>> ---
> >>>>  meta/classes/image_types.bbclass | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/meta/classes/image_types.bbclass
> >>>> b/meta/classes/image_types.bbclass
> >>>> index e872ae20982..00a00d318f4 100644
> >>>> --- a/meta/classes/image_types.bbclass
> >>>> +++ b/meta/classes/image_types.bbclass
> >>>> @@ -281,7 +281,7 @@ COMPRESSIONTYPES ?= ""
> >>>>
> >>>>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
> >>>> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
> >>>> ${COMPRESSIONTYPES}"
> >>>>  CONVERSION_CMD_lzma = "lzma -k -f -7
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> >>>> -CONVERSION_CMD_gz = "gzip -f -9 -n -c
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> >>>> +CONVERSION_CMD_gz = "pigz -f -9 -n -c
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> >>>>  CONVERSION_CMD_bz2 = "pbzip2 -f -k
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> >>>>  CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}
> >>>> --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> >>>>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> >>>> --
> >>>> 2.11.0
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


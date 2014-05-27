Return-Path: <sstncr@gmail.com>
Received: from mail-we0-f181.google.com (unknown [74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4896FA84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 11:22:33 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w61so9321353wes.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nPEAzc49HRnMXzQSyRuH7ii+8pK6oixQD+G0Pv/wypk=;
	b=pQTGjXZX/x1EWhNkbK0xc7jeZw+F2F32xJIcSwf7sVQ3/B+6kX1pJfDyG669YO44Ao
	0Yqws6qa9x9NQiyYgsUFMQO8qsMDl9EwbVJOTdnhyLD+xuorh1kjMy2zvB4fTDBF7ODp
	U8H8IDSBFLxOyl2HyVuu6JRC1sNWfgPEW9ntCLyB7BFeMf1lYuRl/ilb2snuGMBgDV1D
	ccm0tiK+mbJbSF4g1BqIxGLsPB1N6cjY2BsbYUiMdMUWBx4XItArvOPfL1e1sM+dbbha
	IPEKn7wO3hkhlwETTV6QGPv4YGOnfJwu4y3rEBnat8/mF7NPyWK+V3jS3uiywmWOIRQm
	hM6Q==
MIME-Version: 1.0
X-Received: by 10.180.228.42 with SMTP id sf10mr36326724wic.33.1401189280532; 
	Tue, 27 May 2014 04:14:40 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Tue, 27 May 2014 04:14:40 -0700 (PDT)
In-Reply-To: <1401184227-1138-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1401184227-1138-1-git-send-email-corneliux.stoicescu@intel.com>
Date: Tue, 27 May 2014 14:14:40 +0300
Message-ID: <CANr+NRtXiKzXK2aBS6e1vrt-HNRMYqQ5StH-neSsFLZQAbLPtQ@mail.gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/controllers/beaglebonetarget.py: fix conditions for files copied to /boot
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
X-List-Received-Date: Tue, 27 May 2014 11:22:37 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 12:50 PM, Corneliu Stoicescu
<corneliux.stoicescu@intel.com> wrote:

> ---
>  meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

As this patch is for meta-yocto-bsp this should be sent to
poky@yoctoproject.org list...

> diff --git a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
> index 53f454b..af56bda 100644
> --- a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
> +++ b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
> @@ -41,12 +41,12 @@ class BeagleBoneTarget(MasterImageHardwareTarget):
>                  'mount -L testrootfs /mnt/testrootfs',
>                  'rm -rf /mnt/testrootfs/*',
>                  'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
> -                '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-kernel /mnt/testrootfs/boot/uImage',
> +                'if [ ! -e /mnt/testrootfs/boot/uImage ]; then cp ~/test-kernel /mnt/testrootfs/boot/uImage; fi',

How about reversing the check: [ -e /mnt/testrootfs/boot/uImage] || cp
~/test-kernel /mnt/testrootfs/boot/uImage
That would work in both cases, if it exists it won't copy the kernel
and returns 0, if it doesn't it will copy and returns the result of
cp.

>                  ]
>
>          for _, dtbfn in self.dtbs:
>              # Kernel and dtb files may not be in the image, so copy them if not
> -            self.deploy_cmds.append('[ ! -e /mnt/testrootfs/boot/{0} ] && cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn))
> +            self.deploy_cmds.append('if [ ! -e /mnt/testrootfs/boot/{0} ]; then cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn) + '; fi')
>

Same here.


Cheers,
Stefan

>          if not self.serialcontrol_cmd:
>              bb.fatal("This TEST_TARGET needs a TEST_SERIALCONTROL_CMD defined in local.conf.")
> --
> 1.8.3.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1B27565E1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 14:02:02 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id t59so982827yho.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=IpmmtILB+p3QxAIBTNbnmsKKI3AGNKuRP4HiFWzApi4=;
	b=ejHDQmEkbaGmMmvrKIKp3D74KrbdsSyP3gzmahPBV5opgFfOca3LA+fkdUjZ3BVpm9
	J+WWf/M98mdn58xaZbJ9NfAILgUF3F0DIOL9F6ZNtV+2cfTdKMojTDOnOtcs+oRXoC6c
	SqvlGGtCBephNCJlYAxdmTTLPmwQaDks0tBcVa1MXZbP3k3/OAARRlM6phU79zUT/AKz
	iIW99Z0RPHiMveMzKu0fbOKT1uMdbZhchRkp/cmsETX1g5PZJRBNJzg2c8ym2L+s+XcH
	Ci9YxMFA0lod/g620a4axgoup2eUIU/xM3BX7taBKjJ4X1fqZKKS+5jpqtcIum7nRQAM
	TWTg==
MIME-Version: 1.0
X-Received: by 10.236.124.7 with SMTP id w7mr16091298yhh.33.1402581723282;
	Thu, 12 Jun 2014 07:02:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Thu, 12 Jun 2014 07:02:03 -0700 (PDT)
In-Reply-To: <53996893.88fd440a.0627.25d6SMTPIN_ADDED_BROKEN@mx.google.com>
References: <5399151E.3050306@linux.intel.com>
	<53996893.88fd440a.0627.25d6SMTPIN_ADDED_BROKEN@mx.google.com>
Date: Thu, 12 Jun 2014 11:02:03 -0300
X-Google-Sender-Auth: pN60aWXJXFfhPRAa0rh8EHRvoG0
Message-ID: <CAP9ODKrZ9qdGooL3YFBayfsURfaXJm513dX67V49ESidSyzRdg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: y@enea.se
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] Add wic support to generate rootfs image for uboot
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
X-List-Received-Date: Thu, 12 Jun 2014 14:02:04 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Thu, Jun 12, 2014 at 5:43 AM,  <y@enea.se> wrote:
> From: Adrian Calianu <adrian.calianu@enea.com>
>
> Add support in wic to build ramdisk uboot images from list of packages or
> from an existing rootfs folder.
>
> Providing the list of packages starting with XXX-core-boot package(into wks file)
> will generate an rootfs image for uboot out of bitbake.
> There is also possible to combine an existing/application rootfs with a list
> of packages that can be installed but the user must take care to provide
> a basic core boot rootfs or XXX-core-boot package and reporul(wic.conf).
>
> Some prerequisites are required for this new build setup:
> ../poky/scripts/lib/image/config/wic.conf
> [create]
> arch=target_arch (example: powerpc, arm, x86)
> pkgmgr=opkg
> repourl=http://example.distro/p2020rdb/ipk/all http://example.distro/p2020rdb/ipk/p2020rdb http://example.distro/p2020rdb/ipk/ppce500v2
>
>     1) Build an rootfs image from an existing bitbake build:
>        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -e core-image-minimal -o .../output
>
>     2) Build an rootfs image from an existing rootfs and native_sysroot:
>        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -r .../path_to_rootfs -n .../path_to_native_sysroot -o .../output
>
>     3) Build an rootfs image only from a package list (on wks file):
>
>        Add the package list to be installed as rootfs on ../poky/scripts/lib/image/canned-wks/uboot.wks:
>        %packages
>        packagegroup-core-boot
>        pramfs-init
>        run-postinsts
>        packagegroup-core-ssh-dropbear
>        %end
>
>        Generate rootfs image:
>        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks  -n .../path_to_native_sysroot -o .../output
>
> Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>

I really liked the idea and it is a nice step further but it is not
clear to me how we'll "tell" wic about platform specific U-Boot
installation like i.MX vs MXS where the layout of the uSD image is
very different.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


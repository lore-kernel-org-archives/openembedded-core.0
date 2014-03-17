Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id AAAAE6EF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 14:53:04 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id z6so5290114yhz.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=Rc3vVtxOE7kUUEbr5L4kvrpoa/4JpC9mRRxUqZzPnsg=;
	b=FG8pQd4ZScWBe8DDMpTxgfmbAgoDXGuBb6b/OTDp8tLnGmxRCVDrDzgaD5vwPT+AGF
	gWdEmJtfy5poR6Jl6sAuoQ5gePfUNpTVZYqQBgWSU/rmipnRwjmxwNBlLUYNU0yi9Fy3
	E/RTIGKRtYWTH8YwejhIuFKxbPs62hmeQ+yCV+6XVE8H9dqeOPVrZR6gPxA38HTvzFE/
	VOdOD4EPLtCBGC/b5TEQWLsVQuQkwEe7MObBb3HRIqtW27d8IkfrviwY3gE/spkmh28J
	geK2Das8D5xoBETjV99m6Yi0KN9ETtTGzxoBm0q78BXFq3dj33F7uJ2Uye3c7rGCMIhH
	BNvw==
MIME-Version: 1.0
X-Received: by 10.236.198.197 with SMTP id v45mr10055036yhn.87.1395067985837; 
	Mon, 17 Mar 2014 07:53:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 17 Mar 2014 07:53:05 -0700 (PDT)
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
Date: Mon, 17 Mar 2014 11:53:05 -0300
X-Google-Sender-Auth: G12mC0aBGk-bgLHiJah2-CzhWrg
Message-ID: <CAP9ODKoAeOS46F4LqnaMGfJ_5QJKo=vnnRLOgHU0sRC4imRz3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Mon, 17 Mar 2014 14:53:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 6:17 PM, Jo=E3o Henrique Ferreira de Freitas
<joaohf@gmail.com> wrote:
> These patchs allows the user create the following directdisk-multi-rootfs=
.wks file:
>
>   part /boot --source bootimg-pcbios --ondisk sda --fstype=3Dmsdos \
>     --label boot --active --align 1024
>   part / --source rootfs --ondisk sda --fstype=3Dext3 --label primary --a=
lign 1024
>
>   part /standby --source rootfs --rootfs=3D<special rootfs directory> \
>     --ondisk sda --fstype=3Dext3 --label secondary --align 1024
>
>   bootloader  --timeout=3D0  --append=3D"rootwait rootfstype=3Dext3 video=
=3Dvesafb vga=3D0x318 console=3Dtty0"
>
> The special thing is the /standby partition. Which using rootfs with
> a extra '--rootfs' argument instruct the RootfsPlugin what should be
> the rootfs directory to be used to create the partition.

So this allows you to include 'a directory' as source of a partition
to be created, right?

If my understand is right, I like the feature. My only concern is
people overusing it and adding contents which are not 'tracked' in the
build system in a product release which seems attractive when we first
think about it but cause some management, tracking and authenticity
check problems in long term.

I don't know how to better address this from wic perspective. Usually
we end doing multiple images as part of the build process for those
special cases and I don't know how wic could be 'told' about those
secondary rootfs existence.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


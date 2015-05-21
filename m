Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6B81A609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 13:54:20 +0000 (UTC)
Received: by yhom41 with SMTP id m41so21168427yho.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=cmA22cyV3Edep0x+pIEr5TP64XYFZEqKSvj6GDl03Ng=;
	b=Di8eJMSt4ySaKq3cNgnPUu76fQSvwQsKzfYoCx2+g+/ru9f2i7jB8M8Nm6hPRbT+ta
	k+RcQoOkmcyy+ju0Cy3DdhXiGOBfMAv4YCS0DqI0qbDcdMHZkg38yEC2E1cWhurlsTBC
	nW8YProdXolJ8Vjs3zn4fpanxHJIGC8raOxvO9+rjnRV8CUkvLm/RtICZvirEEd2wq8l
	F1xAglZMvd8++hMU7CWC/k586lc9KZYJ4Ke2pI0LwjYwLjgucsq6eba1i8ZY4FUAzCs9
	mMmx+kRh7boTJB3+uqLJvAlkocX+/sxt+hNS0yhcy0eKEhxCVVqeFroGnq3AboDwYtGY
	4T5g==
MIME-Version: 1.0
X-Received: by 10.236.61.137 with SMTP id w9mr2749232yhc.31.1432216462084;
	Thu, 21 May 2015 06:54:22 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Thu, 21 May 2015 06:54:22 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A3649393797@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A3649393797@deeres07.ebgroup.elektrobit.com>
Date: Thu, 21 May 2015 09:54:22 -0400
Message-ID: <CADkTA4NZ9OaeFwXt-itPQGem9sZFO-n09aChP70quN0Cwa_UsQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Steffen.Pankratz@elektrobit.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with module.bbclass
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
X-List-Received-Date: Thu, 21 May 2015 13:54:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 9:48 AM,  <Steffen.Pankratz@elektrobit.com> wrote:
> Hi,
>
> I am using http://git.openembedded.org/openembedded-core/tree/meta/classe=
s/module.bbclass as a base for my recipe to compile a kernel module outside=
 of the kernel tree.
>
> This is my recipe:
>
> DESCRIPTION =3D "Nouveau kernel module"
> SECTION =3D "kernel/modules"
> LICENSE =3D "CLOSED" #fixme
> PR =3D "r0"
> SRC_URI =3D "git://github.com/Gnurou/nouveau;protocol=3Dhttps;branch=3Dst=
aging"
> SRCREV =3D "c256f9450c613cd5075fc8c4a407686925041487"
> S =3D "${WORKDIR}/git/drm/nouveau"
> inherit module
>
> Naively, I hoped that would work out of the box. Of course it did not :) =
and every compiler call resulted in an error message like this:
>
> | make: *** [lib/nvif/notify.o] Error 1
> | In file included from ./lib/include/nvif/os.h:32:0,
> |                  from ./drm/nouveau/include/nvif/object.h:4,
> |                  from ./drm/nouveau/include/nvif/device.h:4,
> |                  from drm/nouveau/nvif/device.c:25:
> | /home/vagrant/repos/tk1/build/tmp/sysroots/x86_64-linux/usr/lib/arm-pok=
y-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.2/include/stdint.h:9:26: fat=
al error: stdint.h: No such file or directory
> |  # include_next <stdint.h>
> |                           ^
> | compilation terminated.
>
> I could resolve that issue by adding the following line to my recipe:
>
> EXTRA_OEMAKE=3D'-C "${STAGING_KERNEL_DIR}"'
>
> And another problem I had faced was that using:
>
> S =3D "${WORKDIR}/git/drm/nouveau"
>
> Compiled all kernel modules inside the kernel tree, instead only the nouv=
eau kernel module.
>
> I could solve that as well and finally I ended up with:
>
> EXTRA_OEMAKE=3D'-C "${STAGING_KERNEL_DIR}" M=3D"${S}"/drm/nouveau/'
>
> Now, I am not sure if I am doing something wrong or if there maybe is a p=
roblem with module.bbclass.

It is expected, but is dependent on the Makefile in for the actual
source you are
building.

If the module doesn't respect O=3D or KBUILD_OUTPUT, you will see the build=
 happen
without a split source/build.

And the other, CC is being overriden so the sysroot path is dropped.

Bruce

>
>
> --
> Steffen Pankratz
> Expert, Software Integration & Services
>
> EB - Driving the Future of Software
> Phone:  +49 9131 7701-6605
> Fax: +49 9131 7701 6333
> steffen.pankratz@elektrobit.com
> http://automotive.elektrobit.com/
> PGP-Key: http://keyserver.elektrobit.com/
>
> Elektrobit Automotive GmbH, Am Wolfsmantel 46, 91058 Erlangen, Germany
> Managing Directors Alexander Kocher, Gregor Zink
> Register Court F=C3=BCrth HRB 488
>
>
>
> ----------------------------------------------------------------
> Please note: This e-mail may contain confidential information
> intended solely for the addressee. If you have received this
> e-mail in error, please do not disclose it to anyone, notify
> the sender promptly, and delete the message from your system.
> Thank you.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B03971AC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 10:46:33 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id u62so5805473lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 03:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=meMwWVwpKYYGBaW1WMrXEsxc1KR0ELUw2dOHpciz1TA=;
	b=X7pNGSHLylWJZa0JHipRwCMpraDb599jnnoOykwKKzQj2rHdPOcHcuHAKjnnrxwAXr
	QdwRM7BeSxHuN2zj8japugcJ8g1CjTPu60akeXjkswH1aoEiDxF6PfcCeLpgWobrasEr
	LdnWW43xlloP/tL07sFTu+1/JYeLEJqiT/imRUlF98wKNgWyAdOxNqBLWnw98Z8Ts5LR
	P9pmyW4qGk+BYi9aScibcQMmHZH7G0iMldlVTkoXzRJTHIeiUJfxlqVFaLLTdZ6a+e8S
	bi5wzwXQDKAmPbJDuNFrla5RLDUrzzDI+KC5Rv5gdNPSE8PtkaFP0lc7cC3i6SZnNNpb
	+Uow==
X-Gm-Message-State: AKS2vOx6KulnhXevEQh2slmbej5vKxlBTZMks5Ix8K+7zsThesgPDCOA
	XL87JuXk20BpdG5gs9o=
X-Received: by 10.80.151.71 with SMTP id d7mr5541914edb.163.1498214794529;
	Fri, 23 Jun 2017 03:46:34 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p19sm2447970eda.15.2017.06.23.03.46.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Jun 2017 03:46:33 -0700 (PDT)
Message-ID: <1498214792.25895.23.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 11:46:32 +0100
In-Reply-To: <CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
References: <20170622151404.27496-1-git@andred.net>
	<CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
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
X-List-Received-Date: Fri, 23 Jun 2017 10:46:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

connman is not doing anything wrong here.

The kernel is redefining IFF_LOWER_UP, because it thinks the libc doesn't
define it yet (and glibc doesn't).

libc-compat.h is the way to solve these kind of issues. There also is https:
//lkml.org/lkml/2017/3/12/238 which is very similar. I'll pick that instead.

Cheers,
Andre'

On Thu, 2017-06-22 at 22:26 +0000, Khem Raj wrote:
> I would rather fix the package instead of kernel headers unless kernel
> community accepts this patch
> 
> On Thu, Jun 22, 2017 at 11:14 AM André Draszik <git@andred.net> wrote:
> 
> > From: André Draszik <adraszik@tycoint.com>
> > 
> > musl _does_ define IFF_LOWER_UP DORMANT ECHO so we should
> > prevent redefinition of these when on musl.
> > 
> > As per the included patch, this can be triggered by
> > (from connman 6to4.c):
> >     include <errno.h>
> >     include <stdio.h>
> >     include <stdlib.h>
> >     include <string.h>
> >     include <sys/socket.h>
> >     include <netinet/in.h>
> >     include <arpa/inet.h>
> >     include <net/if.h>
> >     include <linux/ip.h>
> >     include <linux/if_tunnel.h>
> >     include <linux/netlink.h>
> >     include <linux/rtnetlink.h>
> >     include <sys/ioctl.h>
> >     include <unistd.h>
> > 
> > In file included from ../git/src/6to4.c:34:0:
> > .../usr/include/linux/if.h:97:2: error: expected identifier before
> > numeric
> > constant
> >   IFF_LOWER_UP   = 1<<16, /* __volatile__ */
> >   ^
> > 
> > This is because at that time, IFF_LOWER_UP has been converted
> > to 0x10000 already:
> > enum net_device_flags {
> >  0x10000 = 1<<16,
> >  0x20000 = 1<<17,
> >  0x40000 = 1<<18,
> > 
> > };
> > 
> > By defining __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO
> > to 0, we avoid the duplicated definition.
> > 
> > Signed-off-by: André Draszik <adraszik@tycoint.com>
> > ---
> >  ....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 62
> > ++++++++++++++++++++++
> >  .../linux-libc-headers/linux-libc-headers_4.10.bb  |  1 +
> >  2 files changed, 63 insertions(+)
> >  create mode 100644
> > meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> > 
> > diff --git
> > a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> > b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> > new file mode 100644
> > index 0000000000..fd1bb9edb8
> > --- /dev/null
> > +++
> > b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-
> > compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> > @@ -0,0 +1,62 @@
> > +From 08a04c025395b0580913285045f2af36ee0985db Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
> > +Date: Thu, 15 Jun 2017 16:55:33 +0100
> > +Subject: [PATCH] libc-compat.h: musl _does_ define IFF_LOWER_UP DORMANT
> > ECHO
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +To trigger this (from connman 6to4.c):
> > +    include <errno.h>
> > +    include <stdio.h>
> > +    include <stdlib.h>
> > +    include <string.h>
> > +    include <sys/socket.h>
> > +    include <netinet/in.h>
> > +    include <arpa/inet.h>
> > +    include <net/if.h>
> > +    include <linux/ip.h>
> > +    include <linux/if_tunnel.h>
> > +    include <linux/netlink.h>
> > +    include <linux/rtnetlink.h>
> > +    include <sys/ioctl.h>
> > +    include <unistd.h>
> > +
> > +In file included from ../git/src/6to4.c:34:0:
> > +/scratch/yocto/build-tgm-r3-poky-fpp-tgm.pyro/tmp/work/tgm_r3-poky-
> > linux-musl/connman/1.33-git4+AUTOINC+aa5b3dc12b-r0/recipe-
> > sysroot/usr/include/linux/if.h:97:2:
> > error: expected identifier before numeric constant
> > +  IFF_LOWER_UP   = 1<<16, /* __volatile__ */
> > +  ^
> > +
> > +This is because at that time, IFF_LOWER_UP has been converted
> > +to 0x10000 already:
> > +enum net_device_flags {
> > + 0x10000 = 1<<16,
> > + 0x20000 = 1<<17,
> > + 0x40000 = 1<<18,
> > +
> > +};
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: André Draszik <adraszik@tycoint.com>
> > +Acked-by: Stephane Ayotte <sayotte@tycoint.com>
> > +---
> > + include/uapi/linux/libc-compat.h | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/include/uapi/linux/libc-compat.h
> > b/include/uapi/linux/libc-compat.h
> > +index f11ec0e..2003ae4 100644
> > +--- a/include/uapi/linux/libc-compat.h
> > ++++ b/include/uapi/linux/libc-compat.h
> > +@@ -70,7 +70,8 @@
> > + #define __UAPI_DEF_IF_NET_DEVICE_FLAGS 0
> > + /* For the future if glibc adds IFF_LOWER_UP, IFF_DORMANT and IFF_ECHO
> > */
> > + #ifndef __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO
> > +-#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 1
> > ++/* musl has these defined */
> > ++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
> > + #endif /* __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO */
> > +
> > + #else /* _NET_IF_H */
> > +--
> > +2.11.0
> > +
> > diff --git a/meta/recipes-kernel/linux-libc-headers/
> > linux-libc-headers_4.10.bb b/meta/recipes-kernel/linux-libc-headers/
> > linux-libc-headers_4.10.bb
> > index 108446aa34..29262789a8 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
> > @@ -4,6 +4,7 @@ SRC_URI_append_libc-musl = "\
> >      file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
> > \
> >      file://0002-libc-compat.h-prevent-redefinition-of-struct-
> > ethhdr.patch
> > \
> >      file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
> > +
> > file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
> >     "
> > 
> >  SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
> > --
> > 2.11.0
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 


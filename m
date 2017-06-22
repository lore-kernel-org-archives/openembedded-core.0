Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 052B671AB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 22:27:08 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 77so8039060wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=mVRubVPLBzZanHTAPzQJb52G5GPCbYvwNGDm06qsBaM=;
	b=FfgVypfA0B+uzvAy0qFa91c3L/YEgZgjZF0kW6eTnUQLktlmOEGsdype6G9ewGha5t
	JPa1N6ZbWySq2ql9yWwmh/SKC/xMUhcFzY/8o7sLBwuT0/Gw+uMDKaNskM6VCeO2l9QQ
	iiFbI+j+8RxBFZ6sH5n2QdTTGBls6pIssmSfaGGrI7HpiJbOBDlsbvCNVn8QY6BEPsuK
	yaUZiYugx5d4CiZBhH/FY51N4BRF1skNxco2tJcxpCr7+IBC9nnlWOQcZrQIy21KBnay
	uxt8wLGUUXXmJzjxYNixh3/1EwhvpRZa/OazSlEtGN/QwlN+il0CHpYQCXm2pNniIqOz
	a/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=mVRubVPLBzZanHTAPzQJb52G5GPCbYvwNGDm06qsBaM=;
	b=jpOOpuihqa51uIBgGfDb3HQVsn7kkXN0eUIbw6Xaktmw+1kc7Ukilao0ccxBAgNFO1
	ccGk2AnYYVSXk4gZYseULxIfm+oWdwQ4MU5WBo4l35xuasrynE7joZqfWkuos/6ykTC8
	qkn4WF3cpv9P/FhQb/+Jp7QKLwapZ1KLt4l03yrgb2pCkd6foFALWlRonZL+Im1xIwQa
	+KISqZmlUC+91B3IXYB849S2gpYGsfIEJaTmNWzUAM3X1lHt3q4depQioqZSkwARppkp
	c86jo9M0YM23RL0r4HnDPiTaMxAR7EtQA+pEc5SDm8kCFBB56ARwDm4caaT0Oo9gbpUv
	gfTg==
X-Gm-Message-State: AKS2vOwkcYPRqpQub/ZtEiS2w/O9c7Vn8RiaCSlEDKpRsH08LEwfAZn6
	ZZd13FqSxBHW44+1NFgZuHXxMRyD/Q==
X-Received: by 10.80.131.6 with SMTP id 6mr4117643edh.178.1498170429694; Thu,
	22 Jun 2017 15:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20170622151404.27496-1-git@andred.net>
In-Reply-To: <20170622151404.27496-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jun 2017 22:26:58 +0000
Message-ID: <CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>, 
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 22 Jun 2017 22:27:09 -0000
Content-Type: multipart/alternative; boundary="94eb2c0da3a2466eae055293fc5e"

--94eb2c0da3a2466eae055293fc5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would rather fix the package instead of kernel headers unless kernel
community accepts this patch

On Thu, Jun 22, 2017 at 11:14 AM Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> musl _does_ define IFF_LOWER_UP DORMANT ECHO so we should
> prevent redefinition of these when on musl.
>
> As per the included patch, this can be triggered by
> (from connman 6to4.c):
>     include <errno.h>
>     include <stdio.h>
>     include <stdlib.h>
>     include <string.h>
>     include <sys/socket.h>
>     include <netinet/in.h>
>     include <arpa/inet.h>
>     include <net/if.h>
>     include <linux/ip.h>
>     include <linux/if_tunnel.h>
>     include <linux/netlink.h>
>     include <linux/rtnetlink.h>
>     include <sys/ioctl.h>
>     include <unistd.h>
>
> In file included from ../git/src/6to4.c:34:0:
> .../usr/include/linux/if.h:97:2: error: expected identifier before numeri=
c
> constant
>   IFF_LOWER_UP   =3D 1<<16, /* __volatile__ */
>   ^
>
> This is because at that time, IFF_LOWER_UP has been converted
> to 0x10000 already:
> enum net_device_flags {
>  0x10000 =3D 1<<16,
>  0x20000 =3D 1<<17,
>  0x40000 =3D 1<<18,
>
> };
>
> By defining __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO
> to 0, we avoid the duplicated definition.
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
>  ....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 62
> ++++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_4.10.bb  |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644
> meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compa=
t.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
>
> diff --git
> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-com=
pat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-com=
pat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> new file mode 100644
> index 0000000000..fd1bb9edb8
> --- /dev/null
> +++
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-com=
pat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> @@ -0,0 +1,62 @@
> +From 08a04c025395b0580913285045f2af36ee0985db Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <adraszik@tycoint.com>
> +Date: Thu, 15 Jun 2017 16:55:33 +0100
> +Subject: [PATCH] libc-compat.h: musl _does_ define IFF_LOWER_UP DORMANT
> ECHO
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +To trigger this (from connman 6to4.c):
> +    include <errno.h>
> +    include <stdio.h>
> +    include <stdlib.h>
> +    include <string.h>
> +    include <sys/socket.h>
> +    include <netinet/in.h>
> +    include <arpa/inet.h>
> +    include <net/if.h>
> +    include <linux/ip.h>
> +    include <linux/if_tunnel.h>
> +    include <linux/netlink.h>
> +    include <linux/rtnetlink.h>
> +    include <sys/ioctl.h>
> +    include <unistd.h>
> +
> +In file included from ../git/src/6to4.c:34:0:
> +/scratch/yocto/build-tgm-r3-poky-fpp-tgm.pyro/tmp/work/tgm_r3-poky-linux=
-musl/connman/1.33-git4+AUTOINC+aa5b3dc12b-r0/recipe-sysroot/usr/include/li=
nux/if.h:97:2:
> error: expected identifier before numeric constant
> +  IFF_LOWER_UP   =3D 1<<16, /* __volatile__ */
> +  ^
> +
> +This is because at that time, IFF_LOWER_UP has been converted
> +to 0x10000 already:
> +enum net_device_flags {
> + 0x10000 =3D 1<<16,
> + 0x20000 =3D 1<<17,
> + 0x40000 =3D 1<<18,
> +
> +};
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> +Acked-by: Stephane Ayotte <sayotte@tycoint.com>
> +---
> + include/uapi/linux/libc-compat.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/uapi/linux/libc-compat.h
> b/include/uapi/linux/libc-compat.h
> +index f11ec0e..2003ae4 100644
> +--- a/include/uapi/linux/libc-compat.h
> ++++ b/include/uapi/linux/libc-compat.h
> +@@ -70,7 +70,8 @@
> + #define __UAPI_DEF_IF_NET_DEVICE_FLAGS 0
> + /* For the future if glibc adds IFF_LOWER_UP, IFF_DORMANT and IFF_ECHO =
*/
> + #ifndef __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO
> +-#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 1
> ++/* musl has these defined */
> ++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
> + #endif /* __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO */
> +
> + #else /* _NET_IF_H */
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_4.10.bb b/meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_4.10.bb
> index 108446aa34..29262789a8 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
> @@ -4,6 +4,7 @@ SRC_URI_append_libc-musl =3D "\
>      file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
>      file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patc=
h
> \
>      file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
> +
> file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
>     "
>
>  SRC_URI[md5sum] =3D "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0da3a2466eae055293fc5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I would rather fix the package instead of kernel hea=
ders unless kernel community accepts this patch=C2=A0</div><br><div class=
=3D"gmail_quote"><div>On Thu, Jun 22, 2017 at 11:14 AM Andr=C3=A9 Draszik &=
lt;<a href=3D"mailto:git@andred.net">git@andred.net</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">From: Andr=C3=A9 Draszik &lt;<a href=3D"mai=
lto:adraszik@tycoint.com" target=3D"_blank">adraszik@tycoint.com</a>&gt;<br=
>
<br>
musl _does_ define IFF_LOWER_UP DORMANT ECHO so we should<br>
prevent redefinition of these when on musl.<br>
<br>
As per the included patch, this can be triggered by<br>
(from connman 6to4.c):<br>
=C2=A0 =C2=A0 include &lt;errno.h&gt;<br>
=C2=A0 =C2=A0 include &lt;stdio.h&gt;<br>
=C2=A0 =C2=A0 include &lt;stdlib.h&gt;<br>
=C2=A0 =C2=A0 include &lt;string.h&gt;<br>
=C2=A0 =C2=A0 include &lt;sys/socket.h&gt;<br>
=C2=A0 =C2=A0 include &lt;netinet/in.h&gt;<br>
=C2=A0 =C2=A0 include &lt;arpa/inet.h&gt;<br>
=C2=A0 =C2=A0 include &lt;net/if.h&gt;<br>
=C2=A0 =C2=A0 include &lt;linux/ip.h&gt;<br>
=C2=A0 =C2=A0 include &lt;linux/if_tunnel.h&gt;<br>
=C2=A0 =C2=A0 include &lt;linux/netlink.h&gt;<br>
=C2=A0 =C2=A0 include &lt;linux/rtnetlink.h&gt;<br>
=C2=A0 =C2=A0 include &lt;sys/ioctl.h&gt;<br>
=C2=A0 =C2=A0 include &lt;unistd.h&gt;<br>
<br>
In file included from ../git/src/6to4.c:34:0:<br>
.../usr/include/linux/if.h:97:2: error: expected identifier before numeric =
constant<br>
=C2=A0 IFF_LOWER_UP=C2=A0 =C2=A0=3D 1&lt;&lt;16, /* __volatile__ */<br>
=C2=A0 ^<br>
<br>
This is because at that time, IFF_LOWER_UP has been converted<br>
to 0x10000 already:<br>
enum net_device_flags {<br>
=C2=A00x10000 =3D 1&lt;&lt;16,<br>
=C2=A00x20000 =3D 1&lt;&lt;17,<br>
=C2=A00x40000 =3D 1&lt;&lt;18,<br>
<br>
};<br>
<br>
By defining __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO<br>
to 0, we avoid the duplicated definition.<br>
<br>
Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:adraszik@tycoint.co=
m" target=3D"_blank">adraszik@tycoint.com</a>&gt;<br>
---<br>
=C2=A0....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 62 +++++++++++++=
+++++++++<br>
=C2=A0.../linux-libc-headers/<a href=3D"http://linux-libc-headers_4.10.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_4.10.bb</a>=C2=A0 |=
=C2=A0 1 +<br>
=C2=A02 files changed, 63 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-=
headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001=
-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch b/meta/recipes-=
kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_=
-define-IFF_LOWER_UP-DORMAN.patch<br>
new file mode 100644<br>
index 0000000000..fd1bb9edb8<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-c=
ompat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch<br>
@@ -0,0 +1,62 @@<br>
+From 08a04c025395b0580913285045f2af36ee0985db Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D &lt;<a href=3D"mailto:adr=
aszik@tycoint.com" target=3D"_blank">adraszik@tycoint.com</a>&gt;<br>
+Date: Thu, 15 Jun 2017 16:55:33 +0100<br>
+Subject: [PATCH] libc-compat.h: musl _does_ define IFF_LOWER_UP DORMANT EC=
HO<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+To trigger this (from connman 6to4.c):<br>
+=C2=A0 =C2=A0 include &lt;errno.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;stdio.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;stdlib.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;string.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;sys/socket.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;netinet/in.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;arpa/inet.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;net/if.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;linux/ip.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;linux/if_tunnel.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;linux/netlink.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;linux/rtnetlink.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;sys/ioctl.h&gt;<br>
+=C2=A0 =C2=A0 include &lt;unistd.h&gt;<br>
+<br>
+In file included from ../git/src/6to4.c:34:0:<br>
+/scratch/yocto/build-tgm-r3-poky-fpp-tgm.pyro/tmp/work/tgm_r3-poky-linux-m=
usl/connman/1.33-git4+AUTOINC+aa5b3dc12b-r0/recipe-sysroot/usr/include/linu=
x/if.h:97:2: error: expected identifier before numeric constant<br>
+=C2=A0 IFF_LOWER_UP=C2=A0 =C2=A0=3D 1&lt;&lt;16, /* __volatile__ */<br>
+=C2=A0 ^<br>
+<br>
+This is because at that time, IFF_LOWER_UP has been converted<br>
+to 0x10000 already:<br>
+enum net_device_flags {<br>
+ 0x10000 =3D 1&lt;&lt;16,<br>
+ 0x20000 =3D 1&lt;&lt;17,<br>
+ 0x40000 =3D 1&lt;&lt;18,<br>
+<br>
+};<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:adraszik@tycoint.c=
om" target=3D"_blank">adraszik@tycoint.com</a>&gt;<br>
+Acked-by: Stephane Ayotte &lt;<a href=3D"mailto:sayotte@tycoint.com" targe=
t=3D"_blank">sayotte@tycoint.com</a>&gt;<br>
+---<br>
+ include/uapi/linux/libc-compat.h | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-co=
mpat.h<br>
+index f11ec0e..2003ae4 100644<br>
+--- a/include/uapi/linux/libc-compat.h<br>
++++ b/include/uapi/linux/libc-compat.h<br>
+@@ -70,7 +70,8 @@<br>
+ #define __UAPI_DEF_IF_NET_DEVICE_FLAGS 0<br>
+ /* For the future if glibc adds IFF_LOWER_UP, IFF_DORMANT and IFF_ECHO */=
<br>
+ #ifndef __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO<br>
+-#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 1<br>
++/* musl has these defined */<br>
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0<br>
+ #endif /* __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO */<br>
+<br>
+ #else /* _NET_IF_H */<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux=
-libc-headers_4.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-head=
ers_4.10.bb</a> b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://=
linux-libc-headers_4.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc=
-headers_4.10.bb</a><br>
index 108446aa34..29262789a8 100644<br>
--- a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_4.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_4.1=
0.bb</a><br>
+++ b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_4.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_4.1=
0.bb</a><br>
@@ -4,6 +4,7 @@ SRC_URI_append_libc-musl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0001-libc-compat.h-fix-some-issues-arising-from-=
in6.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-libc-compat.h-prevent-redefinition-of-struc=
t-ethhdr.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.p=
atch \<br>
+=C2=A0 =C2=A0 file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DO=
RMAN.patch \<br>
=C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;b5e7f6b9b2fe1b6cc7bc56a3a0bfc090&quot;<br>
--<br>
2.11.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0da3a2466eae055293fc5e--

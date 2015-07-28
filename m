Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0062B76380
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 11:47:47 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so72542700qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 04:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gYNlAYItVPNxpBTIwh2cNF5sWPRPesXPPfHlxURh4YA=;
	b=T/yG1Ehg0j1dus8gxGb3ea4cWphSsuikBh0rWh8Wf12jF1N3xEac0rXTDabR45FrT/
	qP0rQ0nQgga3kacBX2htXzgmOvXL2rQyeS1v+qUKihRbJCW3uZW5Eh+j89xr/+rmbdpO
	ikEVZp3um9RGHKV850+Cpm5sou8PS89SjSFJIhD16CPBjb8qcDV41v1arilxWIjNJKsO
	pUCcfJT4pki0D1nBJ1KxVC/2nFbB4Sde2QP+BOMtr8k6mdkzLLY0fSJCpq0BFoOLcloN
	6L2L7HkQgZ+j0IFXGXZ+B9KAyYb5Dj+dpDgqQ0jG6fL+cZo1h9VWEGCDS553vyRkdx3T
	1Zlw==
X-Gm-Message-State: ALoCoQkeaIE+sUNvqnX04NsmOB4ra5e++fpR29WnwJ89zSnNUlK2dYpySTd0XlpxQCy41zdtIcIV
X-Received: by 10.140.235.19 with SMTP id g19mr50878850qhc.52.1438084067511;
	Tue, 28 Jul 2015 04:47:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 04:47:28 -0700 (PDT)
In-Reply-To: <1438048807-23716-1-git-send-email-rongqing.li@windriver.com>
References: <1438048807-23716-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 12:47:28 +0100
Message-ID: <CAJTo0LaXtgUCjzPS_6+5fEL6CDdLK1Cn_3wNvCM_EfWH_wDG2A@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: fix a building failure on OpenSus
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
X-List-Received-Date: Tue, 28 Jul 2015 11:47:52 -0000
Content-Type: multipart/alternative; boundary=001a11376dac005911051bee0a8d

--001a11376dac005911051bee0a8d
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 03:00, <rongqing.li@windriver.com> wrote:

> +config.mk will be included only if auto.conf is newer than .config
> +but in some system, the HPET is not enabled, the smallest unit of
> +time is second, and can not decise which file is newer, even if
> +the correct dependency has been created.
> +
> +The below shows unit of time:
> +
> +under SUSE Linux Enterprise Desktop 11 SP2  (i586):
> +    $ls --full-time include/config/auto.conf .config
> +    2015-07-27 03:46:20.000000000 -0400 .config
> +    2015-07-27 03:46:20.000000000 -0400 include/config/auto.conf
> +    $
> +
> +under Ubuntu 14.04 LTS:
> +    $ ls --full-time include/config/auto.conf .config
> +    2015-07-27 13:40:14.008703027 +0800 .config
> +    2015-07-27 13:40:15.020703054 +0800 include/config/auto.conf
> +    $
> +
> +The rule of including config.mk in Makefile as below
> +    autoconf_is_current := $(if $(wildcard $(KCONFIG_CONFIG)),$(shell
> find . \
> +                    -path ./include/config/auto.conf -newer
> $(KCONFIG_CONFIG)))
> +    ifneq ($(autoconf_is_current),)
> +    include $(srctree)/config.mk
> +    include $(srctree)/arch/$(ARCH)/Makefile
> +    endif
> +
> +The compilation will be failed if config.mk is not included
> +so delay 1 second to create auto.conf after creating of .config
>

Adding a sleep seems pretty ugly, wouldn't a neater fix be to change the
logic so that instead of the test being "is newer" you use "is not older",
to handle identical timestamps as being current.

Ross

--001a11376dac005911051bee0a8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 03:00,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ky" class=3D"a3s" =
style=3D"overflow:hidden">+<a href=3D"http://config.mk" rel=3D"noreferrer" =
target=3D"_blank">config.mk</a> will be included only if auto.conf is newer=
 than .config<br>
+but in some system, the HPET is not enabled, the smallest unit of<br>
+time is second, and can not decise which file is newer, even if<br>
+the correct dependency has been created.<br>
+<br>
+The below shows unit of time:<br>
+<br>
+under SUSE Linux Enterprise Desktop 11 SP2=C2=A0 (i586):<br>
+=C2=A0 =C2=A0 $ls --full-time include/config/auto.conf .config<br>
+=C2=A0 =C2=A0 2015-07-27 03:46:20.000000000 -0400 .config<br>
+=C2=A0 =C2=A0 2015-07-27 03:46:20.000000000 -0400 include/config/auto.conf=
<br>
+=C2=A0 =C2=A0 $<br>
+<br>
+under Ubuntu 14.04 LTS:<br>
+=C2=A0 =C2=A0 $ ls --full-time include/config/auto.conf .config<br>
+=C2=A0 =C2=A0 2015-07-27 13:40:14.008703027 +0800 .config<br>
+=C2=A0 =C2=A0 2015-07-27 13:40:15.020703054 +0800 include/config/auto.conf=
<br>
+=C2=A0 =C2=A0 $<br>
+<br>
+The rule of including <a href=3D"http://config.mk" rel=3D"noreferrer" targ=
et=3D"_blank">config.mk</a> in Makefile as below<br>
+=C2=A0 =C2=A0 autoconf_is_current :=3D $(if $(wildcard $(KCONFIG_CONFIG)),=
$(shell find . \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -pat=
h ./include/config/auto.conf -newer $(KCONFIG_CONFIG)))<br>
+=C2=A0 =C2=A0 ifneq ($(autoconf_is_current),)<br>
+=C2=A0 =C2=A0 include $(srctree)/<a href=3D"http://config.mk" rel=3D"noref=
errer" target=3D"_blank">config.mk</a><br>
+=C2=A0 =C2=A0 include $(srctree)/arch/$(ARCH)/Makefile<br>
+=C2=A0 =C2=A0 endif<br>
+<br>
+The compilation will be failed if <a href=3D"http://config.mk" rel=3D"nore=
ferrer" target=3D"_blank">config.mk</a> is not included<br>
+so delay 1 second to create auto.conf after creating of .config</div></blo=
ckquote></div><br>Adding a sleep seems pretty ugly, wouldn&#39;t a neater f=
ix be to change the logic so that instead of the test being &quot;is newer&=
quot; you use &quot;is not older&quot;, to handle identical timestamps as b=
eing current.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a11376dac005911051bee0a8d--

Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 76E6C71A62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 21:07:59 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so6551549wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=txlt6tKH7MInkcYKHFqLN2i7VCBAiQMMtCjZGqMl9Qc=;
	b=sz+ncl6hIm0bTkVEo30RIKrICGi/J3kt5WUg9BtvAqpO02oqQJvjrjvSUfMEWn798o
	X2gk7DcT3uQu3r9QXVcGzY/SJ5twBwlv3edddfbtNKrEdOKCWd6bBA9gx/XXmu1ZqIrn
	CEZgMJb6TTH5UlgOYMVW8KiWdsyXehZedIMgGyoO7ke9kByfaYa/4SXRVVX7ZkuNh6yR
	7Iqp0wUrCDyX8ZdxgxQzsxV12/6q2WeJO5+C6vAuZGnkNR1MMkicnTOTJ/uK00kCA8X5
	6GCwfCoXK9SiTMAxQSGkSkx3QrCc+14a/nBSuh+Ib3jPkaSxH6PepTaif0PbCVKjbkEz
	5DWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=txlt6tKH7MInkcYKHFqLN2i7VCBAiQMMtCjZGqMl9Qc=;
	b=aJMb/7PJrVFD6bhAego5AVlN5yK7KT2w1jrG6fljb4b6vcRnLbasfpB5DQfmyQX+67
	t9aTEc5pDxxZjr3XGJe6mcZAh7StKOaiOMImyI+NygiS4MlCurvb9D0dsB5wltjbeX3Z
	C5/O79ognF9Kve8JZMAIF/mhbKIxO1U8O3lFchxfdekfCw2lQQEDeukpnWzF3RVrYq41
	zTPtM3dkllgJvcGgEh0x4db3doz8ZSURaEK8AZ7S9taNPFpZTPC0mW5EgYr2+UuGon8K
	ikRIvDKtpLBFKoU+5irrykZkV3JB2nSjlrtpEMSyW4X5XyyFLMhRrfp47v6alc50qlum
	ixTg==
X-Gm-Message-State: AFeK/H2KB4QgsSicCJ4IVBF0RZ2miBmUNKKJPSG6rZplTBiWEtWP3bFJ77T0fURo0s/5/pugtSXgwj1gJ0OQCw==
X-Received: by 10.28.172.7 with SMTP id v7mr370796wme.78.1490821680889; Wed,
	29 Mar 2017 14:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Wed, 29 Mar 2017 14:08:00 -0700 (PDT)
In-Reply-To: <CABcZAN=vQzdwxd6F=nGBq0TWhOjx8kw0_MZfPpN82V=pbntF5g@mail.gmail.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
	<f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
	<CAAQYJAvnEY2=jHs6dkjk0aSR74s6+4xYLEQMsp4yVXjngsWQ4g@mail.gmail.com>
	<CABcZAN=vQzdwxd6F=nGBq0TWhOjx8kw0_MZfPpN82V=pbntF5g@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 29 Mar 2017 23:08:00 +0200
Message-ID: <CAAQYJAsVvf+=jvrX0NEnypsEZDJkfFzZVbbri+-DW82o6oeSxw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] update_gio_module_cache: fix host user contamination
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
X-List-Received-Date: Wed, 29 Mar 2017 21:08:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 10:40 PM, Christopher Larson <kergoth@gmail.com> wr=
ote:
>
> On Wed, Mar 29, 2017 at 1:33 PM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
>>
>> On Tue, Mar 28, 2017 at 6:14 PM, Christopher Larson <kergoth@gmail.com>
>> wrote:
>> > From: Abdur Rehman <abdur_rehman@mentor.com>
>> >
>> > update_gio_module_cache intercept creates file:
>> > $D${libdir}/gio/modules/giomodule.cache
>> >
>> > Change ownership of this file to root:root to avoid user contamination
>> > by host.
>> >
>> > Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> > ---
>> >  scripts/postinst-intercepts/update_gio_module_cache | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/scripts/postinst-intercepts/update_gio_module_cache
>> > b/scripts/postinst-intercepts/update_gio_module_cache
>> > index fe468092cf..92092f2144 100644
>> > --- a/scripts/postinst-intercepts/update_gio_module_cache
>> > +++ b/scripts/postinst-intercepts/update_gio_module_cache
>> > @@ -5,3 +5,5 @@ set -e
>> >  PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E
>> > LD_LIBRARY_PATH=3D$D${libdir}:$D${base_libdir} \
>> >          $D${libexecdir}/${binprefix}gio-querymodules
>> > $D${libdir}/gio/modules/
>> >
>> > +chown root:root $D${libdir}/gio/modules/giomodule.cache
>> > +
>> > --
>> > 2.11.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> Hello,
>> There must be something wrong with this patch.
>> After fresh pull of an hour ago I git:
>>
>> andrea@ThinkPad-T520:/oe/oe-core/build$ bitbake core-image-base
>> Loading cache: 100% |############################################| Time:
>> 0:00:00
>> Loaded 2095 entries from dependency cache.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION        =3D "1.33.2"
>> BUILD_SYS         =3D "x86_64-linux"
>> NATIVELSBSTRING   =3D "ubuntu-16.04"
>> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
>> MACHINE           =3D "c7x0"
>> DISTRO            =3D "nodistro"
>> DISTRO_VERSION    =3D "nodistro.0"
>> TUNE_FEATURES     =3D "arm armv5 thumb dsp"
>> TARGET_FPU        =3D "soft"
>> meta              =3D "master:c187326afcf1e9d781c1bd0923e1362a6f50f613"
>> meta-handheld     =3D "master:f88f5bc546ec18de232a91dc1c8185ad242c45f7"
>> meta-oe
>> meta-initramfs    =3D "master:225e64d95bc41077782815f3dceb6f2d1a42b167"
>>
>> Initialising tasks: 100% |#######################################| Time:
>> 0:00:08
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> WARNING: core-image-base-1.0-r0 do_rootfs: The postinstall intercept
>> hook 'update_gio_module_cache' failed (exit code: 1)! See log for
>> details! (Output: b'')
>> WARNING: core-image-base-1.0-r0 do_rootfs: The postinstalls for the
>> following packages will be postponed for first boot: libglib-2.0-0
>> NOTE: Tasks Summary: Attempted 3440 tasks of which 3427 didn't need to
>> be rerun and all succeeded.
>
>
> Odd, we=E2=80=99ve been running with this applied for ages. Is there anyt=
hing useful
> in do_rootfs? I=E2=80=99ll attempt to repro here. Thanks, and sorry for t=
he hassle.
> --

There is just a laconical message:

NOTE: Running intercept scripts:
NOTE: > Executing update_gio_module_cache intercept ...
chown: cannot access
'/tmp/build/tmp-glibc/work/c7x0-oe-linux-gnueabi/core-image-base/1.0-r0/roo=
tfs/usr/lib/gio/modules/giomodule.cache':
No such file or directory

Here the permissions:
andrea@ThinkPad-T520:/tmp/build/tmp-glibc/work/c7x0-oe-linux-gnueabi/core-i=
mage-base/1.0-r0/rootfs/usr/lib/gio$
ls -al
total 0
drwxr-xr-x 3 andrea andrea   60 mar 29 21:33 .
drwxr-xr-x 6 andrea andrea 1660 mar 29 22:51 ..
drwxr-xr-x 2 andrea andrea   40 mar 29 21:33 modules

Cheers
Andrea

> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


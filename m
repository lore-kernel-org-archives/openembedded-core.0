Return-Path: <gary.robertson@linaro.org>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BA52765D59
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 20:25:08 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so23329707wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 12:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=pYWWJbmaFKb3HtvaM0xRbGAFSYNoG/m9ZiatzjlTyac=;
	b=Abb5b0IAOc9X4u2ui3BLJ/g78j91RPvw4sDSA39bd/yAdLECBSG89N9udkwCPX6KbC
	ZbHR0c8OuWKIxHRk8PVhz1J3iINczYg24tiQGdX3wy23fOo3BM1WC1YMtaZ9ScQRwkPP
	Lj+et8bi1nUb7Zz+PnIA0QYR86NkSKzAI8JmFqQjWCmhY4pYt4hdC0DA4rLHZmudv0wd
	yeNYkm6R0/9oh1qP6OO94aKaMkaPeMeCErax2WnPz4/IllKXCB8qo6O9uPs5DuzDIGpT
	hui5SiEwzf9wiRRtWuri9JzXNQEvVI9zQ+NvlBlnOeaDbq9gpyQxFtHcLf5a6ILLJyWj
	4FRw==
X-Gm-Message-State: ALoCoQkVe90cfnJKYOLcxyFaNMje+TcanXd6dB87s2//r35nvs8iqa6DRtqF+3gZHEkskQyzPTg6
MIME-Version: 1.0
X-Received: by 10.180.77.79 with SMTP id q15mr89485wiw.8.1417724708387; Thu,
	04 Dec 2014 12:25:08 -0800 (PST)
Received: by 10.27.39.5 with HTTP; Thu, 4 Dec 2014 12:25:08 -0800 (PST)
In-Reply-To: <CAHPquwMXb8mT+UA5b2ahdTCmXDohTHGcRWF33Br5+tpdHcR6gA@mail.gmail.com>
References: <CAHPquwMXb8mT+UA5b2ahdTCmXDohTHGcRWF33Br5+tpdHcR6gA@mail.gmail.com>
Date: Thu, 4 Dec 2014 14:25:08 -0600
Message-ID: <CAF7YWnxw4RsJ6rKucXmuvHY4281Gxq1woFgMAx-wVrLK16cQ0Q@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: Petr Nechaev <petr.nechaev@cogentembedded.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Rootfs over 4GB
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
X-List-Received-Date: Thu, 04 Dec 2014 20:25:08 -0000
Content-Type: multipart/alternative; boundary=f46d04389063a21735050969c1a1

--f46d04389063a21735050969c1a1
Content-Type: text/plain; charset=UTF-8

AFAIK, the reasons for using FAT are:
(1) it is the most universally accepted filesystem format for devices and
OS environments,
(2) it is usable with almost all boot loaders produced anywhere by anyone,
and
(3) it is the de facto standard format for flash-based devices of all types

Your solution of creating a small FAT partition for booting and ext3 for
the root filesystem is probably
the cleanest way of implementing large filesystem images for a Linux
environment.


On Thu, Dec 4, 2014 at 2:10 PM, Petr Nechaev <
petr.nechaev@cogentembedded.com> wrote:

> Hi All,
>
>  I'm using oe-core for building images and have a problem. Rootfs.img is
> over 5GB and cannot be copied to FAT32 partition because of file size
> limit. This happens during do_bootimg task for core-image-sato-sdk. No
> warning is given by bitbake.
>  The problem occurs in build_fat_img() function in bootimg.bbclass.
>
>  I have temporarily fixed the problem in my build by extending
> bootimg.bbclass. I added new function which first splits *.hddimg into two
> partitions: FAT + ext3 and then puts rootfs.img to ext3 partition.
>
>  But, what is the right way of building core-image-sato-sdk with large
> rootfs? And what is the technical reason behind putting rootfs.img into a
> FAT partition?
>
> ---
> Petr
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--f46d04389063a21735050969c1a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>AFAIK, the reasons for using FAT are:<=
br>(1) it is the most universally accepted filesystem format for devices an=
d OS environments,<br></div>(2) it is usable with almost all boot loaders p=
roduced anywhere by anyone, and<br></div>(3) it is the de facto standard fo=
rmat for flash-based devices of all types<br><br></div>Your solution of cre=
ating a small FAT partition for booting and ext3 for the root filesystem is=
 probably<br></div>the cleanest way of implementing large filesystem images=
 for a Linux environment.<br><br></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Thu, Dec 4, 2014 at 2:10 PM, Petr Nechaev <span di=
r=3D"ltr">&lt;<a href=3D"mailto:petr.nechaev@cogentembedded.com" target=3D"=
_blank">petr.nechaev@cogentembedded.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div><div dir=3D"ltr"><span class=3D"=
"><div style=3D"font-size:13px">Hi All,</div><div style=3D"font-size:13px">=
<br></div><div style=3D"font-size:13px">=C2=A0I&#39;m using oe-core for bui=
lding images and have a problem. Rootfs.img is over 5GB and cannot be copie=
d to FAT32 partition because of file size limit. This happens during do_boo=
timg task for core-image-sato-sdk. No warning is given by bitbake.</div><di=
v style=3D"font-size:13px">=C2=A0The problem occurs in build_fat_img() func=
tion in bootimg.bbclass.=C2=A0<br></div><div style=3D"font-size:13px"><br><=
/div></span><div style=3D"font-size:13px">=C2=A0I have temporarily fixed th=
e problem in my build by extending bootimg.bbclass. I added new function wh=
ich first splits *.hddimg into two partitions: FAT + ext3 and then puts roo=
tfs.img to ext3 partition.=C2=A0</div><div style=3D"font-size:13px"><br></d=
iv><div style=3D"font-size:13px">=C2=A0But, what is the right way of buildi=
ng core-image-sato-sdk with large rootfs? And what is the technical reason =
behind putting rootfs.img into a FAT partition?</div><div style=3D"font-siz=
e:13px"><br></div><div style=3D"font-size:13px">---<br></div><div style=3D"=
font-size:13px"><div dir=3D"ltr">Petr</div></div></div></div>
</div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--f46d04389063a21735050969c1a1--

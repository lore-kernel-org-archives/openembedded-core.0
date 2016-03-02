Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 09BE6762B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 12:40:49 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id hb3so40346664igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 04:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1oKKOFjN4ofihf/OGyQcxihmcEjuCdXwhjH7qTLn+eE=;
	b=s/3hy/SiWO7+korHMz2XXrxfXvPHcoRiqcqyr8dSIKfA4ThJ8jO9i+blvNrwvPVt4q
	AU8LOzuxzzDT8Jx5lh9F1Wt/wwwNTUGWc1T3dzX+KBgp4m0o0G3G7igw5WJFF8GEu9NG
	Ym3ndE/8+tmwN6R4TCJpsba0io5TmQjSMA0kqO9+z5+ppRHSXwTJNEjilcB4cNg3SKD7
	q/C0VEKXeHOtWr3E5mkFc7rkilwkASZ3aloanI9Y/eQP65hdYKg65bBmZUKoquAphv3n
	yjBvYIB7c5Jtt8V3cJg2jQbrJdS0thaMrkO4MMDIN+6nIlZ8KXVuJTCSz4VWjkoY2dgR
	B6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1oKKOFjN4ofihf/OGyQcxihmcEjuCdXwhjH7qTLn+eE=;
	b=PnKOyJr4PXBFSxrWNZXlgvr/oxvDZETOxf4P7Lz7t1Z0CrEOyAPy2szyCmclwBWOHk
	gvt1oeLLRI+S8fcfRQ7gYgHRgLB82l7BILHIJLyIy0HKTtZ0ZnXoUmw4Va8OCXMb0a+t
	W0SQi1+nXKlsegkRIL6gn6ItnSEfnhjKpm55Jh23+CuYWshQOC+Gr5k2bPLJ+UAXOCen
	2d26XkmDgPg63g2s/JElavxoEcRJ3SLupP/SFzIMyTH9qs6KwK2g0Uz/F70nL1zs3s/6
	6TdES4DX0rGtCKwo8L/MhjD8MguOPlnICUBt9Ma4XPqGkfaKX0HTg02efbF9uPFjIzh+
	6gOA==
X-Gm-Message-State: AD7BkJLrYCqzVIGNKaKqPWCYAg3gUM2Iekyy+y8DnNdWTR74/tT+aupuMxxZtRB73Gc1IzjnXZttuWRkpOAGD2Sx
X-Received: by 10.50.160.11 with SMTP id xg11mr4211308igb.52.1456922450411;
	Wed, 02 Mar 2016 04:40:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 2 Mar 2016 04:40:31 -0800 (PST)
In-Reply-To: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Mar 2016 12:40:31 +0000
Message-ID: <CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Wed, 02 Mar 2016 12:40:50 -0000
Content-Type: multipart/alternative; boundary=001a1135e2381f5bf2052d103156

--001a1135e2381f5bf2052d103156
Content-Type: text/plain; charset=UTF-8

On 27 February 2016 at 22:09, Martin Jansa <martin.jansa@gmail.com> wrote:

> * add separate variable for configuration options generated from
>   PACKAGECONFIG setting, this helps other bbclasses and recipes
>   to take advantage of PACKAGECONFIG mechanism, without including
>   other options from EXTRA_OECONF
> * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
>   from PACKAGECONFIG:
>   EXTRA_QMAKEVARS_PRE +=
>   but with
>   conf/distro/include/no-static-libs.inc
>   it means getting --disable-static as invalid option inside
>   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
>   to use poky with meta-qt5.
> * once we migrate all bbclasses and recipes to EXTRA_CONF_PACKAGECONFIG
>   we should also restrict EXTRA_OECONF append only to autotools.bbclass
>   like I did for cmake.bbclass
>

Sorry, some of us have been a bit busy trying to get M3 stable.  This does
look good and I'm for squeezing it into M3.

Ross

--001a1135e2381f5bf2052d103156
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2016 at 22:09, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1k8" clas=
s=3D"a3s" style=3D"overflow:hidden">* add separate variable for configurati=
on options generated from<br>
=C2=A0 PACKAGECONFIG setting, this helps other bbclasses and recipes<br>
=C2=A0 to take advantage of PACKAGECONFIG mechanism, without including<br>
=C2=A0 other options from EXTRA_OECONF<br>
* e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options<br>
=C2=A0 from PACKAGECONFIG:<br>
=C2=A0 EXTRA_QMAKEVARS_PRE +=3D<br>
=C2=A0 but with<br>
=C2=A0 conf/distro/include/no-static-libs.inc<br>
=C2=A0 it means getting --disable-static as invalid option inside<br>
=C2=A0 EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried<br>
=C2=A0 to use poky with meta-qt5.<br>
* once we migrate all bbclasses and recipes to EXTRA_CONF_PACKAGECONFIG<br>
=C2=A0 we should also restrict EXTRA_OECONF append only to autotools.bbclas=
s<br>
=C2=A0 like I did for cmake.bbclass<br></div></blockquote></div><br>Sorry, =
some of us have been a bit busy trying to get M3 stable.=C2=A0 This does lo=
ok good and I&#39;m for squeezing it into M3.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135e2381f5bf2052d103156--

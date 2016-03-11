Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 97C5173232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 14:45:29 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id g203so147952658iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=xa6IbHBiLPHC/khE4DguWNjam9uYHlBRH4pah8BbvfY=;
	b=0ueTaUcVMMR0UhMXrVNh2EaTSl+L1TRGmUNQWSZURGypPHaY2yNupSa6V2MYBitoD7
	93dkVZ4j0fR+mikuKly7sZtBZIulpkkXYOOnBGjMwcacDVNi7sO2dTfoL0uoiwZwQl8r
	1VBFMwth8rQPMAgDOcvtQIgww0gsusP385CnmQJ+cfgVYZ1UgK0Yuk/t2+ZdY6JTr9bh
	b7OMUYzouL+tz3iA8LGoyYrWBShL5QXzG5+A644A08ULQiL4nRWGg3Iu+0aIX6JNElVw
	WAvP4q88n93aPvW+zl4WFe88e5oTMNwcn1gVyUgYwf9r/EPZzji/cozgBGu65kBd8T95
	TLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=xa6IbHBiLPHC/khE4DguWNjam9uYHlBRH4pah8BbvfY=;
	b=WKpifms+sz/ulptlvZEHuVtAfYvYoYNdSrtaY82z3US3iNRVhPK5/fEjUIo6d87dPo
	/JTl/iuvivvVtqwT5yEINegUwthse5s9JC0pnvJLAnZpPJyuOdH0OfNwgr1EO7fmvGUu
	n1pPUrvRPreSM6JTuMWrsWF7p/7g70r9Ak4xS0bVnVYxTHFUpAvhOxr6zWvB7BT/THLk
	7iEU3woDLfGrraxejwrYVWymgcqLWQ80hVnznekkAYi+SCLFl7zgtLpNeMfiLDdOXeTd
	eJsnZZEs50hX/T62/MWQUuDrZSrV0YU3ymNTtD2aeo/8bhUtvuuPLzWDokD5MCZafIw/
	NIjQ==
X-Gm-Message-State: AD7BkJKO1NteTPC9kKPqA2pHkFJX+TI4mFTexq8Xm24fewp/+5qy2oVn9GDEjMSpQ7P/sDgKGW6XozjIlZ177A==
X-Received: by 10.107.15.153 with SMTP id 25mr10579597iop.3.1457707530234;
	Fri, 11 Mar 2016 06:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20160311070859.163019mr4vs6d940@crashcourse.ca>
In-Reply-To: <20160311070859.163019mr4vs6d940@crashcourse.ca>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 11 Mar 2016 14:45:20 +0000
Message-ID: <CABcZAN=yAkvKMUqSML_PhO_mogQUxaBJcqiUpsXT+HAj5FMy6A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	openembedded-core@lists.openembedded.org
Subject: Re: what is the precise search path for resolving "include" or "require" .inc files?
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
X-List-Received-Date: Fri, 11 Mar 2016 14:45:31 -0000
Content-Type: multipart/alternative; boundary=001a113ee4fc86b149052dc6fbb1

--001a113ee4fc86b149052dc6fbb1
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 5:08 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>    not sure why i never noticed this before, but what is the search order
> or precedence or priority for resolving recipe file directives "include"
> or "require"? i was just perusing the bitbake user manual, and noticed
> the explanation that those directives use BBPATH to track down the first
> include file by a given name.
>
>    but AIUI, BBPATH is supposed to represent an ordered set of *layers*
> (i just examined BBPATH for a current [wind river linux] build, and that
> is exactly what it seems to contain). so when a recipe file like
> busybox.whatever.bb contains the line:
>
>    require busybox.inc
>
> i always just assumed the search would look in the current busybox
> directory, but that directory is not technically a layer directory --
> it's not a directory specified on the alleged BBPATH search path.
>
>    i never thought about this until i noticed some .bbappend files
> specifically using directives like:
>
>    require recipes-bsp/u-boot/u-boot.inc
>
> where that file reference *does* refer to a file relative to some
> actual layer directory somewhere.
>
>    what am i missing here?
>

BBPATH is temporarily prepended to include the directory the recipe lives
in, as a special case.

-Chris

--001a113ee4fc86b149052dc6fbb1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Mar 11, 2016 at 5:08 AM Robert P. J. Day &lt;<a href=3D"mailto:rpjday@cra=
shcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">=C2=A0 =C2=A0not sure why i never noticed this before, but w=
hat is the search order<br>
or precedence or priority for resolving recipe file directives &quot;includ=
e&quot;<br>
or &quot;require&quot;? i was just perusing the bitbake user manual, and no=
ticed<br>
the explanation that those directives use BBPATH to track down the first<br=
>
include file by a given name.<br>
<br>
=C2=A0 =C2=A0but AIUI, BBPATH is supposed to represent an ordered set of *l=
ayers*<br>
(i just examined BBPATH for a current [wind river linux] build, and that<br=
>
is exactly what it seems to contain). so when a recipe file like<br>
<a href=3D"http://busybox.whatever.bb" rel=3D"noreferrer" target=3D"_blank"=
>busybox.whatever.bb</a> contains the line:<br>
<br>
=C2=A0 =C2=A0require busybox.inc<br>
<br>
i always just assumed the search would look in the current busybox<br>
directory, but that directory is not technically a layer directory --<br>
it&#39;s not a directory specified on the alleged BBPATH search path.<br>
<br>
=C2=A0 =C2=A0i never thought about this until i noticed some .bbappend file=
s<br>
specifically using directives like:<br>
<br>
=C2=A0 =C2=A0require recipes-bsp/u-boot/u-boot.inc<br>
<br>
where that file reference *does* refer to a file relative to some<br>
actual layer directory somewhere.<br>
<br>
=C2=A0 =C2=A0what am i missing here?<br></blockquote><div><br></div><div>BB=
PATH is temporarily prepended to include the directory the recipe lives in,=
 as a special case.</div><div><br></div><div>-Chris=C2=A0</div></div></div>

--001a113ee4fc86b149052dc6fbb1--

Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 188586CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 16:32:02 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id va2so10072244obc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 08:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=z0NvlYffVaWd5vaIX+naGXzVHlLaksxQ2HJmEZ2O2m0=;
	b=kKLt/gBKx1bVYN4fBwoxNxMEly/pnTClNOohARgWvlYsx3yQIK3TVXpWI1o/22WNez
	19f2FC4fihxIyjC4Xo7e/IkFGeLy4BCBbiePsob8t3M5gvy1ZHPo2W1F/rx2cTVLvuSp
	CpjU3yng1v1yRrWJI6PONDuQCRnCkh5jyh23tK4f0hK3ZqT8+ySqKxETGMK3ESaLqCVs
	R/t195ZCL9Eezufrd5OZImkMVj4FtF/t5h6Q1zG9HZAlMxJdTgn6tBkieIvRsUbWVk66
	LBH2pi8VVptNyKqtnVNuvwx5DFJ7jQYf7d15FAWfjDnHxs2SLgV7B7/zh2IR4U/mNe9z
	oE7w==
X-Gm-Message-State: ALoCoQm7++hUHB2Bycm98bJq2CkC/86SAg2lRPEPNiitCRT3olCblFGPgO1Xis43jkJ8gH01eDE7
X-Received: by 10.60.134.14 with SMTP id pg14mr2388610oeb.66.1385742721117;
	Fri, 29 Nov 2013 08:32:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.0.50 with HTTP; Fri, 29 Nov 2013 08:31:40 -0800 (PST)
In-Reply-To: <2455395.bHzIGNWoWP@helios>
References: <2455395.bHzIGNWoWP@helios>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 29 Nov 2013 17:31:40 +0100
Message-ID: <CAP71Wjy9-8pkU0bLKsn5L-SFDFeidW56ZEuLV25geN1_7ykgHA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Yocto list discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Automated testing on real hardware
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
X-List-Received-Date: Fri, 29 Nov 2013 16:32:02 -0000
Content-Type: multipart/alternative; boundary=047d7b472868a481db04ec535e11

--047d7b472868a481db04ec535e11
Content-Type: text/plain; charset=ISO-8859-1

Paul,


On Fri, Nov 29, 2013 at 4:58 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> LAVA
> -----
>
> A number of people had suggested I look at LAVA [1]. It is split into
> different
> components for each function, some of which should be usable independently
> so
> you don't have to use the entire framework. Many of the components could be
> useful assuming they are independent, but in terms of being able to
> actually
> run our tests, the one that stands out as being most relevant is lava-
> dispatcher. This is the component that deploys images, and boots the
> hardware
> in order to run the tests.
>
> I've looked at lava-dispatcher a couple of times; firstly at the code, and
> yesterday I looked at actually running it. Initially it looked very
> promising
> - reasonably licensed, written in Python, has some rudimentary support for
> OE
> images. However while looking at it I found the following:
>
> * It requires root to run, since it mounts the images temporarily and
> modifies
> the contents. We've done quite a lot to avoid having to run as root in OE,
> so
> this is a hard sell.
>

i have forwarded this email to the relevant people in Linaro working on
LAVA. I hope to be able to bring more information about that, as I am not
involved with LAVA, just a 'user' of it. By 'root' here, you mean on the
server side, e.g. the LAVA instance, which will typically not be the
'builder', or do you want to couple build and test on the same 'server'?
LAVA jobs are generally submitted by a CI instance (Jenkins in our case).


> * It expects images to be created by linaro-media-create, which in turn
> requires an "hwpack" [2]. The hwpack concept seems primarily geared to
> Ubuntu
> and distributions like it where you'd have a generic base image upon which
> you'd install some board-specific packages in order to make it work on the
> board. OE doesn't work that way - we just build images specific to the
> board,
> which makes this mechanism completely superfluous for our usage; but the
> tool
> appears to require it.
>

that is no longer the case. we do have support for 'native' OE images, and
we've had that for a while. That is what I am using for my project at
Linaro. None of our projects/jobs deliverable are 'public' at the moment,
so you won't find them, but i can confirm that what we deploy for our jobs
is the output of OE (e.g. what is in the deploy/image folder). hwpack was
something mostly meant to make it simpler to work with Ubuntu and Android
root FS, and is not suited for OE.


>
> * There is a general lack of abstraction and far too much hardcoding. For
> example, even at the most abstract level, the "Target" class (which is the
> base class for defining what to do for different types of targets) has
> hardcoded
> deploy_linaro / deploy_android functions:
>
>
> https://git.linaro.org/gitweb?p=lava/lava-dispatcher.git;a=blob;f=lava_dispatcher/device/target.py
>
> * It's not clear to me how well it will work across different host
> distributions that we want to support; the main LAVA installer quits if it
> isn't run on Ubuntu. For convenience I happened to be using an Ubuntu VM,
> and
> I wasn't running the full installer so I avoided this check altogether. It
> just concerns me that such a check would even be there.
>

I agree that this is a problem and we should fix. Our IT infrastructure is
largely based on Ubuntu servers, but that should not affect what we create
that much.


>
> Of course, none of these problems are impossible to overcome, if we're
> prepared to put a significant amount of engineering into resolving them. In
> terms of enabling the Yocto Project QA team to test images on real
> hardware in
> the 1.6 development cycle however, I don't believe this is going to be
> deliverable.
>

--047d7b472868a481db04ec535e11
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_extra">Paul=
,=A0</div><div class=3D"gmail_extra"><br></div><div><br></div><div class=3D=
"gmail_quote">On Fri, Nov 29, 2013 at 4:58 PM, Paul Eggleton <span dir=3D"l=
tr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">=
paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":1hk" style=3D"overflow:hidden">LAVA<br>
-----<br>
<br>
A number of people had suggested I look at LAVA [1]. It is split into diffe=
rent<br>
components for each function, some of which should be usable independently =
so<br>
you don&#39;t have to use the entire framework. Many of the components coul=
d be<br>
useful assuming they are independent, but in terms of being able to actuall=
y<br>
run our tests, the one that stands out as being most relevant is lava-<br>
dispatcher. This is the component that deploys images, and boots the hardwa=
re<br>
in order to run the tests.<br>
<br>
I&#39;ve looked at lava-dispatcher a couple of times; firstly at the code, =
and<br>
yesterday I looked at actually running it. Initially it looked very promisi=
ng<br>
- reasonably licensed, written in Python, has some rudimentary support for =
OE<br>
images. However while looking at it I found the following:<br>
<br>
* It requires root to run, since it mounts the images temporarily and modif=
ies<br>
the contents. We&#39;ve done quite a lot to avoid having to run as root in =
OE, so<br>
this is a hard sell.<br></div></blockquote><div><br></div><div>i have forwa=
rded this email to the relevant people in Linaro working on LAVA. I hope to=
 be able to bring more information about that, as I am not involved with LA=
VA, just a &#39;user&#39; of it. By &#39;root&#39; here, you mean on the se=
rver side, e.g. the LAVA instance, which will typically not be the &#39;bui=
lder&#39;, or do you want to couple build and test on the same &#39;server&=
#39;? LAVA jobs are generally submitted by a CI instance (Jenkins in our ca=
se).=A0</div>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D":1hk" style=3D"overflow:hidden">
<br>
* It expects images to be created by linaro-media-create, which in turn<br>
requires an &quot;hwpack&quot; [2]. The hwpack concept seems primarily gear=
ed to Ubuntu<br>
and distributions like it where you&#39;d have a generic base image upon wh=
ich<br>
you&#39;d install some board-specific packages in order to make it work on =
the<br>
board. OE doesn&#39;t work that way - we just build images specific to the =
board,<br>
which makes this mechanism completely superfluous for our usage; but the to=
ol<br>
appears to require it.<br></div></blockquote><div><br></div><div>that is no=
 longer the case. we do have support for &#39;native&#39; OE images, and we=
&#39;ve had that for a while. That is what I am using for my project at Lin=
aro. None of our projects/jobs deliverable are &#39;public&#39; at the mome=
nt, so you won&#39;t find them, but i can confirm that what we deploy for o=
ur jobs is the output of OE (e.g. what is in the deploy/image folder). hwpa=
ck was something mostly meant to make it simpler to work with Ubuntu and An=
droid root FS, and is not suited for OE.</div>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":1hk" style=3D"overflow:hidden">
<br>
* There is a general lack of abstraction and far too much hardcoding. For<b=
r>
example, even at the most abstract level, the &quot;Target&quot; class (whi=
ch is the<br>
base class for defining what to do for different types of targets) has hard=
coded<br>
deploy_linaro / deploy_android functions:<br>
<br>
<a href=3D"https://git.linaro.org/gitweb?p=3Dlava/lava-dispatcher.git;a=3Db=
lob;f=3Dlava_dispatcher/device/target.py" target=3D"_blank">https://git.lin=
aro.org/gitweb?p=3Dlava/lava-dispatcher.git;a=3Dblob;f=3Dlava_dispatcher/de=
vice/target.py</a><br>


<br>
* It&#39;s not clear to me how well it will work across different host<br>
distributions that we want to support; the main LAVA installer quits if it<=
br>
isn&#39;t run on Ubuntu. For convenience I happened to be using an Ubuntu V=
M, and<br>
I wasn&#39;t running the full installer so I avoided this check altogether.=
 It<br>
just concerns me that such a check would even be there.<br></div></blockquo=
te><div><br></div><div>I agree that this is a problem and we should fix. Ou=
r IT infrastructure is largely based on Ubuntu servers, but that should not=
 affect what we create that much.</div>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":1hk" style=3D"overflow:hidden">
<br>
Of course, none of these problems are impossible to overcome, if we&#39;re<=
br>
prepared to put a significant amount of engineering into resolving them. In=
<br>
terms of enabling the Yocto Project QA team to test images on real hardware=
 in<br>
the 1.6 development cycle however, I don&#39;t believe this is going to be<=
br>
deliverable.</div></blockquote></div><br></div><div class=3D"gmail_extra"><=
br></div></div>

--047d7b472868a481db04ec535e11--

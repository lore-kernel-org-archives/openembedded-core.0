Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SZMxs-0004Zq-3t
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 16:00:00 +0200
Received: by yenl13 with SMTP id l13so2074875yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5xCKLpAKvMdM6DUMB6awXnFlyfudBR5HAc1bg1USoSM=;
	b=USpER/XVZGiCJiIbLgzCAM/oAbMMk6d6uA/0JZhRwzkUBLGsQtmEwA6z/G2SIAQRT4
	Dh7AFtETvxu6QlAGvKkiHYUMjICMtQX0sR0dMgbkf9YYy/rfMB83XCItkHkRQ6cGkxYo
	o7zv1GJX6yaknmEvgcmnTSdUXliNGi/pQWMUmDibhU1fzYndRroAY+Vv/4k85IqWDL1L
	jP5ZqIDntAgkVhXq1C82/gopMyUy2r0rjuZkr4c9VBaPONwRaO69lHPDm7F0kFY9LB3U
	d5lWK5+Ebf282xHKNloRFck+B76Bp8iV8Ga4D5fnl6XhULi9kYBhutTdj652LKe0RYiu
	1Wfg==
MIME-Version: 1.0
Received: by 10.43.44.193 with SMTP id uh1mr6673630icb.3.1338299382206; Tue,
	29 May 2012 06:49:42 -0700 (PDT)
Received: by 10.231.238.69 with HTTP; Tue, 29 May 2012 06:49:42 -0700 (PDT)
In-Reply-To: <11156699.ieWXhGW3v3@helios>
References: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
	<3418839.G4f3PdLdKK@helios>
	<CAOHjBZu6_vfPkPnVj9E48nc=1jEO9dqMG8hkrtLkLesbWZ8g6w@mail.gmail.com>
	<11156699.ieWXhGW3v3@helios>
Date: Tue, 29 May 2012 15:49:42 +0200
Message-ID: <CAOHjBZvsH6mQVtHPb8V4tOuKTpjPhCX2yy065yRqR5eQW9=Y-A@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to query installed rpm packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 14:00:00 -0000
Content-Type: multipart/alternative; boundary=bcaec51a76dc4792c004c12d1b02

--bcaec51a76dc4792c004c12d1b02
Content-Type: text/plain; charset=ISO-8859-1

2012/5/29 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Tuesday 29 May 2012 15:20:14 Giuseppe Condorelli wrote:
> > What I'm not understanding is how I can invoke my shell function. Do you
> > mean I have to invoke it as append function of populate_rootfs one?
>
> If you aren't including packaging data in the resulting image (i.e.
> IMAGE_FEATURES does not contain "package-management"), you need to do your
> rpm
> calls from a function called via ROOTFS_POSTPROCESS_COMMAND because
> afterwards
> the data will be removed and rpm will not be usable.
>
> > What I really need is a way to query the rpm database
> > out from the build system, as we normally do with host packages.
> > I tried to have a standalone run of  the rpm command the
> > list_installed_packages invokes but (obviously) I got a long series of
> > errors.
>
> Below is what I meant - you could put this into some bbclass that you could
> add using INHERIT += "someclass.bbclass" in local.conf:
>
> ------------- snip --------------
> ROOTFS_POSTPROCESS_COMMAND += "do_some_packaging_stuff ; "
>
> do_some_packaging_stuff() {
>        list_installed_packages > /path/to/output/file
> }
> ------------- snip --------------
>
> Substitute list_installed_packages for a similar rpm query command to the
> one
> list_installed_packages uses.
>
Yes!!!! Very very simple solution (that obviously I didn't though... :| ).


>
> Out of interest, what information are you querying from the packaging
> system?
>
What I'm trying to obtain is a way to install and to query rpm packages out
from build system.
I mean, I would like to have the rpms built via bitbake/oe-core repository
and than to install them
into a specific root path without the build system support. Also, after
having installed them (or part of
them) I need to query the rpm database in case of debug.
So I started asking my questions to understand if (internally) there was a
way for querying (and it was!).
This for backword compatibility with what I'm currently managing (a
distribution totally rpm based) and
what I'm thinking to implement in next future (a distribution oe based).
For a while I would like both scenarios
will exist in parallel.
If you have other suggestions, or if you think my way to proceed is going
to a black scenario, please don't
hesitate to correct me.

>
> Cheers,
> Paul
>
Cheers,
Giuseppe

>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--bcaec51a76dc4792c004c12d1b02
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">2012/5/29 Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span><br><blockquote style=3D"margin:0px 0px 0=
px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-wi=
dth:1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Tuesday 29 May 2012 15:20:14 Giuseppe Condorelli wrote=
:<br>
&gt; What I&#39;m not understanding is how I can invoke my shell function. =
Do you<br>
&gt; mean I have to invoke it as append function of populate_rootfs one?<br=
>
<br>
</div>If you aren&#39;t including packaging data in the resulting image (i.=
e.<br>
IMAGE_FEATURES does not contain &quot;package-management&quot;), you need t=
o do your rpm<br>
calls from a function called via ROOTFS_POSTPROCESS_COMMAND because afterwa=
rds<br>
the data will be removed and rpm will not be usable.<br>
<div class=3D"im"><br>
&gt; What I really need is a way to query the rpm database<br>
&gt; out from the build system, as we normally do with host packages.<br>
&gt; I tried to have a standalone run of =A0the rpm command the<br>
&gt; list_installed_packages invokes but (obviously) I got a long series of=
<br>
&gt; errors.<br>
<br>
</div>Below is what I meant - you could put this into some bbclass that you=
 could<br>
add using INHERIT +=3D &quot;someclass.bbclass&quot; in local.conf:<br>
<br>
------------- snip --------------<br>
ROOTFS_POSTPROCESS_COMMAND +=3D &quot;do_some_packaging_stuff ; &quot;<br>
<br>
do_some_packaging_stuff() {<br>
 =A0 =A0 =A0 =A0list_installed_packages &gt; /path/to/output/file<br>
}<br>
------------- snip --------------<br>
<br>
Substitute list_installed_packages for a similar rpm query command to the o=
ne<br>
list_installed_packages uses.<br></blockquote><div>Yes!!!! Very very simple=
 solution (that obviously I didn&#39;t though... :| ).<br>=A0</div><blockqu=
ote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rg=
b(204,204,204);border-left-width:1px;border-left-style:solid" class=3D"gmai=
l_quote">

<br>
Out of interest, what information are you querying from the packaging syste=
m?<br></blockquote><div>What I&#39;m trying to obtain is a way to install a=
nd to query rpm packages out from build system.</div><div>I mean, I would l=
ike to have the rpms built via bitbake/oe-core repository and than to insta=
ll them</div>
<div>into a specific root path without the build system support. Also, afte=
r having installed them (or part of</div><div>them) I need to query the rpm=
 database in case of debug.</div><div>So I started asking my questions to u=
nderstand if (internally) there was a way for querying (and it was!).</div>
<div>This for backword compatibility with what=A0I&#39;m currently managing=
 (a distribution totally rpm based) and</div><div>what=A0I&#39;m thinking t=
o implement in next future (a distribution oe based). For a while I would l=
ike both scenarios</div>
<div>will exist in parallel.</div><div>If you have other suggestions, or if=
 you think my way to proceed is going to a black scenario, please don&#39;t=
</div><div>hesitate to correct me.</div><blockquote style=3D"margin:0px 0px=
 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-=
width:1px;border-left-style:solid" class=3D"gmail_quote">

<br>
Cheers,<br>
Paul<br></blockquote><div>Cheers,</div><div>Giuseppe=A0</div><blockquote st=
yle=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,=
204,204);border-left-width:1px;border-left-style:solid" class=3D"gmail_quot=
e">

<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br>

--bcaec51a76dc4792c004c12d1b02--

Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RLelU-0004xO-Ej
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 18:38:17 +0100
Received: by ywf9 with SMTP id 9so367738ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 10:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=42s54TesBtWoa27UhWfQksVge+Ej62xTsvr8q+st+rY=;
	b=SFUU8DGjF5Jr74SamOTjv+sM8cCr4zUvN0r+tvZCjpwrgRsJb2fvH16dZo25O4KLjt
	2tXL0jhzkdgWxLdo+TIBYXTh/7eFtuE71HCEdeR/Mqad5hs16abxFmSA236a9ItCvicq
	jwvLoeJOho0XcXPAq4kHt8KWVfvzTCAns4gRc=
MIME-Version: 1.0
Received: by 10.236.154.193 with SMTP id h41mr8686140yhk.15.1320255126493;
	Wed, 02 Nov 2011 10:32:06 -0700 (PDT)
Received: by 10.147.182.9 with HTTP; Wed, 2 Nov 2011 10:32:06 -0700 (PDT)
In-Reply-To: <1320021891.10032.56.camel@localhost.localdomain>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
	<4EAABF76.7080703@windriver.com>
	<1320021891.10032.56.camel@localhost.localdomain>
Date: Wed, 2 Nov 2011 18:32:06 +0100
Message-ID: <CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to set time zone
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
X-List-Received-Date: Wed, 02 Nov 2011 17:38:17 -0000
Content-Type: multipart/alternative; boundary=20cf303ea4a2d3d9bc04b0c3d929

--20cf303ea4a2d3d9bc04b0c3d929
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 31, 2011 at 1:44 AM, Ni Qingliang <niqingliang@insigma.com.cn>wrote:

> I'd like the 'system level configuration' solution.
>
> the /etc/localtime/ link can be done when packaging rootfs (using the
> system level configuration).
>
> On Fri, 2011-10-28 at 22:43 +0800, Mark Hatle wrote:
> > Setting the default TZ for the image is something that should be done in
> a post
> > install script for the tzdata package or something similar.
> >
> > Since the /etc/localtime is usually a copy/hardlink or symlink to the
> timezone
> > data we don't want to package it up.  Instead we want to perform the
> actions
> > that a program running on the target system itself would use to change
> the timezone.
> >
> > So I think the easiest approach is to add a system level configuration
> variable
> > (set the default).
> >
> > Then use this variable to populate the configuration file that specifies
> the
> > system timezone... and then use the post install process to check the
> contents
> > of a text file.
> >
> > Alternatively do this via an initscript -- but for folks w/ read-only
> > filesystems I'm not sure that will work.
> >
> > --Mark
>
<cut>

Maybe I misunderstand "system level configuration" but in the meta-oe
recipe we have

DEFAULT_TIMEZONE ?= "Europe/London"

Maybe UTC would be better?
Note how the variable is weak thus can be overridden in local.conf.

Secondly, why do it as post-install or at image do_rootfs stage when we
have set the variable and are therefore able to provide sane defaults in
do_install?

Other points before starting to write a patch:
-why is the recipe in oe-core doing   chown -R root:root ${D}   ?

-the logic around   # libc is removing zoneinfo files from package
  Is it only eglibc?


Regards

Andrea

--20cf303ea4a2d3d9bc04b0c3d929
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Oct 31, 2011 at 1:44 AM, Ni Qingliang <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:niqingliang@insigma.com.cn">niqinglia=
ng@insigma.com.cn</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
I&#39;d like the &#39;system level configuration&#39; solution.<br>
<br>
the /etc/localtime/ link can be done when packaging rootfs (using the<br>
system level configuration).<br>
<div><div></div><div class=3D"h5"><br>
On Fri, 2011-10-28 at 22:43 +0800, Mark Hatle wrote:<br>
&gt; Setting the default TZ for the image is something that should be done =
in a post<br>
&gt; install script for the tzdata package or something similar.<br>
&gt;<br>
&gt; Since the /etc/localtime is usually a copy/hardlink or symlink to the =
timezone<br>
&gt; data we don&#39;t want to package it up. =A0Instead we want to perform=
 the actions<br>
&gt; that a program running on the target system itself would use to change=
 the timezone.<br>
&gt;<br>
&gt; So I think the easiest approach is to add a system level configuration=
 variable<br>
&gt; (set the default).<br>
&gt;<br>
&gt; Then use this variable to populate the configuration file that specifi=
es the<br>
&gt; system timezone... and then use the post install process to check the =
contents<br>
&gt; of a text file.<br>
&gt;<br>
&gt; Alternatively do this via an initscript -- but for folks w/ read-only<=
br>
&gt; filesystems I&#39;m not sure that will work.<br>
&gt;<br>
&gt; --Mark<br></div></div></blockquote><div class=3D"h5">&lt;cut&gt;<br><b=
r>Maybe I misunderstand &quot;system level configuration&quot; but in the m=
eta-oe recipe we have<br><br>DEFAULT_TIMEZONE ?=3D &quot;Europe/London&quot=
;<br>
<br>Maybe UTC would be better?<br>Note how the variable is weak thus can be=
 overridden in local.conf. =A0 <br>=A0<br>Secondly, why do it as post-insta=
ll or at image do_rootfs stage when we have set the variable and are theref=
ore able to provide sane defaults in do_install?<br>
<br>Other points before starting to write a patch:<br>-why is the recipe in=
 oe-core doing=A0=A0 chown -R root:root ${D}=A0=A0 ?<br><br>-the logic arou=
nd=A0=A0 # libc is removing zoneinfo files from package<br>=A0 Is it only e=
glibc?<br>
<br><br>Regards<br><br>Andrea<br><br><code><br></code></div></div>

--20cf303ea4a2d3d9bc04b0c3d929--

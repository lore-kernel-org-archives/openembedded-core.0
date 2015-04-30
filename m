Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 303E665CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 14:39:44 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so34227342qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=c336k0+qLCdH74XcAOFCkTkytNg5WMnPV7oZjO7MJTs=;
	b=uCrnTEv1LXvGmDLgb4MP/a0VvsKSV9UcegryAkdKk+ar2p7DMCQqlxSfpAiR2tm7rz
	yV9GT6KeqduQw1HJeLr5nXvOwbEHGnVBfonLFidb20lgxPoPuHDjI9CGEQfHzTS9o2iR
	TLumc1uvrjnWEd3FNG2cvgIAezOFeDyO2T1CTd+GtDxY/qxoVSBVpARiAUMONkwp0hgy
	+LD11NE7l7aC2tUx+dJJQLIqYLEacx0pU1zKcadX4NmPWUY1wrwZWMne0S0pVdiFsKV2
	msJ64x/IsoNQoL5hKbTcTUhuERJhCYDKO93T2uT6Qx+n2BHn1j8Zqkp9Qn7mD0R/QVrk
	I8lg==
X-Received: by 10.140.237.68 with SMTP id i65mr5149654qhc.42.1430404785604;
	Thu, 30 Apr 2015 07:39:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Thu, 30 Apr 2015 07:39:25 -0700 (PDT)
In-Reply-To: <20150430142842.GA19899@mcrowe.com>
References: <20150430142842.GA19899@mcrowe.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 30 Apr 2015 07:39:25 -0700
X-Google-Sender-Auth: tyMr25O2a6eHh5vhdOAygVxZ-T8
Message-ID: <CABcZAN=hpf+C=2TQ+ghPktwM68Bq+T_HVMWhR94Y2K5Em4xwPw@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libcap: make -e causing trouble
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
X-List-Received-Date: Thu, 30 Apr 2015 14:39:46 -0000
Content-Type: multipart/alternative; boundary=001a1135d746218dca0514f211ea

--001a1135d746218dca0514f211ea
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 30, 2015 at 7:28 AM, Mike Crowe <mac@mcrowe.com> wrote:

> oe-core 51540b64f62234c145fc32cfa3fbbaaebbeece08 altered libcap.inc (at the
> time) to append to EXTRA_OEMAKE rather than assign to it. The default value
> for EXTRA_OEMAKE contains "-e". This means that the change caused "-e" to
> be passed to make for the first time.
>
> Unfortunately passing "-e" subtly changes the behaviour of libcap's
> Make.Rules under recursive make when prefix="" (which it is for us since
> we're using meta-micro.) Here's a snippet of Make.rules:
>
> ifdef prefix
> exec_prefix=$(prefix)
> lib_prefix=$(exec_prefix)
> inc_prefix=$(lib_prefix)
> man_prefix=$(prefix)/share
> else
> prefix=/usr
> exec_prefix=
> lib_prefix=$(exec_prefix)
> inc_prefix=$(prefix)
> man_prefix=$(prefix)/share
> endif
>
> Without "-e" the prefix comes from the command line in both the parent and
> submakes. This takes precedence over any attempt to reassign it with a
> simple "=" operation so the headers are correctly installed in (empty
> string)/include.
>
> With "-e" the prefix still comes from the command line in the parent make
> but from the environment in the submake. The attempt to assign it fails in
> the parent make as before, but not in the submake so the headers are
> installed incorrectly in /usr/include.
>
> In all four cases the "ifdef prefix" else clause is executed.
>
> The quick-and-easy fix for this is simply to pass prefix="${prefix}/" but
> it's really just working around the problem.
>
> Alternatively we could go back to assigning EXTRA_OEMAKE rather than
> appending to it.
>
> What would be the preferred course of action?
>

Given our use of make -e (with MAKEFLAGS= to try to prevent it from flowing
into submakes) was always a hack to try to let things "just work", I think
wherever possible we should stop relying on it, and explicitly pass
everything the way that particular make-based buildsystem expects,
personally. Better to be explicit than to rely on implicit "magic".
Further, that behavior encourages recipe maintainers to not even read the
buildsystem of the project they're creating a recipe for, which often leads
to problems down the road..
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135d746218dca0514f211ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Apr 30, 2015 at 7:28 AM, Mike Crowe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":13j" class=3D"a3s" sty=
le=3D"overflow:hidden">oe-core 51540b64f62234c145fc32cfa3fbbaaebbeece08 alt=
ered libcap.inc (at the<br>
time) to append to EXTRA_OEMAKE rather than assign to it. The default value=
<br>
for EXTRA_OEMAKE contains &quot;-e&quot;. This means that the change caused=
 &quot;-e&quot; to<br>
be passed to make for the first time.<br>
<br>
Unfortunately passing &quot;-e&quot; subtly changes the behaviour of libcap=
&#39;s<br>
Make.Rules under recursive make when prefix=3D&quot;&quot; (which it is for=
 us since<br>
we&#39;re using meta-micro.) Here&#39;s a snippet of Make.rules:<br>
<br>
ifdef prefix<br>
exec_prefix=3D$(prefix)<br>
lib_prefix=3D$(exec_prefix)<br>
inc_prefix=3D$(lib_prefix)<br>
man_prefix=3D$(prefix)/share<br>
else<br>
prefix=3D/usr<br>
exec_prefix=3D<br>
lib_prefix=3D$(exec_prefix)<br>
inc_prefix=3D$(prefix)<br>
man_prefix=3D$(prefix)/share<br>
endif<br>
<br>
Without &quot;-e&quot; the prefix comes from the command line in both the p=
arent and<br>
submakes. This takes precedence over any attempt to reassign it with a<br>
simple &quot;=3D&quot; operation so the headers are correctly installed in =
(empty<br>
string)/include.<br>
<br>
With &quot;-e&quot; the prefix still comes from the command line in the par=
ent make<br>
but from the environment in the submake. The attempt to assign it fails in<=
br>
the parent make as before, but not in the submake so the headers are<br>
installed incorrectly in /usr/include.<br>
<br>
In all four cases the &quot;ifdef prefix&quot; else clause is executed.<br>
<br>
The quick-and-easy fix for this is simply to pass prefix=3D&quot;${prefix}/=
&quot; but<br>
it&#39;s really just working around the problem.<br>
<br>
Alternatively we could go back to assigning EXTRA_OEMAKE rather than<br>
appending to it.<br>
<br>
What would be the preferred course of action?</div></blockquote></div><br>G=
iven our use of make -e (with MAKEFLAGS=3D to try to prevent it from flowin=
g into submakes) was always a hack to try to let things &quot;just work&quo=
t;, I think wherever possible we should stop relying on it, and explicitly =
pass everything the way that particular make-based buildsystem expects, per=
sonally. Better to be explicit than to rely on implicit &quot;magic&quot;. =
Further, that behavior encourages recipe maintainers to not even read the b=
uildsystem of the project they&#39;re creating a recipe for, which often le=
ads to problems down the road..<br>-- <br><div class=3D"gmail_signature">Ch=
ristopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEm=
bedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mento=
r Graphics</div>
</div></div>

--001a1135d746218dca0514f211ea--

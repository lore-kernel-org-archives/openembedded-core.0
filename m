Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 536F665CA7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 14:33:28 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id f51so8687278qge.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KzqWhi3Q7AOlbuz5fD2c0if2MMl1aqKRvyVTZA2gFMw=;
	b=V3ao5TI7P45sISC9jwG3eE91WCN7xxNQfolbd5TGO7gv8XjNQYfmapvmx0rQ1xjxqn
	uQsBBk+BDZQgw9rQdKsENhoJHtQz/Vk1it5ggD+EMB4xNZHt7K7R3SPN024ucYVQZZsa
	MZWk6YVkpzbW4bow7H+PfXfOX16VWcmUri3jtbjfpj7HWoVmNCb8Vll3mC7wDBuBroWe
	HdLNMb15xiQulCFv2utQDbxA7RFH4Y+9AUzSNle5b19ztFYDUW6+0MfPZusKPenHK+tI
	8XGFE5r3KLj5tCqvhsrpZ6YkfwDbPR2/ObYEKr6cwfBeizp9zpyd+shOiqV4eEsqOEcD
	hdQA==
X-Received: by 10.140.40.84 with SMTP id w78mr35598172qgw.87.1407162809558;
	Mon, 04 Aug 2014 07:33:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 4 Aug 2014 07:33:09 -0700 (PDT)
In-Reply-To: <1418636.H30RBdXEMU@peggleto-mobl5.ger.corp.intel.com>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
	<1418636.H30RBdXEMU@peggleto-mobl5.ger.corp.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 4 Aug 2014 20:03:09 +0530
Message-ID: <CADyYWLnK2m93BsT+XvPTg-eAFeKTqYUhSLTNkSHEtF8=EemaNw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 14:33:30 -0000
Content-Type: multipart/alternative; boundary=001a11c122ba67ae2d04ffce9fb6

--001a11c122ba67ae2d04ffce9fb6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,


On Mon, Aug 4, 2014 at 7:48 PM, Paul Eggleton <paul.eggleton@linux.intel.co=
m
> wrote:

> Hi Sujith,
>
> On Monday 04 August 2014 19:27:08 Sujith H wrote:
> > From: Sujith H <Sujith_Haridasan@mentor.com>
> >
> > If hostname is not added to /etc/hosts file then rpcinfo
> > command fails when hostname is passed as argument. This was
> > observed when rpcinfo command was tested on freescale target.
> > Below was the output observed without this change.
> >
> > root@mx6q:~# rpcinfo -s mx6q
> > rpcinfo: can't contact rpcbind: RPC: (unknown error code)
> >
> > Below is the output after this change:
> > root@mx6q:~# rpcinfo -s mx6q
> >    program version(s) netid(s)                         service     owne=
r
> >     100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper
>  superuser
> > root@mx6q:~#
> >
> > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > ---
> >  meta/classes/image.bbclass | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 82605f2..7a5a5c1 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {
> >       fi
> >  }
> >
> > +ROOTFS_POSTPROCESS_COMMAND +=3D "add_machine_name_loop_back;"
> > +
> > +add_machine_name_loop_back() {
> > +    if [ -n ${MACHINE} ]; then
> > +         echo 127.0.1.1 "       "${MACHINE} >>
> > ${IMAGE_ROOTFS}${sysconfdir}/hosts +    fi
> > +}
> > +
>
> I think in the earlier discussion the conclusion was that we do not want
> this
> enabled by default, which the above will do.
>
> The question I have is, if this isn't a good idea, is there a better
> solution?
>
>
I totally agree with the discussion. Is it a good idea to implement like
check made for zap_empty_root_password?
For zap_empty_root_password there is a conditional check if debug-tweaks
are enabled then zap_empty_root_password is
called. So can I use debug-tweaks to handle add_machine_name_loop_back in
the patch?


Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

Thanks,

Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11c122ba67ae2d04ffce9fb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<br><div><div class=3D"gmail_extra"><br><br><div c=
lass=3D"gmail_quote">On Mon, Aug 4, 2014 at 7:48 PM, Paul Eggleton <span di=
r=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_b=
lank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Sujith,<br>
<div><div class=3D"h5"><br>
On Monday 04 August 2014 19:27:08 Sujith H wrote:<br>
&gt; From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">Suji=
th_Haridasan@mentor.com</a>&gt;<br>
&gt;<br>
&gt; If hostname is not added to /etc/hosts file then rpcinfo<br>
&gt; command fails when hostname is passed as argument. This was<br>
&gt; observed when rpcinfo command was tested on freescale target.<br>
&gt; Below was the output observed without this change.<br>
&gt;<br>
&gt; root@mx6q:~# rpcinfo -s mx6q<br>
&gt; rpcinfo: can&#39;t contact rpcbind: RPC: (unknown error code)<br>
&gt;<br>
&gt; Below is the output after this change:<br>
&gt; root@mx6q:~# rpcinfo -s mx6q<br>
&gt; =C2=A0 =C2=A0program version(s) netid(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service =C2=A0 =C2=
=A0 owner<br>
&gt; =C2=A0 =C2=A0 100000 =C2=A02,3,4 =C2=A0 =C2=A0 local,udp,tcp,udp6,tcp6=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0portmapper =C2=A0superuser<br>
&gt; root@mx6q:~#<br>
&gt;<br>
&gt; Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.=
com">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/image.bbclass | 8 ++++++++<br>
&gt; =C2=A01 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<b=
r>
&gt; index 82605f2..7a5a5c1 100644<br>
&gt; --- a/meta/classes/image.bbclass<br>
&gt; +++ b/meta/classes/image.bbclass<br>
&gt; @@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; +ROOTFS_POSTPROCESS_COMMAND +=3D &quot;add_machine_name_loop_back;&quo=
t;<br>
&gt; +<br>
&gt; +add_machine_name_loop_back() {<br>
&gt; + =C2=A0 =C2=A0if [ -n ${MACHINE} ]; then<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 127.0.1.1 &quot; =C2=A0 =C2=A0 =C2=
=A0 &quot;${MACHINE} &gt;&gt;<br>
&gt; ${IMAGE_ROOTFS}${sysconfdir}/hosts + =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt; +<br>
<br>
</div></div>I think in the earlier discussion the conclusion was that we do=
 not want this<br>
enabled by default, which the above will do.<br>
<br>
The question I have is, if this isn&#39;t a good idea, is there a better so=
lution?<br>
<br></blockquote><div><br></div><div>I totally agree with the discussion. I=
s it a good idea to implement like check made for zap_empty_root_password? =
<br></div><div>For zap_empty_root_password there is a conditional check if =
debug-tweaks are enabled then zap_empty_root_password is<br>

</div><div>called. So can I use debug-tweaks to handle add_machine_name_loo=
p_back in the patch? <br></div><div><br><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">


Cheers,<br>
Paul<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">Thank=
s,<br><br></div><div class=3D"gmail_extra">Sujith H<br clear=3D"all"></div>=
<div class=3D"gmail_extra"><br>-- <br>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=
=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=
=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE projec=
t<br>

<a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">h=
ttp://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"h=
ttp://sujithh.info" target=3D"_blank">http://sujithh.info</a><br>
</div></div></div>

--001a11c122ba67ae2d04ffce9fb6--

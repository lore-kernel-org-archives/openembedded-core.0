Return-Path: <naresh.bhat@linaro.org>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 31E1560034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 07:53:11 +0000 (UTC)
Received: by oiag65 with SMTP id g65so30925398oia.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 00:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=i966SnmzVCCPfhXiiCJlqsVqjqf+R2BChOWMG5wOwGA=;
	b=QrcugU4Aqbpc/AXi4vF5cjF+1R2O/yx50ijI6qlhGG8BkvrCP7cdtpghtk/hVjCeCc
	QViTR/M3WRAf+AWIxhxlnBKKivh2JrRjbjjNQG2gDO2mqSnR5C4rQz5czEje/FSvq2kW
	oinYcH9QMXZF5DGhek+yLsWc6kJlSVScCOEDiRZk4YxNMCPSBPFRrN4lr2HRG0RdDJwy
	rlbDfiqaErODAmZP6Sfmkp4mS8X49/Z90SZqDTIJbhudp2REIcSXRv+wediIB/ifsoMM
	p8NaQYgzxyklC/CtE+tUqom6Txfu6NXRYp+y97qFLkPeV6wWcL4lWL/5A2QXMcmcpRSE
	xtWg==
X-Gm-Message-State: ALoCoQmvKyeH0KqFD8XJOkQ09SEzmfDhzc8rYCUulz1CU0rVgyrHVVsuyOWwlTkDSeJxeumKjpDs
MIME-Version: 1.0
X-Received: by 10.182.251.138 with SMTP id zk10mr47059168obc.72.1426492392342; 
	Mon, 16 Mar 2015 00:53:12 -0700 (PDT)
Received: by 10.60.99.6 with HTTP; Mon, 16 Mar 2015 00:53:12 -0700 (PDT)
In-Reply-To: <6C32DAB4-4AC9-41E9-8C3A-C787C0DDD05D@gmail.com>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
	<1426258527-2329-4-git-send-email-naresh.bhat@linaro.org>
	<1426262415.9114.212.camel@linuxfoundation.org>
	<6C32DAB4-4AC9-41E9-8C3A-C787C0DDD05D@gmail.com>
Date: Mon, 16 Mar 2015 13:23:12 +0530
Message-ID: <CAFoFrHZyoG0erBR2JHYAyMSk6a_MB+zOVXv9mC_FHcaS8dL1aQ@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v1 PATCH 3/5] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Mon, 16 Mar 2015 07:53:13 -0000
Content-Type: multipart/alternative; boundary=001a11c1dada52358105116324d8

--001a11c1dada52358105116324d8
Content-Type: text/plain; charset=UTF-8

On 13 March 2015 at 22:47, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
wrote:

> On March 13, 2015 5:00:15 PM GMT+01:00, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> >On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat wrote:
> >> Build iso image required syslinux package.  We have already skip the
> >syslinux
> >> package.  Hence just skip the iso image build too.
> >>
> >> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> >> ---
> >>  meta/classes/bootimg.bbclass |    6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/bootimg.bbclass
> >b/meta/classes/bootimg.bbclass
> >> index ed7b32f..d8c2a59 100644
> >> --- a/meta/classes/bootimg.bbclass
> >> +++ b/meta/classes/bootimg.bbclass
> >> @@ -265,7 +265,11 @@ python do_bootimg() {
> >>      if d.getVar("EFI", True) == "1":
> >>          bb.build.exec_func('build_efi_cfg', d)
> >>      bb.build.exec_func('build_hddimg', d)
> >> -    bb.build.exec_func('build_iso', d)
> >> +
> >> +    if d.getVar('TARGET_ARCH', True) == "aarch64":
> >> +            return
> >> +    else:
> >> +            bb.build.exec_func('build_iso', d)
> >
> >Its minor but the else: here is redundant after a return.
>
> As previously asked, why does this only affect aarch64 and not all not
> COMPATIBLE_HOST ?
> Shouldn't you instead set NOISO to 1 for !COMPATIBLE_HOST ?
>
Thank you very much.  I will try it out and update in my next series.

>
> Thanks,
>
>
>

--001a11c1dada52358105116324d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 13 March 2015 at 22:47, Bernhard Reutner-Fischer <span dir=3D"ltr">&=
lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb"><div class=3D"h5">On March 13, 2015 5:00:15 PM GMT+01:00, Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat wrote:<br>
&gt;&gt; Build iso image required syslinux package.=C2=A0 We have already s=
kip the<br>
&gt;syslinux<br>
&gt;&gt; package.=C2=A0 Hence just skip the iso image build too.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Naresh Bhat &lt;<a href=3D"mailto:naresh.bhat@linar=
o.org">naresh.bhat@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/bootimg.bbclass |=C2=A0 =C2=A0 6 +++++-<br>
&gt;&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/bootimg.bbclass<br>
&gt;b/meta/classes/bootimg.bbclass<br>
&gt;&gt; index ed7b32f..d8c2a59 100644<br>
&gt;&gt; --- a/meta/classes/bootimg.bbclass<br>
&gt;&gt; +++ b/meta/classes/bootimg.bbclass<br>
&gt;&gt; @@ -265,7 +265,11 @@ python do_bootimg() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;EFI&quot;, True) =3D=3D &quo=
t;1&quot;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&#39;build_ef=
i_cfg&#39;, d)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&#39;build_hddimg&#39;, d)<=
br>
&gt;&gt; -=C2=A0 =C2=A0 bb.build.exec_func(&#39;build_iso&#39;, d)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if d.getVar(&#39;TARGET_ARCH&#39;, True) =3D=3D &qu=
ot;aarch64&quot;:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; +=C2=A0 =C2=A0 else:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&#39=
;build_iso&#39;, d)<br>
&gt;<br>
&gt;Its minor but the else: here is redundant after a return.<br>
<br>
</div></div>As previously asked, why does this only affect aarch64 and not =
all not COMPATIBLE_HOST ?<br>
Shouldn&#39;t you instead set NOISO to 1 for !COMPATIBLE_HOST ?<br></blockq=
uote><div>Thank you very much.=C2=A0 I will try it out and update in my nex=
t series.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
<br>
<br>
</blockquote></div><br></div></div>

--001a11c1dada52358105116324d8--

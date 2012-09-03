Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T8V3C-0007G0-23
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 13:42:42 +0200
Received: by iebc11 with SMTP id c11so3607884ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 04:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=duxk0Yyn60SavWAzptCgRYNGH8Ma5aN5v2xpNVQgtys=;
	b=Slfn6Kq3VyWQB7y0FpiUWaEVul2ZMsoJw7AI4F9UjkyveIIsrq2lq8nkIQM/4p7WQb
	Vfq+QaGoTfcZ0PFSv9Vc6QrOCvKp+Nxg7mwQmmYDI48GDG52R4i309tiESnvjf4XPESZ
	O1w+QsopF2ALzkssz62xPAfifO5m/SaCj75NXJ69YzvpFK4g1rdxASn14MS1mydOWS5S
	V8VaK0+bk4RtDGjOkY0lOMtc3VX/5QJvCgjpLuOq3bw+mLiwbgDg+hahM/LLkhOOWk3w
	IoP0vE8qhk3v8z7JxIx2i0r/fHOcYe2VKvHHcASupvqJQw6jjbmnWMhglmdBpaKLbz0l
	O+0A==
Received: by 10.50.209.8 with SMTP id mi8mr10476810igc.63.1346671821090; Mon,
	03 Sep 2012 04:30:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.129.232 with HTTP; Mon, 3 Sep 2012 04:30:00 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <5808938.Nh0F33ee0J@helios>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
	<2c0055c43eae1489aee3e5e3fa2b8481d10fe0ce.1345155936.git.andrei@gherzan.ro>
	<5808938.Nh0F33ee0J@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 3 Sep 2012 14:30:00 +0300
Message-ID: <CAK18fxG9PSizEv0OUP8-weqGGBicz-=JS6U8KY3yf+Y1hEUCdA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnG72XYQHb0g3XsUdo4hXYAm+NlWZHiRBNNYWntPMutamxwJxrTMLGhTQBAxA1lz9pbL3EP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V2 PATCH 5/6] task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 11:42:42 -0000
Content-Type: multipart/alternative; boundary=14dae9340e5386700404c8ca775a

--14dae9340e5386700404c8ca775a
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 3, 2012 at 11:03 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Friday 17 August 2012 01:28:51 Andrei Gherzan wrote:
> > For machines with no hardware clock it makes no sense to have this
> > init stript. Moreover, we avoid a boot error in this way.
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-core/tasks/task-core-boot.bb |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/tasks/task-core-boot.bb
> > b/meta/recipes-core/tasks/task-core-boot.bb index 6487436..2947509
> 100644
> > --- a/meta/recipes-core/tasks/task-core-boot.bb
> > +++ b/meta/recipes-core/tasks/task-core-boot.bb
> > @@ -34,6 +34,7 @@ RDEPENDS_task-core-boot = "\
> >      base-files \
> >      base-passwd \
> >      busybox \
>

busybox-hwclock contains the hwclock init script. Before this change that
script was included in busybox main package which was added to this task. I
didn't want to move this package as this change would have been a different
commit - to move stuff from stuff - and because i didn't want to break
anything around.

ag


> > +    ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "",
> d)}
> > \ ${VIRTUAL-RUNTIME_initscripts} \
> >      ${@base_contains("MACHINE_FEATURES", "keyboard",
> > "${VIRTUAL-RUNTIME_keymaps}", "", d)} \ modutils-initscripts \
>
> Why did this get added to task-core-boot? This is meant only to contain
> items
> that are essential for booting; I'm not sure that support for the rtc
> qualifies.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--14dae9340e5386700404c8ca775a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Sep 3, 2012 at 11:03 AM, Paul Eggleton <=
span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" targe=
t=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">

On Friday 17 August 2012 01:28:51 Andrei Gherzan wrote:<br>
&gt; For machines with no hardware clock it makes no sense to have this<br>
&gt; init stript. Moreover, we avoid a boot error in this way.<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-core/tasks/<a href=3D"http://task-core-boot.bb" target=
=3D"_blank">task-core-boot.bb</a> | =A0 =A01 +<br>
&gt; =A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/tasks/<a href=3D"http://task-core-boot.=
bb" target=3D"_blank">task-core-boot.bb</a><br>
&gt; b/meta/recipes-core/tasks/<a href=3D"http://task-core-boot.bb" target=
=3D"_blank">task-core-boot.bb</a> index 6487436..2947509 100644<br>
&gt; --- a/meta/recipes-core/tasks/<a href=3D"http://task-core-boot.bb" tar=
get=3D"_blank">task-core-boot.bb</a><br>
&gt; +++ b/meta/recipes-core/tasks/<a href=3D"http://task-core-boot.bb" tar=
get=3D"_blank">task-core-boot.bb</a><br>
&gt; @@ -34,6 +34,7 @@ RDEPENDS_task-core-boot =3D &quot;\<br>
&gt; =A0 =A0 =A0base-files \<br>
&gt; =A0 =A0 =A0base-passwd \<br>
&gt; =A0 =A0 =A0busybox \<br></blockquote><div><br></div><div>busybox-hwclo=
ck contains the hwclock init script. Before this change that script was inc=
luded in busybox main package which was added to this task. I didn&#39;t wa=
nt to move this package as this change would have been a different commit -=
 to move stuff from stuff - and because i didn&#39;t want to break anything=
 around.=A0</div>

<div><br></div><div>ag</div><div>=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; + =A0 =A0${@base_contains(&quot;MACHINE_FEATURES&quot;, &quot;rtc&quot=
;, &quot;busybox-hwclock&quot;, &quot;&quot;, d)}<br>
&gt; \ ${VIRTUAL-RUNTIME_initscripts} \<br>
&gt; =A0 =A0 =A0${@base_contains(&quot;MACHINE_FEATURES&quot;, &quot;keyboa=
rd&quot;,<br>
&gt; &quot;${VIRTUAL-RUNTIME_keymaps}&quot;, &quot;&quot;, d)} \ modutils-i=
nitscripts \<br>
<br>
Why did this get added to task-core-boot? This is meant only to contain ite=
ms<br>
that are essential for booting; I&#39;m not sure that support for the rtc<b=
r>
qualifies.<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br>

--14dae9340e5386700404c8ca775a--

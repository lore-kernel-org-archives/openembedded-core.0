Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id AB8556A976
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 14:46:37 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k14so6023759oag.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 07:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=e1MpS1zRXpZV/0xq4HviEv2G7kdzaeLrhLgcmNdNBzk=;
	b=ajjbIqJgRE+GX7LS7cEod78U20riC+bdj80hvZTnUjZA2zG8b/8h+kwKE59U08Yvpz
	v8JkP9uFT1a92Jo0mgZybeTpK463/4LDvBZ5xBVFtlfQiDlfKzrmVDz7YLfZ+glCHrU/
	y5gqL8AbVgMgxSC4MXGLoW0ez968tjTw2EYNmhjsQr+S+k8tbTrOwte16zh7YPBDHrhn
	W34SGjEwxVfhvP3T3N+OHzfLblhnEjdoBwZ8GnF3ac9sWgJLMiNrx4ytvIh1+p3ARBlS
	kd9RNJrsCT8o034eIsPBiG3pUBL8vxrcxWBMdDgThypIV9DfuIYnRtWRA4RigGXUhezi
	4vGg==
X-Received: by 10.182.66.46 with SMTP id c14mr12601923obt.33.1374245198070;
	Fri, 19 Jul 2013 07:46:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.126.144 with HTTP; Fri, 19 Jul 2013 07:46:17 -0700 (PDT)
In-Reply-To: <1374223150-16033-1-git-send-email-andre.draszik@linaro.org>
References: <1374223150-16033-1-git-send-email-andre.draszik@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 19 Jul 2013 16:46:17 +0200
Message-ID: <CAP71WjyRkp0TM9vLfX6jFG-E6TWZuUjZeUTSnEefvJA1VOb5yA@mail.gmail.com>
To: =?ISO-8859-1?Q?Andr=E9_Draszik?= <andre.draszik@linaro.org>
X-Gm-Message-State: ALoCoQnXtnH+a5Vi2rTmRrJLoNdVksU4UA0EvjVpiFRMN/x/KvNlYPwlS9suv4uOxHNcTuLaRqws
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb: don't patch pkg-config files
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
X-List-Received-Date: Fri, 19 Jul 2013 14:46:37 -0000
Content-Type: multipart/alternative; boundary=e89a8fb200e6dd953904e1de64b9

--e89a8fb200e6dd953904e1de64b9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2013 at 10:39 AM, Andr=E9 Draszik <andre.draszik@linaro.org=
>wrote:

> We are currently getting build failures of projects that rely on
> being able to access DirectFB's internal include directories, as
> returned via pkg-config, since the include paths returned by
> pkg-config are incomplete.
>
> The reason for that is the patch that is being removed with this
> change. It modified the cflags returned by pkg-config in an
> incorrect way, causing us to miss important include paths:
>
> For reference, pkg-config output with incorrect patch applied:
>   ad@bril0118 #513 ~> pkg-config --cflags directfb-internal
> -D_GNU_SOURCE -D_REENTRANT
> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb
> -I<builddir>/tmp/sysroots/<machine>/usr/include
>
> Now, with the incorrect patch removed, the output is as expected:
>   ad@bril0118 #514 ~> pkg-config --cflags directfb-internal
> -D_GNU_SOURCE -D_REENTRANT
> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb-internal
> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb
>
> Overall, the removed patch is not needed - pkg-config does the right
> thing these days and we can simply use the correctly working upstream
> versions of all DirectFB .pc files.
>
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
>

i reviewed and tested this patch against a QT4e image build. it looks good
to me, and that offending patch being removed seems to come from quite
ancient stuff.

Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

any chance this can get into 'dylan', too?

--e89a8fb200e6dd953904e1de64b9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 19, 2013 at 10:39 AM, Andr=E9 Draszik <span dir=3D"ltr">&lt;<a =
href=3D"mailto:andre.draszik@linaro.org" target=3D"_blank">andre.draszik@li=
naro.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":1fq" style=3D"overflow:hidden">We are currentl=
y getting build failures of projects that rely on<br>


being able to access DirectFB&#39;s internal include directories, as<br>
returned via pkg-config, since the include paths returned by<br>
pkg-config are incomplete.<br>
<br>
The reason for that is the patch that is being removed with this<br>
change. It modified the cflags returned by pkg-config in an<br>
incorrect way, causing us to miss important include paths:<br>
<br>
For reference, pkg-config output with incorrect patch applied:<br>
=A0 ad@bril0118 #513 ~&gt; pkg-config --cflags directfb-internal<br>
-D_GNU_SOURCE -D_REENTRANT -I&lt;builddir&gt;/tmp/sysroots/&lt;machine&gt;/=
usr/include/directfb -I&lt;builddir&gt;/tmp/sysroots/&lt;machine&gt;/usr/in=
clude<br>
<br>
Now, with the incorrect patch removed, the output is as expected:<br>
=A0 ad@bril0118 #514 ~&gt; pkg-config --cflags directfb-internal<br>
-D_GNU_SOURCE -D_REENTRANT -I&lt;builddir&gt;/tmp/sysroots/&lt;machine&gt;/=
usr/include/directfb-internal -I&lt;builddir&gt;/tmp/sysroots/&lt;machine&g=
t;/usr/include/directfb<br>
<br>
Overall, the removed patch is not needed - pkg-config does the right<br>
thing these days and we can simply use the correctly working upstream<br>
versions of all DirectFB .pc files.<br>
<br>
Signed-off-by: Andr=E9 Draszik &lt;<a href=3D"mailto:andre.draszik@linaro.o=
rg">andre.draszik@linaro.org</a>&gt;<br></div></blockquote></div><br>i revi=
ewed and tested this patch against a QT4e image build. it looks good to me,=
 and that offending patch being removed seems to come from quite ancient st=
uff.=A0</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Tested-by: =
Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas=
.dechesne@linaro.org</a>&gt;<br></div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">

any chance this can get into &#39;dylan&#39;, too?</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra"><br></div></div>

--e89a8fb200e6dd953904e1de64b9--

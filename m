Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 75B5B6C72C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:00:43 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so7621201oag.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 05:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uzf5q57GzV6F34hoXnMwkE/vtViA+hem8SAHtNmNY4M=;
	b=avBWpHJBk8QKhoi8KhOjJOj3bXfdXYIuSKiOWli9OrXUnmIM9GcyoGF+nBzPEtlAnY
	qKoN/wnWywK4zdvx8txOOGn40mSS/tu39byX2Jd99shsOOOmNkk1ZFH1/ZZLZVO3WR9j
	31dHRqFupNpn4v1wCx0VLIzZe1KByJfs23EokqmSQ+Vb2eqmmmWh8k5oWoVV/NIidDh7
	d3SYrTdgBLx4B+9ymd3pfdIfk/qV6xB5+lGoozuIkOoRyBJM5h+SbJqLkLKsSlxohpdv
	e3fnNlkY5jdylLDG9EUg/rkotK+sErLLM6EXBQMpePhzis4tvt3I3zmBPLMR32gowFYY
	y2NQ==
X-Gm-Message-State: ALoCoQmr5b0iWQuh2c6mOKGo6nGAySTuZTp41i0otGG3fTWJNmzrqYtEOWQZAi3nH0iktfNN5Fpv
X-Received: by 10.182.97.138 with SMTP id ea10mr179929obb.77.1385557242546;
	Wed, 27 Nov 2013 05:00:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.0.50 with HTTP; Wed, 27 Nov 2013 05:00:22 -0800 (PST)
In-Reply-To: <52955AAB.6000801@gmail.com>
References: <1384162062-30319-2-git-send-email-layliu@gmail.com>
	<1384251828.1143.3.camel@ted> <5282EC62.9010805@gmail.com>
	<CAP71Wjz9ymXepFCBpLQkKuzH_sGv0H7sYFW5M9FDV1Z8GSqmKw@mail.gmail.com>
	<52955AAB.6000801@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 27 Nov 2013 14:00:22 +0100
Message-ID: <CAP71WjymGofv6HzYrBdqsxH7y011Zjp4mEZ-Qdqo+QSNR5-Afw@mail.gmail.com>
To: Lei Liu <layliu@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Fix grep pattern when mklibs collects executables in rootfs
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
X-List-Received-Date: Wed, 27 Nov 2013 13:00:44 -0000
Content-Type: multipart/alternative; boundary=047d7b2e4e3c42201d04ec282fd4

--047d7b2e4e3c42201d04ec282fd4
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 27, 2013 at 3:36 AM, Lei Liu <layliu@gmail.com> wrote:

> > If I revert to 0.1.34 (that we had on dylan branch), i can build my
> image just fine (note that I am building an arm soft-float image), so are
> you able to use image-mklibs with dora or master which have 0.1.38?
> >
>
> Hi,
>
> I'm testing on master.  And I'm able to build my qemux86 image with
> mklibs-0.1.38.
>

ok, thanks for your answer.

I tested this morning, and confirm that 'master' + mklibs is broken on ARM
(i tested qemuarm), altough qemux86 is working.. i will try to look into
that... in fact to be honest, i still believe that mklibs 0.1.38 is broken,
even on x86 and that it's working for qemux86 because it uses the loader
from your host instead of the one in the sysroot. In my case it's failing
because it doesn't find the loader in /lib (/lib in my host):

Exception: Cannot find lib /lib/ld-linux.so.3

it should in theory look for that file in the sysroot... if you look at the
upstream commit i referenced above, upstream no longer uses 'sysroot'
variable to locate the loader...

--047d7b2e4e3c42201d04ec282fd4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 27, 2013 at 3:36 AM, Lei Liu <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:layliu@gmail.com" target=3D"_blank">layliu@gmail.com</a>&gt;</span> w=
rote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">&gt; If I revert to 0.1.34 (that we had =
on dylan branch), i can build my image just fine (note that I am building a=
n arm soft-float image), so are you able to use image-mklibs with dora or m=
aster which have 0.1.38?<br>


&gt;<br>
<br>
</div>Hi,<br>
<br>
I&#39;m testing on master. =A0And I&#39;m able to build my qemux86 image wi=
th mklibs-0.1.38.<div class=3D""><div id=3D":2ig" class=3D"" tabindex=3D"0"=
></div></div></blockquote></div><br>ok, thanks for your answer.=A0</div><di=
v class=3D"gmail_extra">

<br></div><div class=3D"gmail_extra">I tested this morning, and confirm tha=
t &#39;master&#39; + mklibs is broken on ARM (i tested qemuarm), altough qe=
mux86 is working.. i will try to look into that... in fact to be honest, i =
still believe that mklibs 0.1.38 is broken, even on x86 and that it&#39;s w=
orking for qemux86 because it uses the loader from your host instead of the=
 one in the sysroot. In my case it&#39;s failing because it doesn&#39;t fin=
d the loader in /lib (/lib in my host):</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">Exception: Cannot find lib /lib/ld-linux.so.3</div><div><b=
r></div><div>it should in theory look for that file in the sysroot... if yo=
u look at the upstream commit i referenced above, upstream no longer uses &=
#39;sysroot&#39; variable to locate the loader...</div>

<div><br></div><div><br></div></div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra"><br></div></div>

--047d7b2e4e3c42201d04ec282fd4--

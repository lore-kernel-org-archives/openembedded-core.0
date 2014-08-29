Return-Path: <niqingliang2003@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9E73C70281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 11:36:21 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so2061183wes.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=r33Ccj9tMgm5CgnbIzcuDTw8rZqYerQFVl/kTVEAQic=;
	b=1FLuWczqKAVi1aARWODOqtJrwhHXbT7InVb+4ENAVhPCfIuu+LGY698EC12z6qeQHQ
	xdQop2bbl4SHEr+hR486R1KyFfCzdfsuif49joSG+LrO870psVzpQu44y+sMyEZVKhTf
	CJ9bmUUhP3COGYulVxVK/a+eeUleA82v4/NIbk1lULZVnPP1P4aqRxUuRCGrRtHbtFRb
	TmxH6z6ZX5+fXPp/Zu0MMPg7BDMyQnP9I5p4exRjl/qNLoGqFolqbN/Dkhvot97Xmj8o
	FxV8EnE5bbH9Ii1FbvmZlTn0cHgGkF0+dmSwbEmGIRF/k11L6c4v9hjbgAmRS90teyEQ
	+pwg==
MIME-Version: 1.0
X-Received: by 10.194.77.35 with SMTP id p3mr13065146wjw.56.1409312182660;
	Fri, 29 Aug 2014 04:36:22 -0700 (PDT)
Received: by 10.217.141.72 with HTTP; Fri, 29 Aug 2014 04:36:22 -0700 (PDT)
In-Reply-To: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>
References: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>
Date: Fri, 29 Aug 2014 11:36:22 +0000
Message-ID: <CADwFkYf_QR_=Ky54rfxLfQ+LJ7=WEzDZr_uVuharnjty2dSGtg@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: boost 1.56 compile fail
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
X-List-Received-Date: Fri, 29 Aug 2014 11:36:25 -0000
Content-Type: multipart/alternative; boundary=047d7bfcebd00676af0501c310ee

--047d7bfcebd00676af0501c310ee
Content-Type: text/plain; charset=UTF-8

and use 'gcc_atomic' in platform.hpp just for 4.8.x 4.9.x,


#if ((defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 407))

I don't know why low version gcc can do the lock free atomic operation, but
high version can't


On Fri, Aug 29, 2014 at 11:28 AM, Yi Qingliang <niqingliang2003@gmail.com>
wrote:

> hardware: samsung s3c6410
>
> after updated to latest poky, the boost compile fail!
>
> error info:
> libs/atomic/src/lockpool.cpp:127:5: error: 'thread_fence' is not a member
> of 'boost::atomics::detail'
> libs/atomic/src/lockpool.cpp:138:5: error: 'signal_fence' is not a member
> of 'boost::atomics::detail'
>
>
> after dig into it, I found that:
> the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so it don't include
> 'operations_lockfree.hpp' which has 'thread_fence' and 'signal_fence', but
> pthread.h at line 21.
>
> in file 'caps_gcc_atomic.hpp', 'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to
> '0', the author think if '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the atomic
> serial function gcc provided is not lock free.
>
> at the end of 'caps_gcc_atomic.hpp', it defined
> 'BOOST_ATOMIC_THREAD_FENCE' as 2.
>
> so the conflict is: *BOOST_ATOMIC_THREAD_FENCE* and
> *BOOST_ATOMIC_FLAG_LOCK_FREE*
>
> I don't know it is the new poky problem, or the boost problem, any idea?
>
>
> Yi Qingliang
>

--047d7bfcebd00676af0501c310ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">and use &#39;gcc_atomic&#39; in platform.hpp just for 4.8.=
x 4.9.x,=C2=A0<div>=C2=A0=C2=A0</div><div><br></div><div>#if ((defined(__GN=
UC__) &amp;&amp; ((__GNUC__ * 100 + __GNUC_MINOR__) &gt;=3D 407))</div><div=
><br></div><div>
I don&#39;t know why low version gcc can do the lock free atomic operation,=
 but high version can&#39;t</div></div><div class=3D"gmail_extra"><br><br><=
div class=3D"gmail_quote">On Fri, Aug 29, 2014 at 11:28 AM, Yi Qingliang <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:niqingliang2003@gmail.com" target=3D"=
_blank">niqingliang2003@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">hardware: samsung s3c6410<b=
r><br>after updated to latest poky, the boost compile fail!<br><br>error in=
fo:<div>
<div>libs/atomic/src/lockpool.cpp:127:5: error: &#39;thread_fence&#39; is n=
ot a member of &#39;boost::atomics::detail&#39;<br>
</div><div>libs/atomic/src/lockpool.cpp:138:5: error: &#39;signal_fence&#39=
; is not a member of &#39;boost::atomics::detail&#39;</div></div><div><br><=
/div><div><br></div><div>after dig into it, I found that:</div><div>the mar=
co &#39;BOOST_ATOMIC_FLAG_LOCK_FREE&#39; is 0, so it don&#39;t include &#39=
;operations_lockfree.hpp&#39; which has &#39;thread_fence&#39; and &#39;sig=
nal_fence&#39;, but pthread.h at line 21.<br>

<br></div><div>in file &#39;caps_gcc_atomic.hpp&#39;, &#39;BOOST_ATOMIC_FLA=
G_LOCK_FREE&#39; is set to &#39;0&#39;, the author think if &#39;__GCC_ATOM=
IC_BOOL_LOCK_FREE&#39; is 1, the atomic serial function gcc provided is not=
 lock free.</div>

<div><br></div><div>at the end of &#39;caps_gcc_atomic.hpp&#39;, it defined=
 &#39;BOOST_ATOMIC_THREAD_FENCE&#39; as 2.</div><div><br></div><div>so the =
conflict is: <b>BOOST_ATOMIC_THREAD_FENCE</b> and <b>BOOST_ATOMIC_FLAG_LOCK=
_FREE</b></div>

<div><b><br></b></div><div>I don&#39;t know it is the new poky problem, or =
the boost problem, any idea?</div><span class=3D"HOEnZb"><font color=3D"#88=
8888"><div><br></div><div><br></div><div>Yi Qingliang</div></font></span></=
div>

</blockquote></div><br></div>

--047d7bfcebd00676af0501c310ee--

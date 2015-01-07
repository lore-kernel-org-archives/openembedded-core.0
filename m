Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 62A247289F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 11:17:08 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id z107so713904qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 03:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oDPgwN+CAVrc6FOSWPQrUg+q5oVUfedDfvIujUsaJUM=;
	b=SbSAsdhjfGxx+GjeBCrwiVPEzTb7KA80I+kRrlNvAtE8dtkkBWxeueFXs0i9M2rEJV
	IYeLUeqnYKjtxi/gJUs8del7ujDtPRhIZY781FL3syTlabHbWDqW5AfPuS5Xic7C84w+
	UUTxW5m9rl8U2fIG688Z/nomNujgeCvuBIEYOqodni0dL/s6tQq8MhPP11h/e2u7dHLE
	AGVL61vVJ1xUSw6qln9exDYDCQf9+I/q2P5N1feYbM9fVexoB2wv7J3GlY4dRGqux0TP
	1gYXjZ4syVBjyMpqjyrKBS0K+sitvdi8C/buj1DeBv1d8ik7Fv+cJ55Mrf51sg4eKvX1
	Ubnw==
X-Gm-Message-State: ALoCoQmk9pJXyrtOp3n3Bsl4hmjybC4d+Dsd9TFnbwA+KI3umkT4M+DmhQTu/aP/MpvgGbGNeRVM
X-Received: by 10.140.92.138 with SMTP id b10mr3261749qge.59.1420629429283;
	Wed, 07 Jan 2015 03:17:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 7 Jan 2015 03:16:49 -0800 (PST)
In-Reply-To: <54ACFB02.5060209@topic.nl>
References: <1420592855-20473-1-git-send-email-liezhi.yang@windriver.com>
	<1420618033.25779.56.camel@linuxfoundation.org>
	<54ACFB02.5060209@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 11:16:49 +0000
Message-ID: <CAJTo0LYYeD6eEA6XpGudTuSVsRBK=XDBvFM4Dafavdq1Zg86rw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] package.bbclass: omit .pyc and .pyo file
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
X-List-Received-Date: Wed, 07 Jan 2015 11:17:14 -0000
Content-Type: multipart/alternative; boundary=001a113a5d5e7d874b050c0e1038

--001a113a5d5e7d874b050c0e1038
Content-Type: text/plain; charset=UTF-8

On 7 January 2015 at 09:23, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> You definitely SHOULD ship the .pyc files. If they don't exist, the
> interpreter is forced to re-compile the .py source, and will attempt to
> write the result to the filesystem. It won't cause harm, it won't fail, but
> it's very inefficient. It's better to let the host do the py->pyc
> conversion anyway.
>
> The opposite works just fine: You can omit the .py files and ship only
> .pyc files. We do that on settopboxes that use Python for the GUI, this
> saves several megabytes of flash space.
> To accomplish that, we put the .py files into a $PN-src package.
>

I agree with Mike, there is a use-case for just shipping .pyc.  Whether
oe-core should do something to assist with this or not is debatable.

There's an open bug report about this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=6434.

https://docs.python.org/2/tutorial/modules.html#compiled-python-files has
the details we're after.  Summary:

.pyc is Python bytecode, which is an implementation detail of CPython.  As
such it's version-dependent but explicitly architecture-independent.
.pyo generated with -O is simply .pyc but with asserts removed.
.pyo generated with -O -O has asserts and docstrings removed.

I think it's fair to say we should just ignore .pyo - no point generating
and shipping it.  It does seem that if we want to ship usable .pyc we need
to ensure that they are compiled with python-native. I guess this could be
done by calling python-native's compileall module to recompile the sources
at package time.

Ross

--001a113a5d5e7d874b050c0e1038
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 January 2015 at 09:23, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":78e" class=3D"" style=
=3D"overflow:hidden">You definitely SHOULD ship the .pyc files. If they don=
&#39;t exist, the interpreter is forced to re-compile the .py source, and w=
ill attempt to write the result to the filesystem. It won&#39;t cause harm,=
 it won&#39;t fail, but it&#39;s very inefficient. It&#39;s better to let t=
he host do the py-&gt;pyc conversion anyway.<br>
<br>
The opposite works just fine: You can omit the .py files and ship only .pyc=
 files. We do that on settopboxes that use Python for the GUI, this saves s=
everal megabytes of flash space.<br>
To accomplish that, we put the .py files into a $PN-src package.</div></blo=
ckquote></div><br>I agree with Mike, there is a use-case for just shipping =
.pyc.=C2=A0 Whether oe-core should do something to assist with this or not =
is debatable.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">There&#39;s an open bug report about this:=C2=A0<a href=3D"https://=
bugzilla.yoctoproject.org/show_bug.cgi?id=3D6434">https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D6434</a>.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra"><a href=3D"https://docs.python.org/2/tutoria=
l/modules.html#compiled-python-files">https://docs.python.org/2/tutorial/mo=
dules.html#compiled-python-files</a> has the details we&#39;re after.=C2=A0=
 Summary:<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">.pyc is Python bytecode, which is an implementation detail of CPyth=
on.=C2=A0 As such it&#39;s version-dependent but explicitly architecture-in=
dependent.</div><div class=3D"gmail_extra">.pyo generated with -O is simply=
 .pyc but with asserts removed.</div><div class=3D"gmail_extra">.pyo genera=
ted with -O -O has asserts and docstrings removed.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">I think it&#39;s fair to say w=
e should just ignore .pyo - no point generating and shipping it.=C2=A0 It d=
oes seem that if we want to ship usable .pyc we need to ensure that they ar=
e compiled with python-native. I guess this could be done by calling python=
-native&#39;s compileall module to recompile the sources at package time.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv><div class=3D"gmail_extra"><br></div></div>

--001a113a5d5e7d874b050c0e1038--

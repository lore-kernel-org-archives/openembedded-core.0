Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id CA7F765CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 20:55:56 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so107866341qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lh0WfMqSOStxKdBHEpjodnyr9Gx1S+wzKi3IBECm39I=;
	b=jCjgPFjAKKAkGKSQ+d05qX8Iu8hZTuVw218ooC1oWWpJGlx7ONOETxl5W4is3qSVH5
	ZkeZ4KTw1TMxf4yTvrFhiasOCn5uApNVxwtTzHpkmKSihj30sl9A/LVkU1g7U/OjCH04
	aWTiJW4DeHkpvtyuEpMmqWgUaWY2BOy/nrZIUMpw8U/EiqOmxG5ZOr9wEKYBXhVqfbXQ
	ibqMsspzIR0W0FyZ2AN7Np4Os8nQaZhS2+FhQ+e0CDR0/x4YwNEKrf6VUGbxDa384GMD
	b7D/xVDMQ10qzyt6u/q0AxX+IwCjeZLbvSOJX0kLkDR6LVFBEkvwnnHdU5ofx5VdCyox
	TWew==
X-Gm-Message-State: ALoCoQn05ROC3a4AjH5dDfHzEzhNv5ljW5cKzNPeYYnU2p3djMtsA4+fzwJkzyS9x+X0OYnGMTDZ
X-Received: by 10.55.221.25 with SMTP id n25mr68329053qki.67.1440536156220;
	Tue, 25 Aug 2015 13:55:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 25 Aug 2015 13:55:36 -0700 (PDT)
In-Reply-To: <1440535925.12105.445.camel@linuxfoundation.org>
References: <1440521261-5444-1-git-send-email-ross.burton@intel.com>
	<1440535925.12105.445.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Aug 2015 21:55:36 +0100
Message-ID: <CAJTo0LashRACPqimm0CkB31Hc2c5t=-pq9AeS9rVA17MzhheVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] sstate: implement basic signing/validation
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
X-List-Received-Date: Tue, 25 Aug 2015 20:55:59 -0000
Content-Type: multipart/alternative; boundary=001a1149b5c4e1198c051e28f550

--001a1149b5c4e1198c051e28f550
Content-Type: text/plain; charset=UTF-8

On 25 August 2015 at 21:52, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
> Some random thoughts. We could add the signature into the tarball using
> something like the --use-compress-program option  (see
> https://www.gnu.org/software/tar/manual/html_chapter/tar_8.html and the
> gpg references). That would mean we have one less separate file to worry
> about.
>
> Not sure which approach I prefer, just putting the idea out there...


Or alternatively stash the signature in the siginfo as another field in the
data store.

Still not sure what I prefer either!

> I'd also probably make these callable functions, then others can
> override them and use them as hooks if they want to.

FWIW, initially they were functions in the pre-extract and post-create
functions, but error handling disappears that way and instead of shouting
"signature verification failed" it just says that "an error occured".    I
can still factor them out but call them directly.

Ross

--001a1149b5c4e1198c051e28f550
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"></div>On 25 August 2015 at 21:5=
2, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>&gt; Some random thou=
ghts. We could add the signature into the tarball using<br>&gt; something l=
ike the --use-compress-program option =C2=A0(see<br>&gt; <a href=3D"https:/=
/www.gnu.org/software/tar/manual/html_chapter/tar_8.html">https://www.gnu.o=
rg/software/tar/manual/html_chapter/tar_8.html</a> and the<br>&gt; gpg refe=
rences). That would mean we have one less separate file to worry<br>&gt; ab=
out.<br>&gt;<br>&gt; Not sure which approach I prefer, just putting the ide=
a out there...<br><br><br>Or alternatively stash the signature in the sigin=
fo as another field in the data store.<br><br>Still not sure what I prefer =
either!<br><br>&gt; I&#39;d also probably make these callable functions, th=
en others can<br>&gt; override them and use them as hooks if they want to.<=
br><br>FWIW, initially they were functions in the pre-extract and post-crea=
te functions, but error handling disappears that way and instead of shoutin=
g &quot;signature verification failed&quot; it just says that &quot;an erro=
r occured&quot;. =C2=A0 =C2=A0I can still factor them out but call them dir=
ectly.<div><br>Ross<br></div></div>

--001a1149b5c4e1198c051e28f550--

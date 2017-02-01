Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id C8F18605BE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 11:45:22 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id w75so59806917ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U//yTNmEmjf0zo6IckVUTPP/YHG+pE2fzC8OW8kWNew=;
	b=ts3rDx/gTdpfJui61qB2Ed4/VFrfhtwqdBsgmJitC+AGJF1Sj88ahlOXu2xX5VvXYg
	orbXZnZmFgoPBDdw1tOxDcGEXOuzJYtizAetje+o/qttBkdFlf4tZPySQc5OkzSkd2L3
	z+R1AStN9AXJKqJjU0h7lWtYrpf564BcyPxkmTiqAHn5/iU1A6wEuQWjPOyv+XUSUZL7
	GYxeZy2U0sfCR0d1+MS95gn6Kud1V2zIqdeJ3QRVY0d9Hb+3ckZe4tTFdIN3WeZzRT27
	kYHRWH+9U1RLCHeyUEJfPo9VBY6cgAN7WARMQN4ta1vsFa7FylDdZcdgQcduPA2wUToD
	GEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U//yTNmEmjf0zo6IckVUTPP/YHG+pE2fzC8OW8kWNew=;
	b=bqbtLLeS6n49Ri1a5mUxyEz9uzoBv4wVezOF2Ou7DJwab6okJ/hCouT1DEzQGOlIka
	74xBPpiPOVmV38EEQGLg5JZOgK6tG3aUrHz6A66/T037j1FOXHLBzDDRdN5uGqq61d7j
	JZt3oJsVkuLnO68gQJFfmKajMnD61djCQxz3CNNmkP6kLmWGsbXuITJUynOTE8Zl5nhV
	1iUagnTBO+VKGnuWbdx4rKwdUitv4o+fCAL+c9BE1sP3EbtwFhHta7tGYQFjoSlHNOTR
	MwNf0UJ1jfpNLcnpaXms6LdZl+Gpb6S1yssCKPXjMVz5L4EO1XLW0NDMgARFXwAYDWJM
	7gaA==
X-Gm-Message-State: AIkVDXJFvXAt7SzKTeAu+C2LNgb3oB01UhtmebrOEbeWwDrjU6PAqmp59zpu49+zC0QXH3IL7TLGywId0O93yMPN
X-Received: by 10.13.211.70 with SMTP id v67mr1278930ywd.260.1485949522880;
	Wed, 01 Feb 2017 03:45:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Wed, 1 Feb 2017 03:44:52 -0800 (PST)
In-Reply-To: <1485948194.14144.23.camel@linuxfoundation.org>
References: <1485943415-8260-1-git-send-email-jussi.kukkonen@intel.com>
	<1485948194.14144.23.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 1 Feb 2017 13:44:52 +0200
Message-ID: <CAHiDW_GosUv9rS2c5yZXvWgReno1rorTk4cR5J00+XZPb9wytg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Fix make_relative_symlink() for RSS
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
X-List-Received-Date: Wed, 01 Feb 2017 11:45:23 -0000
Content-Type: multipart/alternative; boundary=001a114d83ea775a530547769511

--001a114d83ea775a530547769511
Content-Type: text/plain; charset=UTF-8

On 1 February 2017 at 13:23, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2017-02-01 at 12:03 +0200, Jussi Kukkonen wrote:
> > Recipe-specific sysroots broke make_relative_symlink(), which
> > turns absolute symlinks in sysroots into relative ones. Use the
> > difference between the (in-sysroot) paths to construct the relative
> > symlink.
> >
> > This fixes links in openssl-native, fontconfig-native and bzip2-
> > native.
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
> >
> > sstate is not an area I'm familiar with, please take a good look.
> >
> > As far as I could see outputpath (based on state[2]) was never really
> > needed so I did not use it in the new version.
>
> I don't think we can hardcode workdir into here as for tasks like
> do_deploy, this makes no sense. I think we removed most of the absolute
> links from the deploy tasks so we currently don't need this, at least
> in the common case but the sstate code is meant to be generic.
>
> I am wondering if we need to pass in anything at all, can't we just
> call relpath on the original path and turn it into a relative one
> directly without referencing it back to TMPDIR/WORKDIR?
>
>
The actual file path during do_populate_sysroot is something like

/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/sysroot-destdir/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native/usr/lib/ssl/certs

and the link before make_relative_symlink() points to

/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native/etc/ssl/certs

Assuming those are correct, I don't see how to do this without referencing
WORKDIR or TMPDIR?

Jussi

--001a114d83ea775a530547769511
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
 February 2017 at 13:23, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><span class=3D"gmail-">On Wed, 2017-02-01 at 12:03 +0200=
, Jussi Kukkonen wrote:<br>
&gt; Recipe-specific sysroots broke make_relative_symlink(), which<br>
&gt; turns absolute symlinks in sysroots into relative ones. Use the<br>
&gt; difference between the (in-sysroot) paths to construct the relative<br=
>
&gt; symlink.<br>
&gt;<br>
&gt; This fixes links in openssl-native, fontconfig-native and bzip2-<br>
&gt; native.<br>
&gt;<br>
&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@int=
el.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; sstate is not an area I&#39;m familiar with, please take a good look.<=
br>
&gt;<br>
&gt; As far as I could see outputpath (based on state[2]) was never really<=
br>
&gt; needed so I did not use it in the new version.<br>
<br>
</span>I don&#39;t think we can hardcode workdir into here as for tasks lik=
e<br>
do_deploy, this makes no sense. I think we removed most of the absolute<br>
links from the deploy tasks so we currently don&#39;t need this, at least<b=
r>
in the common case but the sstate code is meant to be generic.<br>
<br>
I am wondering if we need to pass in anything at all, can&#39;t we just<br>
call relpath on the original path and turn it into a relative one<br>
directly without referencing it back to TMPDIR/WORKDIR?<br>
<br></blockquote><div><br></div><div>The actual file path during do_populat=
e_sysroot is something like</div><div>=C2=A0 /mnt/extra-ssd/tmp/work/x86_64=
-linux/openssl-native/1.0.2j-r0/sysroot-destdir/mnt/extra-ssd/tmp/work/x86_=
64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native/usr/lib/ssl/certs</=
div><div><br></div><div>and the link before make_relative_symlink() points =
to=C2=A0</div><div>=C2=A0 /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-nati=
ve/1.0.2j-r0/recipe-sysroot-native/etc/ssl/certs</div><div><br></div><div>A=
ssuming those are correct, I don&#39;t see how to do this without referenci=
ng WORKDIR or TMPDIR?</div><div><br></div><div>Jussi</div></div></div></div=
>

--001a114d83ea775a530547769511--

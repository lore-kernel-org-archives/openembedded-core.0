Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id ABCEB7392C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 21:39:54 +0000 (UTC)
Received: by oifl3 with SMTP id l3so61230736oif.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CC9IyRQ3E6d/YfO1mShp1ulMx2WitvmzWU6+zNlMVUY=;
	b=BPHJCvpDf7mjqa4OjDpdzA+N/GEK1ZIBd/1M/pFepUOOTup7BpD3toaHul0rru4PII
	pTIfiMoQz8kli1Y2R2TLkW35aFXMcbzjBIGvcprBpXdIyjx5Oe545dDL40YkHUWcpWdk
	mR1rqzgSQ8fKn34kXhLTuR6CxqvoFTtbv5AU0YngjO8zmoFpY71he89IzNbonSsab+D6
	RSMjZ51sdFuO+Sm7RTTQf3BgQMui4lMvq3P27oNmFAjcvt3wme8L44uh8sE59hThi382
	Y2DwBGcyrQIHDX9S4xhKxvXAbolzVAS+IVPuoCFxUJo3EveSd7rm+iT131LYPvoF0mhz
	3JMg==
X-Gm-Message-State: ALoCoQl5n+rtuKXlQLBxt3oZof4vC6YUhyKJATkN9lLid7vvRU2zlU8Euo142Lf53ruw5NcJNcNk
X-Received: by 10.202.223.6 with SMTP id w6mr4776550oig.89.1427405996183; Thu,
	26 Mar 2015 14:39:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.203.145 with HTTP; Thu, 26 Mar 2015 14:39:35 -0700 (PDT)
In-Reply-To: <20150325221441.GN3904@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama>
	<CAJTo0LZV65-iZ3XDy7aaSyRayNOZ3trVpCfZMwe_=qrq8SUG-A@mail.gmail.com>
	<20150325221441.GN3904@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Mar 2015 21:39:35 +0000
Message-ID: <CAJTo0LY2yCWb-8MEAnirTe=19vTOsP8ZVNPMN21qarK3kVYgGA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Thu, 26 Mar 2015 21:39:57 -0000
Content-Type: multipart/alternative; boundary=001a113d631e5a6e42051237db29

--001a113d631e5a6e42051237db29
Content-Type: text/plain; charset=UTF-8

On 25 March 2015 at 22:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> yes, I've verified that I can reproduce this issue in master after
> reverting this change and that it resolves the issue in dizzy if I
> backport it with one other change (just to apply it cleanly with
> additional bugfix), I've referenced the fontcache.bbclass fix, these
> 3 should go in only together.
>

So I just managed to replicate and root-cause this a bit.   Good news:
found this in qemu's bugzilla.  Bad news: it's been open since 2013.

https://bugs.launchpad.net/qemu/+bug/1245703

The startup code iterates all files in the "sysroot" and cyclic symlinks
cause it to iterate forever.  So for now the official advice is "don't have
cyclic symlinks in your rootfs, or qemu breaks".

Ross

--001a113d631e5a6e42051237db29
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 March 2015 at 22:14, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D":4yk" class=3D"" style=3D"o=
verflow:hidden">yes, I&#39;ve verified that I can reproduce this issue in m=
aster after<br>
reverting this change and that it resolves the issue in dizzy if I<br>
backport it with one other change (just to apply it cleanly with<br>
additional bugfix), I&#39;ve referenced the fontcache.bbclass fix, these<br=
>
3 should go in only together.</div></blockquote></div><br>So I just managed=
 to replicate and root-cause this a bit. =C2=A0 Good news: found this in qe=
mu&#39;s bugzilla.=C2=A0 Bad news: it&#39;s been open since 2013.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"http=
s://bugs.launchpad.net/qemu/+bug/1245703">https://bugs.launchpad.net/qemu/+=
bug/1245703</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">The startup code iterates all files in the &quot;sysroot&quot=
; and cyclic symlinks cause it to iterate forever.=C2=A0 So for now the off=
icial advice is &quot;don&#39;t have cyclic symlinks in your rootfs, or qem=
u breaks&quot;.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a113d631e5a6e42051237db29--

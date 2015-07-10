Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id DE38973710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:25:10 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so21068671qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=91FMbl5CY3Y8+eo1tGPp/770Q9OMpxVRuv/1Isv5QF8=;
	b=Te65Le/GessEP9pjH1vP/Wxwjj5H1adk1YvGtA4IwTOTvYl6QdhPrSc9zYEaJvd8x1
	INB505ASZuNPGGSNB1X2M/BNvziCti5577em3k0t4fQxb0XOr6krSuoKEGEmwwh4yWE0
	xYkc9kMG3NI9qU5O24ar80BnzPaZJXLvjPgcppnsNnB+yquONmHPZbU9QrdENv1TFKRQ
	uNvOpImfiZa+tJNuoefIY+RH0V2myy1/KLiEOrK/34Zxc/Ct1O2lB7oZQOt0UndTGjB0
	firwy48aG2T5mkioDWvYRYuUrvuJ8aDRqe8IyRYLZNKdw+CmCqTnUaBoWd2sHs1rl5Xq
	Mbug==
X-Gm-Message-State: ALoCoQki1lkm1abU/S9KQfHBxBTdogHCFkwqplaNwusdtadwxD8otGEBQ3UFi+iN/aWmoOhgd95Q
X-Received: by 10.55.18.197 with SMTP id 66mr37047707qks.13.1436567110122;
	Fri, 10 Jul 2015 15:25:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:24:50 -0700 (PDT)
In-Reply-To: <55964128.4090607@opendreambox.org>
References: <1435905732-15169-1-git-send-email-xiao.zhang@windriver.com>
	<55964128.4090607@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:24:50 +0100
Message-ID: <CAJTo0LYuy4fWcFA5cS=0gpU_D7AepGpMtLKh+S=xWEuoeeSiFg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: bug fix for the path of systemd.conf
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
X-List-Received-Date: Fri, 10 Jul 2015 22:25:11 -0000
Content-Type: multipart/alternative; boundary=001a11474faa4b9527051a8cd8b9

--001a11474faa4b9527051a8cd8b9
Content-Type: text/plain; charset=UTF-8

On 3 July 2015 at 09:00, Andreas Oberritter <obi@opendreambox.org> wrote:

> >       if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; the
> > -             ${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':',
> 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -"
> ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
> > +             ${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':',
> 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -"
> ${D}${prefix}/lib/tmpfiles.d/systemd.conf', d)}
>
> wouldn't it be appropriate to change the conditional above, too?
>

+1 on that.  Also you probably want $rootlibdir, a variable defined in the
systemd recipe to mirror the path names used in the systemd makefile.
Obviously check what path it's actually using.

Ross

--001a11474faa4b9527051a8cd8b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 July 2015 at 09:00, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ];=
 the<br>
</span><span class=3D"">&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;networkd&#39;, &#39;:=
&#39;, &#39;sed -i -e &quot;\$ad /run/systemd/netif/links 0755 root root -&=
quot; ${D}${libdir}/tmpfiles.d/systemd.conf&#39;, d)}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(=
&#39;PACKAGECONFIG&#39;, &#39;networkd&#39;, &#39;:&#39;, &#39;sed -i -e &q=
uot;\$ad /run/systemd/netif/links 0755 root root -&quot; ${D}${prefix}/lib/=
tmpfiles.d/systemd.conf&#39;, d)}<br>
<br>
</span>wouldn&#39;t it be appropriate to change the conditional above, too?=
<br></blockquote><div><br></div><div>+1 on that.=C2=A0 Also you probably wa=
nt $rootlibdir, a variable defined in the systemd recipe to mirror the path=
 names used in the systemd makefile.=C2=A0 Obviously check what path it&#39=
;s actually using.</div><div><br></div><div>Ross</div></div></div></div>

--001a11474faa4b9527051a8cd8b9--

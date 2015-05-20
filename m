Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 69883601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 09:01:05 +0000 (UTC)
Received: by qkgw4 with SMTP id w4so27266827qkg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 02:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qqYFY9ZxHj9ORxp8t4sd3f/7kS4XTSKMrA6p/lIkngc=;
	b=Q5ytMAc9KZ4iZhC9xtVhZc+0lAWoI8fPyqFp4KXM5nzrqUr9QrUFPvhsp7eVqvVV6w
	M+WbIprb+Ex3BaQrmWfAdg7/bf0bMwxgN+K/2owRLB4lgjxnW/iTHQp6wQWgmhh3o8t8
	qhwmj/tBbOu5zAHRX45+A4qD67dltnRy5ghGMre61wgY5KoDEimVvyezJN4kdYVlHNpH
	JfijXVa47Nvdi472rOav9JMhUp8WFlJnk5P3TNYy7Faq1ljgXPzAOmg9nlGkoNDH5nW5
	ZHlMQb2RAb/qdtbBAq75lAVPNDgA/nk6euA2Ew3s3ACMJ0e/k2iQtENRgWOnms0wSpTF
	f+Yw==
X-Gm-Message-State: ALoCoQkA6p6D0QyX+pwieuLy4rcoF5enKywVNqX8l05dXwmVYH1Ete1Jjfb8yg4NLoR77pqm3nGM
X-Received: by 10.55.40.18 with SMTP id o18mr9484952qkh.58.1432112467034; Wed,
	20 May 2015 02:01:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 02:00:46 -0700 (PDT)
In-Reply-To: <1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 10:00:46 +0100
Message-ID: <CAJTo0LYu+bbDe+ybzfKcZ-xk-=YAaTNX7enkVyAvdwOubNm7Pw@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Wed, 20 May 2015 09:01:08 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8e0533905167faa71

--001a11440fb8e0533905167faa71
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 13:40, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> When PulseAudio is installed, alsa-plugins is needed to provide
> compatibility for ALSA applications.
>
> The dependencies are set up so that pulseaudio-server depends on
> alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
> on the PulseAudio plugins. This should make the ALSA->PulseAudio
> compatibility configuration work out of the box, while leaving the
> PulseAudio specific configuration out on systems that don't have
> pulseaudio-server installed.
>

 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
alsa-plugins-dev:
 * alsa-plugins (= 1.0.29-r0) *
 * opkg_install_cmd: Cannot install package alsa-plugins-dev.

There's a default RDEPENDS_${PN}-dev = ${PN}, but as alsa-plugins doesn't
exist that isn't very useful.  Then again shipping the .la files for the
loadable modules isn't very useful either (Linux doesn't need them to load
modules, and nothing will link against them).

So, instead of:

+FILES_${PN}-dev += "${libdir}/alsa-lib/*.la"

we should just delete the .la files in the do_install_append().

Ross

--001a11440fb8e0533905167faa71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 13:40, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><div id=3D":81o" class=3D=
"" style=3D"overflow:hidden">When PulseAudio is installed, <span class=3D""=
>alsa</span>-<span class=3D"">plugins</span> is needed to provide<br>
compatibility for <span class=3D"">ALSA</span> applications.<br>
<br>
The dependencies are set up so that pulseaudio-server depends on<br>
<span class=3D"">alsa</span>-<span class=3D"">plugins</span>-pulseaudio-con=
f, and <span class=3D"">alsa</span>-<span class=3D"">plugins</span>-pulseau=
dio-conf depends<br>
on the PulseAudio <span class=3D"">plugins</span>. This should make the <sp=
an class=3D"">ALSA</span>-&gt;PulseAudio<br>
compatibility configuration work out of the box, while leaving the<br>
PulseAudio specific configuration out on systems that don&#39;t have<br>
pulseaudio-server installed.</div></blockquote></div><br><div class=3D"gmai=
l_extra">=C2=A0* satisfy_dependencies_for: Cannot satisfy the following dep=
endencies for alsa-plugins-dev:</div><div class=3D"gmail_extra">=C2=A0* <sp=
an class=3D"" style=3D"white-space:pre">	</span>alsa-plugins (=3D 1.0.29-r0=
) *=C2=A0</div><div class=3D"gmail_extra">=C2=A0* opkg_install_cmd: Cannot =
install package alsa-plugins-dev.</div><div><br></div><div>There&#39;s a de=
fault RDEPENDS_${PN}-dev =3D ${PN}, but as alsa-plugins doesn&#39;t exist t=
hat isn&#39;t very useful.=C2=A0 Then again shipping the .la files for the =
loadable modules isn&#39;t very useful either (Linux doesn&#39;t need them =
to load modules, and nothing will link against them). =C2=A0</div><div><br>=
</div><div>So, instead of:</div><div><br></div><div><span style=3D"font-siz=
e:12.8000001907349px">+FILES_${PN}-dev +=3D &quot;${libdir}/</span><span cl=
ass=3D"" style=3D"font-size:12.8000001907349px;background-color:rgb(255,255=
,255)">alsa</span><span style=3D"font-size:12.8000001907349px">-lib/*.la&qu=
ot;</span><br style=3D"font-size:12.8000001907349px"></div><div><span style=
=3D"font-size:12.8000001907349px"><br></span></div><div><span style=3D"font=
-size:12.8000001907349px">we should just delete the .la files in the do_ins=
tall_append().</span></div><div><span style=3D"font-size:12.8000001907349px=
"><br></span></div><div><span style=3D"font-size:12.8000001907349px">Ross</=
span></div></div></div>

--001a11440fb8e0533905167faa71--

Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 10A5065CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 16:12:06 +0000 (UTC)
Received: by qkht68 with SMTP id t68so21165680qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 09:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=sMhILJsRVciNZN5q0kwMMHUKZSzF2woNtLEAk7LCRBE=;
	b=VW1JvpoR8bSTPhRvCjIoPhGYyS3z7W48LU7eYd1kzox0RD/h8UuYDw7vABNbY+Hkll
	1CBNkiH6XvUNuLJ7EMgrGJ4l9cqrkb9ObP8iF9cG/tjOwZr/0tP+mfa6B3mf+bRFTfPF
	3XBAnLhydrwrCrWD58YnOaI9eOqvIpx1KW0GavTwxTAsp/eAXc1bzesMUozWmisyLveW
	2Zo5I8JDwFdqTwWMD9P+2vt7KP6vB82FBI5jD9Qh82JyUSBcaRWSL0qViAuRjRUGbMtD
	nNClhlmPU9Yr1DuZSEuFaZsPS1jTEsFKEGuqcMFKxzF/7ZDuLP/SFyL8fotfLetXWB3p
	d7gQ==
X-Gm-Message-State: ALoCoQnxkvQo7uEGVLvjmyL7jSvVbb/nDe54yX7cHj4qGkUtDshg0cdOm4tum2wJ8VyX3OwzLH09
X-Received: by 10.55.212.219 with SMTP id s88mr9493931qks.70.1444320726496;
	Thu, 08 Oct 2015 09:12:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Thu, 8 Oct 2015 09:11:47 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 8 Oct 2015 17:11:47 +0100
Message-ID: <CAP71Wjy4XmN6Ffu=reiNyR+_MDaSbGHwGU0DxRRz2msfQ_rgkg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: issues with gcc 5 + mesa
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
X-List-Received-Date: Thu, 08 Oct 2015 16:12:07 -0000
Content-Type: multipart/alternative; boundary=001a11479872d879dd05219a1f89

--001a11479872d879dd05219a1f89
Content-Type: text/plain; charset=UTF-8

hi,

I am seeing this error on my board when compilng core-image-x11 based image:

root@ifc6410:~# glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
[   50.359341] Alignment trap: not handling instruction f4008a1f at
[<b6cf3f84>]
[   50.364408] Unhandled fault: alignment exception (0x801) at 0x000cd5bc
[   50.371419] pgd = ec024000
[   50.377885] [000cd5bc] *pgd=fb85f835
Bus error

While I initially thought it was something to do with my kernel or
firmware, I just thought about trying a build with GCCVERSION="4.9.3" and
the issue is gone.

I was having this issue as soon as EGL/GLES is being used, and I could get
it with both X11 or Weston/Wayland. This is running on IFC6410 (e.g. an
ARMv7 platform). The same images built for ARMv8 (DragonBoard 410c) work
fine.

I am using Mesa Gallium/freedreno for the GPU. I have tried armv7athf-neon
and armv7at-neon, and both show the same issue.

I would be curious to hear from others using similar platforms , though it
is likely something in mesa/gallium (so possibly in freedreno bits)..
Maybe someone using etnaviv ? Or is anyone building images for qemuarm v7?

cheers
nico

--001a11479872d879dd05219a1f89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi,<br><br></div>I am seeing this error on my board w=
hen compilng core-image-x11 based image:<br><div><div><br>root@ifc6410:~# g=
lxgears<br>Running synchronized to the vertical refresh.=C2=A0 The framerat=
e should be<br>approximately the same as the monitor refresh rate.<br>[=C2=
=A0=C2=A0 50.359341] Alignment trap: not handling instruction f4008a1f at [=
&lt;b6cf3f84&gt;]<br>[=C2=A0=C2=A0 50.364408] Unhandled fault: alignment ex=
ception (0x801) at 0x000cd5bc<br>[=C2=A0=C2=A0 50.371419] pgd =3D ec024000<=
br>[=C2=A0=C2=A0 50.377885] [000cd5bc] *pgd=3Dfb85f835<br>Bus error<br><br>=
</div><div>While I initially thought it was something to do with my kernel =
or firmware, I just thought about trying a build with GCCVERSION=3D&quot;4.=
9.3&quot; and the issue is gone.<br><br></div><div>I was having this issue =
as soon as EGL/GLES is being used, and I could get it with both X11 or West=
on/Wayland. This is running on IFC6410 (e.g. an ARMv7 platform). The same i=
mages built for ARMv8 (DragonBoard 410c) work fine. <br><br></div><div>I am=
 using Mesa Gallium/freedreno for the GPU. I have tried armv7athf-neon and =
armv7at-neon, and both show the same issue.<br><br></div><div>I would be cu=
rious to hear from others using similar platforms , though it is likely som=
ething in mesa/gallium (so possibly in freedreno bits)..=C2=A0 Maybe someon=
e using etnaviv ? Or is anyone building images for qemuarm v7? <br><br></di=
v><div>cheers<br></div><div>nico<br></div><div><br></div></div></div>

--001a11479872d879dd05219a1f89--

Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 960AE78442
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 16:09:24 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id q1so11320401ywh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=t/NGNg5jMjaGV7FNPumzasE41gHIv1YzwaXOv1ITHyM=;
	b=Bs7VQZIW8/MP9phCJADDY8qIakXAYGoPiu9dChVP73Et8iYDotnZeIKTiZnQveKFhy
	LtDZU801Aa2mmhmYlbvTSYsjLb55xt1Y+CdyP5xTGXgwVwrZSMcsif/QP2GDWj1Ba3uo
	+Bis2zmvXiQNf6/+i3xNSKZ2eCAYjbKjmM277jmIbCWUgLodCmzU5ZMWslSCmvcLIk+q
	cqlPVt4vLBqw5R7AmACizL6D0cKb1KXBa2tjig/Rq6E/G1dOGQOqciJ+KrW8Xibu85y0
	GKeWSVnmA6k5sH0WdnHfN0M3rQgNthEIeUfbWvMGLYJS83HItq4Cbf1Io46OPSb4UEkH
	N4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=t/NGNg5jMjaGV7FNPumzasE41gHIv1YzwaXOv1ITHyM=;
	b=tP/yxX10Twpl7S12bLzCKKs11m+V+Agj5nZuiL07iJ7LEorjtNffrV6/Ym+vTfBAuV
	Z09PDDSCjKcIZbOHn+gX/fd74NqPzgJp1OZwadFYBOeK0WSXM1zdcoGO9oFZddmLgUdi
	kZwAAQYyzps8tTtOqpoXiTDDpaZvdRUl+Qq3nrIsJlWhV8oqHPlnrw+AN+oemmkhl8W0
	i+oXmQd9luXlRsX1+4jJpIZLo6sNL3iCduQ7Qmz3KmCE5u96d5Oo7iKLX1RydoKkKL3K
	tEc6+leZZufnUmN53FLTp1ywbl6rE7HNMrB9yE0K4fH2x7XIOhjKJiqT6k0dSCI9Gtb2
	zyUA==
X-Gm-Message-State: AMCzsaV1wboNBPIpf/E6czl18MfE4oPfwRGoieY0KMa+c10Ks1PWwMZ9
	6jPO6T9NLYEsy1Lvyc07sHX31up7Ox1PLJ3r6NI=
X-Google-Smtp-Source: ABhQp+S3rCymTXFs2Ok1v+OjEnoTjh+AcqMpiv8Sl20s7pIVFaf4rEnwiu4JcxHpNqkNJYckKciqPl6tYEYuzL4V4+s=
X-Received: by 10.13.201.66 with SMTP id l63mr12614955ywd.83.1510070965042;
	Tue, 07 Nov 2017 08:09:25 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Tue, 07 Nov 2017 16:09:14 +0000
Message-ID: <CAFeBWL47-8O=LOG+1EW48vA3Gq34dbHYeCnMMiyv0zgME-X0DA@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: EGL (in XWayland) and NULLWS
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
X-List-Received-Date: Tue, 07 Nov 2017 16:09:24 -0000
Content-Type: multipart/alternative; boundary="001a114e67b4751bcc055d66cb6e"

--001a114e67b4751bcc055d66cb6e
Content-Type: text/plain; charset="UTF-8"

Hello, I am not 100% sure if this is the right mailing list, but I will
give it a try.

My Xwayland (x11 and Wayland in DISTRO_FEATURES) environment is not
providing the right X11 environment for my (legacy) X11 application.

In the platform definition file (/usr/include/EGL/eglplatform.h), there are
a set of definitions for a few platforms including X11:

    /* X11 (tentative)  */
    #include <X11/Xlib.h>
    #include <X11/Xutil.h>

    typedef Display *EGLNativeDisplayType;
    typedef Pixmap   EGLNativePixmapType;
    typedef Window   EGLNativeWindowType;


However on my system fall back is used:

    /* NULLWS fallback */

    #if defined(_WIN64) ||  __WORDSIZE == 64
    typedef khronos_int64_t EGLNativeDisplayType;
    #else
    typedef int EGLNativeDisplayType;
    #endif

    typedef void*   EGLNativePixmapType;
    typedef void*   EGLNativeWindowType;

As evidenced below:

    type = int
    (gdb) whatis EGLNativeDisplayType
    type = int
    (gdb) whatis EGLNativeWindowType
    type = void *

I am not versed with EGL / X11 API, but I believe this may be happening
because my graphics stack (TI's AM57xx SoC with SGX) only supports Wayland,
and not X11, out of the box.
It appears that X11 is supported by another package (XSGX) from TI, but I
don't believe using XSGX is the solution here as it is no longer endorsed
as the default in TI SDK.

Now I should also note that the platform definition
(/usr/include/eglplatform.h) does not have an entry for Wayland. I see
Win32, WinCE, X11 and the NULLWS fallback.

Given the context of running X11 applications via XWayland, X11 is still
the right platform definitions, and not NULLWS in my opinion.
If so, how do I correct this problem?

Any tips will be appreciated,

Adam

--001a114e67b4751bcc055d66cb6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, I am not 100% sure if this is the right mailing lis=
t, but I will give it a try.<div><br></div><div>My Xwayland (x11 and Waylan=
d in DISTRO_FEATURES) environment is not providing the right X11 environmen=
t for my (legacy) X11 application.</div><div><br></div><div>In the platform=
 definition file (/usr/include/EGL/eglplatform.h), there are a set of defin=
itions for a few platforms including X11:</div><div><div><div><div><br></di=
v><div>=C2=A0 =C2=A0 /* X11 (tentative)=C2=A0 */</div><div>=C2=A0 =C2=A0 #i=
nclude &lt;X11/Xlib.h&gt;</div><div>=C2=A0 =C2=A0 #include &lt;X11/Xutil.h&=
gt;</div><div><br></div><div>=C2=A0 =C2=A0 typedef Display *EGLNativeDispla=
yType;</div><div>=C2=A0 =C2=A0 typedef Pixmap=C2=A0 =C2=A0EGLNativePixmapTy=
pe;</div><div>=C2=A0 =C2=A0 typedef Window=C2=A0 =C2=A0EGLNativeWindowType;=
</div></div><div><br></div><div><div><br></div><div><div>However on my syst=
em fall back is used:</div><div><br></div><div>=C2=A0 =C2=A0 /* NULLWS fall=
back */</div><div><br></div><div>=C2=A0 =C2=A0 #if defined(_WIN64) ||=C2=A0=
 __WORDSIZE =3D=3D 64</div><div>=C2=A0 =C2=A0 typedef khronos_int64_t EGLNa=
tiveDisplayType;</div><div>=C2=A0 =C2=A0 #else</div><div>=C2=A0 =C2=A0 type=
def int EGLNativeDisplayType;</div><div>=C2=A0 =C2=A0 #endif</div><div><br>=
</div><div>=C2=A0 =C2=A0 typedef void*=C2=A0 =C2=A0EGLNativePixmapType;</di=
v><div>=C2=A0 =C2=A0 typedef void*=C2=A0 =C2=A0EGLNativeWindowType;</div></=
div></div></div><br></div><div>As evidenced below:</div><div><br></div><div=
><div>=C2=A0 =C2=A0 type =3D int</div><div>=C2=A0 =C2=A0 (gdb) whatis EGLNa=
tiveDisplayType</div><div>=C2=A0 =C2=A0 type =3D int</div><div>=C2=A0 =C2=
=A0 (gdb) whatis EGLNativeWindowType</div><div>=C2=A0 =C2=A0 type =3D void =
*</div></div><div><br></div><div>I am not versed with EGL / X11 API, but I =
believe this may be happening because my graphics stack (TI&#39;s AM57xx So=
C with SGX) only supports Wayland, and not X11, out of the box.</div><div>I=
t appears that X11 is supported by another package (XSGX) from TI, but I do=
n&#39;t believe using XSGX is the solution here as it is no longer endorsed=
 as the default in TI SDK.</div><div><br></div><div>Now I should also note =
that the platform definition (/usr/include/eglplatform.h) does not have an =
entry for Wayland. I see Win32, WinCE, X11 and the NULLWS fallback.</div><d=
iv><br></div><div>Given the context of running X11 applications via XWaylan=
d, X11 is still the right platform definitions, and not NULLWS in my opinio=
n.</div><div>If so, how do I correct this problem?=C2=A0</div><div><br></di=
v><div>Any tips will be appreciated,</div><div><br></div><div>Adam</div><di=
v><br></div></div>

--001a114e67b4751bcc055d66cb6e--

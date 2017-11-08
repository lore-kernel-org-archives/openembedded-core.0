Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 28BDD60107
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 17:18:55 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id w2so2914858ywa.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 09:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Yoj0xZVDP5G/molv73Q0w8u2uh7BYuO0Us0Ixkq9zxk=;
	b=uX5umo9kllRokkTrdeLgH13+z0p2BZB+U2rnzClL/lFAD285I56yJXFFe4Om2GTl+q
	CsU/PnJISyfKQc632vXld1H7qRpJqHLgO66iFoWvSL2a6nTHdcULXuWVwI/TOMrYMlPE
	Reg3TBM64vKIIrGCklb+4Y4FR5v8V+B0DPYXRw8Csxiy1ycJN0PvcoR744NsLA+FzszW
	u/iRdk29iqJ6N3TpMsXmoniVcgHJy9NWPuZY0JldXJKh6q5SnoQGibQ25MoOiR7mFSxJ
	yEvbCWajTZJkVfQ1RHMX2ELl/0k9kQXdqfid6s46D87It3X3e15n3bN5PZ6RrCqZ0PKI
	UjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Yoj0xZVDP5G/molv73Q0w8u2uh7BYuO0Us0Ixkq9zxk=;
	b=GP3NJcb4+0Abvxt3uq00KSqIJOWHphW2CSgXp2MOcHNv7dPS75MnPjsRjWkGrOC9hW
	STFoXOUnC+pwyvjvpba/1OInaWDL6+vxjg225atgWUam/t1xc9oGKofwfSuJDPtTLf9b
	dPTihlvTw1k0Qj4wvaCAA+oKEpvf/j/nw4SAciuTj352beDwowGC4+KGgpyMxXBqu+hc
	RVpRl4V11Hsx9UWg/SD8JZ/i7dUi4fGfQFgDnW2usPqIX4tz3Og7aZYHpfNrllE2KDRP
	Fs0mbFXS4di5CLcYVuJNlJcc5zoRvx1GPhTSExXHY15dSOZfKlhr6uGidnx//cxsFvFP
	NYhg==
X-Gm-Message-State: AJaThX4CcZgUdzXNViolm7Yg/z52ecakOs8tFEcpFCfDustjdzvW0i3o
	ywgN/JL9y7zM1kvMh0GakirLzIISphgO2FwFaCM=
X-Google-Smtp-Source: ABhQp+RoU7rCXlgAgqLCs9M0Ia+KW4Gr7+uRbugIN7xWkQ5emItYorixHQl2x7WkiLna7junWHXqXb/fSCGLve3ZVZc=
X-Received: by 10.129.175.39 with SMTP id n39mr867055ywh.231.1510161536945;
	Wed, 08 Nov 2017 09:18:56 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 08 Nov 2017 17:18:46 +0000
Message-ID: <CAFeBWL7jKmEYnvGJSUfA816SfkCWn-u3Vw8jdcAzScSZiAu+dw@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: [meta-qt5][meta-ti] X11 + Wayland in distro feature fails qtwayland build
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
X-List-Received-Date: Wed, 08 Nov 2017 17:18:56 -0000
Content-Type: multipart/alternative; boundary="f403045eb726f69350055d7be16a"

--f403045eb726f69350055d7be16a
Content-Type: text/plain; charset="UTF-8"

To run some x11 apps via Xwayland,I have both x11 and wayland in the distro
features on my Morty based TI-SDK.
I had to get mesa-gl included to provide the features of OpenGL that are
not provided by TI's SGX DDK for Xwayland to build.

With this change however, qtwayland is refusing to build because EGL does
not provide correct hooks:

| make[2]: Leaving directory
'/home/build/tisdk/build/arago-tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwayland/5.7.1+gitAUTOINC+4b23163fb6-r0.arago0/build/src/imports'
|
/home/build/tisdk/build/arago-tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwayland/5.7.1+gitAUTOINC+4b23163fb6-r0.arago0/git/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp:
In member function 'void
QtWaylandClient::QWaylandXCompositeEGLWindow::createEglSurface()':
|
/home/build/tisdk/build/arago-tmp-glibc/work/armv7ahf-neon-oe-linux-gnueabi/qtwayland/5.7.1+gitAUTOINC+4b23163fb6-r0.arago0/git/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp:126:82:
*error: invalid conversion from 'Window {aka long unsigned int}' to
'EGLNativeWindowType {aka void*}'* [-fpermissive]
|      m_surface = eglCreateWindowSurface(m_glxIntegration->eglDisplay(),
m_config, m_xWindow,0);
|
         ^~~~~~~~~

I don't know why I am getting this error, as the provider for virtual/egl
is still ti-sgx-ddk-um, which is the SDK default.

Any insights will be appreciated!

Adam

--f403045eb726f69350055d7be16a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To run some x11 apps via Xwayland,I have both x11 and wayl=
and in the distro features on my Morty based TI-SDK.<div>I had to get mesa-=
gl included to provide the features of OpenGL that are not provided by TI&#=
39;s SGX DDK for Xwayland to build.</div><div><br></div><div>With this chan=
ge however, qtwayland is refusing to build because EGL does not provide cor=
rect hooks:</div><div><br></div><div><div>| make[2]: Leaving directory &#39=
;/home/build/tisdk/build/arago-tmp-glibc/work/armv7ahf-neon-oe-linux-gnueab=
i/qtwayland/5.7.1+gitAUTOINC+4b23163fb6-r0.arago0/build/src/imports&#39;</d=
iv><div>| /home/build/tisdk/build/arago-tmp-glibc/work/armv7ahf-neon-oe-lin=
ux-gnueabi/qtwayland/5.7.1+gitAUTOINC+4b23163fb6-r0.arago0/git/src/hardware=
integration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp: In membe=
r function &#39;void QtWaylandClient::QWaylandXCompositeEGLWindow::createEg=
lSurface()&#39;:</div><div>| /home/build/tisdk/build/arago-tmp-glibc/work/a=
rmv7ahf-neon-oe-linux-gnueabi/qtwayland/5.7.1+gitAUTOINC+4b23163fb6-r0.arag=
o0/git/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglw=
indow.cpp:126:82: <b>error: invalid conversion from &#39;Window {aka long u=
nsigned int}&#39; to &#39;EGLNativeWindowType {aka void*}&#39;</b> [-fpermi=
ssive]</div><div>|=C2=A0 =C2=A0 =C2=A0 m_surface =3D eglCreateWindowSurface=
(m_glxIntegration-&gt;eglDisplay(), m_config, m_xWindow,0);</div><div>|=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~=
~~~</div><div><br></div></div><div>I don&#39;t know why I am getting this e=
rror, as the provider for virtual/egl is still ti-sgx-ddk-um, which is the =
SDK default.</div><div><br></div><div>Any insights will be appreciated!</di=
v><div><br></div><div>Adam</div></div>

--f403045eb726f69350055d7be16a--

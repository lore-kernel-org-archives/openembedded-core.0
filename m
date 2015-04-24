Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 562A5605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 21:19:39 +0000 (UTC)
Received: by wizk4 with SMTP id k4so36148127wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 14:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=aL9jRCNXpLbMIrKXdtxBx2TvdpZdHT5XJ73pKDplM2E=;
	b=EulE1zj/K6opw818FksiGI6LVFcx4mIdmV8NZzcdAz0YR+6ZGc577NKU8QB1U7+IYG
	IoMyXsIpovkGiYW/2KoSQnadNol7IYGB2yh9ifNPAe7pFjWs/QC+EPiX3Tki6HzR8TE/
	/hrsWVjBzuPuX6CgTBzGmYondznJn4xcQXaRczLaw8zdvmmq14Z983hlZ9J7kQQCLk3Q
	NUi1GLk/H01BBprqHn6r9ToASSJbWQYZ47NUqGlzhhc5EaNqmLD9kojlEmM38MFg0KQQ
	Xdy8h0zb35y8kr6V1MPkQvsESuQ0yGEmunrOjDsvc7cszyUmrr+p64IwMEJCI2CL7KHa
	8jfQ==
X-Received: by 10.194.91.129 with SMTP id ce1mr597523wjb.53.1429910380231;
	Fri, 24 Apr 2015 14:19:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	cf12sm18444454wjb.10.2015.04.24.14.19.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Apr 2015 14:19:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 Apr 2015 23:20:13 +0200
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Message-ID: <20150424212013.GF2353@jama>
References: <1429905741-24667-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1429905741-24667-1-git-send-email-dmitry_eremin@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4-x11-free: make virtual/libgl dependecy conditional
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
X-List-Received-Date: Fri, 24 Apr 2015 21:19:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2015 at 11:02:21PM +0300, Dmitry Eremin-Solenikov wrote:
> Make qt4-x11-free depend on virtual/libgl only if the DISTRO_FEATURES
> contain opengl. Otherwise there will be no package to fullfil this
> dependency.
>=20
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> ---
>  meta/recipes-qt/qt4/qt4-x11-free.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/q=
t4-x11-free.inc
> index 3b1e0fe..835fc96 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -4,7 +4,8 @@ SUMMARY =3D "Cross-platform UI toolkit and application fr=
amework (X11 version)"
>  DESCRIPTION =3D "Qt is a versatile cross-platform application framework =
-- this is the X11 version."
>  HOMEPAGE =3D "http://qt-project.org/"
>  SECTION =3D "x11/libs"
> -DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext lib=
xrender libxrandr libxcursor"
> +DEPENDS +=3D "virtual/libx11 fontconfig libxft libxext libxrender libxra=
ndr libxcursor"
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual=
/libgl', '', d)}"

That still leaves opengl support to be autodetected from sysroot for
distributions without opengl in DISTRO_FEATURES but where someone built
virtual/libgl provider before qt4-x11-free.

You need to use PACKAGECONFIG to explicitly disable it when it should be
disabled based on DISTRO_FEATURES.

>  PROVIDES +=3D "qt4-x11"
>  QT4DEPENDS =3D ""
> =20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


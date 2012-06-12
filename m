Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeTCu-0002Zl-Aw
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:40:36 +0200
Received: by eaal1 with SMTP id l1so2421204eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=U+VimYek+ijzAvhb5Zmvg28gddjumNNI48TmHu/5pmQ=;
	b=xLNZ2iVgk3qotXzYuuiiLT8Lx20yH7dmLnsatg4767UmZUU8qzAoiHgwxm60SfFXFX
	dD1KcBXTLaEMnW5PT4SsdonDvdrZAS6FXexObMXeZbjgSPDvasHkMbmO/zKr3CQL/BhY
	I0IAKON+xmz5ePo7zcT4SDQQPrgV/iTTQ6ZlSLh2EbGCAbFD9fCClgb4ebhwHLSFFIpB
	V5tNzGrJkG8J+xeRN9DqnHj89WE0EATV62CX82jk5KAAwqJapzGswOtoIBxyFbTxUAUW
	YFLZul7rdJuFm2BmGfLBojIwghP+t2BxAW/QjkfYY+ae0tCtFxbeNMXRtLhKstsflbMy
	WGOg==
Received: by 10.14.100.194 with SMTP id z42mr917924eef.146.1339515001418; Tue,
	12 Jun 2012 08:30:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 12 Jun 2012 08:29:31 -0700 (PDT)
In-Reply-To: <1339514126-23855-1-git-send-email-sgw@linux.intel.com>
References: <1339514126-23855-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2012 08:29:31 -0700
Message-ID: <CAMKF1sqhpJ9+wwuUSwBaSE4mdWM4EJXkAC-pSv5_WS+0o8kRUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Add check for wifi/bluetooth to enable rfkill
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 15:40:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2012 at 8:15 AM, Saul Wold <sgw@linux.intel.com> wrote:
> rfkill is a usefull tool when you have a device with bluetooth and wifi e=
nabled
>
> [YOCTO #2494]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> =C2=A0meta/recipes-core/busybox/busybox.inc | =C2=A0 =C2=A05 +++++
> =C2=A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 5b83d32..83b25b4 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -57,6 +57,11 @@ def features_to_busybox_settings(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0busybox_cfg('nls', =C2=A0distro_features, 'CON=
FIG_LOCALE_SUPPORT', cnf, rem)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0busybox_cfg('ipv4', distro_features, 'CONFIG_F=
EATURE_IFUPDOWN_IPV4', cnf, rem)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0busybox_cfg('ipv6', distro_features, 'CONFIG_F=
EATURE_IFUPDOWN_IPV6', cnf, rem)
> + =C2=A0 =C2=A0 =C2=A0 busybox_cfg('wifi', distro_features, 'CONFIG_RFKIL=
L', cnf, rem)
> + =C2=A0 =C2=A0 =C2=A0 busybox_cfg('bluetooth', distro_features, 'CONFIG_=
RFKILL', cnf, rem)
> + =C2=A0 =C2=A0 =C2=A0 machine_features =3D d.getVar('MACHINE_FEATURES', =
True).split()
> + =C2=A0 =C2=A0 =C2=A0 busybox_cfg('wifi', machine_features, 'CONFIG_RFKI=
LL', cnf, rem)
> + =C2=A0 =C2=A0 =C2=A0 busybox_cfg('bluetooth', machine_features, 'CONFIG=
_RFKILL', cnf, rem)

Doesnt this mean that it should be made machine specific recipe now ?


> =C2=A0 =C2=A0 =C2=A0 =C2=A0return "\n".join(cnf), "\n".join(rem)
>
> =C2=A0# X, Y =3D ${@features_to_uclibc_settings(d)}
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



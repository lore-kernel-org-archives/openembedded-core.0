Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QpCa0-0001SJ-Ro
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:04:16 +0200
Received: by vws2 with SMTP id 2so109836vws.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 21:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=iUas2JW4hGRSFRKfKsU8KiKnW4Y9aIAdGxZGqezqBrw=;
	b=FyCmtqc5/Bh3Au0E86olsIfpU6W27vZAZjPQH21ssEigfP7Bgf6EQelKXHkQypEis9
	0mDSEIDY/EL6Hp+pAokn9pg6M5NgGZv1ngcQ98N1z460Z9fBhQYLBdz3guLwbxta5V8A
	LOVVKwh3WsiPyAzZ7ULebM57HiPlTYOnEXd+g=
Received: by 10.52.90.12 with SMTP id bs12mr1987555vdb.495.1312520392100; Thu,
	04 Aug 2011 21:59:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.112.194 with HTTP; Thu, 4 Aug 2011 21:59:32 -0700 (PDT)
In-Reply-To: <359B10B9B28B294BAA6405D9320312E0111E934067@naemmail08.na.leapfrog.com>
References: <359B10B9B28B294BAA6405D9320312E0111E934067@naemmail08.na.leapfrog.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Aug 2011 21:59:32 -0700
X-Google-Sender-Auth: nNTg7CcvSPf8VW41dSKkXLLgoyI
Message-ID: <CABcZANkf_xBxAfs584Mo7370oLO8ggyy0BMQPfBy-dFN-qkWpA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Immediately append TCLIBCAPPEND to TMPDIR in defaultsetup.conf
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
X-List-Received-Date: Fri, 05 Aug 2011 05:04:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 3, 2011 at 2:54 PM, Daniel Lazzari <dlazzari@leapfrog.com> wrot=
e:
> =C2=A0Immediately append TCLIBCAPPEND to TMPDIR in defaultsetup.conf
> =C2=A0 =C2=A0instead of lazily appending it with _append. This fixes a bu=
g where
> =C2=A0 =C2=A0the wrong cache was cleared when BB_SRCREV_POLICY =3D "clear=
".
>
>
> Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>
> ---
> =C2=A0meta/conf/distro/defaultsetup.conf | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
> index 072f03c..951e5be 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -14,7 +14,7 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
>
> =C2=A0# Allow single libc distros to disable this code
> =C2=A0TCLIBCAPPEND ?=3D "-${TCLIBC}"
> -TMPDIR_append =3D "${TCLIBCAPPEND}"
> +TMPDIR :=3D "${TMPDIR}${TCLIBCAPPEND}"
>
> =C2=A0CACHE =3D "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(bb.=
data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['=
', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKM=
ACHINE', d, 1))]}"

If all you want is an immediate concatenation, you can use .=3D. Using
:=3D like this forces an early expansion of TMPDIR unnecessarily, as far
as I can tell.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



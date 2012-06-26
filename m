Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjY53-0001X6-GS
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 17:53:29 +0200
Received: by eaal1 with SMTP id l1so32671eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=PhUoS1PY5jJ+41syYqJcs/xlgHrQq9VB5dJUYPnJKLY=;
	b=aZFn9CECGZYfF7igofzR57qYPW2ieZi9gO8qLjNmDSCMj/fKiMZfh6TJakyEVoM9MX
	f0F7hf6aTOrJYikE2OrJGULFtjJDwOKRYAT6yzRzwNweo/msjfeTJAFI8/baYQwDju9W
	OddRl4UiKtG+aNvEyPxfj2upVjWQDjJDpMiVt0TIwuhZPUYFd3Qf3c5kXrHCG4FTUcku
	Ig0icVTNzydGhhBrkW494lgKR7a0TVDMa9RP1KQk9lASFH2tIl6AFQ8jqnZgOdamYJ7A
	9HqNuBzWZMo8NmwrbR/gAQaVd7QYrSZHkGmRRAy4PsZa0C0D3v/xvIH/HknlB4pHf0Ts
	5D2g==
Received: by 10.14.185.137 with SMTP id u9mr3477330eem.220.1340725357183; Tue,
	26 Jun 2012 08:42:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Tue, 26 Jun 2012 08:42:06 -0700 (PDT)
In-Reply-To: <1340722587-16368-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1340722587-16368-1-git-send-email-marcin.juszkiewicz@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jun 2012 08:42:06 -0700
Message-ID: <CAMKF1spa33Az7-ROMPvavJjV-uOmEwQjkAi8XxNDm7OPau3zxg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml: add lzma to build time dependencies
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
X-List-Received-Date: Tue, 26 Jun 2012 15:53:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 7:56 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> On my system libxml-native got linked with host copy of liblzma and as a
> result libxslt-native was not linkable:

>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> =C2=A0meta/recipes-core/libxml/libxml2.inc =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A02 +-
> =C2=A0meta/recipes-core/libxml/libxml2_2.8.0.bb | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/lib=
xml/libxml2.inc
> index 7d8cc16..b68c79f 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dbb90c48926=
316d9af6e2d70ca7013ade \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://trio.c;beginline=3D5;endline=3D14;md5=3D6c025753c86d958722ec76e94cae932=
e"
>
> =C2=A0DEPENDS_virtclass-native =3D "python-native"
> -DEPENDS =3D+ "zlib"
> +DEPENDS =3D+ "zlib lzma"

as you describe above I think problem is in native building of xslt.
this is adding the dependency on target lzma not host lzma.

I think you can look for options to disable lzma
explicitly in libxml2 otherwise you can also provide lzma-native and
create a dep on that

>
> =C2=A0SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml-64bit.patch"
> diff --git a/meta/recipes-core/libxml/libxml2_2.8.0.bb b/meta/recipes-cor=
e/libxml/libxml2_2.8.0.bb
> index 243789c..fe9ec05 100644
> --- a/meta/recipes-core/libxml/libxml2_2.8.0.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.8.0.bb
> @@ -1,6 +1,6 @@
> =C2=A0require libxml2.inc
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0SRC_URI[md5sum] =3D "c62106f02ee00b6437f0fb9d370c1093"
> =C2=A0SRC_URI[sha256sum] =3D "f2e2d0e322685193d1affec83b21dc05d599e17a730=
6d7b90de95bb5b9ac622a"
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



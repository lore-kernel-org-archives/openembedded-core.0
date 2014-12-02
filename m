Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id E76AF6AC19
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 18:13:44 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hq11so6023231vcb.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 10:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LGSAlXYFRP+0r+0se3IeQXNamattchkLc4O4UMbFaAI=;
	b=gasr+K1FBcT552wY22b2KGnSrYe9TLdcrRGZ6GUvQlz+DoJnwPE64XKk+SROggdJqY
	u/elH6aEKxGlMqXNhZpVxVDEKYCGWogeCY34k8rzWIiJrrIn36qtupEeDITwGIF+y0Qi
	IOAxVrin5TzzGHnD0HSPcWiEh+n/QR39KmDpZ9BapkxMCoQ+C9pQPGfVldj52epbgBtp
	lULN55PxpPgMGjAbtAIdRPHl5FnReSgnuUoxxqo11Q6ykYHYVkCu8yJ6XvPYVU7TuFxD
	4yNGfxUeJMjDRspNOwi25l8n4iZwhxlh2G47d4q/StJobbfxHwbCuvGHH1fWeLKkCxfr
	hZ/w==
MIME-Version: 1.0
X-Received: by 10.52.154.13 with SMTP id vk13mr307234vdb.59.1417544024988;
	Tue, 02 Dec 2014 10:13:44 -0800 (PST)
Received: by 10.52.237.165 with HTTP; Tue, 2 Dec 2014 10:13:44 -0800 (PST)
In-Reply-To: <1417508198-30563-2-git-send-email-schnitzeltony@googlemail.com>
References: <1417508198-30563-1-git-send-email-schnitzeltony@googlemail.com>
	<1417508198-30563-2-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 2 Dec 2014 19:13:44 +0100
Message-ID: <CALbNGRT4C0C5qomkne=1Ck2+K5rsK6KvxWBfyynbmQZus4Y6FA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gettext-native: build libintl so that other native recipes can use them
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
X-List-Received-Date: Tue, 02 Dec 2014 18:13:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2014 at 9:16 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> I have a native recipe around which directly compiles/links against libin=
tl.
> Gettext contains this code (usually supplied by glibc) as fallback. In na=
tive
> case this code is used by default because we don't have glibc there. This=
 patch
> changes static linking into dynamic linking making libintl code shareable=
.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-core/gettext/gettext_0.18.3.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes=
-core/gettext/gettext_0.18.3.2.bb
> index 65d4103..98838d7 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
> @@ -39,6 +39,9 @@ EXTRA_OECONF +=3D "--without-lispdir \
>                   --with-included-libunistring \
>                  "
>
> +# we have no glib intl
> +EXTRA_OECONF_append_class-native =3D "--with-included-gettext --enable-s=
hared"
> +
>  acpaths =3D '-I ${S}/gettext-runtime/m4 \
>             -I ${S}/gettext-tools/m4'
>
> --
> 1.8.3.1
>
AArgh: In case gettext-native is build before cross-localdef-native,
cross-localdef-native fails with

/usr/bin/ld: cannot find -lintl

It seems that cross-localdef-native finds libintl from gettext and
does not build it's own

log.do_configure
checking libintl.h usability... yes
checking libintl.h presence... yes
checking for libintl.h... yes

will investigate this further

Andreas


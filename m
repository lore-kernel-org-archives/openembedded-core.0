Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDE56C46B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 11:14:10 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i7so14747991iti.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 03:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i8lUzs7aFhuU4S8OKAVIMeG+7c8yV2UgGVivxPGDgoc=;
	b=RRs7VcF/WpRn8H/f1dCtj7mYhtyxvg6qvcBfttVg59PcU8Vem8K7r9/0YqcK82yIk+
	ivsX07+5ph60SPaTiXqDbk096jAWySANlDIfQxfBSjyo+cISVRrQc2RkAfnkk9qXvajw
	zNMczQV+fJycMW0tzwAKfkkd/3c8wQfywgL+3I85vxmNYT2pER+MMqjP9WM+hSGnyQwQ
	JiyynTeZEiHaVLU7xYCV6NHgvCDmvsm+olRBDO1R7f3qQuxtWCFablT7cgWXL0Q/VN4E
	hindlrKGKhnB8L4+95ps6ec4HD4P0cgVqbmRU0prmrM5MaOhyEw8xSSWaFUNhjAma9Sj
	TukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i8lUzs7aFhuU4S8OKAVIMeG+7c8yV2UgGVivxPGDgoc=;
	b=s+q5S4Qj05yGGR0xvGanL8JorbG0vKXAh3xRJnbHxxqLTQAVmFr3LOqx9l/3IBf3XV
	ZJICt+iI7uw/AbvkxXcHvWTjLPlxkvtrIGiHnniNplbFBshRXYd4TX13jnsch/cI0nA+
	wcvDe/I+5Egel7yVC72n/hbEwuzKxfzrARENQEGcjV/rpLUR3hNDTBPUCNrTeoIoHa7b
	0+4A+HKGYBaC0USLguHJqIsmBjtHAAXKZP9C+SqEzSAbdOVTUbgmG58HBpdOeyhkdgS5
	oERjd1xplkj6wC33Po3ENc7dmqSxywUBdPlbcBuwNuXg28QXRsD0rF1xd5SGqzXc1Aut
	m/6w==
X-Gm-Message-State: AA+aEWaTgtYHwdLQvYWhReNYFp0du1LIA0wjShbLXkKDm4ALX+Gz/F1t
	IXuTHdKcmnJhUQdz643j+4iY4dN57TPsERX5iBCM3Q==
X-Google-Smtp-Source: AFSGD/U0yXhBRJNNypoeJ92MEWkqJ+Sogk4H4mCIyqo0mJCu/YL3SqpGVYRPxtGJorL29HEbV1XK7n5cPiuzKJNEZnE=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr813930ite.26.1543922052003;
	Tue, 04 Dec 2018 03:14:12 -0800 (PST)
MIME-Version: 1.0
References: <1543947770-97931-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1543947770-97931-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2018 11:14:00 +0000
Message-ID: <CAJTo0LZMmnbc7140n-TsPdiHOt4SOHXB31ibV-yshqj3iXH_zw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: Fix SHA_HTONL bug for arm 32be.
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
X-List-Received-Date: Tue, 04 Dec 2018 11:14:11 -0000
Content-Type: text/plain; charset="UTF-8"

As this isn't a little detail, can you file this upstream?

Ross
On Tue, 4 Dec 2018 at 09:24, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Rpm use nss as digest crypto library and which will cause an error as follows:
>
> error: test-manual-1.2.3-20181012.noarch.rpm: Header SHA1 digest: BAD (Expected
> f1deb7dc4a10742d88ccd1e967dbc62ae45095a5 !=4ad9d7dad6d70d6086eefec62612ad5d77f2fe81)  => this value is wrong
> error: test-manual-1.2.3-20181012.noarch.rpm: not an rpm package (or package manifest)
>
> The error is caused by SHA_HTONL in nss, for there is no need to reverse the host value for arm 32be, so fix it.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch   | 34 ++++++++++++++++++++++
>  meta/recipes-support/nss/nss_3.40.bb               |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
>
> diff --git a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
> new file mode 100644
> index 0000000..7ba8d16
> --- /dev/null
> +++ b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
> @@ -0,0 +1,34 @@
> +Subject: [PATCH] Fix SHA_HTONL bug for arm 32be.
> +
> +In arm 32be, there is no need to reverse the host value.
> +
> +Upstream Status: Pending
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + lib/freebl/sha_fast.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/nss/lib/freebl/sha_fast.h b/nss/lib/freebl/sha_fast.h
> +index 4f37d13..8072eda 100644
> +--- a/nss/lib/freebl/sha_fast.h
> ++++ b/nss/lib/freebl/sha_fast.h
> +@@ -99,6 +99,7 @@ swap4b(PRUint32 value)
> +       defined(__ARM_ARCH_7__) ||   \
> +       defined(__ARM_ARCH_7A__) ||  \
> +       defined(__ARM_ARCH_7R__)))
> ++#if defined(IS_LITTLE_ENDIAN)
> + static __inline__ PRUint32
> + swap4b(PRUint32 value)
> + {
> +@@ -109,6 +110,7 @@ swap4b(PRUint32 value)
> +     return ret;
> + }
> + #define SHA_HTONL(x) swap4b(x)
> ++#endif
> +
> + #endif /* x86 family */
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-support/nss/nss_3.40.bb b/meta/recipes-support/nss/nss_3.40.bb
> index 23c95dd..afc5081 100644
> --- a/meta/recipes-support/nss/nss_3.40.bb
> +++ b/meta/recipes-support/nss/nss_3.40.bb
> @@ -28,6 +28,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>             file://blank-cert9.db \
>             file://blank-key4.db \
>             file://system-pkcs11.txt \
> +           file://nss-fix-SHA_HTONL-bug-for-arm-32be.patch \
>             "
>
>  SRC_URI[md5sum] = "f7aec858d192ae03d0e9a35a730c70fa"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


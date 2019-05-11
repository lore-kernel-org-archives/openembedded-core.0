Return-Path: <jacob.kroon@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id B514B7E0DF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 07:21:24 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e19so6294544iob.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 00:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Jv0Bwbw+qKnA3ydxBxi0dm6T8eq3xYyKLDkKZrSCT4w=;
	b=RlOr/u3fyawJC1YgxXYpmW6JxpW1HccnmXdEl4GKpsTbaoBkvctU3Msb1CxSl6tHqU
	MH9PjMur3IDibWD6GWRgD1Zdry2HpE7qj3vpbR63U2ZkI9/HH/z2I16XQxHpNE706iDu
	ZyxG+vn/QjcayjYUtSpm7p+uGnwSCOUPWFwYIKldjXaH8Z8bS7EXS7nIrX2nxdSlHFWj
	ZrJU8PF1qIrRsKq+Wp2vvHzTGc4seHzUnefbvAuX4+9LNWdaliR0gClAp6OtZCw4wT2M
	xGYtFzNnkCJomVcn63JNferszd73KjGDPJ9Ao+GaSDbJ+QeNFT7218Pag/eUoEPKCOZ/
	iibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Jv0Bwbw+qKnA3ydxBxi0dm6T8eq3xYyKLDkKZrSCT4w=;
	b=Vi+UcCX1RoNbR1+ZTnxBzd131amQRupwREbXUaPXow7mBzeageUbYKxQhnGF9O/Gj9
	YaVM2HAY9CNHEqefY3qFor40yKRAlcwm7st3cK7uDaX1M7jOBOO9oJi2Xex8Dm7Rf19f
	sKJVPmkbF+3zZkC/JNdBp61u2mlgJWxl9LwGaFpBa8RJxIReNHbhbJZ2OnD//vjgVK4a
	X5GS9E7D5CiUHiWhXLvXxqle/QF3LbO/IhZ53jhmCnWdGmX2M08pBGaegtZvaqO3zZfZ
	NUbsBCzHzUNC3K58OtK8wh+fqD7LZh6b769jYolWwdbVOFKSi2zGAncO3cUwoUzSEMjA
	pD+w==
X-Gm-Message-State: APjAAAVXusSKqpHd69re50lpuk5T2tt9J3X73CHlP0IC/0W4iCn8tv+M
	SVDUsFaIm+4gCmWoYFwXays9TaVNfV8kpG5L6RqvKg==
X-Google-Smtp-Source: APXvYqysVqBdL4sSDF0bTtlWx1nxYHB4SUrlw5/M8MjkwUGjEqJz9TfbSJe1LUAqB1Fu4Lpf5iVLu2UvNgadsfzt3UE=
X-Received: by 2002:a5e:990f:: with SMTP id t15mr8950320ioj.182.1557559285458; 
	Sat, 11 May 2019 00:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190204031153.1348-1-jacob.kroon@gmail.com>
In-Reply-To: <20190204031153.1348-1-jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Sat, 11 May 2019 09:21:14 +0200
Message-ID: <CAPbeDCmoxDEw6-Ke_eAQ2Rf1FszXavkj0qk08NJfq2jZy2rXHQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] base-passwd: Add kvm group
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
X-List-Received-Date: Sat, 11 May 2019 07:21:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 4, 2019 at 4:13 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> Although base-passwd in OE is somewhat outdated, upgrading
> to a newer version is not going to solve eudev warnings about
> missing groups during boot; input/shutdown/kvm are still not
> listed in groups.master. The reason for this is that
> Debian uses systemd, which will automatically create
> missing groups(systemd-sysusers). In a sysvinit+eudev
> configuration you instead get a warning printed to
> the console:
>
>   udevd[<pid>]: specified group 'kvm' unknown
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>
> v2: Add reasoning in commit message trying to justify the added patch
>
>  .../base-passwd/base-passwd/kvm.patch         | 23 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.5.29.bb         |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/kvm.patch
>
> diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
> new file mode 100644
> index 0000000000..113d5151e7
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
> @@ -0,0 +1,23 @@
> +From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
> +From: Jacob Kroon <jacob.kroon@gmail.com>
> +Date: Wed, 30 Jan 2019 04:53:48 +0000
> +Subject: [PATCH] Add kvm group
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> +---
> + group.master | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/group.master b/group.master
> +index cea9d60..5b62284 100644
> +--- a/group.master
> ++++ b/group.master
> +@@ -34,6 +34,7 @@ utmp:*:43:
> + video:*:44:
> + sasl:*:45:
> + plugdev:*:46:
> ++kvm:*:47:
> + staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> index c6be1c1d08..d1aab09181 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -12,7 +12,8 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://noshadow.patch \
>             file://input.patch \
>             file://disable-docs.patch \
> -          "
> +           file://kvm.patch \
> +           "
>
>  SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
>  SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
> --
> 2.20.1
>

This patch hasn't made it into master yet, I guess frowned upon for
adding yet another patch(?).
I can merge the 3 patches that add missing groups into one patch if that helps ?

Jacob


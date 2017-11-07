Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7DC71C70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 20:31:59 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id y42so432673wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 12:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EC6rn9vIRAoSggizVORiKo3nqQ3V7YCQf2X3MgH5u/s=;
	b=mhQ6LmOau/2Wlds0h0kyvE/ZbBOZyFT9SdSuIjqnmdhANhqJUTx0UhiG4TnFMAzdUn
	xfkrQgAfr0O0lGLMOwjVwQWY9PZ9BrOLgBRquPtEZ8AxMLEGb6hiuQAawZtCzEY0JMAt
	N+oqDGwhIedY/o9f90Axm95y3Z3/1ksoNKSy3zhR1LOQ2F+3C3YayAPfxeIxKWCF0whf
	q02JuaU6Swa7pddWidimRVm6tjPelOM9k6pfU8fk4QYyJjruwCwOCysw650o48WUif4a
	uovBPXAD8Q7cuBjk64i3VG2D9PlnJE3mHBfEUkTvx+VvMHysAaRNdqTFDY3+meZw+BtY
	f/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EC6rn9vIRAoSggizVORiKo3nqQ3V7YCQf2X3MgH5u/s=;
	b=OPw0m83zqbhxcwZlIZ4T7lxPXNo94TKKK8LX2oMQOYc/netwQsIcfyAXr5N26KkT41
	UG+gX1ceyexVGHiJWZYdpAk1ns1hSkbyjNigh2W6kIdnZ6xdrwwCAKUI6L8BL9a2fOrj
	q8oUUdl1kIaB+eYrWJC0Z8rTfi5ImkTpKvowhIhL7w4yZCcCPvI/oyOIOU5mDkmUhVxE
	etRB8zaV56qlSGKaF3KFVvtSLZMgBfjmXPeaLQaY+oMr+bOdjFxSOOqzNFY54NM+ECaN
	kK3H6Hj2mR5gyZXmbQsQqCbr2F+85eg3AGl3eNMYU/Uw/cBOpsG/yJZUcmdpRZHNyjEj
	enYg==
X-Gm-Message-State: AMCzsaXyrT90BNjWYrWJlcL5NyhoHt/l4zjksfoHmqWHdHvcnAqGlDGI
	4+BIOLrdE7/GuK+WHdnbfocLFoS6xCtuKklTh3o=
X-Google-Smtp-Source: ABhQp+R3/3YVQ38mKIwesYiDvVpwDeM2hCa5hlX13Uha6nd8Sc22agI6BrRPYxzl7CF6GGzVbjFW7NP5m+er38IGLug=
X-Received: by 10.223.146.197 with SMTP id 63mr15450308wrn.180.1510086719905; 
	Tue, 07 Nov 2017 12:31:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Tue, 7 Nov 2017 12:31:59 -0800 (PST)
In-Reply-To: <1509582216-10840-1-git-send-email-armccurdy@gmail.com>
References: <1509582216-10840-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 7 Nov 2017 12:31:59 -0800
Message-ID: <CAJ86T=XDqH1emDDZ5LkJJ-KSMBMZeR3oOj5=yMjRAOhfcozrzQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [morty][PATCH] gmp_4.2.1: prevent calls to mpn_add_nc() if HAVE_NATIVE_mpn_sub_nc is false
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
X-List-Received-Date: Tue, 07 Nov 2017 20:32:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 1, 2017 at 5:23 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> When building for aarch64 (ie relying only on generic C code rather
> than asm) libgmp.so contains undefined references to __gmpn_add_nc
> and __gmpn_sub_nc which causes attempts to link with -lgmp to fail:
>
>  | .../usr/lib/libgmp.so: undefined reference to `__gmpn_sub_nc'
>  | .../usr/lib/libgmp.so: undefined reference to `__gmpn_add_nc'
>
> Solution based on a historical patch posted to the gmp mailing list:
>
>   https://gmplib.org/list-archives/gmp-discuss/2006-May/002344.html
>
> Cherry-pick from meta-gplv2:
>
>   http://git.yoctoproject.org/cgit/cgit.cgi/meta-gplv2/commit/?id=d8668018d5d795be2297f878fd871a27edf532bf

Ping. CCing Armin.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...ls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch | 78 ++++++++++++++++++++++
>  meta/recipes-support/gmp/gmp_4.2.1.bb              |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch
>
> diff --git a/meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch b/meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch
> new file mode 100644
> index 0000000..7b879c3
> --- /dev/null
> +++ b/meta/recipes-support/gmp/gmp-4.2.1/prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch
> @@ -0,0 +1,78 @@
> +From d4f3542fabe0797cf2d60afd957585862bd9a29b Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Fri, 25 Aug 2017 16:16:06 -0700
> +Subject: [PATCH] prevent calls to mpn_add_nc() if HAVE_NATIVE_mpn_sub_nc is false
> +
> +When building for aarch64 (ie relying only on generic C code rather
> +than asm) libgmp.so contains undefined references to __gmpn_add_nc
> +and __gmpn_sub_nc which causes attempts to link with -lgmp to fail:
> +
> + | .../usr/lib/libgmp.so: undefined reference to `__gmpn_sub_nc'
> + | .../usr/lib/libgmp.so: undefined reference to `__gmpn_add_nc'
> +
> +Solution based on a historical patch posted to the gmp mailing list:
> +
> +  https://gmplib.org/list-archives/gmp-discuss/2006-May/002344.html
> +
> +Upstream-Status: Inappropriate [Fixed in current versions]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + mpn/generic/addsub_n.c | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/mpn/generic/addsub_n.c b/mpn/generic/addsub_n.c
> +index 27b2c08..0ff7ca0 100644
> +--- a/mpn/generic/addsub_n.c
> ++++ b/mpn/generic/addsub_n.c
> +@@ -58,13 +58,13 @@ mpn_addsub_n (mp_ptr r1p, mp_ptr r2p, mp_srcptr s1p, mp_srcptr s2p, mp_size_t n)
> +       for (off = 0; off < n; off += PART_SIZE)
> +       {
> +         this_n = MIN (n - off, PART_SIZE);
> +-#if HAVE_NATIVE_mpn_add_nc || !HAVE_NATIVE_mpn_add_n
> ++#if HAVE_NATIVE_mpn_add_nc
> +         acyo = mpn_add_nc (r1p + off, s1p + off, s2p + off, this_n, acyo);
> + #else
> +         acyn = mpn_add_n (r1p + off, s1p + off, s2p + off, this_n);
> +         acyo = acyn + mpn_add_1 (r1p + off, r1p + off, this_n, acyo);
> + #endif
> +-#if HAVE_NATIVE_mpn_sub_nc || !HAVE_NATIVE_mpn_sub_n
> ++#if HAVE_NATIVE_mpn_sub_nc
> +         scyo = mpn_sub_nc (r2p + off, s1p + off, s2p + off, this_n, scyo);
> + #else
> +         scyn = mpn_sub_n (r2p + off, s1p + off, s2p + off, this_n);
> +@@ -81,13 +81,13 @@ mpn_addsub_n (mp_ptr r1p, mp_ptr r2p, mp_srcptr s1p, mp_srcptr s2p, mp_size_t n)
> +       for (off = 0; off < n; off += PART_SIZE)
> +       {
> +         this_n = MIN (n - off, PART_SIZE);
> +-#if HAVE_NATIVE_mpn_sub_nc || !HAVE_NATIVE_mpn_sub_n
> ++#if HAVE_NATIVE_mpn_sub_nc
> +         scyo = mpn_sub_nc (r2p + off, s1p + off, s2p + off, this_n, scyo);
> + #else
> +         scyn = mpn_sub_n (r2p + off, s1p + off, s2p + off, this_n);
> +         scyo = scyn + mpn_sub_1 (r2p + off, r2p + off, this_n, scyo);
> + #endif
> +-#if HAVE_NATIVE_mpn_add_nc || !HAVE_NATIVE_mpn_add_n
> ++#if HAVE_NATIVE_mpn_add_nc
> +         acyo = mpn_add_nc (r1p + off, s1p + off, s2p + off, this_n, acyo);
> + #else
> +         acyn = mpn_add_n (r1p + off, s1p + off, s2p + off, this_n);
> +@@ -105,13 +105,13 @@ mpn_addsub_n (mp_ptr r1p, mp_ptr r2p, mp_srcptr s1p, mp_srcptr s2p, mp_size_t n)
> +       for (off = 0; off < n; off += PART_SIZE)
> +       {
> +         this_n = MIN (n - off, PART_SIZE);
> +-#if HAVE_NATIVE_mpn_add_nc || !HAVE_NATIVE_mpn_add_n
> ++#if HAVE_NATIVE_mpn_add_nc
> +         acyo = mpn_add_nc (tp, s1p + off, s2p + off, this_n, acyo);
> + #else
> +         acyn = mpn_add_n (tp, s1p + off, s2p + off, this_n);
> +         acyo = acyn + mpn_add_1 (tp, tp, this_n, acyo);
> + #endif
> +-#if HAVE_NATIVE_mpn_sub_nc || !HAVE_NATIVE_mpn_sub_n
> ++#if HAVE_NATIVE_mpn_sub_nc
> +         scyo = mpn_sub_nc (r2p + off, s1p + off, s2p + off, this_n, scyo);
> + #else
> +         scyn = mpn_sub_n (r2p + off, s1p + off, s2p + off, this_n);
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
> index 5e8ee29..029e728 100644
> --- a/meta/recipes-support/gmp/gmp_4.2.1.bb
> +++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
> @@ -11,6 +11,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/archive/${BP}.tar.bz2 \
>             file://Use-__gnu_inline__-attribute.patch \
>             file://gmp_fix_for_automake-1.12.patch \
>             file://avoid-h-asm-constraint-for-MIPS.patch \
> +           file://prevent-calls-to-mpn_add_nc-if-HAVE_NATIVE_mpn_sub_n.patch \
>  "
>
>  SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
> --
> 1.9.1
>


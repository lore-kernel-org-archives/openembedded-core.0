Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id A22B579503
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 17:48:50 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id o11-v6so21466836uak.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bm4kJHloOpUKXsvqAIf8JR6C3TxIC1748K3cD18p/K4=;
	b=TYE4cGM5bbXV+jVAtt2i0AMMDgTBmLlhw2vCO64/8f8JgKyCRm2Clp/U3F7iI7km6r
	otNBotpuo85j4xfUnjHwmdgo0oc83IvGyyuWBpe0GL1urn1PoZUj6fd3Da8yb1d0lPpr
	dAnfmREu1NTDVy+BvfzkjFJZW4eAV9Zw/TRFEetkTf6E5Mo5dewGhR90bJEbm685ZkRi
	g0F7T+fP+weQY3FW12y3Aohh9IswtXygb7erbUC5UY/Qrf0QDJd8lkfVPWrLJdh5HmhE
	RSs30MkFhi0vR+rH953Bi+RLS/uKAm2ykGdZbWYF0nnMMQqxVOMS2lxVvMFj86Im2/KD
	vt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bm4kJHloOpUKXsvqAIf8JR6C3TxIC1748K3cD18p/K4=;
	b=Db+tRl/uJz1eOKYmpbp5oz4otgwtq1jn6V9ycQxPKqV5y9FOLwx8k1LlbQXO8hxIgz
	OfRv3x8WvNQ9iJFLM0xy9jJH2YgHmVenX18fltmt2hBTDA2ZiW161/I4fipn9jtK6Us2
	YYlnAhYrpBeM1fnkM3vd/Njhqsq0E7RemyHZpPfk67H6+68Iyt4JagbiI+4ObrojQqzl
	upMmWzaGB0UKFq0BR/jXN6ZVuhbH+pGiFVLejyq05WnAmd00424XeDJlkxv2LVzHuYJO
	yb0aZZeCu9h7I7ctGgI3+OvLc982mIstwCs39ac0sQtzK0sk523QC2LKfaSJ5PCDHelx
	1hbw==
X-Gm-Message-State: APzg51BJe2YmBCCPPOxQZxuWKrsVUmAf0zdcAyy/l3OB686A88IfheVE
	kYBX/TPoU7bj7aYMxcVxl7t/wL64/edWffP3Wug=
X-Google-Smtp-Source: ANB0Vdb3XVrYdoWiZ4uVQgm4u3GdG6yspFMBFLrSTV/JqnlBnt+qiqGUEvwK6nuFcePsvru445bMOeTScwgCYXJshlU=
X-Received: by 2002:ab0:5c0c:: with SMTP id
	q12-v6mr9480797uaf.134.1536688131444; 
	Tue, 11 Sep 2018 10:48:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Tue, 11 Sep 2018 10:48:51
	-0700 (PDT)
In-Reply-To: <20180911173738.31045-1-raj.khem@gmail.com>
References: <20180911173738.31045-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 11 Sep 2018 10:48:51 -0700
Message-ID: <CAJ86T=VvSOUb4-d0LJ4QYD-uiGYva4hMvdPuhq9BMaU7Duu-ag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] socat: Cache shift value for CRDLY, TABDLY and CSIZE
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
X-List-Received-Date: Tue, 11 Sep 2018 17:48:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 11, 2018 at 10:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Match it to definitions in
> arch/<ARCH>/include/uapi/asm/termbits.h
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-connectivity/socat/socat_1.7.3.2.bb | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> index 4dcb7b4adc..1c8c903d83 100644
> --- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> @@ -11,7 +11,6 @@ LICENSE = "GPL-2.0+-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
>
> -
>  SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
>             file://Makefile.in-fix-for-parallel-build.patch \
>             file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
> @@ -26,9 +25,23 @@ inherit autotools
>  EXTRA_AUTORECONF += "--exclude=autoheader"
>
>  EXTRA_OECONF += "ac_cv_have_z_modifier=yes \
> -        ac_cv_header_bsd_libutil_h=no \
> +                 ac_cv_header_bsd_libutil_h=no \
> +                 sc_cv_termios_ispeed=no \
> +                 ${TERMBITS_SHIFTS} \
>  "
>
> +TERMBITS_SHIFTS ?= "sc_cv_sys_crdly_shift=9 \
> +                    sc_cv_sys_tabdly_shift=11 \
> +                    sc_cv_sys_csize_shift=4"
> +
> +TERMBITS_SHIFTS_powerpc ?= "sc_cv_sys_crdly_shift=12 \
> +                            sc_cv_sys_tabdly_shift=10 \
> +                            sc_cv_sys_csize_shift=8"
> +
> +TERMBITS_SHIFTS_powerpc64 ?= "sc_cv_sys_crdly_shift=9 \
> +                              sc_cv_sys_tabdly_shift=11 \
> +                              sc_cv_sys_csize_shift=4"

The _powerpc64 over-ride is forcing TERMBITS_SHIFTS back to the
default. Is that the intention?

>  PACKAGECONFIG_class-target ??= "tcp-wrappers"
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


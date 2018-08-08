Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id AF2F278AC2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 20:11:56 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id m11-v6so5995117oic.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 13:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OJjWUz+bqxG7xKMuHn2+1Oq+NrE41oqhoCxXOeq2q2E=;
	b=dVTyvg+hUItHwbY+ionKJdLvBc2nVJqfPFLKCnP8+aPbrweXh4ZJfhH/amBFXnpN1Z
	h54Q4+5sAtBkLoFXf8SwcbycOhBBbX3czU+cbNfxZXm7ji71DWF2jWpSli+MoRmlFluq
	4WFpPFDwR8t8UliRWzCQjVFX9J8puDKG/msnS/mT4hkl9pOlapMBOdkCs8EP8WhgJHEY
	Wf3rupFb94gU9SBqOrsSyw+Tf7LeezXsLVqGRSGHBI6HAghRT1aUf+WwHJun62rFqNYU
	KaSDN1eIj12O4E3TzvgYOUz7efGDOHoOSlYmSZ5Ael/weGm5acxfijhLMXiHmX6nLwPg
	+cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OJjWUz+bqxG7xKMuHn2+1Oq+NrE41oqhoCxXOeq2q2E=;
	b=OgfEeKkijcCtuyRRQ1xZ8zkKEB7fytrTMBD0nTXuBQOTXUuKIQvhvktYD8+nlQ7M8j
	CcET5PmL61jfaY5NbSbMd7U8722M7JW4UMfdxTyM8UbR1zuEPxb97UcIkPW+u79hcYkF
	bXDBthF0+psQ8e+iC4fZBK0r9T77HMSH8VsptJ1ZNSZ0b6p4Y68/YcRidjCB1rTdkBJb
	Wcyw9k7Q92j1Hi4JW0ZQJMZdyZUfH1EOzOpDOKd6ymUT2omFSnpoZ0QOtCfU0q972cc+
	jySZGj7bB/uf3C/fbt2zOu3XCpG4LMqn96Ls6evk4Hg6yft1Qs7hkO143xBxnRkrnwhh
	6How==
X-Gm-Message-State: AOUpUlEaZSJ66WrE6BHNwzrHqZBKzG7X5WOaWhyLj3r+3iJgbQ+gKMpj
	ZS1xI/jAU+6eeptJmmCDKxLiFjuMK5AmJauxNPHDJg==
X-Google-Smtp-Source: AA+uWPwz79nhqJvGe18VTdLTv8XEHQEP158O+DD/QyaenvPxlzYlT5GaNkq43bj+b7JMXAVkpur4UiMYizMOG/TNvBI=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr4662426oig.245.1533759117333; 
	Wed, 08 Aug 2018 13:11:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 13:11:36 -0700 (PDT)
In-Reply-To: <311591ab337eaa74854a45f9906984c777e386db.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
	<311591ab337eaa74854a45f9906984c777e386db.1533747698.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2018 21:11:36 +0100
Message-ID: <CAJTo0Lb3ZbisVT0OyoTQ3-ntsh+j9h_t4tQMq2VM+rtUVFxDfw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] ppp: Use openssl for the DES instead of the libcrypt / glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 20:11:56 -0000
Content-Type: text/plain; charset="UTF-8"

Is it possible to backport the patch from upstream so when they do
make a new release, devtool doesn't report conflicts but will just
delete the patch?

Ross

On 8 August 2018 at 18:04, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       | 84 +++++++++++++++++++
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  5 +-
>  2 files changed, 87 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
>
> diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> new file mode 100644
> index 0000000000..e53f240543
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> @@ -0,0 +1,84 @@
> +Used openssl for the DES instead of the libcrypt / glibc
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: ppp-2.4.7/pppd/Makefile.linux
> +===================================================================
> +--- ppp-2.4.7.orig/pppd/Makefile.linux
> ++++ ppp-2.4.7/pppd/Makefile.linux
> +@@ -38,7 +38,7 @@ LIBS =
> + # Uncomment the next 2 lines to include support for Microsoft's
> + # MS-CHAP authentication protocol.  Also, edit plugins/radius/Makefile.linux.
> + CHAPMS=y
> +-USE_CRYPT=y
> ++#USE_CRYPT=y
> + # Don't use MSLANMAN unless you really know what you're doing.
> + #MSLANMAN=y
> + # Uncomment the next line to include support for MPPE.  CHAPMS (above) must
> +@@ -132,7 +132,7 @@ endif
> +
> + ifdef NEEDDES
> + ifndef USE_CRYPT
> +-LIBS     += -ldes $(LIBS)
> ++LIBS     += -lcrypto
> + else
> + CFLAGS   += -DUSE_CRYPT=1
> + endif
> +Index: ppp-2.4.7/pppd/pppcrypt.c
> +===================================================================
> +--- ppp-2.4.7.orig/pppd/pppcrypt.c
> ++++ ppp-2.4.7/pppd/pppcrypt.c
> +@@ -64,7 +64,7 @@ u_char *des_key;     /* OUT 64 bit DES key w
> +       des_key[7] = Get7Bits(key, 49);
> +
> + #ifndef USE_CRYPT
> +-      des_set_odd_parity((des_cblock *)des_key);
> ++      DES_set_odd_parity((DES_cblock *)des_key);
> + #endif
> + }
> +
> +@@ -158,25 +158,25 @@ u_char *clear;   /* OUT 8 octets */
> + }
> +
> + #else /* USE_CRYPT */
> +-static des_key_schedule       key_schedule;
> ++static DES_key_schedule       key_schedule;
> +
> + bool
> + DesSetkey(key)
> + u_char *key;
> + {
> +-      des_cblock des_key;
> ++      DES_cblock des_key;
> +       MakeKey(key, des_key);
> +-      des_set_key(&des_key, key_schedule);
> ++      DES_set_key(&des_key, &key_schedule);
> +       return (1);
> + }
> +
> + bool
> +-DesEncrypt(clear, key, cipher)
> ++DesEncrypt(clear, cipher)
> + u_char *clear;        /* IN  8 octets */
> + u_char *cipher;       /* OUT 8 octets */
> + {
> +-      des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
> +-          key_schedule, 1);
> ++      DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
> ++          &key_schedule, 1);
> +       return (1);
> + }
> +
> +@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
> + u_char *cipher;       /* IN  8 octets */
> + u_char *clear;        /* OUT 8 octets */
> + {
> +-      des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
> +-          key_schedule, 0);
> ++      DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
> ++          &key_schedule, 0);
> +       return (1);
> + }
> +
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> index a1bb7d71c1..f4646bd693 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> @@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
>  SECTION = "console/network"
>  HOMEPAGE = "http://samba.org/ppp/"
>  BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
> -DEPENDS = "libpcap"
> +DEPENDS = "libpcap openssl"
>  LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
>  LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
>                      file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
> @@ -32,6 +32,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
>             file://fix-CVE-2015-3310.patch \
>             file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
>             file://0001-ppp-Remove-unneeded-include.patch \
> +           file://ppp-2.4.7-DES-openssl.patch \
>  "
>
>  SRC_URI_append_libc-musl = "\
> @@ -49,7 +50,7 @@ EXTRA_OECONF = "--disable-strip"
>  # Package Makefile computes CFLAGS, referencing COPTS.
>  # Typically hard-coded to '-O2 -g' in the Makefile's.
>  #
> -EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${S}/include"'
> +EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl -I${S}/include"'
>
>  do_configure () {
>         oe_runconf
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


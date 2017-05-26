Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 58DD778150
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 18:47:16 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id n104so174901wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nKQ/97Mgmr2nl7Otn7f+eY4gBPqcVWSZDGRyVWr8Nxk=;
	b=stFCJ5hkxiHUkvM3NH6bnPvkiSlJINQZ2RMTtS/H87g8hnkai7cwjpj/NCGkS1gv96
	sUJNDVPj14R6xJ/kpnP74TkDV6N7kVtMTheWcqGcDrJcDZPBS8hBBZKpAnjY+LwP7UZ6
	mVCkZqNeFUl/jhTP/A7wyaiQkVhSvicq39Gg3KhCiWEzxksCpMFJs1m0/LU9/YsTqiRU
	ivhwfIN4xIJd5ilZUSTvFQnH/QoC2doYtRtoyxoAQXk6Ffid7J18oa5LhsysjsQ3gTLr
	cWyday3cUc9GgHwHWo+zLV9wZM/sWJu9VqJDMSuGAx87Ry/Uyb1deIFF9jER9slC2u8e
	oFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nKQ/97Mgmr2nl7Otn7f+eY4gBPqcVWSZDGRyVWr8Nxk=;
	b=Nen4IsgMYyX7TJoizQRcyXABcTys1dGICV+SQMmZq0unc/RcacpGj2qcfEPUPtfitn
	K0P6xoNU6BN8EPr5wVzF7EHcEUKNPHqcI8m87WlKwUZLP3jbjhHsqcQrys4e+Ks5T1hm
	7vtnD8TpArBeFFQNLvEes+BzsmAxoxZMmdEBiCeOsGgM/HjesT7yP3F+njJ17nC+FUhA
	30lSwVU6aFtxVBHXihfvfPINMVP10LrBxnLfxSARp6OPBSLkRHDXCEO9efYsRrcr5LEB
	2NjUg0QHjMRinv5Y4VJX1m8h24ygpNRoOu9W/oAs+b9oNIIruSZNMpUBK6MMf2h0UOUF
	4urQ==
X-Gm-Message-State: AODbwcDyPtUqY6bewa8EJfdbRo8ZOixJgUWMXBUMSaUSGuS8HfMXZQGQ
	Y1TJerCrER0zCBvNntHqz5Gx1tEz1nnj
X-Received: by 10.223.170.67 with SMTP id q3mr3038657wrd.19.1495824437116;
	Fri, 26 May 2017 11:47:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.18 with HTTP; Fri, 26 May 2017 11:47:16 -0700 (PDT)
In-Reply-To: <20170526070344.6053-1-mirza.krak@endian.se>
References: <20170526070344.6053-1-mirza.krak@endian.se>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 26 May 2017 11:47:16 -0700
Message-ID: <CAJ86T=WvYZHsVBKjMkLOGko31sw5tMNki8fVz38u4DhRz6dG9Q@mail.gmail.com>
To: Mirza Krak <mirza.krak@endian.se>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Fri, 26 May 2017 18:47:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 26, 2017 at 12:03 AM, Mirza Krak <mirza.krak@endian.se> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Fixes
> | /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 against undefined symbol `OPENSSL_ia32cap_P' can not be used when making a shared object; recompile with -fPIC
> | /usr/bin/ld: final link failed: Bad value

Although this is an old thread, it appears to suggest that adding
-Wl,-Bsymbolic may be the more "correct" solution:

  https://rt.openssl.org/Ticket/Display.html?user=guest&pass=guest&id=1521

Interestingly, that's actually the default in upstream openssl, but
removed by an OE patch inherited from Debian:

  http://git.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/openssl/openssl/debian/no-symbolic.patch


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
> Signed-off-by: Mirza Krak <mirza.krak@endian.se>
> ---
>
> I hit the same compiler error as in above commit message when running on morty branch.
>
> I simply cherry-picked that fix in to morty branch. I looked in the git log of oe-core and it seems to me that it shall be ok to do that?
>
> This is a re-send since I messed up Subject the first time around [1]
>
> [1]. http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136489.html
>
>  meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
> index 9a7cdedd05..b6fb126349 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
> @@ -5,6 +5,7 @@ require openssl.inc
>  DEPENDS += "cryptodev-linux"
>
>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> +CFLAG_append_class-native = " -fPIC"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


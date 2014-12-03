Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8A31E60E24
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 07:54:09 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so23446735wiw.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 23:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=f2vrEedqVwRCv/3mm5CxUfkmj153VOOcktO0Kp9ULvo=;
	b=SwNdarfJTwA2S/vmg5fK4h8GaVUK3Im6DRAFFMeFJ6DBRfbspav2jurVA/weVthMjK
	OZlaVPsb5l2DRktuuzIM0UKX+H76rbTvzOs4EsIbDXOXYwys3PtlEmXKAceGHw6EmQwI
	asqekdiqGksE7VeUASbTvL9FpurTitgFNUtdLMIBpGrI9qrSTPH6KKImkBrpoLM6fnLX
	innBpvxRFS1vj5YEN1exuGkRP8paeB65wZzmNWw5jBepOPu7osWPPiYVZVy8DaHOSKFt
	f+V1i68tK9AHSibBaOW0zIq0TowpIAbcoix1cNvY3RCw8Wv7CWC3DK/yEJs45ihYBwpU
	+PRA==
X-Gm-Message-State: ALoCoQkdBIBXbIpjhQXIP2OpkprZJBQ8ZF2lN4j/y6nhHHh6vugxwPTMeDJpl7EoVa1Pa7fL3gmV
X-Received: by 10.194.234.40 with SMTP id ub8mr5330706wjc.100.1417593249978;
	Tue, 02 Dec 2014 23:54:09 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	fk12sm15432131wic.6.2014.12.02.23.54.08 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Dec 2014 23:54:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1417569841-24545-1-git-send-email-sgw@linux.intel.com>
Date: Wed, 3 Dec 2014 08:54:08 +0100
Message-Id: <967A3102-C8A6-48C6-A99F-AB15D2C4B85B@dominion.thruhere.net>
References: <1417569841-24545-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lzo: add debian patch for alignment issue
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
X-List-Received-Date: Wed, 03 Dec 2014 07:54:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 3 dec. 2014, om 02:24 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>=20
> [YOCTO #6994]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> ...0001-Use-memcpy-instead-of-reinventing-it.patch | 69 =
++++++++++++++++++++++
> meta/recipes-support/lzo/lzo_2.08.bb               |  1 +
> 2 files changed, 70 insertions(+)
> create mode 100644 =
meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.pat=
ch
>=20
> diff --git =
a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.p=
atch =
b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.p=
atch
> new file mode 100644
> index 0000000..f978f1b
> --- /dev/null
> +++ =
b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.p=
atch
> @@ -0,0 +1,69 @@
> +From: Simon McVittie <smcv@debian.org>
> +Date: Sun, 23 Nov 2014 22:50:33 +0000
> +Subject: Use memcpy() instead of reinventing it
> +
> +gcc inlines memcpy() with results as fast as handwritten code (at
> +least in my brief testing with lzop), and knows the alignment
> +constraints for our architectures.
> +
> +Change suggested by Julian Taylor.
> +
> +Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D757037
> +---
> + minilzo/minilzo.c | 14 ++++++++++++++
> + src/lzo_func.h    | 14 ++++++++++++++
> + 2 files changed, 28 insertions(+)
> +
> +Upstream-Status: Pending
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>

Please move those above the '---' so they get preserved when rediffing =
the patches


> +
> +diff --git a/minilzo/minilzo.c b/minilzo/minilzo.c
> +index ab2be5f..6913c2f 100644
> +--- a/minilzo/minilzo.c
> ++++ b/minilzo/minilzo.c
> +@@ -3523,6 +3523,20 @@ =
LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memops_TU8p)0)=3D=3D8)
> +     if ((void)0, n__n > 0) do { *d__n++ =3D *s__n++; } while (--n__n =
> 0); \
> +     LZO_BLOCK_END
> +=20
> ++/* Debian-specific change: we know that our compiler inlines =
memcpy() with
> ++ * constant n to be as fast as handwritten code, and knows which =
architectures
> ++ * need things correctly aligned. */
> ++#undef LZO_MEMOPS_COPY1
> ++#undef LZO_MEMOPS_COPY2
> ++#undef LZO_MEMOPS_COPY4
> ++#undef LZO_MEMOPS_COPY8
> ++#undef LZO_MEMOPS_COPYN
> ++#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
> ++#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
> ++#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
> ++#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
> ++#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
> ++
> + __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const =
lzo_voidp ss)
> + {
> +     lzo_uint16_t v;
> +diff --git a/src/lzo_func.h b/src/lzo_func.h
> +index dfaa676..1cc1b53 100644
> +--- a/src/lzo_func.h
> ++++ b/src/lzo_func.h
> +@@ -333,6 +333,20 @@ =
LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memops_TU8p)0)=3D=3D8)
> +     if ((void)0, n__n > 0) do { *d__n++ =3D *s__n++; } while (--n__n =
> 0); \
> +     LZO_BLOCK_END
> +=20
> ++/* Debian-specific change: we know that our compiler inlines =
memcpy() with
> ++ * constant n to be as fast as handwritten code, and knows which =
architectures
> ++ * need things correctly aligned. */
> ++#undef LZO_MEMOPS_COPY1
> ++#undef LZO_MEMOPS_COPY2
> ++#undef LZO_MEMOPS_COPY4
> ++#undef LZO_MEMOPS_COPY8
> ++#undef LZO_MEMOPS_COPYN
> ++#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
> ++#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
> ++#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
> ++#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
> ++#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
> ++
> + __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const =
lzo_voidp ss)
> + {
> +     lzo_uint16_t v;
> diff --git a/meta/recipes-support/lzo/lzo_2.08.bb =
b/meta/recipes-support/lzo/lzo_2.08.bb
> index 7d7d1f3..af06e29 100644
> --- a/meta/recipes-support/lzo/lzo_2.08.bb
> +++ b/meta/recipes-support/lzo/lzo_2.08.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>                     =
file://src/lzo_init.c;beginline=3D5;endline=3D25;md5=3Da6e25df9a83b24629e8=
47846ccdd8054"
>=20
> SRC_URI =3D =
"http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
> +           file://0001-Use-memcpy-instead-of-reinventing-it.patch \
>            file://acinclude.m4 \
>            "
>=20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20



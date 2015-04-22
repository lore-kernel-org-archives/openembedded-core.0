Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9B760167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:18:48 +0000 (UTC)
Received: by widdi4 with SMTP id di4so46522036wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=vUKpJYO73qY93QxBjgIz48hirsGA9g7/Lj0KiUUeBUY=;
	b=BBnrPohS0Vb6hmEH6BFwj7d2I8vbcvxG6cAb83IEClBNiK88l/bZ7ZOPtnQne4cAjn
	J+klJ8/0Zf1Ne+mUB3wAUvqPM/dmv8KZwTpcJABvKCmL8Y0ijCi1hicYAXxkFX7xgNOC
	RBTJewU6YlMf5baI5jAxUsSUqGXRaDAhLVqkTRNafT5CXrQWI1oxnc0PzGU9B98B77nC
	eIvkOAlth4nONmoil5/zq7febOlOZPSPixA3UB176zK1VKj3fCGzdn4IeqBq6qjSoGvT
	qirLtDyW5O4aGilPs9OkCc7wCarmX4bZlieni66lmgyKxQXs6pTtwLefSf/Q0DoxgdkU
	6A1w==
X-Gm-Message-State: ALoCoQmSHIp7w/Pb++BNK7Kv/1l62+FIuzyoGFFJoZ2LdeAroUVMNmsPkDo16tnzYfmvot8cwn6x
X-Received: by 10.180.218.108 with SMTP id pf12mr3350530wic.13.1429687129898; 
	Wed, 22 Apr 2015 00:18:49 -0700 (PDT)
Received: from ?IPv6:2001:610:612::7ca4:fabf:4c7f:75fe?
	([2001:610:612:0:7ca4:fabf:4c7f:75fe])
	by mx.google.com with ESMTPSA id k2sm6399220wix.4.2015.04.22.00.18.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Apr 2015 00:18:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <1271ca6bd1854156a5b6efcf8a925e0c@BL2FFO11FD020.protection.gbl>
Date: Wed, 22 Apr 2015 09:18:47 +0200
Message-Id: <F274ED94-A38E-42DD-9226-3A3565A11ACD@linaro.org>
References: <1271ca6bd1854156a5b6efcf8a925e0c@BL2FFO11FD020.protection.gbl>
To: Nathan Rossi <nathan.rossi@xilinx.com>
X-Mailer: Apple Mail (2.2098)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel-arch.bbclass: add arm64 support to U-Boot architecture map"
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
X-List-Received-Date: Wed, 22 Apr 2015 07:18:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 19 feb. 2015, om 04:34 heeft Nathan Rossi <nathan.rossi@xilinx.com> =
het volgende geschreven:
>=20
> This reverts commit 0b891265716c414ade29d587fc1a3c4ea7beadbe.
>=20
> U-Boot does support AArch64, this however was only added to newer
> versions of U-Boot and at the time of this original commit the U-Boot =
in
> OE-Core did not support the 'arm64' architecture. OE-Core now has a
> newer version of U-Boot for the mkimage recipe and thus supports the
> 'arm64' architecture.
>=20
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> ---
> meta/classes/kernel-arch.bbclass | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel-arch.bbclass =
b/meta/classes/kernel-arch.bbclass
> index bbcfa15..6a6ad91 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -40,7 +40,6 @@ def map_uboot_arch(a, d):
>=20
>     if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
>     elif re.match('i.86$', a): return 'x86'
> -    elif re.match('arm64$', a): return 'arm'
>     return a

I just debugged a boot failure to this revert. The machine in question =
is using u-boot 2013.04 + vendor patches and can=E2=80=99t be replaced =
at this time.  I get that OE doesn=E2=80=99t care about vendor trees =
using obsolete versions, but this case is extra annoying because a few =
lines later this bbclass does:

     export UBOOT_ARCH =3D "${@map_uboot_arch(d.getVar('ARCH', True), =
d)}"

instead of:

     export UBOOT_ARCH ?=3D "${@map_uboot_arch(d.getVar('ARCH', True), =
d)}"

So now I=E2=80=99m forced to overlay kernel-arch.bbclass with the revert =
reverted and hope I don=E2=80=99t get any machines with a recent u-boot. =
Having said all that, modern uboots should default to zImage for arm32 =
and Image for aarch64 and have CONFIG_SUPPORT_RAW_INITRD enabled so =
mkimage isn;t needed anymore.

So, opinions on weakly assigning UBOOT_ARCH?

--
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs





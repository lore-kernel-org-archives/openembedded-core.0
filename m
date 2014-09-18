Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id CB12F70E1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 06:56:46 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id p10so797511pdj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 23:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=bQsRDGvTKfqc9vFO+MhNfPzS7xmmFpvjK8UognXK1lw=;
	b=DXalouxMLkz533SFNbng8QIYT2JNj2DZQJUwW629LpTa83L/iEqltLT60j6lDFZS/l
	6Kmy5VdFfgHX1MPK0FabrAnxNJAHBsW+1lbjSEy+nuiKAx49/PAqnNAXjjZUJuuFDb1o
	BG1HhFLMPtvmXAsBJ03i7Yl7Dh1mfzMx9ZNEs1PYwhYGmbs6x7eSo4g2pwl4ieaass77
	jbbLpMCi/rXJJJ/eoSJa1jATqY100GHq9H9H1yrBOlo3Mg52xeahfRM/vdRBaD7mDuKA
	Jtk/qSj/7VYDeUp6GBsZ++URO8KhCU7whRgiPw3ggCgfMwx/T7grAc9G4Snz7GVba3xL
	49Kw==
X-Received: by 10.66.165.4 with SMTP id yu4mr1624517pab.157.1411023407653;
	Wed, 17 Sep 2014 23:56:47 -0700 (PDT)
Received: from CACSVMO-14452.local (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	du5sm18676182pbb.80.2014.09.17.23.56.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Sep 2014 23:56:47 -0700 (PDT)
Message-ID: <541A822D.2030702@gmail.com>
Date: Wed, 17 Sep 2014 23:56:45 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1410879378.git.kai.kang@windriver.com>
	<64a67dbfe6aba5a52b7740fa15b6baa6f117defa.1410879378.git.kai.kang@windriver.com>
In-Reply-To: <64a67dbfe6aba5a52b7740fa15b6baa6f117defa.1410879378.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/9] linux-yocto: depend on libgcc for aarch64
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
X-List-Received-Date: Thu, 18 Sep 2014 06:56:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 9/16/14 8:06 AM, Kai Kang wrote:
> Make aarch aarch64 kernel depend on libgcc. In arch/arm64/Makefile, it
> adds LIBGCC to libs-y:
> 
> LIBGCC          := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> libs-y          += $(LIBGCC)
> 
> If build without libgcc, the value of LIBGCC is just libgcc.a without
> parent directory. linux-yocto fails to build:
> 
> |   LD      vmlinux.o
> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
> 
> Add libgcc to aarch64 kernel dependency.

really ? usually kernel has its own routines to substitute libgcc needs.
why is it different here.

> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 4ed3188..db693e6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  INC_PR = "r4"
>  
>  DEPENDS += "xz-native bc-native"
> +DEPENDS_aarch64 += "libgcc"
>  

this should be using append instead of +=

>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
> 

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlQagi0ACgkQuwUzVZGdMxQfGwCaAuY+dIXbAnQ9tTOIA4MFSwhe
wEwAn1FxFeun292octWdy0sYJqtGRPOb
=5Tcg
-----END PGP SIGNATURE-----


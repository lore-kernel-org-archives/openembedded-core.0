Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 422FB7169F;
	Wed, 29 Apr 2015 14:34:02 +0000 (UTC)
Received: by wizk4 with SMTP id k4so182738785wiz.1;
	Wed, 29 Apr 2015 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=RRD/KzocpQc1oYFKHk9ukRdAxSIv1lRgGiwnkS9eqKM=;
	b=m0/UYClCsrfEbF7zotB5u8vkfEI5DZhoUpTWufrKB80754XMjdIgiNcb5tI24FTUaC
	gwIWEPC/18cP4LDn0N8zTEYyhp1bgh6xfyS7WrFbXxMInCKSLQ6uv3DjuXCADto0L6d9
	DaVe3wqCkBolpos9lY4O3AAiFEbmffQ+eABL5maLn5izoVBuykDmFNswPKVViEzULb4l
	lKCLlCFanOdBC+rQsbqxIKf6EDE/NXL19LJQ5FcbRsp6l6Yuq42GnKUTURvJmSOdLB4U
	eAKAlwaDhmsRp7vorKw1vf/HP+R6Fa+qsqcM34w75DPfAZ3iuf7VXroPtL2S2KnLRZbl
	dmhA==
X-Received: by 10.180.91.137 with SMTP id ce9mr6267777wib.76.1430318043515;
	Wed, 29 Apr 2015 07:34:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id c5sm7861209wjf.40.2015.04.29.07.34.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Apr 2015 07:34:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Apr 2015 16:34:11 +0200
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150429143411.GB2369@jama>
References: <20150428065736.84E005048F@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150428065736.84E005048F@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: unify meta directory detection
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
X-List-Received-Date: Wed, 29 Apr 2015 14:34:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 06:57:36AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6b04ae2c0439b83c0445fd1b8cb9cba5cee6b9bc
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6b04ae2c0439b83c0445fd1b8cb9cba5cee6b9bc
>=20
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Fri Apr 24 12:13:53 2015 -0400
>=20
> kern-tools: unify meta directory detection
>=20
> It is possible that recipe specific tasks, or build processes drop
> files into the kernel source directory. These files can cause problems
> with the meta data detection in the kern-tools.
>=20
> With this change, we have a single unified meta data detection routine,
> that logs the result in a new file ".metadir", which subsequent scripts
> can find, and use, thereby avoid repeating the same check many times.
>=20
> We also enhance the check to look for a sentinel file in a proper meta
> directory, to avoid false positives when an unexpected kernel process
> leaves an uncommitted directory in the kernel dir.

One of recent linux-yocto changes causes new warning in default qemux86
build:

WARNING: [kernel config]: specified values did not make it into the kernel'=
s final configuration:

Value requested for CONFIG_ATA_PIIX not in final ".config"
Requested value: "CONFIG_ATA_PIIX=3Dy"
Actual value set: ""


NOTE: recipe linux-yocto-tiny-kexecboot-3.19.5+gitAUTOINC+1b28e65444_d5d30b=
a4d2-r0: task do_kernel_configcheck: Succeeded

> [YOCTO: #7441]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/me=
ta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index a1ec198..e83f195 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=3D5=
;endline=3D9;md5=3Dd8d1d729a70c
> =20
>  DEPENDS =3D "git-native"
> =20
> -SRCREV =3D "83e5493ea46067152609008ade131971eaebbb27"
> +SRCREV =3D "79bc82453c26d426d3d8fd05d5da37cf5fc4068c"
>  PR =3D "r12"
>  PV =3D "0.2+git${SRCPV}"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


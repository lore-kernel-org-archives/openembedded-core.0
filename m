Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC2A862135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 17:51:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so17357798wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=skewS/XwQtJvH+BbzZp4Jj7ZBXeWFIhWNx/7xKSiai4=;
	b=Xkgt9CRwVJfLOq/+qR4aPy3CSqxTaJ+WAz835qex8jwu9M01exh+BV7c+t0uJIRHh0
	Mhqk9wKCO2lTT06cX0EA6xi4cFgNa2uczcHYQ5W2aF2jf/Q16lbp92/4a3qkIveEoBqy
	mlbJR2fwFcHNsETOC29LxhaKLZ4UQSdR5jxRRyoTmh4QcAr/M9e0BJwYyeGwr1peSgB8
	YWt9KGap3zeux20iXRQ3L4O253a7ExWhFq6u1sRyrZdZRXBk57UfraYxGXEKgW1/bxtd
	ydGUL2+cQQ1r05LxMsJ+dbokgjjw+alKH8T8D69QN6FliT4zXUlJsS60r1WQRXlBk1Rv
	Raiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=skewS/XwQtJvH+BbzZp4Jj7ZBXeWFIhWNx/7xKSiai4=;
	b=NKx2ddBo+L/3LeJwCVoz4DMD8SftoVw/RWCcxoCJxFoPfk73VPASWiYUDwiiQA1M4M
	p0Vx7oTkcMuXSZpjB0GGIAaQP3NF7v6pOla5Eku5M39DXO2XCwQWoEQMuASW//BGmFKE
	yWhJVE0OYOmVx8pGC4ICRSWhuiFvZWb7Ykkdd0Q73IZde9Vq3zVpqf+U8+mZBwde18mC
	xT7Kl0Q/r8pkqVotOGnO2LrkHjAjRnhOD2gKnQUKhrF/xKF31IxLeEclWm63EsM1iCRf
	4wq7R1XjIoddAuq+Q5mfynpMQENCexlosV0NkEA3NqTEyDSO26I4ZsC0JIlhZlZetnaC
	1iyA==
X-Gm-Message-State: ALyK8tKoMs77dzKZRoBmnNGO0trCvjwaO6A4TQUCz9Ee+xfCRerBWSlRi2x2oLBhLFSR3w==
X-Received: by 10.28.68.68 with SMTP id r65mr11758302wma.11.1464025883781;
	Mon, 23 May 2016 10:51:23 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	f12sm12032875wme.13.2016.05.23.10.51.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2016 10:51:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1461232047-5393-1-git-send-email-kad@kad.name>
Date: Mon, 23 May 2016 19:51:20 +0200
Message-Id: <F2B01478-079E-441D-B72B-258DAF96290B@dominion.thruhere.net>
References: <1461232047-5393-1-git-send-email-kad@kad.name>
To: "Alexander D. Kanevskiy" <kad@kad.name>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: don't execute compression commands multiple times
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
X-List-Received-Date: Mon, 23 May 2016 17:51:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 21 apr. 2016, om 11:47 heeft Alexander D. Kanevskiy <kad@kad.name> =
het volgende geschreven:
>=20
> In case of chained conversion methods are used via COMPRESS_CMD_*
> there is chance that some of steps would be executed multiple times.

And this breaks image_types_uboot.bbclass:

ERROR: Logfile of failure stored in: =
/build/linaro/build/build/tmp-glibc/work/genericarmv8-oe-linux/linaro-imag=
e-minimal-initramfs/1.0-r0/temp/log.do_image_cpio.16506
Log data follows:
| DEBUG: Executing python function set_image_size
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_cpio
| 31373 blocks
| Image Name:   linaro-image-minimal-initramfs-g
| Created:      Mon May 23 19:38:56 2016
| Image Type:   ARM Linux RAMDisk Image (gzip compressed)
| Data Size:    7326620 Bytes =3D 7154.90 kB =3D 6.99 MB
| Load Address: 00000000
| Entry Point:  00000000
| mkimage: Can't open =
/build/linaro/build/build/tmp-glibc/deploy/images/genericarmv8/linaro-imag=
e-minimal-initramfs-genericarmv8-20160523173835.rootfs.cpio.gz: No such =
file or directory

And I suspect this problem is better fixed with =
https://github.com/openembedded/openembedded-core/commit/85855af359c2c3bfc=
1eaa942c95f1f7d7cc6698e

>=20
> [YOCTO #9482]
>=20
> Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
> ---
> meta/classes/image.bbclass | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8bfd241..5d6f4a3 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -398,9 +398,13 @@ python () {
>                     # Create input image first.
>                     gen_conversion_cmds(type)
>                     localdata.setVar('type', type)
> -                    cmds.append("\t" + =
localdata.getVar("COMPRESS_CMD_" + ctype, True))
> +                    cmd =3D "\t" + localdata.getVar("COMPRESS_CMD_" + =
ctype, True)
> +                    if cmd not in cmds:
> +                        cmds.append(cmd)
>                     vardeps.add('COMPRESS_CMD_' + ctype)
> -                    subimages.append(type + "." + ctype)
> +                    subimage =3D type + "." + ctype
> +                    if subimage not in subimages:
> +                        subimages.append(subimage)
>                     if type not in alltypes:
>                         =
rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}"))
>=20
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20



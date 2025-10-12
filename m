Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB821CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 07:59:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.14975.1760255946647045945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 00:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EnxNZArf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88201C08CC6;
	Sun, 12 Oct 2025 07:58:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FF2F606C6;
	Sun, 12 Oct 2025 07:59:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18E22102F1BFD;
	Sun, 12 Oct 2025 09:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760255944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AE7aOaZ4EN07fy2rddoaJ8wGUQGfiKWDwuV/to08vwY=;
	b=EnxNZArfnKBBy/bysSkW9YNQnzY2Y2tZldW4bmbPOQknctdr3jITlvszNnIHrgIFgxyVnT
	oUsSXt1SfC7nwoCF0hXJoelNXE+CoWF3xkwzRGpBpuN0UsS+WMyZUcUAhYGigMQ1BTxM3q
	ZC+JDMYJivNEoiRX2D/RLYlFn/tpBffj0GSDiqwHL/nvHQ7MQ5btY0YMJCtL1o+cC0s6sb
	OrMsmwUoo8g9nq4uq4zmc+E2CG4kBg9khNaj7Modabs+0EAJb+hU42HU0g1r8hxd5Zskwc
	7ZhkNtqnCsY7IJtcYDnk9QKyAzaLnekQJjSqIXMt2Elu+2V8+mXKAtFSje+DKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Oct 2025 09:58:56 +0200
Message-Id: <DDG6NHU3783G.1S9MK3XL1X71V@bootlin.com>
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <kavinaya@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] kernel-fit-image: allow extending
 compatible string property for DTBs
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 07:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224728

On Sat Oct 11, 2025 at 11:48 AM CEST, Kavinaya S via lists.openembedded.org=
 wrote:
> The Linux kernel allows multiple DTBs to share the same compatible string=
.
> For example:
> qcs6490-rb3gen2.dtb
> qcs6490-rb3gen2-vision-mezzanine.dtb
> qcs6490-rb3gen2-industrial-mezzanine.dtb
>
> All of these use the same base compatible string:
> compatible =3D "qcom,qcs6490-rb3gen2", "qcom,qcm6490";
>
> Since the latter two DTBs are overlays on top of the base DTB and do not
> modify platform properties, they retain the same compatible string.
>
> When these DTBs are bundled into a single fitImage, the bootloader cannot
> distinguish between them due to identical compatible strings.
>
> To address this, introduce a mechanism to extend the compatible string
> using a OE build variable:
> FIT_DTB_COMPATIBLE_EXTENTION[dtb_name] =3D "extension"
>
> This appends the extension to the first compatible string in the DTB,
> resulting in unique entries in the generated .its file. For example:
> FIT_DTB_COMPATIBLE_EXTENTION[qcs6490-rb3gen2-vision-mezzanine] =3D "visio=
n"
> FIT_DTB_COMPATIBLE_EXTENTION[qcs6490-rb3gen2-industrial-mezzanine] =3D "i=
ndustrial"
>
> Generates:
> compatible =3D "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";
> compatible =3D "qcom,qcs6490-rb3gen2-industrial", "qcom,qcm6490";
>
> Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
> Suggested-By: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---

Hi Kavinaya,

Thanks for the new version.

It looks like this is breaking some selftest:

AssertionError: 'ti,am335x-bone-green-subtypeA' not found in '/dts-v1/;\n\n=
/ {\n        description =3D "Kernel fitImage for Poky (Yocto Project Refer=
ence Distro)/1.0/beaglebone-yocto";\n        #address-cells =3D <1>;\n     =
   images {\n                kernel-1 {\n                        descriptio=
n =3D "Linux kernel";\n                        type =3D "kernel";\n        =
                compression =3D "none";\n                        data =3D /=
incbin/("linux.bin");\n                        arch =3D "arm";\n           =
             os =3D "linux";\n                        load =3D <0x20008000>=
;\n                        entry =3D <0x20008000>;\n                       =
 hash-1 {\n                                algo =3D "sha256";\n            =
            };\n                };\n                fdt-am335x-bone.dtb {\n=
                        description =3D "Flattened Device Tree blob";\n    =
                    type =3D "flat_dt";\n                        compressio=
n =3D "none";\n                        data =3D /incbin/("am335x-bone.dtb")=
;\n                        arch =3D "arm";\n                        hash-1 =
{\n                                algo =3D "sha256";\n                    =
    };\n                };\n                fdt-am335x-boneblack.dtb {\n   =
                     description =3D "Flattened Device Tree blob";\n       =
                 type =3D "flat_dt";\n                        compression =
=3D "none";\n                        data =3D /incbin/("am335x-boneblack.dt=
b");\n                        arch =3D "arm";\n                        hash=
-1 {\n                                algo =3D "sha256";\n                 =
       };\n                };\n                fdt-am335x-bonegreen.dtb {\n=
                        description =3D "Flattened Device Tree blob";\n    =
                    type =3D "flat_dt";\n                        compressio=
n =3D "none";\n                        data =3D /incbin/("am335x-bonegreen.=
dtb");\n                        arch =3D "arm";\n                        ha=
sh-1 {\n                                algo =3D "sha256";\n               =
         };\n                };\n        };\n        configurations {\n    =
            default =3D "conf-am335x-bone.dtb";\n                conf-am335=
x-bone.dtb {\n                        description =3D "1 Linux kernel, FDT =
blob";\n                        kernel =3D "kernel-1";\n                   =
     fdt =3D "fdt-am335x-bone.dtb";\n                        hash-1 {\n    =
                            algo =3D "sha256";\n                        };\=
n                };\n                conf-am335x-boneblack.dtb {\n         =
               description =3D "0 Linux kernel, FDT blob";\n               =
         kernel =3D "kernel-1";\n                        fdt =3D "fdt-am335=
x-boneblack.dtb";\n                        hash-1 {\n                      =
          algo =3D "sha256";\n                        };\n                }=
;\n                conf-am335x-bonegreen.dtb {\n                        des=
cription =3D "0 Linux kernel, FDT blob";\n                        kernel =
=3D "kernel-1";\n                        fdt =3D "fdt-am335x-bonegreen.dtb"=
;\n                        hash-1 {\n                                algo =
=3D "sha256";\n                        };\n                };\n        };\n=
};\n'
...
2025-10-11 15:18:18,764 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fitimage_compatible_extn_in_its (subunit.RemotedTestCase)
2025-10-11 15:18:18,771 - oe-selftest - INFO -  ... FAIL

Can you have a look at this failure, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126E5CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:30:45 +0000 (UTC)
Subject: Re: [PATCH 1/2] kernel-fitimage: add support for custom ITS file override
To: openembedded-core@lists.openembedded.org
From: kavinaya@qti.qualcomm.com
X-Originating-Location: Mumbai, Maharashtra, IN (163.116.213.93)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 01:30:38 -0700
References: <809c00d00ea6231c966cecd56a8dfca39f68a02c.camel@siemens.com>
In-Reply-To: <809c00d00ea6231c966cecd56a8dfca39f68a02c.camel@siemens.com>
Message-ID: <3586.1758702638415588291@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223954

On Tue, Sep 23, 2025 at 02:28 AM, Adrian Freihofer wrote:

>
> Could you clarify the specific need for this custom ITS file? Perhaps
> the desired outcome could be achieved by leveraging the existing
> KERNEL_DEVICETREE_* variables without needing to introduce a separate
> custom file that overrides the generated one.
>=20
> I would like to understand:
> * What specific limitations or requirements does the generated ITS
> file not meet for your use case?
> * Could you share an example of how your custom ITS file differs from
> what's generated?
>
Hi Adrian,

1.The compatible string format required by our UEFI implementation is diffe=
rent from what dynamic generation allows. The format we rely on is:
   compatible =3D "qcom,<SoC>[-<soc_version>][-<foundry_id>]-<board>[/<subt=
ype>][-<pmic>][-<board_version>]"
   This structure enables precise identification of the appropriate DTB for=
 each board variant.

2.As in the upstream kernel Makefile for QCOM platforms (https://git.kernel=
.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/q=
com/Makefile ), overlays are used to generate composite DTBs:
=20
   dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2.dtb
   qcs6490-rb3gen2-vision-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs6490-r=
b3gen2-vision-mezzanine.dtbo
   qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs64=
90-rb3gen2-industrial-mezzanine.dtbo

   In the above cases, the base DTB remains the same, but the overlays diff=
er. Without manual .its file support, we cannot assign unique compatible st=
rings to these variants.

The ITS file generated dynamically will look like:
             configurations {
                default =3D "conf-qcs6490-rb3gen2.dtb";
                conf-qcs6490-rb3gen2.dtb {
                        description =3D "1 Linux kernel, FDT blob";
                        kernel =3D "kernel-1";
                        fdt =3D "fdt-qcs6490-rb3gen2.dtb";
                        compatible =3D "qcom,qcs6490-rb3gen2", "qcom,qcm649=
0";
                        hash-1 {
                                algo =3D "sha256";
                        };
                };
                conf-qcs6490-rb3gen2-vision-mezzanine.dtb {
                        description =3D "0 Linux kernel, FDT blob";
                        kernel =3D "kernel-1";
                        fdt =3D "fdt-qcs6490-rb3gen2-vision-mezzanine.dtb";
                        compatible =3D "qcom,qcs6490-rb3gen2", "qcom,qcm649=
0";
                        hash-1 {
                                algo =3D "sha256";
                        };
                };
                conf-qcs6490-rb3gen2-industrial-mezzanine.dtb {
                        description =3D "0 Linux kernel, FDT blob";
                        kernel =3D "kernel-1";
                        fdt =3D "fdt-qcs6490-rb3gen2-industrial-mezzanine.d=
tb";
                        compatible =3D "qcom,qcs6490-rb3gen2", "qcom,qcm649=
0";
                        hash-1 {
                                algo =3D "sha256";
                };
               };




The ITS file that would meet our requirements will look like:
        configurations {
                default =3D "conf-qcs6490-rb3gen2.dtb";
                conf-qcs6490-rb3gen2.dtb {
                        description =3D "1 Linux kernel, FDT blob";
                        kernel =3D "kernel-1";
                        fdt =3D "fdt-qcs6490-rb3gen2.dtb";
                        compatible =3D "qcom,qcs6490-rb3gen2", "qcom,qcm649=
0";
                        hash-1 {
                                algo =3D "sha256";
                        };
                };
                conf-qcs6490-rb3gen2-vision-mezzanine.dtb {
                        description =3D "0 Linux kernel, FDT blob";
                        kernel =3D "kernel-1";
                        fdt =3D "fdt-qcs6490-rb3gen2-vision-mezzanine.dtb";
                        compatible =3D "qcom,qcs6490-rb-subtype5";
                        hash-1 {
                                algo =3D "sha256";
                        };
                };
                conf-qcs6490-rb3gen2-industrial-mezzanine.dtb {
                        description =3D "0 Linux kernel, FDT blob";
                        kernel =3D "kernel-1";
                        fdt =3D "fdt-qcs6490-rb3gen2-industrial-mezzanine.d=
tb";
                        compatible =3D "qcom,qcs6490-rb-subtype2";
                        hash-1 {
                                algo =3D "sha256";
                };
               };
Please look into the difference in the compatible string in both cases.

Thanks,
Kavinaya



Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590E1CCA468
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:54:43 +0000 (UTC)
Subject: Re: [PATCH v3 0/1] Add support for custom compatible string via optional parameter
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.105)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 09:54:38 -0700
References: <CAA_5yos1jzc55U=Ct4NSt9B+Mf_ES8yx0YKSrSYu9N94oTHc2w@mail.gmail.com>
In-Reply-To: <CAA_5yos1jzc55U=Ct4NSt9B+Mf_ES8yx0YKSrSYu9N94oTHc2w@mail.gmail.com>
Message-ID: <22989.1759164878731751541@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224157

Hi Ricardo,

I=E2=80=99ve implemented this change by adding a custom compatible string f=
or one specific DTB in my machine.conf:
FIT_DTB_COMPATIBLE_OVERRIDE:qcs6490-rb3gen2-vision-mezzanine.dtb =3D "qcom,=
qcs6490-rb-subtype5"

For qcs6490-rb3gen2.dtb, I have not defined any override, so it continues t=
o use the compatible string extracted from the DTB itself.
As a result, the ITS configuration section looks like this:
configurations {
    default =3D "conf-qcs6490-rb3gen2.dtb";
    conf-qcs6490-rb3gen2.dtb {
        description =3D "1 Linux kernel, FDT blob";
        kernel =3D "kernel-1";
        fdt =3D "fdt-qcs6490-rb3gen2.dtb";
        compatible =3D "qcom,qcs6490-rb3gen2", "qcom,qcm6490";
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
}

This demonstrates how the override works:

If an override is defined in machine.conf, the FIT generator uses that valu=
e.
If no override is provided, it falls back to the compatible string from the=
 DTB.

Thanks,
Kavinaya



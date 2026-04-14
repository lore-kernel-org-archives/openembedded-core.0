Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D0EF9D0FB
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 21:49:43 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5796.1776203376475086159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 14:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KI6efDjp;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-671c24f23b1so2977988a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 14:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776203375; cv=none;
        d=google.com; s=arc-20240605;
        b=YfVbRLmuipcUkpqBj0TWf+ezyNFMO9N6IrVcCFdDApYbcsC8U8ddAaXfmx3d9fZlEe
         svVeTyxTbPi7OKnRQ5G18OQ1tveY6w9WeCxcqj/S3Iyr0LMLJ3J63ihv6X4VeAm2nb+H
         zaw8lKTnpeF3ZwRM70nUPrmcaTFnQ/eFu+DMW2DVV/b7F881/7Vu1+1mfLq0+c/VHz7C
         ak34QvK4gIbE/ShbxaBokg7bcpdWTKwGU2Ha+NKPaUySEiWp9Qzi8Iq7BV3MnEFt7R8/
         92zTd32CWx9O8iJZUK/73j3HJuL7XpLnBo/Lc0AexujRgrrb6xJxs3CqA9WIWV811kG5
         TyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHzrFbEs/ZnAUxL6E3+i0V6A1YXwHwkQPRjuYS3pOcg=;
        fh=AujHAA+8rCASy2VxaCSqjvdHUY6GU9XME1EUKrsJIKA=;
        b=eH8etpJ4URvt3k3nyXhseZVNaMKxXGo4aBSY0v15njjAXHYeX5nvNVKQfLiQlENdl0
         6HDNfzvRtqJtHR5uxZerqloPHlubmmyjXc0+Hdqju4zhl7k1Hfx6LyZ6KTPkK6ZcpWwT
         wFsJZlpzRVt1ZrmTpX9xKNxe4noipcbKoSHUefbyNblgnMIeRLuRkqJItGJgJ8/3ayY5
         eXQYYxTE1kjMm1MobACRTXNzCXu/22y9U+PPsOIENwmY8LZ2RpIMLC5N1gNrMdu7LQGU
         7ZqiMoplkyAyWkX6r8V/UvLXRhImEI4dRz6zRPUv9JdGQhqkDoSWqbCjFLrOCauy8kga
         wS4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776203375; x=1776808175; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHzrFbEs/ZnAUxL6E3+i0V6A1YXwHwkQPRjuYS3pOcg=;
        b=KI6efDjpoTFPo+IASN+zajIOuZPBmgTRM9k2V4z7ZEHjyw2rkVI9+DQsAWVC62H9+w
         Cszc7TwmUka/mFmbkpg2mKWRJ01w9S1DWdnG2k4/KC45De/jNtwAGLqPZhZes5zBLXRb
         I51CCkHDL2pbWflowBDWgueLEi2CMo8Hp7dLALIQxJAhPrtB9/4gBRl6cfw2QX3KyCVT
         VEZzpnVFHaU9GObKw9W+69V47c+QG9uLvjEqZdo13NzcEvBzypQNvH94TExbvpjwagK7
         aL/1/umST1Bo/3TPjYtSz2x8n6C2TkZ6XayNGibLiCY5yYNerEzQxj8paJZB576jykj2
         oWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776203375; x=1776808175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHzrFbEs/ZnAUxL6E3+i0V6A1YXwHwkQPRjuYS3pOcg=;
        b=reNosWh/JJXdqdc2pLR0fhGYjcUSMTxssXyMqQRi0Fvor10x01llVj4/O61fKgh780
         tSXCpQ4tJNzijlez70NtnXCxNr/6kSSrqc4rM7rZJ9PiycFGDQa0sYwFFZhStcXeMxP7
         dRI4nusXqeimWRLvtjlyd4TSrUbVXWQG2YpUsk/yj/obFYaWWiu9z93DwH9DddCmpsS4
         2kC1tqGPwQziU6hkdqM/YMBa5NYF6wFjZ3Cy/1W8MsQel93eLtOPcaPSlOMCdYWiY70l
         XLLZZ2cJ/XW7JJARbMkGmJPsWH6fWYASu0vp7Z3I3MSx+QN6OtfqIE/KGEnhkD1hCUPj
         5qqQ==
X-Gm-Message-State: AOJu0YxE4BRa2TnuL6wSpjhEszG0qnN3iEOc1xKAuM3Cf0wj1v8CoQkV
	MbFTG0/5Ivhb/wlcMTn3uWhDvK3qy0tWfIwgFamhkzLRPlxzxZeLO80WPCuwxI8Z8PKMNwpjgDP
	pAEmjPLWmqT2uoQvmnn4KZ4aPt6ipxnY=
X-Gm-Gg: AeBDieuy5h+XAmGjL6+XXthAaiqkkQ0srLk9phbxM9QTroSCjK9S5Vkcq5SlhetVoK0
	z7gq3Ym4hSJ7GSrYW0rV9D4v0ijkDp5FdnruvmSrPKFdfUl4s10eyQVNgO84azqfJ9Kp/0Tipcx
	32O8tQSioNjrIToLlnihyZj5G2QxpeOzHwhYBK2fL6wWrp33DgInyF9PQGq/pyB0gP204dqCzHx
	NWjhFujqy7LYDXiAdbt2BPvWDJNLTjk4UbywsD5/LuvtXGcu7Ia8gvH+mbUfHpRJxhCP0OXvMzt
	Co4zqZ5TO/ZnIT5/a2bQG/1xmj3OvE4qeR4o0Xdj/gwtSVFqO9Fm0wisUT050Nj2Z605c14MpWx
	3WAti
X-Received: by 2002:a17:907:25cc:b0:b9c:aae6:907e with SMTP id
 a640c23a62f3a-b9d7260da0emr1080807066b.13.1776203374384; Tue, 14 Apr 2026
 14:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260413192730.3533490-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20260413192730.3533490-1-vpuar@qti.qualcomm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 14 Apr 2026 22:49:21 +0100
X-Gm-Features: AQROBzBNMUv321e6-EFDWe1ylNHsLUSnOB_WRiuSiRsbTPh_oJE_RcFE0OynwYg
Message-ID: <CANPvuRkmj230bj4XFF=0nop1RNp_c5u=Nf+NCv5nRdCt6TY4WQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: upgrade 20260309 -> 20260410
To: vpuar@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000002ddafa064f72934f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 21:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235173

--0000000000002ddafa064f72934f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vivek

Vivek Puar via lists.openembedded.org <vpuar=3D
qti.qualcomm.com@lists.openembedded.org> escreveu (segunda, 13/04/2026 =C3=
=A0(s)
20:27):

> Upgrade the firmware package to latest release. Add qupv3fw
> firmware for qcs615 and shikra, add adreno, audio and compute
> package for DELL XPS13 9345, add audioreach firmware for Glymur
> and arduno monza, add ISH firmware for Intel Wildcat Lake platform,
>

Just a minor missing 'i' in arduino.

Jose


> add lenovo ish firmware for X9-15 2025, X1 Carbon (Gen 14) and
> X1 2-in-1 (Gen 11).
>
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260309.bb =3D> linux-firmware_20260410.bb} | 59 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 9 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260309.bb =
=3D>
> linux-firmware_20260410.bb} (98%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.b=
b
> b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
> similarity index 98%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
> index 42681a879f..54c2c45261 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
> @@ -314,7 +314,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  =3D "772c8667ff568e7de3a7794fd420f2f7"
> +WHENCE_CHKSUM  =3D "1468492365c9cec2e7ebf71c79d2e8f5"
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -452,7 +452,7 @@ SRC_URI:class-devupstream =3D "git://
> git.kernel.org/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?=3D "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>
> -SRC_URI[sha256sum] =3D
> "c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c"
> +SRC_URI[sha256sum] =3D
> "b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178"
>
>  inherit allarch
>
> @@ -720,8 +720,9 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license
> ${PN}-amphion-vpu \
>               ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio
> ${PN}-qcom-qcm2290-modem \
>               ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio
> ${PN}-qcom-qcm6490-compute \
>               ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi
> ${PN}-qcom-qcm6490-qupv3fw \
> -             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio
> ${PN}-qcom-qcs615-compute \
> +             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio
> ${PN}-qcom-qcs615-compute ${PN}-qcom-qcs615-qupv3fw \
>               ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio
> ${PN}-qcom-qcs6490-radxa-dragon-q6a-compute \
> +             ${PN}-qcom-shikra-qupv3fw \
>               ${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio \
>               ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio
> ${PN}-qcom-qcs8300-compute \
>               ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3f=
w
> \
> @@ -751,7 +752,10 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license
> ${PN}-amphion-vpu \
>               ${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg \
>               ${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg \
>               ${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg \
> +             ${PN}-qcom-x1e80100-dell-xps13-9345-adreno \
> +             ${PN}-qcom-x1e80100-dell-xps13-9345-audio \
>               ${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg \
> +             ${PN}-qcom-x1e80100-dell-xps13-9345-compute \
>               ${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg \
>               ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio
> ${PN}-qcom-x1e80100-compute \
>               ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno
> ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
> @@ -773,8 +777,8 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license
> ${PN}-amphion-vpu \
>               ${PN}-intel-license ${PN}-ish-lnlm \
>               ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8
> ${PN}-ish-ptl-39ceeaf8 \
>               ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
> -             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad \
> -             ${PN}-ish-ptl \
> +             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad
> ${PN}-ish-ptl-53c4ffad \
> +             ${PN}-ish-ptl ${PN}-ish-wcl \
>               ${PN}-advansys-license ${PN}-advansys \
>               ${PN}-aeonsemi-license ${PN}-as21xxx \
>               ${PN}-agere-license ${PN}-orinoco \
> @@ -2330,7 +2334,7 @@ LICENSE:${PN}-qcom-apq8096-audio =3D "Firmware-qcom=
"
>  LICENSE:${PN}-qcom-apq8096-adreno =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-apq8096-modem =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-glymur-adreno =3D "Firmware-qcom"
> -LICENSE:${PN}-qcom-glymur-audio =3D "Firmware-qcom-2"
> +LICENSE:${PN}-qcom-glymur-audio =3D "Firmware-qcom-2 & Firmware-linaro"
>  LICENSE:${PN}-qcom-glymur-compute =3D "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-kaanapali-adreno =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-kaanapali-audio =3D "Firmware-qcom-2 & Firmware-linar=
o"
> @@ -2349,8 +2353,10 @@ LICENSE:${PN}-qcom-qcm6490-qupv3fw =3D "Firmware-q=
com"
>  LICENSE:${PN}-qcom-qcs615-adreno =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs615-audio =3D "Firmware-qcom & Firmware-linaro"
>  LICENSE:${PN}-qcom-qcs615-compute =3D "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcs615-qupv3fw =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D "Firmware-qcom &
> Firmware-linaro"
>  LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D "Firmware-qcom"
> +LICENSE:${PN}-qcom-shikra-qupv3fw =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio =3D "Firmware-qcom=
 &
> Firmware-linaro"
>  LICENSE:${PN}-qcom-qcs8300-adreno =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs8300-audio =3D "Firmware-qcom-2 & Firmware-linaro"
> @@ -2402,7 +2408,10 @@
> LICENSE:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg =3D "Firmware-li=
naro"
>  LICENSE:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg =3D
> "Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg =3D
> "Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg =3D
> "Firmware-linaro"
> +LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D "Firmware-dell"
> +LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio =3D "Firmware-dell"
>  LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg =3D "Firmware-lin=
aro"
> +LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D "Firmware-dell"
>  LICENSE:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg =3D "Firmware-lin=
aro"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno =3D "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio =3D "Firmware-qcom &
> Firmware-linaro"
> @@ -2458,7 +2467,10 @@ FILES:${PN}-qcom-apq8096-adreno =3D
> "${nonarch_base_libdir}/firmware/qcom/apq8096/
>  FILES:${PN}-qcom-apq8096-audio =3D
> "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
>  FILES:${PN}-qcom-apq8096-modem =3D
> "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn*
> ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.*
> ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
>  FILES:${PN}-qcom-glymur-adreno =3D
> "${nonarch_base_libdir}/firmware/qcom/glymur/gen80100_zap.mbn*"
> -FILES:${PN}-qcom-glymur-audio =3D
> "${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.*"
> +FILES:${PN}-qcom-glymur-audio =3D " \
> +    ${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.* \
> +    ${nonarch_base_libdir}/firmware/qcom/glymur/GLYMUR-CRD-tplg.bin* \
> +"
>  FILES:${PN}-qcom-glymur-compute =3D
> "${nonarch_base_libdir}/firmware/qcom/glymur/cdsp*.*"
>  FILES:${PN}-qcom-kaanapali-adreno =3D
> "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
>  FILES:${PN}-qcom-kaanapali-audio =3D " \
> @@ -2485,6 +2497,7 @@ FILES:${PN}-qcom-qcm6490-qupv3fw =3D
> "${nonarch_base_libdir}/firmware/qcom/qc[ms]6
>  FILES:${PN}-qcom-qcs615-adreno =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
>  FILES:${PN}-qcom-qcs615-audio =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.*
> ${nonarch_base_libdir}/firmware/qcom/qcs615/TALOS-EVK-tplg.bin*"
>  FILES:${PN}-qcom-qcs615-compute =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
> +FILES:${PN}-qcom-qcs615-qupv3fw =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs615/qupv3fw.elf*"
>  FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D " \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.=
*
> \
>
>  ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Ra=
dxa-Dragon-Q6A-tplg.bin*\
> @@ -2493,13 +2506,18 @@ FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =
=3D
> " \
>  FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D " \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp*.=
*
> \
>  "
> +FILES:${PN}-qcom-shikra-qupv3fw =3D
> "${nonarch_base_libdir}/firmware/qcom/shikra/qupv3fw.elf*"
>  FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio =3D " \
>
>  ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.=
* \
>
>  ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/QCS649=
0-Thundercomm-RubikPi3-tplg.bin*
> \
>
>  ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Thundercomm-RubikPi=
3-tplg.bin*
> \
>  "
>  FILES:${PN}-qcom-qcs8300-adreno =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
> -FILES:${PN}-qcom-qcs8300-audio =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*
> ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
> +FILES:${PN}-qcom-qcs8300-audio =3D " \
> +    ${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* \
> +    ${nonarch_base_libdir}/firmware/qcom/qcs8300/arduino-monza-tplg.bin*=
 \
> +    ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin* \
> +"
>  FILES:${PN}-qcom-qcs8300-compute =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
>  FILES:${PN}-qcom-qcs8300-generalpurpose =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
>  FILES:${PN}-qcom-qcs8300-qupv3fw =3D
> "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
> @@ -2577,10 +2595,16 @@
> FILES:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg =3D " \
>
>  ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/latitude-7455/X1E8010=
0-Dell-Latitude-7455-tplg.bin*
> \
>
>  ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-Latitude-745=
5-tplg.bin*
> \
>  "
> +FILES:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D
> "${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/qcdxkmsuc8=
380.mbn*"
> +FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio =3D " \
> +
> ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*adsp*.* \
> +
> ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/battmgr.jsn=
* \
> +"
>  FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg =3D " \
>
>  ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/X1E80100-D=
ell-XPS-13-9345-tplg.bin*
> \
>
>  ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-XPS-13-9345-=
tplg.bin*
> \
>  "
> +FILES:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D
> "${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*cdsp*.*"
>  FILES:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg =3D " \
>
>  ${nonarch_base_libdir}/firmware/qcom/x1e80100/hp/omnibook-x14/X1E80100-H=
P-OMNIBOOK-X14-tplg.bin*
> \
>
>  ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-HP-OMNIBOOK-X14-t=
plg.bin*
> \
> @@ -2631,7 +2655,7 @@ RDEPENDS:${PN}-qcom-apq8096-adreno =3D
> "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-apq8096-audio =3D "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-apq8096-modem =3D "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-glymur-adreno =3D "${PN}-qcom-license"
> -RDEPENDS:${PN}-qcom-glymur-audio =3D "${PN}-qcom-2-license"
> +RDEPENDS:${PN}-qcom-glymur-audio =3D "${PN}-qcom-2-license
> ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-glymur-compute =3D "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-kaanapali-adreno =3D "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-kaanapali-audio =3D "${PN}-qcom-2-license
> ${PN}-linaro-license"
> @@ -2654,8 +2678,10 @@ RDEPENDS:${PN}-qcom-qcm6490-qupv3fw =3D
> "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs615-adreno =3D "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs615-audio =3D "${PN}-qcom-license
> ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-qcs615-compute =3D "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcs615-qupv3fw =3D "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D "${PN}-qcom-licen=
se
> ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D
> "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-shikra-qupv3fw =3D "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio =3D
> "${PN}-qcom-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-qcs8300-adreno =3D "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs8300-audio =3D "${PN}-qcom-2-license
> ${PN}-linaro-license"
> @@ -2709,7 +2735,10 @@
> RDEPENDS:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg =3D
> "${PN}-linaro-licens
>  RDEPENDS:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg =3D
> "${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg =3D
> "${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg =3D
> "${PN}-linaro-license"
> +RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D "${PN}-dell-lice=
nse"
> +RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio =3D "${PN}-dell-licen=
se"
>  RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg =3D
> "${PN}-linaro-license"
> +RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D
> "${PN}-dell-license"
>  RDEPENDS:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg =3D
> "${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno =3D "${PN}-qcom-licen=
se"
>  RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio =3D "${PN}-qcom-licens=
e
> ${PN}-linaro-license"
> @@ -2801,14 +2830,26 @@ LICENSE:${PN}-ish-lnlm-53c4ffad =3D "Firmware-len=
ovo"
>  FILES:${PN}-ish-lnlm-53c4ffad =3D "\
>      ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_*.bin* \
>
>  ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X1_2025_5.8.4=
.7720.bin*
> \
> +
> ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_x9-15_2025_5.8=
.0.7720.bin*
> \
>
>  ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.=
8.36.09092.bin*
> \
>  "
>  RDEPENDS:${PN}-ish-lnlm-53c4ffad =3D "${PN}-lenovo-license"
>
> +LICENSE:${PN}-ish-ptl-53c4ffad =3D "Firmware-lenovo"
> +FILES:${PN}-ish-ptl-53c4ffad =3D "\
> +    ${nonarch_base_libdir}/firmware/intel/ish/ish_ptl_53c4ffad_*.bin* \
> +
> ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7=
782.bin*
> \
> +"
> +RDEPENDS:${PN}-ish-ptl-53c4ffad =3D "${PN}-lenovo-license"
> +
>  LICENSE:${PN}-ish-ptl =3D "Firmware-intel"
>  FILES:${PN}-ish-ptl =3D
> "${nonarch_base_libdir}/firmware/intel/ish/ish_ptl.bin*"
>  RDEPENDS:${PN}-ish-ptl =3D "${PN}-intel-license"
>
> +LICENSE:${PN}-ish-wcl =3D "Firmware-intel"
> +FILES:${PN}-ish-wcl =3D
> "${nonarch_base_libdir}/firmware/intel/ish/ish_wcl.bin*"
> +RDEPENDS:${PN}-ish-wcl =3D "${PN}-intel-license"
> +
>  # For advansys - AdvanSys SCSI
>  LICENSE:${PN}-advansys-license =3D "Firmware-advansys"
>  FILES:${PN}-advansys-license =3D
> "${nonarch_base_libdir}/firmware/LICENCE.advansys"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235119):
> https://lists.openembedded.org/g/openembedded-core/message/235119
> Mute This Topic: https://lists.openembedded.org/mt/118811193/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002ddafa064f72934f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Vivek</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">Vivek Puar via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;vpuar=3D<=
a href=3D"mailto:qti.qualcomm.com@lists.openembedded.org">qti.qualcomm.com@=
lists.openembedded.org</a>&gt; escreveu (segunda, 13/04/2026 =C3=A0(s) 20:2=
7):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade the =
firmware package to latest release. Add qupv3fw<br>
firmware for qcs615 and shikra, add adreno, audio and compute<br>
package for DELL XPS13 9345, add audioreach firmware for Glymur<br>
and arduno monza, add ISH firmware for Intel Wildcat Lake platform,<br></bl=
ockquote><div><br></div><div>Just a minor missing &#39;i&#39; in arduino.<b=
r><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
add lenovo ish firmware for X9-15 2025, X1 Carbon (Gen 14) and<br>
X1 2-in-1 (Gen 11).<br>
<br>
Signed-off-by: Vivek Puar &lt;<a href=3D"mailto:vpuar@qti.qualcomm.com" tar=
get=3D"_blank">vpuar@qti.qualcomm.com</a>&gt;<br>
Cc: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.co=
m" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://20260309.bb" rel=3D"noreferrer" target=3D"_blank=
">20260309.bb</a> =3D&gt; <a href=3D"http://linux-firmware_20260410.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-firmware_20260410.bb</a>} | 59 ++++=
++++++++++++---<br>
=C2=A01 file changed, 50 insertions(+), 9 deletions(-)<br>
=C2=A0rename meta/recipes-kernel/linux-firmware/{<a href=3D"http://linux-fi=
rmware_20260309.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202=
60309.bb</a> =3D&gt; <a href=3D"http://linux-firmware_20260410.bb" rel=3D"n=
oreferrer" target=3D"_blank">linux-firmware_20260410.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_20260309.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_2026=
0309.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fi=
rmware_20260410.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202=
60410.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firm=
ware_20260309.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20260=
309.bb</a><br>
rename to meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmwa=
re_20260410.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_2026041=
0.bb</a><br>
index 42681a879f..54c2c45261 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0260309.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20260309.bb=
</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0260410.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20260410.bb=
</a><br>
@@ -314,7 +314,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;md5=3D=
b5ee3f410780e56711ad48eadc22b8bc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
=C2=A0# WHENCE checksum is defined separately to ease overriding it if<br>
=C2=A0# class-devupstream is selected.<br>
-WHENCE_CHKSUM=C2=A0 =3D &quot;772c8667ff568e7de3a7794fd420f2f7&quot;<br>
+WHENCE_CHKSUM=C2=A0 =3D &quot;1468492365c9cec2e7ebf71c79d2e8f5&quot;<br>
<br>
=C2=A0# These are not common licenses, set NO_GENERIC_LICENSE for them<br>
=C2=A0# so that the license files will be copied from fetched source<br>
@@ -452,7 +452,7 @@ SRC_URI:class-devupstream =3D &quot;git://<a href=3D"ht=
tp://git.kernel.org/pub/scm/linux/kernel/git/firmw" rel=3D"noreferrer" targ=
et=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/firmw</a><br>
=C2=A0# Pin this to the 20220509 release, override this in local.conf<br>
=C2=A0SRCREV:class-devupstream ?=3D &quot;b19cbdca78ab2adfd210c91be15a22568=
e8b8cae&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7=
ba34fbca9928e07a96c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46c=
a60478a4ebf02f1e178&quot;<br>
<br>
=C2=A0inherit allarch<br>
<br>
@@ -720,8 +720,9 @@ PACKAGES =3D+ &quot;${PN}-amphion-vpu-license ${PN}-amp=
hion-vpu \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-qcm2290-adreno =
${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-qcm6490-adreno =
${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-qcm6490-ipa ${P=
N}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-qcs615-adreno $=
{PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-qcs615-adreno $=
{PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute ${PN}-qcom-qcs615-qupv3fw =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-qcs6490-radxa-d=
ragon-q6a-audio ${PN}-qcom-qcs6490-radxa-dragon-q6a-compute \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-shikra-qupv3fw =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-qcs6490-thunder=
comm-rubikpi3-audio \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-qcs8300-adreno =
${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-qcs8300-general=
purpose ${PN}-qcom-qcs8300-qupv3fw \<br>
@@ -751,7 +752,10 @@ PACKAGES =3D+ &quot;${PN}-amphion-vpu-license ${PN}-am=
phion-vpu \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-x1e80100-asus-z=
enbook-a14-audio-tplg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-x1e80100-dell-i=
nspiron-14-plus-7441-audio-tplg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-x1e80100-dell-l=
atitude-7455-audio-tplg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-x1e80100-dell-x=
ps13-9345-adreno \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-x1e80100-dell-x=
ps13-9345-audio \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-x1e80100-dell-x=
ps13-9345-audio-tplg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-x1e80100-dell-x=
ps13-9345-compute \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-x1e80100-hp-omn=
ibook-x14-audio-tplg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-x1e80100-adreno=
 ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-x1e80100-lenovo=
-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \<br>
@@ -773,8 +777,8 @@ PACKAGES =3D+ &quot;${PN}-amphion-vpu-license ${PN}-amp=
hion-vpu \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-intel-license ${PN}-=
ish-lnlm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-dell-license ${PN}-i=
sh-lnlm-39ceeaf8 ${PN}-ish-ptl-39ceeaf8 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-hp-license ${PN}-ish=
-lnlm-12128606 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-lenovo-license ${PN}=
-ish-lnlm-53c4ffad \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-ish-ptl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-lenovo-license ${PN}=
-ish-lnlm-53c4ffad=C2=A0 ${PN}-ish-ptl-53c4ffad \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-ish-ptl ${PN}-ish-wc=
l \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-advansys-license ${P=
N}-advansys \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-aeonsemi-license ${P=
N}-as21xxx \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-agere-license ${PN}-=
orinoco \<br>
@@ -2330,7 +2334,7 @@ LICENSE:${PN}-qcom-apq8096-audio =3D &quot;Firmware-q=
com&quot;<br>
=C2=A0LICENSE:${PN}-qcom-apq8096-adreno =3D &quot;Firmware-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-apq8096-modem =3D &quot;Firmware-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-glymur-adreno =3D &quot;Firmware-qcom&quot;<br>
-LICENSE:${PN}-qcom-glymur-audio =3D &quot;Firmware-qcom-2&quot;<br>
+LICENSE:${PN}-qcom-glymur-audio =3D &quot;Firmware-qcom-2 &amp; Firmware-l=
inaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-glymur-compute =3D &quot;Firmware-qcom-2&quot;<br>
=C2=A0LICENSE:${PN}-qcom-kaanapali-adreno =3D &quot;Firmware-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-kaanapali-audio =3D &quot;Firmware-qcom-2 &amp; Fi=
rmware-linaro&quot;<br>
@@ -2349,8 +2353,10 @@ LICENSE:${PN}-qcom-qcm6490-qupv3fw =3D &quot;Firmwar=
e-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs615-adreno =3D &quot;Firmware-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs615-audio =3D &quot;Firmware-qcom &amp; Firmwar=
e-linaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs615-compute =3D &quot;Firmware-qcom&quot;<br>
+LICENSE:${PN}-qcom-qcs615-qupv3fw =3D &quot;Firmware-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D &quot;Firmware-=
qcom &amp; Firmware-linaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D &quot;Firmwar=
e-qcom&quot;<br>
+LICENSE:${PN}-qcom-shikra-qupv3fw =3D &quot;Firmware-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio =3D &quot;Firmw=
are-qcom &amp; Firmware-linaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs8300-adreno =3D &quot;Firmware-qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-qcs8300-audio =3D &quot;Firmware-qcom-2 &amp; Firm=
ware-linaro&quot;<br>
@@ -2402,7 +2408,10 @@ LICENSE:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-=
tplg =3D &quot;Firmware-linaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg =3D &quot;Fir=
mware-linaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg =3D=
 &quot;Firmware-linaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg =3D &quot;F=
irmware-linaro&quot;<br>
+LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D &quot;Firmware-dell=
&quot;<br>
+LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio =3D &quot;Firmware-dell&=
quot;<br>
=C2=A0LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg =3D &quot;Firm=
ware-linaro&quot;<br>
+LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D &quot;Firmware-del=
l&quot;<br>
=C2=A0LICENSE:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg =3D &quot;Firm=
ware-linaro&quot;<br>
=C2=A0LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno =3D &quot;Firmware-=
qcom&quot;<br>
=C2=A0LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio =3D &quot;Firmware-q=
com &amp; Firmware-linaro&quot;<br>
@@ -2458,7 +2467,10 @@ FILES:${PN}-qcom-apq8096-adreno =3D &quot;${nonarch_=
base_libdir}/firmware/qcom/apq8096/<br>
=C2=A0FILES:${PN}-qcom-apq8096-audio =3D &quot;${nonarch_base_libdir}/firmw=
are/qcom/apq8096/adsp*.*&quot;<br>
=C2=A0FILES:${PN}-qcom-apq8096-modem =3D &quot;${nonarch_base_libdir}/firmw=
are/qcom/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/mode=
m*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*&quot;<br>
=C2=A0FILES:${PN}-qcom-glymur-adreno =3D &quot;${nonarch_base_libdir}/firmw=
are/qcom/glymur/gen80100_zap.mbn*&quot;<br>
-FILES:${PN}-qcom-glymur-audio =3D &quot;${nonarch_base_libdir}/firmware/qc=
om/glymur/adsp*.*&quot;<br>
+FILES:${PN}-qcom-glymur-audio =3D &quot; \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.* \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/qcom/glymur/GLYMUR-CRD-tplg.=
bin* \<br>
+&quot;<br>
=C2=A0FILES:${PN}-qcom-glymur-compute =3D &quot;${nonarch_base_libdir}/firm=
ware/qcom/glymur/cdsp*.*&quot;<br>
=C2=A0FILES:${PN}-qcom-kaanapali-adreno =3D &quot;${nonarch_base_libdir}/fi=
rmware/qcom/kaanapali/gen80200_zap.mbn*&quot;<br>
=C2=A0FILES:${PN}-qcom-kaanapali-audio =3D &quot; \<br>
@@ -2485,6 +2497,7 @@ FILES:${PN}-qcom-qcm6490-qupv3fw =3D &quot;${nonarch_=
base_libdir}/firmware/qcom/qc[ms]6<br>
=C2=A0FILES:${PN}-qcom-qcs615-adreno =3D &quot;${nonarch_base_libdir}/firmw=
are/qcom/qcs615/a612_zap.mbn*&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs615-audio =3D &quot;${nonarch_base_libdir}/firmwa=
re/qcom/qcs615/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs615/TALOS-EV=
K-tplg.bin*&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs615-compute =3D &quot;${nonarch_base_libdir}/firm=
ware/qcom/qcs615/cdsp*.*&quot;<br>
+FILES:${PN}-qcom-qcs615-qupv3fw =3D &quot;${nonarch_base_libdir}/firmware/=
qcom/qcs615/qupv3fw.elf*&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/drag=
on-q6a/adsp*.* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/drag=
on-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\<br>
@@ -2493,13 +2506,18 @@ FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D=
 &quot; \<br>
=C2=A0FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/drag=
on-q6a/cdsp*.* \<br>
=C2=A0&quot;<br>
+FILES:${PN}-qcom-shikra-qupv3fw =3D &quot;${nonarch_base_libdir}/firmware/=
qcom/shikra/qupv3fw.elf*&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercom=
m/RubikPi3/adsp*.* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercom=
m/RubikPi3/QCS6490-Thundercomm-RubikPi3-tplg.bin* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Th=
undercomm-RubikPi3-tplg.bin* \<br>
=C2=A0&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs8300-adreno =3D &quot;${nonarch_base_libdir}/firm=
ware/qcom/qcs8300/a623_zap.mbn*&quot;<br>
-FILES:${PN}-qcom-qcs8300-audio =3D &quot;${nonarch_base_libdir}/firmware/q=
com/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK=
-tplg.bin*&quot;<br>
+FILES:${PN}-qcom-qcs8300-audio =3D &quot; \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/qcom/qcs8300/arduino-monza-t=
plg.bin* \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg=
.bin* \<br>
+&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs8300-compute =3D &quot;${nonarch_base_libdir}/fir=
mware/qcom/qcs8300/cdsp*.*&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs8300-generalpurpose =3D &quot;${nonarch_base_libd=
ir}/firmware/qcom/qcs8300/gpdsp*.*&quot;<br>
=C2=A0FILES:${PN}-qcom-qcs8300-qupv3fw =3D &quot;${nonarch_base_libdir}/fir=
mware/qcom/qcs8300/qupv3fw.elf*&quot;<br>
@@ -2577,10 +2595,16 @@ FILES:${PN}-qcom-x1e80100-dell-latitude-7455-audio-=
tplg =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/lati=
tude-7455/X1E80100-Dell-Latitude-7455-tplg.bin* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-=
Dell-Latitude-7455-tplg.bin* \<br>
=C2=A0&quot;<br>
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D &quot;${nonarch_base_=
libdir}/firmware/qcom/x1e80100/dell/xps13-9345/qcdxkmsuc8380.mbn*&quot;<br>
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio =3D &quot; \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-934=
5/*adsp*.* \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-934=
5/battmgr.jsn* \<br>
+&quot;<br>
=C2=A0FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps1=
3-9345/X1E80100-Dell-XPS-13-9345-tplg.bin* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-=
Dell-XPS-13-9345-tplg.bin* \<br>
=C2=A0&quot;<br>
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D &quot;${nonarch_base=
_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*cdsp*.*&quot;<br>
=C2=A0FILES:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/x1e80100/hp/omnibo=
ok-x14/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-=
HP-OMNIBOOK-X14-tplg.bin* \<br>
@@ -2631,7 +2655,7 @@ RDEPENDS:${PN}-qcom-apq8096-adreno =3D &quot;${PN}-qc=
om-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-apq8096-audio =3D &quot;${PN}-qcom-license&quot;<=
br>
=C2=A0RDEPENDS:${PN}-qcom-apq8096-modem =3D &quot;${PN}-qcom-license&quot;<=
br>
=C2=A0RDEPENDS:${PN}-qcom-glymur-adreno =3D &quot;${PN}-qcom-license&quot;<=
br>
-RDEPENDS:${PN}-qcom-glymur-audio =3D &quot;${PN}-qcom-2-license&quot;<br>
+RDEPENDS:${PN}-qcom-glymur-audio =3D &quot;${PN}-qcom-2-license ${PN}-lina=
ro-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-glymur-compute =3D &quot;${PN}-qcom-2-license&quo=
t;<br>
=C2=A0RDEPENDS:${PN}-qcom-kaanapali-adreno =3D &quot;${PN}-qcom-license&quo=
t;<br>
=C2=A0RDEPENDS:${PN}-qcom-kaanapali-audio =3D &quot;${PN}-qcom-2-license ${=
PN}-linaro-license&quot;<br>
@@ -2654,8 +2678,10 @@ RDEPENDS:${PN}-qcom-qcm6490-qupv3fw =3D &quot;${PN}-=
qcom-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-qcs615-adreno =3D &quot;${PN}-qcom-license&quot;<=
br>
=C2=A0RDEPENDS:${PN}-qcom-qcs615-audio =3D &quot;${PN}-qcom-license ${PN}-l=
inaro-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-qcs615-compute =3D &quot;${PN}-qcom-license&quot;=
<br>
+RDEPENDS:${PN}-qcom-qcs615-qupv3fw =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D &quot;${PN}-qc=
om-license ${PN}-linaro-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D &quot;${PN}-=
qcom-license&quot;<br>
+RDEPENDS:${PN}-qcom-shikra-qupv3fw =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio =3D &quot;${PN=
}-qcom-license ${PN}-linaro-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-qcs8300-adreno =3D &quot;${PN}-qcom-license&quot;=
<br>
=C2=A0RDEPENDS:${PN}-qcom-qcs8300-audio =3D &quot;${PN}-qcom-2-license ${PN=
}-linaro-license&quot;<br>
@@ -2709,7 +2735,10 @@ RDEPENDS:${PN}-qcom-x1e80100-asus-vivobook-s15-audio=
-tplg =3D &quot;${PN}-linaro-licens<br>
=C2=A0RDEPENDS:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg =3D &quot;${=
PN}-linaro-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg =
=3D &quot;${PN}-linaro-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg =3D &quot;=
${PN}-linaro-license&quot;<br>
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D &quot;${PN}-dell-l=
icense&quot;<br>
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio =3D &quot;${PN}-dell-li=
cense&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg =3D &quot;${P=
N}-linaro-license&quot;<br>
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D &quot;${PN}-dell-=
license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg =3D &quot;${P=
N}-linaro-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno =3D &quot;${PN}-qc=
om-license&quot;<br>
=C2=A0RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio =3D &quot;${PN}-qco=
m-license ${PN}-linaro-license&quot;<br>
@@ -2801,14 +2830,26 @@ LICENSE:${PN}-ish-lnlm-53c4ffad =3D &quot;Firmware-=
lenovo&quot;<br>
=C2=A0FILES:${PN}-ish-lnlm-53c4ffad =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4=
ffad_*.bin* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_len=
ovo_X1_2025_5.8.4.7720.bin* \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_x=
9-15_2025_5.8.0.7720.bin* \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_len=
ovo_X9-14_2025_5.8.36.09092.bin* \<br>
=C2=A0&quot;<br>
=C2=A0RDEPENDS:${PN}-ish-lnlm-53c4ffad =3D &quot;${PN}-lenovo-license&quot;=
<br>
<br>
+LICENSE:${PN}-ish-ptl-53c4ffad =3D &quot;Firmware-lenovo&quot;<br>
+FILES:${PN}-ish-ptl-53c4ffad =3D &quot;\<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/intel/ish/ish_ptl_53c4ffad_*=
.bin* \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_ptl_lenovo_X1=
_2026_5.8.1.7782.bin* \<br>
+&quot;<br>
+RDEPENDS:${PN}-ish-ptl-53c4ffad =3D &quot;${PN}-lenovo-license&quot;<br>
+<br>
=C2=A0LICENSE:${PN}-ish-ptl =3D &quot;Firmware-intel&quot;<br>
=C2=A0FILES:${PN}-ish-ptl =3D &quot;${nonarch_base_libdir}/firmware/intel/i=
sh/ish_ptl.bin*&quot;<br>
=C2=A0RDEPENDS:${PN}-ish-ptl =3D &quot;${PN}-intel-license&quot;<br>
<br>
+LICENSE:${PN}-ish-wcl =3D &quot;Firmware-intel&quot;<br>
+FILES:${PN}-ish-wcl =3D &quot;${nonarch_base_libdir}/firmware/intel/ish/is=
h_wcl.bin*&quot;<br>
+RDEPENDS:${PN}-ish-wcl =3D &quot;${PN}-intel-license&quot;<br>
+<br>
=C2=A0# For advansys - AdvanSys SCSI<br>
=C2=A0LICENSE:${PN}-advansys-license =3D &quot;Firmware-advansys&quot;<br>
=C2=A0FILES:${PN}-advansys-license =3D &quot;${nonarch_base_libdir}/firmwar=
e/LICENCE.advansys&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235119): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235119" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235119</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118811193/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118811193/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000002ddafa064f72934f--


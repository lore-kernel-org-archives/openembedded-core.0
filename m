Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0C0C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 17:47:36 +0000 (UTC)
Subject: Re: [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.13)
X-Originating-Platform: Mac Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 16 May 2025 10:47:26 -0700
References: <CANNYZj_L16xr8rTpsghREB6PmEE549BKZjPE4zLdszGbx2fpNw@mail.gmail.com>
In-Reply-To: <CANNYZj_L16xr8rTpsghREB6PmEE549BKZjPE4zLdszGbx2fpNw@mail.gmail.com>
Message-ID: <13420.1747417646881312279@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="80JJsbNF7zDMeloSqbgb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 17:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216762

--80JJsbNF7zDMeloSqbgb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 10:19 AM, Alexander Kanavin wrote:

>=20
> Can you put =E2=80=94features directly into packageconfig definitions? Do=
es cargo
> accept multiple =E2=80=94features flags?

Oh, yes it works. Thanks. The only small problem is I can't use comma-separ=
ated features in =C2=A0PACKAGECONFIG because it itself is comma-separated. =
So I have to add --features before each feature in the same line. It doesn'=
t look bad if I use -F instead of --features though:

PACKAGECONFIG ??=3D "PKCS11 MBED-CRYPTO"
have_TPM =3D "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', 'TPM', '', d)=
}"
PACKAGECONFIG:append =3D " ${@bb.utils.contains('BBFILE_COLLECTIONS', 'tpm-=
layer', '${have_TPM}', '', d)}"

PACKAGECONFIG[ALL] =3D "-F all-providers -F cryptoki/generate-bindings -F t=
ss-esapi/generate-bindings,,tpm2-tss libts,tpm2-tss libtss2-tcti-device lib=
ts"
PACKAGECONFIG[TPM] =3D "-F tpm-provider -F tss-esapi/generate-bindings,,tpm=
2-tss,tpm2-tss libtss2-tcti-device"
PACKAGECONFIG[PKCS11] =3D "-F pkcs11-provider -F cryptoki/generate-bindings=
,"
PACKAGECONFIG[MBED-CRYPTO] =3D "-F mbed-crypto-provider,"
PACKAGECONFIG[CRYPTOAUTHLIB] =3D "-F cryptoauthlib-provider,"
PACKAGECONFIG[TS] =3D "-F trusted-service-provider,,libts,libts"

Anton

--80JJsbNF7zDMeloSqbgb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, May 16, 2025 at 10:19 AM, Alexander Kanavin wrote:</div>
<div>
<blockquote>Can you put &mdash;features directly into packageconfig definit=
ions? Does cargo accept multiple &mdash;features flags?</blockquote>
</div>
<div>Oh, yes it works. Thanks. The only small problem is I can't use comma-=
separated features in &nbsp;PACKAGECONFIG because it itself is comma-separa=
ted. So I have to add --features before each feature in the same line. It d=
oesn't look bad if I use -F instead of --features though:<br /><br />PACKAG=
ECONFIG ??=3D "PKCS11 MBED-CRYPTO"<br />have_TPM =3D "${@bb.utils.contains(=
'DISTRO_FEATURES', 'tpm2', 'TPM', '', d)}"<br />PACKAGECONFIG:append =3D " =
${@bb.utils.contains('BBFILE_COLLECTIONS', 'tpm-layer', '${have_TPM}', '', =
d)}"<br /><br />PACKAGECONFIG[ALL] =3D "-F all-providers -F cryptoki/genera=
te-bindings -F tss-esapi/generate-bindings,,tpm2-tss libts,tpm2-tss libtss2=
-tcti-device libts"<br />PACKAGECONFIG[TPM] =3D "-F tpm-provider -F tss-esa=
pi/generate-bindings,,tpm2-tss,tpm2-tss libtss2-tcti-device"<br />PACKAGECO=
NFIG[PKCS11] =3D "-F pkcs11-provider -F cryptoki/generate-bindings,"<br />P=
ACKAGECONFIG[MBED-CRYPTO] =3D "-F mbed-crypto-provider,"<br />PACKAGECONFIG=
[CRYPTOAUTHLIB] =3D "-F cryptoauthlib-provider,"<br />PACKAGECONFIG[TS] =3D=
 "-F trusted-service-provider,,libts,libts"<br /><br />Anton<br /><br /></d=
iv>

--80JJsbNF7zDMeloSqbgb--


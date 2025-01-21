Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BF2C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:36:33 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.18741.1737473785507526408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 07:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NvFg0PAD;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401be44b58so5964728e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737473784; x=1738078584; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRmRL1ikZ5HIpYAENa29M3aT0X2KlJLeWz/81l5deVA=;
        b=NvFg0PADwkRbf4OO6J3TwanM7JtS2msqLU18gSELSvr4+AQe6hC3Rh+PkWwvqMBhbT
         hCh6oETVtCz8z0DdyfX/J2yCwwKPvaLzSXdIhe29A9D7ERBkOtrhH+fhe+JyrgIQs9uq
         dp17JKFIYEvJV+vzWaNab0QUrYqSw6veblkxLhgFiJphn9+Axk5XKqk94EAbGRGivHRI
         KH39x2+/+4O+J7/XZj9wxNieG9dD70rRornXJdLuehfO4ypSnozl9SR2d9wkJxVVhG/4
         3VxIYEaoS8wnGwlYJ3HvAIuV1gKxSgy351LwSRBM1OzY1D6sZ9G8nqDO7J9vphwUBrYe
         z1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737473784; x=1738078584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRmRL1ikZ5HIpYAENa29M3aT0X2KlJLeWz/81l5deVA=;
        b=FjmevAko//cqj+YfW9Vq3Kde9REK0ghyvrsMmbCnheP1NvGYxofMVW8IHACJNmf9si
         fgagirCMy8J6Bw8wLKtobSsEQOJqY9D8LIhd85wp4WY55jtm4bMGT7jKLFGmHAUuGeZ0
         hJQR1TcstbscNhAXeuqZSoMDqS14xp15fslsigKDde35kTNMmQEk0K76RqGU9JY7Ak09
         qn+Ux5jOw5Ek73Hum5/kIeFFPtF/rO5G6IrBrARgswPS9neUHINqYmXuHmcBuTQT8oVA
         0qNKuVDi/MfUQ2BvaKV4yBWxlPkx7YN/S7Hqgm9qkk9uzETbEsfmqZnMCoo3aQnOv3o1
         hq0g==
X-Gm-Message-State: AOJu0Yx84ZgCQatK1x4z7+yOacjzFTaCLNUUlRoOxgS8qpviCbxkU8dz
	B8PiWZRSNoPqRONipHVejG/xeixvvSm4Q4vcrIlySrqqjV6uSLnzVhRlD5/oCTO0QUTzIFbsJ5d
	ysgTs3vNnTN/QZHmNaV4yy6EsoqQ=
X-Gm-Gg: ASbGncvH6A08bKq9zQqFfyMkedzb+4VN8az1kFCVyziYQViXOiHUlmPV5jkyW/dA05Q
	Tk3+OH6VFJ3xPtxCXvGU+8EXFxEVS18SXA3KI2nUnsEB7R7442uobja8qYSgBv44IvQ==
X-Google-Smtp-Source: AGHT+IG9l+YLFAhSVdlPvMRDPQTzXVNWYD+XRxgqtEp9NHW1vpXQ3WPHjiV8GWG9cgmhmWF0q2rxoXndd+vQsVYGT2A=
X-Received: by 2002:ac2:4c24:0:b0:540:5253:6af2 with SMTP id
 2adb3069b0e04-5439c22148amr5084415e87.12.1737473783302; Tue, 21 Jan 2025
 07:36:23 -0800 (PST)
MIME-Version: 1.0
References: <1e91d93673d7414baea355383b0f0ebe@diehl.com>
In-Reply-To: <1e91d93673d7414baea355383b0f0ebe@diehl.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 21 Jan 2025 08:36:08 -0700
X-Gm-Features: AbW1kvY6IB5fRX1_3315AgMvTBSI6eJjJT-n_Qb5mdA6zuNnjpk-d7wotXEmxTE
Message-ID: <CAJdd5Gb-mh=SNEJ_zz5LsPXGRqW8cHhogJvP0jp-=rBVMu-kkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx: support line numbers
To: denis.osterland@diehl.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 15:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210099

On Mon, Jan 20, 2025 at 6:10=E2=80=AFAM Denis OSTERLAND-HEIM via
lists.openembedded.org
<denis.osterland=3Ddiehl.com@lists.openembedded.org> wrote:
>
> LIC_FILES_CHKSUM supports begin-/endline for licenses included in
> for instance header files. This patch adds support for line numbers
> to NO_GENERIC_LICENSE, too.
>
> Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> ---
> Resent without signature
>
>  meta/classes/create-spdx-2.2.bbclass | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 27242ecf70..494bde117f 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -75,11 +75,17 @@ def convert_license_to_spdx(lic, license_data, docume=
nt, d, existing=3D{}):
>                      pass
>              if extracted_info.extractedText is None:
>                  # If it's not SPDX or PD, then NO_GENERIC_LICENSE must b=
e set
> -                filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
> +                entry =3D d.getVarFlag('NO_GENERIC_LICENSE', name).split=
(';')
> +                filename =3D entry[0]
> +                params =3D {i.split('=3D')[0]: i.split('=3D')[1] for i i=
n entry[1:] if '=3D' in i}
> +                beginline =3D int(params.get('beginline', 1))
> +                endline =3D params.get('endline', None)
> +                if endline:
> +                    endline =3D int(endline)
>                  if filename:
>                      filename =3D d.expand("${S}/" + filename)
>                      with open(filename, errors=3D"replace") as f:
> -                        extracted_info.extractedText =3D f.read()
> +                        extracted_info.extractedText =3D "".join(line fo=
r idx, line in enumerate(f, 1) if beginline <=3D idx and idx <=3D (endline =
or idx))
>                  else:
>                      bb.fatal("Cannot find any text for license %s" % nam=
e)
>
> --
> 2.45.2
> Diehl Metering GmbH, Donaustrasse 120, 90451 Nuernberg
> Sitz der Gesellschaft: Ansbach, Registergericht: Ansbach HRB 69
> Geschaeftsfuehrer: Dr. Christof Bosbach (Sprecher), Dipl.-Dolm. Annette G=
euther, Dipl.-Kfm. Reiner Edel, Jean-Claude Luttringer
>
> Bitte denken Sie an die Umwelt, bevor Sie diese E-Mail drucken. Diese E-M=
ail kann vertrauliche Informationen enthalten. Sollten die in dieser E-Mail=
 enthaltenen Informationen nicht f=C3=BCr Sie bestimmt sein, informieren Si=
e bitte unverzueglich den Absender per E-Mail und loeschen Sie diese E-Mail=
 in Ihrem System. Jede unberechtigte Form der Reproduktion, Bekanntgabe, Ae=
nderung, Verteilung und/oder Publikation dieser E-Mail ist strengstens unte=
rsagt. Informationen zum Datenschutz finden Sie auf unserer Homepage<https:=
//www.diehl.com/metering/de/impressum-und-rechtliche-hinweise/>.
>
> Before printing, think about environmental responsibility.This message ma=
y contain confidential information. If you are not authorized to receive th=
is information please advise the sender immediately by reply e-mail and del=
ete this message without making any copies. Any form of unauthorized use, p=
ublication, reproduction, copying or disclosure of the e-mail is not permit=
ted. Information about data protection can be found on our homepage<https:/=
/www.diehl.com/metering/en/data-protection/>.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210028): https://lists.openembedded.org/g/openembedde=
d-core/message/210028
> Mute This Topic: https://lists.openembedded.org/mt/110713816/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


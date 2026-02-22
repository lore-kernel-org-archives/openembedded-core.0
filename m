Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B43C624D8
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 10:13:07 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11065.1771755179424811850
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 02:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DCem74Tn;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d4c4cacf78so1227680a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 02:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771755178; cv=none;
        d=google.com; s=arc-20240605;
        b=HECulTsI/1QscCJqvnWvZER2lwfBhCxWsAN3lpAp/UJqgLma9RI7+kTpAGmSgXysnp
         uDtv1sOuGndGG1pM7RjT9EK6SA/x7DwD0b5juHu34h00c08kUg/rI64bY44FXjboG3LG
         e3nYUzhZo5KWkkkzLmGoR3x24ZV2QP2rzCDwYOVB14EHfRW4RGt1Q1itSlfb/Y1hI6PU
         DCakp2TGTQyzyip89ggJnovMm9HtAlHWDXH/TykL3q6IQpGqWGfldpotYE4nBUC/4fvZ
         chWz1xdlt95ElpGk//S1hUI2C+PSdF8ih6fFrvvlZ9by6A2nEPrB8CSMeoreR5JlGiI0
         R+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OO05PfZhZIC8Bmi3PTK5CpP8vZWDcLHt4d2tfsTovgU=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=SNLAUf6ofeCwHfueJNAz7c2qxOREAwR0SaX7NG0eBk1cNLqnaByLl+/EAFLfE8HBUA
         TPdXiI6ET2sadbt9aBdDRfxJi/snvNtRIhXCoSyaR71yxFVZjUUt7Q8rD8esBUIHshCs
         eOgwNPu/9fmBb+XtxWNsdlNl4cTehOT+MwbuITvjF1o4+AK3IjistiCrq/tJjTpgAuD5
         LYlbL9JEHoDAZOdENGvdR3vs9O7QD/dkMkVA2LzkJ2aO7Uxjroz3KlUwjJEHRK+y0nJX
         rWM6nrqNO3nMeU9zVCUrawkJ5yB5wyxRcIurLnNbCyNoko/GGo7O+TMULcorWa308Wds
         mEtw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771755178; x=1772359978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO05PfZhZIC8Bmi3PTK5CpP8vZWDcLHt4d2tfsTovgU=;
        b=DCem74Tn50wOFnrtfelUBwUtVYjUBSHxq7V8F19fHACLPktR9aQFI0lY0JASReGKzi
         Hbar+jFNGxLRmxLlsh+qWD+ZRAieN8XbKTsaG0bswVvjfKJur71ADsZc1CL8aYCWDUl2
         OJ3oYEHZkjW85EW7OitLYRTIwP741ysC6ZFObzVJw60fkCpEsGQ1hq+u8Y12H7AaYCXF
         6gi39VFv347nrumd9EmAXkVt4CctdPu5jhoc2c+6KDmUwSfcKYDwrJaOxyTmzjGeJ/Z7
         s+v997QP8BxmEw3V2EVyrN1mfOMhjbTBdZVr00TKwfncwApEkrXUZprC2NGXbndfXjR7
         oc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771755178; x=1772359978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OO05PfZhZIC8Bmi3PTK5CpP8vZWDcLHt4d2tfsTovgU=;
        b=hnl5wa8alG6a2HwAZFrBdTNEbxzMeoUc31ET538Mz28VOZuPwqTS+AZIK5p0VcH6Vs
         XeDZCzRRdo4GbkXwUhiZhvC4ge14lVrZwSg944KPOnvtraSkcFZJJdYccHoIF+vaNMg9
         SnswXkBDk3hT9x2nvRiFLedxz2weKwdL864ze6Ztl7uvcSBOgtBlEf4sr1ntOiK+wmIH
         RKI2KmSLjhBEPrwDjRA/CmRIGmngl3x4mn3PPgSKT7Lrrjz7bR7wNwCXzSAiA6pTSSzg
         wiKAXV5GYJMhkfBzPqOyMjvw69/hpamjs+uX2AotcbH3EbONKEZ6JwZjnQDNttM7955e
         mAow==
X-Gm-Message-State: AOJu0YyF6cLEQGd1fMVjA8m9yk4z8q42rzKzTnbOaqMstDge6aBRocb9
	fLSWE+OvYFpm8cyMwCr3xkKMroAMYmf/gyWhMdRJwbhiSj4tRmWLQ66mbORUM8hS2qi9aL2bi5N
	QDxVIU7u1TN/0ShoUA/DjX4HT2wubF/f5lTY1JGA=
X-Gm-Gg: AZuq6aJ/YcirZc7ccNAinuRAJe/vrRlRT2bidpGazO9yFm5hlSLCLTOHTW8DgbjZGE9
	TNErvRbXsRT5GM8yfI2TKbCJGKL4+bE0PiR6130XgOuVhg1D1hQjkoUAdx0ZrLDr9bnUJUgz3Ab
	z4FQQQ/XTDpDvNKP1/n/yONpehveaucE3H4v4ivgdQ8wIRBvViqoUT6vugzLjSUXf2+NZHMxV0j
	ZlJcfTzLqq8k//AlDXRdnks2/vadJqaJDQboViJEuEWj0dzT+HaXCjTI9M21BKWuklpr5J42TTU
	k3jEHAzSeAJ+woqlb1zx
X-Received: by 2002:a05:6820:221d:b0:66d:b183:64ed with SMTP id
 006d021491bc7-679c4279029mr3348934eaf.25.1771755178306; Sun, 22 Feb 2026
 02:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20260218090606.3693584-1-ankur.tyagi85@gmail.com>
 <20260218090606.3693584-2-ankur.tyagi85@gmail.com> <DGKMTIQVT97I.10NPWRO24MLGR@bootlin.com>
In-Reply-To: <DGKMTIQVT97I.10NPWRO24MLGR@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 22 Feb 2026 23:12:46 +1300
X-Gm-Features: AaiRm53DrnRhBURrz3buJ-jQhlGBqfzXV75YcZwLt5vN2jU-DAuaDf8qF7xUXus
Message-ID: <CADySD0ExUn0uimBUEXTfN5D_oZN3Ueaw5+L0_teLYvQQTi6xdQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] mdadm: catch sed substitution failure
 during install
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 10:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231626

On Sun, Feb 22, 2026 at 1:17=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Feb 18, 2026 at 10:06 AM CET, Ankur Tyagi via lists.openembedded.o=
rg wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > This patch is to validate a possible race condition theory during insta=
ll.
> > Also fail the build if sed substitution still fails for further investi=
gation.
> >
> > Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16166
> >
> > [YOCTO #16166]
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Just a quick update on this: I continue to run it on the autobuilder,
> but I'm at about 15 runs without any issue.
>
> I will keep you in touch if the reproducibility issue appears again.
>

Thanks Mathieu,

So does it imply hash equivalence related issues which Alex was alluding to=
?

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


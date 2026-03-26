Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3DD10AB80C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 19:12:17 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55953.1774552330219706596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 12:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HBkrum9X;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d7e9b97a73so1432905a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774552329; cv=none;
        d=google.com; s=arc-20240605;
        b=ZZKZBfLVUGbSVwjeqdujCAdKc7v55ohR+NG+5dVNDhfxg5TouIMohgcZxvPXZ3EN3G
         ZepcAdSxEfrVZrX4mjSOAfRsePxOC5c6hDZVzgh2DOJ2SUCu7BUN5n+KSo28OX6CrjJg
         p7TmlBo8HkaJxbJSaQI1lfoxp3lkaUPOGeh70gm/FPbBPktYlOctZ2rRiF9jEqjwGyo0
         Qp33RfLHNzWm5wMJ5GaL/wlBMB2wVaGEm9SZCg9G7SDr2PUYgOtj2m+NUKMF0ymG6xY2
         rAuFQTs3E6N7WWqkvAF+GDH1aSJwYDnXshjB1hmsyeHM/X9BqudIXXorLHVVIaLl3TcL
         H1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZNum1IZEWPLShjYbEyG36N9uvcfIQpB3ZN+DTuYZDM=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=Lnf1rSgyyruXiqwHvt6+Zi47TM2TuWpoWQnF/637X8LSiW+E8PJMh1ONA8poe4WzqI
         //CEXZZWwc7gAPGHUengBt5eyUwlRyd7El2MMsrv2PL1FwQwrf2OiEhF5POKlhYudMW2
         gCk1bMmiqpNBUAJCz3YRGfTFV1dA2HKCWiNjdZICQvYptl3ZgSys956YC4Xl0udXEvyj
         vPZR3BsJGWfmlpXgXstcxjWXUojQGDR3WbN7bLW5rOr00AfKHHdmffxg2lulxhkgL4Rx
         GucKu3GMVLoiRzX4VKAmvJo4ww1YQzs9SdldgonD4LGDsBdfbQubORYjneFFBkOgEg+5
         w4hw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774552329; x=1775157129; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZNum1IZEWPLShjYbEyG36N9uvcfIQpB3ZN+DTuYZDM=;
        b=HBkrum9XzTwoAk9Oqc6sbQFykZs7V1p0JyqpnIfG/1KKUXLmPDA1pat0dEB4Uxeuzb
         QvKkqyYmPUqaJ/zPR80apUd8Q/0k9rY/Dd1MgFWDB1q1qx7C8RBlGW0acDbgWSgSrfbF
         I1aB8loZ/4BHPhnSS5Lx2uUy+OZ1/JEHN4UKMzAHWu6kPCSrMiF9mSSQ5zLMs/iE0te6
         DOIOLkMrGS4lPuzglBJukYsaRQ7XcnGLBIQVBs3vkQ3pYEYNWQAEckv/hRZiITKSvot3
         gfbTBt2mjkwf4fEvn40TGL/A2V/HpGrgpWR6Ml0rebQd5egrinXO6t/2TtAzwRRKrmO/
         tsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774552329; x=1775157129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZNum1IZEWPLShjYbEyG36N9uvcfIQpB3ZN+DTuYZDM=;
        b=jDt2ct1ttdV06YM8Yvz3C5/RRkysvInHMtp3sePy5BmoZyDFG0Fn/MbtvI3iXH4chA
         Or7OPoFEmhtX++6EkezO5wz4iDO5ISxy1AUk54ycrpyqH+08tR1o/A6+QCRJLgraR8vu
         T0EahdrI/kAtnBr9zWefLk6UUURAf4Ts2Np7nV9sy85Azwgg+wSuDSktgVg++WDg1XmH
         nQ1rOsw+t+sAMXyH8YaKfMzY2SIJgMdKcccPVNuOyEyEOs+M3MIJMU0D8/SNXw+Nr7ul
         LhuMniIWJ3i8Cm532HMUY3nxhqCc32PquSWdO1a/OFXHVFeYyJqb7SFtPkwrep85DNob
         hIxA==
X-Gm-Message-State: AOJu0Ywsx/gHM2jiVuJ4CzSaqtrCd5WgozNvoCNTUfRXu+5KfM7pTc7a
	tONgk3DEwSarzRsStqSOeQgRDXDjbbemU0LPYq0G85N6AGUXKN2gI8cAc/oK7EZSOVVizzgSfup
	iPTtg/HJ1BBhVW8FfqDLU8gWWt5Pw4h8=
X-Gm-Gg: ATEYQzywHxKD0IN8cfl3nP3/T458Hzxg4/w4+6Fsir6SQu37RIrrtHjfYUxIP3z+mm7
	r2h4dRydAIpw9JEvauhhTkmFfl4fIXXXIb578/2OpLKRxn6w9ErxQvSzLsQk92IMDEF5q5T0MWQ
	i7aMtJk2ykbhHY0Lso0/wpIWEwHkdnVLsy+cSoIbi9c1mxiX7a1LQDcGrGOEZUxd6wbMIRkenTO
	mN5oueNRpZbjIkurHUChkt51WNPiAlXYcHNZ8jtObQi4uu937WjyAIw3oDkFqVLL1/glp0FIr49
	v58oFsdm
X-Received: by 2002:a05:6820:a288:20b0:67e:154e:c055 with SMTP id
 006d021491bc7-67e154ec501mr397296eaf.1.1774552329439; Thu, 26 Mar 2026
 12:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260326105453.1799455-1-ankur.tyagi85@gmail.com> <CANNYZj9eMOVW12_nz5h9ri7NbUx=hpEH_ecQkisFX9v4ES-fiQ@mail.gmail.com>
In-Reply-To: <CANNYZj9eMOVW12_nz5h9ri7NbUx=hpEH_ecQkisFX9v4ES-fiQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 27 Mar 2026 08:11:57 +1300
X-Gm-Features: AQROBzDjMZEGxmjpcHn0QxBqvo6XWtzHf3Lpa7OScIVpQFBe7EUX3ExkNFXWpJc
Message-ID: <CADySD0GR5fdqg5jk2K0hauOTe4q3JcesguiBYATM3XSnSzHZyg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] vte: upgrade 0.82.2 -> 0.84.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 19:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234045

On Fri, Mar 27, 2026 at 1:50=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 26 Mar 2026 at 11:55, Ankur Tyagi via lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> >  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.p=
atch \
> > -            file://0001-support-reproducibility-for-debug-sources.patc=
h;patchdir=3D./subprojects/simdutf \
>
> The patch file needs to be removed as well.

Thanks, sent v2.

>
> Alex


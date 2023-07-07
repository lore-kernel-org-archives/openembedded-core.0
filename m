Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDBFEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 11:09:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.9989.1688728169358877125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 04:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GHvb0rf7;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fb7589b187so2783299e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688728167; x=1691320167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYNnOn40paOO/foX/1gyBReJjAN6GnAU8Q8MO648Vs=;
        b=GHvb0rf7QTOCC1ObMoajEhnj6LkMxwdHAGS8R1VbD9cMu05RfPuUTANtUhoCOV2w7g
         bgeU8JCpns2orEORmp6LDhdw/U/eKq2O2pj8JIoOnwo52StP1wCUfloWQ2pQpvmJTrlf
         qiCOxDFv5KgptRvcK0sMQjHQwu97A2ujAwocunuN1JR8jEN2yjZbcrLuzUWtqL+A6eQG
         EWcOae8oXwv0cjfEdT/ehGPBcoLJE9YKdVxpqueGEt+TCjr5W4I/M/UXug/BKIFH+UoB
         jZtc/PG1+i+asMDTw8Xn5tOKJXxe55iiYb47gCXuP2/gpNIH1vQD5tON+vh7z3TPDQKC
         j77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688728167; x=1691320167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYNnOn40paOO/foX/1gyBReJjAN6GnAU8Q8MO648Vs=;
        b=l4mJ3vE8FLFyfK3+EOmOZ76qJHP9fuNdHISj19U9sgcQPJToSA4D+1msWWg1dzpI+2
         tgywkVvP+Zz8ISFQfnnTYOTX5lBwwuT+kUf6ErPLZJARe6fXXdYYrRDRYPkVH9Tbbqse
         Casc0VUxTVzFdqfbOXUDeyye4NvPWZrxBZ5ti5vFrAmnMY02uN70EpZ/oNqk9ieG4TuW
         AoBoGMZ91DAVgP5l0lVxyVL7XI/LCK22iC8ABu/19Ag4adJylhPLgI3wY5P5QTPKLGou
         5yWfTvBjPqt7jy7XWkHgw7TRZ4NDKTzuEFKdYo/UkiKfsh21RY1E+q0ubq8TyG8DJk4e
         aK5w==
X-Gm-Message-State: ABy/qLas6jFgdCjkYidZ+bTjxvCN0dGaJ/HceFpPt6ILdzkZY/b0lofP
	J4Cy9unQ9vjjyC5NlXJeGJmq+lpO6+s9Q/6oN30=
X-Google-Smtp-Source: APBJJlGxTV8Ixkq/X+Jw7YVvG3pZm7d59w0h0n2bgmuvqB7niNTEAaRg4QYer11QzDmca0VnQwL/fQu5HHHssIFAcyw=
X-Received: by 2002:a19:655a:0:b0:4fb:7cea:882a with SMTP id
 c26-20020a19655a000000b004fb7cea882amr3295234lfj.3.1688728167249; Fri, 07 Jul
 2023 04:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
 <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com>
 <5633c982-9553-5ee8-167c-04c56577d5e5@baylibre.com> <CANNYZj8PW4efL+U1b6HJwyD+24AT3eaYQRxKz5Ai98x1pVbh5g@mail.gmail.com>
 <5efb8cd4-46ee-50dc-40bf-6d5bf61a7c04@baylibre.com> <CANNYZj8=A9rX55KuA2wB4jPOM_DWApAds2OaLgE+Cjy=Kva0WQ@mail.gmail.com>
 <94B80420-20B1-4AC0-A077-1A4A28482DE8@arm.com>
In-Reply-To: <94B80420-20B1-4AC0-A077-1A4A28482DE8@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Jul 2023 13:09:15 +0200
Message-ID: <CANNYZj_jo_aDTRZAYbipK6ZEuxQnaPu6ok+k8Zaq0hzcYjv27Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
To: Ross Burton <Ross.Burton@arm.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 11:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184007

On Fri, 7 Jul 2023 at 12:22, Ross Burton <Ross.Burton@arm.com> wrote:
> So I started on this, and there=E2=80=99s a unittest runner in python3-un=
ittest-automake-output which has our output format.  The problem with pytho=
n=E2=80=99s test module is that it also has its own runner, so the trick wo=
uld be interfacing the two.

Until that is ready, I think we should simply use '-m test -W' with no
post-processing. It would stay quiet for the succeeding tests (which
is 99.9% of them), but output everything for the failing ones. As long
as that output is captured and reported as an 'overall fail', we can
do without per-test split in the qa reports. I'm testing a patch.

Alex


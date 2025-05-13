Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8698BC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:44:50 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.70309.1747118687477627588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 23:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3a/MHZI;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c54f67db99so706160685a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 23:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118686; x=1747723486; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkVt6mMwMz04WBECjOynH9p6yBC9xu12w8yxvdzdvQs=;
        b=e3a/MHZILOICxRAENe1ANSvrGGZIERFFOXTXGGnurEQh00WtUR4SXMlkSjTzA0j/Zd
         FXr/vMZ6TLrdmhBuB5u45ymCANX2q146ULRNt8eNqsWq+JqjKk+MMn6ijZHgZyg4WdpE
         U1ePaSAzmgh7grHKVddmg1arIa+BNYu34jnG1QTOL5d7oGxHdshQ3s9jGixaiVx7f0DC
         ASLMDzlK+uOx2Ft9NRqc3t6wU309FBplJqg/vVTnmwPqT0yT1Dop2jXrmduSMWEYZwxt
         KR/yjGrD606liM+tduvyKBPSP6mP/QSK6YHZnpSyh6lbZoEZYnyQvkjyjRkbOAzqkfC4
         Iihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118686; x=1747723486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkVt6mMwMz04WBECjOynH9p6yBC9xu12w8yxvdzdvQs=;
        b=m40l8bxc201BxXxWJB/TL/PySmzcIqo8e+TmXDN/3I698C1gvv4DD/A/Twg1miEJ4w
         bm4aMHmAh/w3Vf0NjnRX+J2xFOtiP+kFd4fo7K2xyYote3+0fmn6nsxKU0V41ShWmCOV
         MImt7CRVeCI6ElFA2YqfXNZA5WC6GJpKynvXJn76DhfmoOPBLxJw9dWW4dQc+XMpiz2N
         1NYL0NTL425fIbHm2MdYmEVno3+0iWkF1se7nz3s5Pc3ztTHvgzAvK9Ru+DqCtSt4TMb
         QQ76CZkbNP6NX/AAyX+itB+4lQgu9+v5ow24Px5CQccH6wW5nwQBDDf2xN/QfXog67rE
         Ubog==
X-Gm-Message-State: AOJu0Yxdpcx7AkUq9Fag24Gjn5YKZL1MGdb2VyuqSdy8ynSn9CvLxUHJ
	OeImeHh7+INsPNFwJo8WcXRFCaJ4IR/evUlMFVSn2IRsCocKnOwTgW2Yg/F4Cqgqt6TYkyPCUNY
	cOnoGILW2P2aNkJEJppnbCIvrxgh0QuIv
X-Gm-Gg: ASbGncufhhWc7qZQ5fzgrbAKajvRhutx8xE2nqfcPRT5yNFeMAjkwfXtfzWX8hyQOzP
	hTz9RlFkyXvJAUBMTzt7GB4XWeFJSuh6dfNczA6E/jdaBFMUH4Oi/HXa9q7xtFicS++i3b53tYN
	2tO6mxQ1urhOvGShGOPDuBo6xYY6PW+0XR
X-Google-Smtp-Source: AGHT+IHXtIOzdQfriPxDgd5JbTNbR5dlihacW3L6OU+0mEHGvFit9Qf7GF0flOX0rQyPeoorYRekrYmJD5Ro5pAFlP8=
X-Received: by 2002:a05:6820:f06:b0:604:a5f:a1ff with SMTP id
 006d021491bc7-609d31109fbmr1330161eaf.4.1747118676142; Mon, 12 May 2025
 23:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250511211411.1720365-1-raj.khem@gmail.com> <CANNYZj-cF_GPpkHv1gQE2nNOtVBu3RKMtn9mbcN-cBuLQSNzog@mail.gmail.com>
In-Reply-To: <CANNYZj-cF_GPpkHv1gQE2nNOtVBu3RKMtn9mbcN-cBuLQSNzog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 May 2025 23:44:10 -0700
X-Gm-Features: AX0GCFtLoORkIVuUCkjweXPL70LOEwPxwuvjUsnfMkNCqS7g8wMW7vsKzbO8VKk
Message-ID: <CAMKF1sq-ip+PjF4gkJVqyEJH2Fipt8FHUi91AuGwuc8WXcJ9Qg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: Skip a non-posix awk ptest on musl systems
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 06:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216398

On Mon, May 12, 2025 at 2:51=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 11 May 2025 at 23:14, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The test depends on BSD extension REG_STARTEND which
> > is not in POSIX, glibc does implement this extention so it
> > works on glibc systems. Therefore the patch to disable this test
> > is made musl specific
>              "
> > +SRC_URI:append:libc-musl =3D "\
> > +                            file://musl.cfg \
> > +                            file://0001-busybox-Add-awk-gsub-erroneous=
-word-start-match-test.patch"
>
>
> Please no conditional inappropriate patches that disable things
> unconditionally and add breakage and friction to version updates. Can
> we rather fix the test itself to determine if the extension is
> available, and skip if not so. Or add a configuration switch, or
> preprocessor ifdef block, or something more maintainable.

Not that I know if this but upstream does not have libc specific
variables to ignore tests
this testcase has not changed that often so the patch is not going to
be as troublesome
to carry. Although adding a libc specific ignore variable might be
something upstream might accept.

>
> Alex


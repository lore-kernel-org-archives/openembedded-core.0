Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730CCCF538F
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:22:02 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.10362.1729693313548085666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 07:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AJTMEJNR;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so7501299e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729693312; x=1730298112; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y7cZA/XfQyQPgHNFOQ5ZaPAfzu+w7aTlW/4amvBJvM=;
        b=AJTMEJNRuQ6klcVYm2r+mBGWoLNFwy/BtVI0PRNE0O+IqVCyYM7MbjmOek0wnnVe+u
         p8tPxCoxJtCIDDI0pljLzGhPqQciP75+u3NVck59L6QkAEVCG1GXm+m7pSmVhYv3CX+F
         je6ns1tXhJed+13E1CbEM0wztgf8A0fxfnV6BoefrFCl6sjMYj+m5Z4YZNPX9iCC0UP3
         wOiMHuGXuntel6+ih8p65Q2woRjRRJoYIrfbIEc5DBGrbceTxvs9T39NVCq3om6NX8kH
         rbeu0nGXX0tvMJnHZHBjntgmNTbH8nGQAdQL3OWVHpcjddaVo6FNiUXPmUlV8ANlr5Ne
         6bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729693312; x=1730298112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y7cZA/XfQyQPgHNFOQ5ZaPAfzu+w7aTlW/4amvBJvM=;
        b=olWs1BDfsrE7jg2Q+X4ggKUefMFBZrWE193yNOHJk5Pk5kTHMPDDCyKSJCfcrBbf+6
         56yPhLhHXWDWc9yUap4S6z4hVPKfxQt3C9XjAT0TaeEAuqHVFONEQ2E9Pc49FUhxYDmr
         bHYwo2jrB6pbC0MpGNm2xpzMnYhlBgD+4CSz3tlQOX0hBW+w6l2DSt2VrKYIKf0tKQMU
         SfGzWXqTIHxeX0nvPVAd9K6sSPOLxd6e2O33Q6pQt4OeqrxeXS+Tz8C5HEqt8J6NrKNv
         rs/nZr7u9UT3yOv4Jle/hW6tx5dZO9PCTMx9n41FRoAytN9+N7dIdoZuQ1afR9+7+Kd/
         xhNQ==
X-Gm-Message-State: AOJu0Yyhbz7OjQ8dRMHn1HS+CK78avtLgFAt6h0eQ5HBDZUXDegsEz+I
	JeyX9NmN0I2dW3T97BPPVtX8koaKkDcIXnmV30SMSUo7BhrRqWN6af3KK8+RLpGbdELu6wmH/99
	y38g58gSLSMRHq9kIbQ9O5OAiPJk=
X-Google-Smtp-Source: AGHT+IEECKCL7ZtW/lNv2Jxo77HG9la4W9FLLcsd9/kWYEXDbQq2mQxpOfcVfASxpbFDpL5oqydzDOsMQYOiGN3LGZg=
X-Received: by 2002:a05:6512:124c:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-53b1a315efbmr1623851e87.29.1729693311280; Wed, 23 Oct 2024
 07:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
 <20241016193606.3459951-5-alex.kanavin@gmail.com> <21294B27-3875-41E3-9A81-A02A8DE8E66E@arm.com>
In-Reply-To: <21294B27-3875-41E3-9A81-A02A8DE8E66E@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Oct 2024 16:21:39 +0200
Message-ID: <CANNYZj8W1MMJUeb2nnZUQK3te8HPjCT1PSMvqm5-Lhmu8E9LJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] python3: update 3.12.6 -> 3.13.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206239

On Tue, 22 Oct 2024 at 17:57, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 16 Oct 2024, at 20:36, Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> > diff --git a/meta/recipes-devtools/python/python3/fix-armv5.patch b/met=
a/recipes-devtools/python/python3/fix-armv5.patch
> > new file mode 100644
>
> Probably worth mentioning this in the commit message.

Done (v2 is coming).

> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json=
 b/meta/recipes-devtools/python/python3/python3-manifest.json
> > index 292c5bbc5da..4b7f9cc7e33 100644
> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > @@ -103,17 +103,6 @@
> >         ],
> >         "cached": []
> >     },
> > -    "2to3": {
> > -        "summary": "Python automated Python 2 to 3 code translator",
> > -        "rdepends": [
> > -            "core"
> > -        ],
> > -        "files": [
> > -            "${bindir}/2to3*",
> > -            "${libdir}/python${PYTHON_MAJMIN}/lib2to3"
> > -        ],
> > -        "cached": []
> > -    },
>
> Was 2to3 removed?  This isn=E2=80=99t in the commit message.

Also done.

> >         "files": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/chunk.py",
> > -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/audioop.*.so=
",
> > -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/ossaudiodev.=
*.so",
> > -            "${libdir}/python${PYTHON_MAJMIN}/sndhdr.py",
> > -            "${libdir}/python${PYTHON_MAJMIN}/sunau.py",
> >             "${libdir}/python${PYTHON_MAJMIN}/wave.py"
> >         ],
>
> There=E2=80=99s been a lot of deprecation modules that are being removed =
in this release, might be worth listing them.

I've added a link to upstream changelog which lists everything that's
been removed.

> >     "crypt": {
> >         "summary": "Python basic cryptographic and hashing support",
> >         "rdepends": [
> > -            "core",
> > -            "math",
> > -            "stringold"
> > +            "core"
> >         ],
> >         "files": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
> >             "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
> >             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so"=
,
> > -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so"=
,
> >             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so=
",
> >             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
> >             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
>
> This explains the buildhistory-diff:
>
> packages/cortexa57-poky-linux/python3/python3-crypt: RDEPENDS: removed "l=
ibxcrypt (['>=3D 4.4.36']) python3-math python3-stringold=E2=80=9D
>
> Is that package no longer building native code, or is it failing to build=
 native code?

crypt has been removed in 3.13, so it's simply not existing to begin with.

> > @@ -909,22 +867,12 @@
> >         "summary": "Python Internet Protocol servers",
> >         "rdepends": [
> >             "core",
> > -            "crypt",
> > -            "datetime",
> > -            "email",
> > -            "html",
> > -            "io",
> > -            "math",
> > -            "mime",
> > -            "netclient",
> > -            "stringold"
> > +            "io"
> >         ],
>
> That dependency list change seems suspiciously large.

Just below there's a line that removes the cgi module and those are
all dependencies of that.
The remaining socketserver needs only core and io.

> > @@ -1147,7 +1092,6 @@
> >             "core"
> >         ],
> >         "files": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.s=
o",
> >             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> >         ],
> >         "cached": []
>
> I still see a _tkinter.c in the cpython source tree, so this doesn=E2=80=
=99t seem right?

Manifest is supposed to list only things built and installed by
default, and this isn't. Packaging it should be fixed up in the recipe
by those who enable the feature. I'm not sure why tkinter python
module is still installed and what's the difference/relationship
between them. Users, if any, should figure this out.

> > +CACHED_CONFIGUREVARS:append:class-target =3D " \
> > +                ac_cv_libatomic_needed=3Dyes \
>
> Why is this needed?

Added to commit message.

> > +    d.setVar('ALLOW_EMPTY:${PN}-fcntl', '1')
>
> Looks like you moved fcntl into core, this should be mentioned.  Is this =
an attempt at preserving the name for compatibility? Might be neater to hav=
e it as a RPROVIDES on -core instead.

fcntl is now mentioned in commit.
There's a similar pre-existing line for pkgutil, so I'd rather do this
as a separate follow-up.

> > +    cp ${UNPACKDIR}/python3-manifest.json ${WORKDIR}
> > +    cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}
>
> Did the manifest updating just not work? Would it be neater to just chang=
e the script to work in unpackdir instead of copying the files further?

Yes, this broke when UNPACKDIR was introduced. I'd rather do a separate fix=
-up.

Alex


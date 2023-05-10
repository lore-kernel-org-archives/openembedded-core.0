Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644ABC7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 16:22:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.22237.1683735714776895622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 09:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mRJ53BM7;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50db7f0a1b4so3632103a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683735713; x=1686327713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xyza1I8irywzv22xa9Y1RVdQGRgL/LHG1Zi90ehxpO0=;
        b=mRJ53BM7qDXftuGEdX61VFPHLPS/a/qNILPakb66YIV5CG88acehUQ8Ub9lqoYXymC
         kuS9KcXYz4ZaMogiacz6vpYrQslXShXOl43XIv+tDmuHvr9/voPYe/5k6sKEItbJvJMx
         t3DlqWTDjrzwhZBN8yeoqC7D1J5or/hRd/A9cNKwzX6PWto5sEUdF8NolAm9WZTFNYz/
         01g38KOFhWXPXR60YdEmD9mHM/Vxn65uUDTm9Rk77l0NE/1HtlQ8VpbEJdpwSI7wy9Md
         s51XfzeXSAuKCfP5ox6UFid4fs4jV9xA2zquqVhgf8AfYq9W3fESm4/XE3O1TUx+Yaww
         OU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683735713; x=1686327713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xyza1I8irywzv22xa9Y1RVdQGRgL/LHG1Zi90ehxpO0=;
        b=D7f8QAjMiw4oUZG0Wv4gLszcWFo0O5Rrw7MitgdbfIi1/ydM4hsvnugZE7mE9YoAuj
         v7lWBxwT7WOgfTKPHAWt9QDTAh+wITsqOfov/hPLA08aN4iasQbi0JuUn66WrPEvctfb
         IG8yS9kjZxBOHQ4CDW3Kux1eUSV4rh4A45On7TSzBtZI0Bhn5IebCil94eT9fQLpjTE6
         v4OqKOJ7zSYHYBUbWyr2zFq89Npzp7Pvx7MJoxwvF7G9VjYz+pbm10xQGfWwxGS2FDnX
         TxTVsfQopkCcYyzpxBX6c8oI8RKKzHWo7JbVz4f8ljlZavIF7f+GGGVj/RyH7uJuK9jy
         N8Qw==
X-Gm-Message-State: AC+VfDyJfmSExvr+Om8Gp1FTfxtXtG3PSeDQOmrZ0wePBByn3PKaML+F
	7U3QEMdc4nForvFMUeJ9gPLKp2+Zfd6rRrsKPTlG8w==
X-Google-Smtp-Source: ACHHUZ64tjY1eZRR6PebOOEr5LzpHiInBe/X3HpGfTsqeNROz1enekTAdnU3S8Xhlv4xKd7tsjiX4w7f9gXN5IoEqOY=
X-Received: by 2002:a17:907:1c26:b0:96a:440b:d5db with SMTP id
 nc38-20020a1709071c2600b0096a440bd5dbmr1170606ejc.47.1683735713027; Wed, 10
 May 2023 09:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683671423.git.steve@sakoman.com> <5703fcbbede8ec438e36505d406e1f873b13a476.1683671423.git.steve@sakoman.com>
 <e9734fec-402d-63fb-bff0-8ab89306f599@smile.fr>
In-Reply-To: <e9734fec-402d-63fb-bff0-8ab89306f599@smile.fr>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 May 2023 06:21:41 -1000
Message-ID: <CAOSpxdZpACp21LPR3X35M_RktnWpcLPFgovYmfAN1b36Me_uEw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 04/15] linux-yocto: Exclude 121 CVEs already
 fixed upstream
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 16:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181117

On Wed, May 10, 2023 at 5:32=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> Hi Steve!
>
> On 5/10/23 00:32, Steve Sakoman wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > Exclude CVEs that are fixed in both current linux-yocto version
> > v5.10.175 and v5.15.108.
> >
> > To get the commit fixing a CVE, I used the Debian kernel-sec repo [1].
> >
> > [1]: https://salsa.debian.org/kernel-team/kernel-sec/-/commit/86d5040ae=
e9275f9555458fcaf9cb43710dff398
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-kernel/linux/cve-exclusion.inc | 875 ++++++++++++++++++++
> >  meta/recipes-kernel/linux/linux-yocto.inc   |   3 +
> >  2 files changed, 878 insertions(+)
> >  create mode 100644 meta/recipes-kernel/linux/cve-exclusion.inc
> >
> > diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes=
-kernel/linux/cve-exclusion.inc
> > new file mode 100644
> > index 0000000000..7fd362881a
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> > @@ -0,0 +1,875 @@
> > +# Kernel CVE exclusion file
> > +
>
> .../...
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2022-2503
> > +# Patched in kernel since v5.19 4caae58406f8ceb741603eee460d79bacca9b1=
b5
> > +# Backported in version v5.4.197 fd2f7e9984850a0162bfb6948b98ffac9fb5f=
a58
> > +# Backported in version v5.10.120 8df42bcd364cc3b41105215d841792aea787=
b133
> > +# Backported in version v5.15.45 69712b170237ec5979f168149cd31e851a465=
853
> > +CVE_CHECK_IGNORE +=3D "CVE-2022-2503"
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2022-26365
> > +# Patched in kernel since v5.19 2f446ffe9d737e9a844b97887919c4fda18246=
e7
> > +# Backported in version v5.4.204 42112e8f94617d83943f8f3b8de2b66041905=
506
> > +# Backported in version v5.10.129 cfea428030be836d79a7690968232bb7fa44=
10f1
> > +# Backported in version v5.15.53 7ed65a4ad8fa9f40bc3979b32c54243d6a684=
ec9
> > +CVE_CHECK_IGNORE +=3D "CVE-2022-26365"
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2022-2663
> > +# Patched in kernel since v6.0 e8d5dfd1d8747b56077d02664a8838c71ced948=
e
> > +# Backported in version v5.4.215 d0a24bc8e2aa703030d80affa3e5237fe3ad4=
dd2
> > +# Backported in version v5.10.146 9a5d7e0acb41bb2aac552f8eeb4b404177f3=
f66d
> > +# Backported in version v5.15.71 dc33ffbc361e2579a8f31b8724ef85d411744=
0e4
> > +# Backported in version v5.19.12 510ea9eae5ee45f4e443023556532bda99387=
351
> > +CVE_CHECK_IGNORE +=3D "CVE-2022-2663"
>
> I just noticed that the list in not sorted :(
>
> I'll send a V2 sorted (This will make the next iterations cleaner)

I'm just about to finalize the patchset for the upcoming 4.0.10
release, so I'll need to get the v2 today if you want it in the
release!

Thanks for doing this!

Steve


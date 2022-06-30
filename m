Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DB9C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 08:46:50 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.22720.1656578808603711411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iD7DjLi9;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id t25so32460784lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ciMMbW7QvZ07ZvDa02TsyhSADXcEnLmCXm+1xXeOuxA=;
        b=iD7DjLi9EGu8oD1nrn8gzO6KlJeMQuhSSLZzPjQiU1HOdSqOxsKvVjwUhedZE1393a
         q7VgQTnV9HVuMi8eRKtdSc1U28ZR1KrQHlaDqfzGCOCBk0UkvXSIXlD/Qq2+7D6coRiA
         SebJvBV8l1QLmZvVrUlt6Jw4q36rE4hWkbpKLY7pgRwkNvxZgt7R27y/4lNjrc5rgoM/
         /E3IsBew3UjC7ZDz0rM6zoUbJasFaH2je1mdQu3HiFiK6qmFM+oOez+7aZsipNtsM7+O
         j8hqFLVEOirS5ioeiPbO8Pndmo/+5j90cGuhzzXH+i6fSpoEDXrm+vgK7ocbkjqTydjR
         AMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ciMMbW7QvZ07ZvDa02TsyhSADXcEnLmCXm+1xXeOuxA=;
        b=7kHqhmmqnhK98eWBjNgHYREOOAAa9pnaJsnkNGYVvh+sySafUQf5vV0iLvf89sxbay
         m+vqQ7LgNAsV1TTvGXOPjqiLor1/ec3jqBlbDl8EGsZhsEaC/JPgQ9cNwThoECuTiABw
         Fqaoy9HjnNSV3+iLBm6ltGnxigwYdGWjidNjayNceB4JCCAt8X0OtS7EJKiBj0bqATl6
         IefdmSXyyQPxFA63hgy44jnKYAUOrBYHc0oRESkk74oePjctGAeMHqFiVDdfzLUJ3xI2
         DJyx2lIbB74i9NuHmb1iM4rXnvewCA5YI8M9xQblzAtkem8jzocrfho4SpL+qtQywUlT
         f59g==
X-Gm-Message-State: AJIora9CfIs5YWmHF0K3inHbFTGvoJVPb1m+y/JZjW3BxCh60g7Lpw6u
	pG0XonoX/HwyspFcvKLKGK1yivUxKosBDELqPaA=
X-Google-Smtp-Source: 
 AGRyM1s4MQxmXlDtADFMwS6nGiBeztMb0mZ3B3OFRUvbYRT6PvDtIvAZJpKFmFXZNwfmQOodk5EmXKnwlqxojbKdUnI=
X-Received: by 2002:a05:6512:acc:b0:47f:769e:6aef with SMTP id
 n12-20020a0565120acc00b0047f769e6aefmr4558925lfu.26.1656578806653; Thu, 30
 Jun 2022 01:46:46 -0700 (PDT)
MIME-Version: 1.0
References: 
 <SN4PR04MB8365732A4EAC162B5ACB5B22E4BB9@SN4PR04MB8365.namprd04.prod.outlook.com>
In-Reply-To: 
 <SN4PR04MB8365732A4EAC162B5ACB5B22E4BB9@SN4PR04MB8365.namprd04.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Jun 2022 10:46:35 +0200
Message-ID: 
 <CANNYZj9rW+p68mTbVxZM77aP-GWGVHdb+nXeLmQziHH8UKKjrw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to
 stdout
To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 08:46:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167405

Thanks for the information - perhaps this should be added to the commit message?

Does this change discard things that appear on stderr completely, or
does it still go somewhere where it can be seen later?

Alex

On Wed, 29 Jun 2022 at 21:22, Shruthi Ravichandran
<shruthi.ravichandran@ni.com> wrote:
>
> Hi Alex,
>
> I've found that some OE commands print an error during cleanup when
> the tmp_dir does not exist and an attempt is made to delete it. I've
> submitted a patch to opkg to fix that.
> Link: https://git.yoctoproject.org/opkg/commit/?id=8dfdda86afd407a66e3dc00a077bdcc8b53d54ea.
> That was the one instance that was causing an issue in our builds.
> There may be other instances that I don't know of. Given that, I think
> the package_manager code should be resilient against any such
> miscellaneous stderr messages, which do not result in the command
> itself failing.
>
> Hope that helps,
> Shruthi
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Tuesday, June 28, 2022 1:33 PM
> > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> >
> > This needs additional justification. What are the error messages, why are they harmless and why the solution is to suppress them instead of
> > addressing the reasons they appear?
> >
> > Alex
> >
> > On Tue 28. Jun 2022 at 23.13, Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> > wrote:
> >
> >
> >       When parsing the output of a command, do not pipe stderr to stdout.
> >       Opkg sometimes prints harmless error messages even when the opkg
> >       command succeeds. When stderr is piped to stdout, these error
> >       messages may clobber the stdout and cause unexpected results while
> >       parsing the output.
> >
> >       Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> >
> >       ---
> >        meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
> >        1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >       diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> >       index 4cd3963111..d7f3f31853 100644
> >       --- a/meta/lib/oe/package_manager/ipk/__init__.py
> >       +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> >       @@ -103,7 +103,7 @@ class OpkgDpkgPM(PackageManager):
> >                """
> >
> >                try:
> >       -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> >       +            output = subprocess.check_output(cmd, shell=True).decode("utf-8")
> >                except subprocess.CalledProcessError as e:
> >                    bb.fatal("Unable to list available packages. Command '%s' "
> >                             "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> >       --
> >       2.20.1
> >
> >
> >       -=-=-=-=-=-=-=-=-=-=-=-
> >       Links: You receive all messages sent to this group.
> >       View/Reply Online (#167354): https://lists.openembedded.org/g/openembedded-core/message/167354
> > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > core/message/167354__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-
> > qSvIV3p_DxpS6tCIX3jHMdg$>
> >       Mute This Topic: https://lists.openembedded.org/mt/92051989/1686489
> > <https://urldefense.com/v3/__https://lists.openembedded.org/mt/92051989/1686489__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kB
> > LndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-qSvIV3p_DxpS6tCIs81jASw$>
> >       Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-
> > core%2Bowner@lists.openembedded.org>
> >       Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > core/unsub__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-qSvIV3p_DxpS6tCIADJRjJc$>
> > [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com> ]
> >       -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
>
>
> INTERNAL - NI CONFIDENTIAL


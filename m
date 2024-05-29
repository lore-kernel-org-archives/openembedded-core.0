Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12A9C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 12:17:49 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.12337.1716985063946155419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 05:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CBvkPVT6;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e95a883101so23701851fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716985062; x=1717589862; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yz7sYFpBGV313XV+MijptugECRtJl6rCEZaXl3DBJuc=;
        b=CBvkPVT6qK1mOnr9rpj9RHJr1UfWkzVt2IFiJCGL9D99y4HXUbqsLM35LtVdkywz3p
         hM57bgbw82LqzSio8HUjTY1/AfGfwxsyBdOySmZ6n52XuwcSE15UoLSZ7eIsmsgn3EIv
         F8/CfZLsnu7TTcHtMXJrcHg0lqrlI9S2eoIG3ahS1/xauXdwfDIO2W2j3/zP0Ud81Xd2
         cZ7+YiTPWKS4SaktpiY4TzeTlGHbvDRomkbDE1sfImj2FlzuqyqSARkPoWEfsi7Wus4C
         N5lKArLUzp+06xrN/Tm+vqt2I602RB6KkMO5DDUJ/syY60B0IhiS7lsvUO3xw8WD90eY
         zXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985062; x=1717589862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz7sYFpBGV313XV+MijptugECRtJl6rCEZaXl3DBJuc=;
        b=FCyIHVDxCcJUnTc6kNsS1TpMeR8hARDlcTdzPu8qFEvzbaqFSiIqCr/hEqQBiDEQxx
         5bw1NDJmZxC4NTHS/cMQYmu4JI0Uo1R3Ihdr33W7C7xkKW5IOGmePwTDFbia8Rq+Cmfn
         YEYCN5cQynxmo+xql4H+wu6QXkPAVvTWCtDe3+vHmw+aqk1EK8tO9KD48yLn2tXxvyi2
         CMi8w1pNKSNbSAM/EbhS4ZFb+MdeLCGASdcXjgAzu2i5LPGFMGA2mKy44cBi8gAFAUiI
         odCGUi6mb0Pl6yfzP0ZADVZjxSI0+BL0RadBvyax4mR383/oMwTpe1XDOtBYtrEpFgfS
         2cdA==
X-Gm-Message-State: AOJu0Yz5z8cvl6dG5bcmUQu4EmpnZnYBtaaEZWOekjPaNANqL+g+JJI7
	pxC+kIzoxoIOzc+J/R56XrTt3jEV+/DT2yV2Bi9EexzKc4NGc7rEExiXPYMC3fmyoTMsY2fsbDp
	dt2DlpdvvGc+RryIvj/ub3AvjcAs=
X-Google-Smtp-Source: AGHT+IFyr2Q+BalqoQ4bbKOixuZKa8X06j4onSPQK81U+mtja3CrFO2/cj3CBuQagECsuvgb3Z22DZVapa13bNP0tow=
X-Received: by 2002:a2e:2ac6:0:b0:2e9:6e43:c897 with SMTP id
 38308e7fff4ca-2e96e43d34emr74727011fa.48.1716985061794; Wed, 29 May 2024
 05:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj92hE=tRTpYX9LB2FnbOZsJ6gSmtdJE3zqtop-Nhzzfrg@mail.gmail.com>
 <26273.1716983836341504845@lists.openembedded.org>
In-Reply-To: <26273.1716983836341504845@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 May 2024 14:17:30 +0200
Message-ID: <CANNYZj8tYDfh8r3QLtKoaQNUeiEy177PDxt88ao0Uce5y8fAeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 12:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200004

On Wed, 29 May 2024 at 13:57, pmi183 via lists.openembedded.org
<pmi183=gmail.com@lists.openembedded.org> wrote:

> Patch 1 - fixes race condition detected while executing functions registered on `SSTATEPOSTINSTFUNCS`

The patches needs to be sent as separate messages in a series, like
every other patch submitted here ('git send-email' does it).

> ---
>  meta/classes-global/sstate.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
> index 76a7b59636..9887169e4f 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -403,7 +403,6 @@ def sstate_installpkgdir(ss, d):
>      for state in ss['dirs']:
>          prepdir(state[1])
>          bb.utils.rename(sstateinst + state[0], state[1])
> -    sstate_install(ss, d)
>
>      for plain in ss['plaindirs']:
>          workdir = d.getVar('WORKDIR')
> @@ -416,6 +415,8 @@ def sstate_installpkgdir(ss, d):
>          prepdir(dest)
>          bb.utils.rename(src, dest)
>
> +    sstate_install(ss, d)
> +
>      return True
>
>  python sstate_hardcode_path_unpack () {

sstate.bbclass is a highly sensitive piece in yocto, and any changes
need to be strictly justified. Specifically, you need to explain what
is racing against each other, demonstrate how to reproduce and observe
the problem that the patch is fixing, and (ideally) provide a test
case (in oe-selftest) that fails without the change and passes with
it.

> Patch 2 - fixes `find` usage, avoiding hiding errors on the command execution and creates buildhistory output folder if doesnt exist.
>  buildhistory_list_pkg_files() {
>         # Create individual files-in-package for each recipe's package
> -       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
> +    pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
> +       for pkgdir in $pkgdirlist; do
>                 pkgname=$(basename $pkgdir)
>                 outfolder="${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
>                 outfile="$outfolder/files-in-package.txt"
>                 # Make sure the output folder exists so we can create the file
> -               if [ ! -d $outfolder ] ; then
> -                       bbdebug 2 "Folder $outfolder does not exist, file $outfile not created"
> -                       continue
> -               fi
> +        mkdir -p $outfolder
>                 buildhistory_list_files $pkgdir $outfile fakeroot
>         done

Indentation problems here. Is the folder is supposed to be created
elsewhere, and sometimes it is not? Why?

>  }
> --
> 2.25.1
>
> Patch 3 - fixes usage of 2 features combined, `BUILDHISTORY_PRESERVE` and `BUILDHISTORY_RESET`, restoring files to buildhistory main folder.

Needs a better explanation too. What wasn't previously working? How
does the code change address it?

Don't be afraid to be verbose and write multiple paragraphs in your
commit messages.

> Patch 4 - adds unit tests to validate files-in-package.txt generation and feature combination from patch 3.
> ---
>  meta/lib/oeqa/selftest/cases/buildoptions.py | 26 ++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
> index 31dafaa9c5..e05bac7c6c 100644
> --- a/meta/lib/oeqa/selftest/cases/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
> @@ -176,6 +176,32 @@ class BuildhistoryTests(BuildhistoryBase):
>              self.assertEqual(data['FILELIST'], '')
>          self.assertEqual(int(data['PKGSIZE']), 0)
>
> +    def test_files_in_package_txt_creation(self):
> +        self.config_buildhistory()
> +        bitbake('xcursor-transparent-theme -c cleansstate')

Thanks for taking the trouble to write the tests, it's good to see.
Sadly cleansstate is not allowed in selftests because that operation
must be performed offline with no other builds running. Is it possible
to test without that?

Alex


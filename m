Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.3308.1587635851757229781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 02:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ciJre9Q3;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id l19so5537066lje.10
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rR/mSCNtxbcso2kHMJPJjBzpKvr94cSU6foYPzgyb+s=;
        b=ciJre9Q3ETUaQrD14ll5K02mRbFSjAYKLUH5w3uumRj+9G7NATb1yaz8bS29ozeBvz
         5hPvLEPobRNUJ2JgsQdixA80cAGSb2XcFDJS3COHXOBDL7fNv2T+R3FygVQpl6FVnEaD
         bH3lrhVr4nA+KwJLwj9IusLDo+UVkzJZg1Vq3krVhzau2GW5d4hn+FZOnhL224Q1BU5M
         yqMU0+pp6mHfd8tHySaRuIxHXogQe/YX9LvIpFux4j/DlsCSN+wGdq8RP5Nmi+/ZGQdV
         WRCB24g49nHKCx9wp+sh9fhcu3pxwPvIfrB6gspau+INDwcJixkykqOh0ZgFSWxZ1cXs
         6USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rR/mSCNtxbcso2kHMJPJjBzpKvr94cSU6foYPzgyb+s=;
        b=dzuKvBYISS5sGN90zBac3UldXaJvN4YQv212WhgmShVOPfp4weqAe9ZvrZNXkv2bHT
         nG8liFHrJv5hWABf5oRxwDQAj8YXifCPSD66cia4diPtl4jE20S29bliKJPIrwUELvN6
         k+4ZnOjiXQMRCs2VRQbtEVSFo0bkQNA6K0imEOcF5t0JyxTik7u1nMcnbY7zXLAn9yb+
         zVGbKGgJ71eokpZRAO/WzV3Co2VEsGVF+lRmiNrnKh8OrdLvOSZ0Qn4yJU8DxKAKqjFr
         wuRwmwtfxKWsqWMWDWy3Ebl3xXcjNbQyTLXrUP7bqTK1EVjbuuRCatMLtAa4a5ytme0C
         MYCw==
X-Gm-Message-State: AGi0Pubt/B3l7pro/pUkpIIhyiJy0042rYQ9P1xR8PgXIEMrGfjGE+TV
	Ttlj1IDDYAyXVlpXepAm4SSrMLHbX7G9q1X1QqI=
X-Google-Smtp-Source: APiQypI+IMVIch6y23BX91cOtZIaF/LzivqDwy83B0DQVdBktrIUT4JIUz6SpYWwgf7SRMYL4Dq2lTX4s5ErxgOPHxc=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr1824913ljn.125.1587635849874;
 Thu, 23 Apr 2020 02:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200419063539.1467641-1-ricardo@ribalda.com> <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
In-Reply-To: <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Thu, 23 Apr 2020 11:57:12 +0200
Message-ID: <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Thanks for the test.

All the errors seem to have the same pattern:

FileNotFoundError: [Errno 2] No such file or directory:
'/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-27135/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-r0/testimage/qemurunner_log.20200423015612'

I do not believe that it is related to my patchset, I have seen that
you are already running the selftest without the patchset
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/850

Lets see if it also crashes or not. I am also trying to replicate locally.

Best regards!

On Thu, Apr 23, 2020 at 10:54 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-04-19 at 08:35 +0200, Ricardo Ribalda wrote:
> >
> > Changelog v6->v7 (Thanks Paul):
> >   - Use passwd instead of shadow for oetests
> >   - For pseudo folder inside workdir
> >   - Improve comments on tar
> >   - Use line number on tar name
> >   - Allow include-files of files in workdir
> >
> > Changelog v5->v6:
> >   - Allow two arguments to include-path
> >   - Fix permission on include-path
> >   - exec_native with ASSUME_PROVIDED
> >   - More unittesting
> >
> > Changelog v4->v5:
> >   - Add unittesting
> >   - wic: Avoid creating invalid pseudo directory
> >
> > Ricardo Ribalda Delgado (10):
> >   wic: Fix permissions when using exclude or include path
> >   wic: Fix multi images .wks with bitbake
> >   wic: Add --change-directory argument
> >   wic: Continue if excluded_path does not exist
> >   wic: Avoid creating invalid pseudo directory
> >   oeqa: wic: Add tests for permissions and change-directory
> >   wic: misc: Do not find for executables in ALREADY_PROVIDED
> >   wic: root: Add an opt. destination on include-path
> >   wic: rootfs: Combine path_validation in one function
> >   oeqa: wic: Add more tests for include_path
>
> I did run this through the autobuilder along with other changes and
> there were 5 oe-selftest failures for wic:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/858
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/855
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/861
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/849
>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

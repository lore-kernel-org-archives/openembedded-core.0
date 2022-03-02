Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F4EC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:49:07 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web09.5355.1646210946384732328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iGrFLxOE;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id f12so512915vkl.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/kVuJwIpuGoR2X/v5CrgZvYK8YoyN5I9l4CQQrT3Cw=;
        b=iGrFLxOE5b4GbAeKdKtfAeHTyzZN+5N6IQVdmv7dYiA4MU51CrmNTxkIKnbIVicXoV
         u7ngKjCktwFQpQVqz4sa6dKhEmHlEN2DmXoYbTCsbubFsho5euiYYFpSm4EGezq732vS
         TQVZWUE7p9wm0ZBcSDPC4tCtZc53P7YK/kia65JW3fPmFNFnFo59xsrgNZieDl1pGG8D
         QyCYL06J98k7EQjG+kkmnY8w+r013+4PAG9568d8xQy/Vno8o4LTbXIct38jmQy7G8Gz
         FygZYnVA5GzMHyv59gwaRNoQFzhrR/7uqMBGceqd7VThI+eZOsbjlLucv+/ixMbrqizA
         hZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/kVuJwIpuGoR2X/v5CrgZvYK8YoyN5I9l4CQQrT3Cw=;
        b=Madn0vFKac2Itk2g/CDchCRryIxZWPG8sAfb8LKo8hxDppht045VQsIZKK/p/K+b/v
         O00Amr+8i+Mva+L3l4H2VUl7fZMouN/PaRD47NYhA8hMfvo+emPF0+ZhB56cLhbCKeE7
         cS95p56pvUUjLCF5t1Nma7oo7fID70ccO89ycHcW/RCIP67ntl5CDqWWl/HVwd8mrVrP
         fYqlBHPnOg91tjdHtHHkNJE0gbtdpV5lO4kzilPb1KBLWaaXaiMEHI0DFARs5DemheLt
         oscA+KbMpOWhYyBkxhY63b3oWyfBE6fzETnSC8Pr9DusyJCueh5BvssyLi13VrXz+bkb
         mczQ==
X-Gm-Message-State: AOAM531Ayw4vlUpq+muaQwKlylHRbsFcUk3PQrdUhrSBmIonEQXKb/BZ
	MkObiAF89i2QKepoVQkV32oF6U6n0JRl+YRZ94c=
X-Google-Smtp-Source: 
 ABdhPJxcC5QqNBpmZdi2sAHGAETGY3CMKMWBFVgq+aK/XOfggembVhgZpGjvBbTNfi9ycGA6I/GYT/51Wh9BmtMG31k=
X-Received: by 2002:a05:6122:b41:b0:332:f05d:efcf with SMTP id
 1-20020a0561220b4100b00332f05defcfmr8950209vko.30.1646210945424; Wed, 02 Mar
 2022 00:49:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646204967.git.liezhi.yang@windriver.com>
 <d4b25c6c4a2a48da96da92bd03fe060e0cb37547.1646204967.git.liezhi.yang@windriver.com>
 <CANNYZj8Qd9uDCKQ2M_X35O__2MeiSJEP9A1J9TJzZsi+y6OCOw@mail.gmail.com>
 <88666595-4acf-5d7e-eb4b-23cd28b9929d@windriver.com>
In-Reply-To: <88666595-4acf-5d7e-eb4b-23cd28b9929d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Mar 2022 09:48:54 +0100
Message-ID: 
 <CANNYZj-MEo1k9sH+qkN=kewT0B52scf6ZRWPsj-rvBO+dHxxnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] perl: Makefile.PL: Fix _PATH_LOG for
 deterministic build
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 08:49:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162598

Yes, but you do not need to submit the patch for inclusion, only to
file a ticket, and ask upstream what can be done about the issue.

Alex

On Wed, 2 Mar 2022 at 09:47, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Hi
>
> On 3/2/22 4:42 PM, Alexander Kanavin wrote:
> > Can you file a ticket upstream for this please, and include the link
> > in the patch?
> >
>
> This patch won't work for upstream, only work by cross building, let me check on
> how to make it work for all cases.
>
> // Robert
>
>
> > Alex
> >
> > On Wed, 2 Mar 2022 at 08:13, Robert Yang <liezhi.yang@windriver.com> wrote:
> >>
> >> It checks host's path such as /dev/log and uses it, this doesn't make sense for
> >> cross build, and it causes undeterministic, for example, the contianer os
> >> usually doesn't have /dev/log which leads to a different build result since
> >> other host usually has /dev/log, so make it always use the default value to fix
> >> the issue.
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch | 34 +++++++++++++++++++
> >>   meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
> >>   2 files changed, 35 insertions(+)
> >>   create mode 100644 meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
> >>
> >> diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
> >> new file mode 100644
> >> index 00000000000..f6bcbce6856
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
> >> @@ -0,0 +1,34 @@
> >> +From a73fff1fcf0def4ce93964f1b63fe3ad0967259d Mon Sep 17 00:00:00 2001
> >> +From: Robert Yang <liezhi.yang@windriver.com>
> >> +Date: Fri, 18 Feb 2022 09:44:26 +0000
> >> +Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
> >> +
> >> +It checks host's path such as /dev/log and uses it, this doesn't make sense for
> >> +cross build, and it causes undeterministic, for example, the contianer os
> >> +usually doesn't have /dev/log which leads to a different build result since
> >> +other host usually has /dev/log, so make it always use the default value to fix
> >> +the issue.
> >> +
> >> +Upstream-Status:Inappropriate [OE specific]
> >> +
> >> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> +---
> >> + cpan/Sys-Syslog/Makefile.PL | 2 ++
> >> + 1 file changed, 2 insertions(+)
> >> +
> >> +diff --git a/cpan/Sys-Syslog/Makefile.PL b/cpan/Sys-Syslog/Makefile.PL
> >> +index d09ba69..d44e58c 100644
> >> +--- a/cpan/Sys-Syslog/Makefile.PL
> >> ++++ b/cpan/Sys-Syslog/Makefile.PL
> >> +@@ -130,6 +130,8 @@ else {
> >> +     $_PATH_LOG = "";
> >> + }
> >> +
> >> ++# OE specific
> >> ++$_PATH_LOG = "";
> >> +
> >> + # if possible, generate the code that handles the constants with
> >> + # ExtUtils::Constant, otherwise use cached copy in fallback/
> >> +--
> >> +2.31.1
> >> +
> >> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> >> index a97da872032..8a1db7ed359 100644
> >> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> >> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> >> @@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
> >>              file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
> >>              file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
> >>              file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
> >> +           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
> >>              "
> >>   SRC_URI:append:class-native = " \
> >>              file://perl-configpm-switch.patch \
> >> --
> >> 2.31.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#162590): https://lists.openembedded.org/g/openembedded-core/message/162590
> >> Mute This Topic: https://lists.openembedded.org/mt/89496472/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>


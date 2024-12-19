Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA97EE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 13:36:33 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.128907.1734615385885669927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 05:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x/gOUN5P;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eff5ad69a1so6861497b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734615385; x=1735220185; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3XWLofzog+9c3OarjuSRF0QjcujQyhPXkoYL0AtU3M=;
        b=x/gOUN5P1C6COWr/uqDhPaiys7ms8RFYNQGqHYjjIZxPQPwdpwPjG5VCI5xxpB0PyP
         K9rDruzrpYsHPH1JGlMz2dcFDOgEy5e0a3UHhqLxf0ti/Nr32cZub8sHliwpdVJnDpEI
         P5aJWy/2DwyckIK2eWSValmEkI5pc9rgYOlpheZ2o2KQg1cZJMGT3gDnvruQiCc92yB3
         UZ3WrjSlENIJAv9uv2znUKzIbI9+ouU1CKBFhiKqM6MEE8v0bTJIMxMZt9xxLMAXYANu
         rwXzZEnmoRyvMUjVT1lar9lrsW/n+R0MLt5PBqd+bI8+KEO0iWpW2kKHGULScVjnIJ70
         Zdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734615385; x=1735220185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3XWLofzog+9c3OarjuSRF0QjcujQyhPXkoYL0AtU3M=;
        b=rB5qskai1MAp0qz1tnY4K/dA9Q8EGwOrE8LZba2TYh4C8hOjGXncs4Jrc6yqLDetI3
         nKC+qUPfKtjY4FxLoGwdhGhC+KMHs2oYUi7bSvkwBzR9R5zCi+OGSOtfkfiF8Zokcav8
         gxzOD2J/ktHvY+81c6zZ358Fbw4QlESWWy4BXswYzPBAC+53JciHK4BUrWjk8Kfb4RNh
         FojX61pgPqplV0lztBLU20gpj0ZqzRk32snwzH5Nx/GbSomx5YJt6/LOt2Y+bC1gI6r8
         biOP56sPK1Em7W12W+61sm5gBrev/rRWWZ1+ggaaqbVw/rMZvB19baBQ9vq9a+OhsAa6
         JfUA==
X-Gm-Message-State: AOJu0YyuVUdIwq+q7Im92z1A44td3I4v0YuJkUjktmfjxLDafbgZR3II
	sAb3pxEtF4qasl6VHyHuMf/aRF1ojcdSZZmN7NGEyXGk+85vguu1tV5PuctGvz0298t3MuF9EUE
	8vDImph4VL860dzfNPKaaMCN+f6ki9jtvN2r1iA==
X-Gm-Gg: ASbGncth6Q4Gvjo3/2/ISKMU7ttvnDeMuk8ShdPF4MImpHTPe+0cFiEmzsm/Y0t9ih7
	VaHvEndgcm3/jNzirC2BgUAez83/LH/6RGE7pUQ==
X-Google-Smtp-Source: AGHT+IH2V22jLcoEKHtE5NUye2S8/XAwWaEU3ijAiyKq6cgYPKQE7GyvryXvnfO8Rn1H6tTaY+kkrQ17nt4k7S+ObaA=
X-Received: by 2002:a05:690c:4884:b0:6ef:e390:95ee with SMTP id
 00721157ae682-6f3ccc25aacmr59428537b3.3.1734615384961; Thu, 19 Dec 2024
 05:36:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1734553652.git.steve@sakoman.com> <fb0653a8b95be95eb2553b7c939444683cb11eed.1734553652.git.steve@sakoman.com>
 <CADkTA4NqRrK9Myu+Xt1e+87jDcAsNO_y68i=KHLjC5oWbJHzuA@mail.gmail.com>
In-Reply-To: <CADkTA4NqRrK9Myu+Xt1e+87jDcAsNO_y68i=KHLjC5oWbJHzuA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 19 Dec 2024 05:36:14 -0800
Message-ID: <CAOSpxdb+MwZLN-Ph=V=CNdTibnSYYujOOMw8WgRRr_ORLBb++A@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 09/10] kern-tools-native: fix SyntaxWarning
 for RegEx calls on Python 3.12
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 13:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208908

On Wed, Dec 18, 2024 at 8:04=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> Please don't take this patch in this format.
>
> Once I've approved and merged the changes into the kern-tools, there will
> be a SRCREV update.
>
> So this is a NACK/

Got it!  Thanks for reviewing.

Steve

> On Wed, Dec 18, 2024 at 5:02=E2=80=AFPM Steve Sakoman via lists.openembed=
ded.org <steve=3Dsakoman.com@lists.openembedded.org> wrote:
>>
>> From: Hongxu Jia <hongxu.jia@windriver.com>
>>
>> Python 3.12 emmits a SyntaxWarning when using unescaped
>> character inside a RegEx string.
>> '''
>> recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid =
escape sequence '\.'
>>   if re.match( ".*\.config", opt ):
>> recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid =
escape sequence '\w'
>>   x =3D re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Con=
figuration", line )
>> recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid =
escape sequence '\s'
>>   if re.search( "^#\s*CONFIG_", option ):
>> '''
>>
>> According to [1], use raw strings for regular expression
>>
>> [1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-change=
s
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  ...yntaxWarning-for-RegEx-calls-on-Pyth.patch | 60 +++++++++++++++++++
>>  .../kern-tools/kern-tools-native_git.bb       |  4 +-
>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-kernel/kern-tools/files/0001-symbol_why=
-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch
>>
>> diff --git a/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-Sy=
ntaxWarning-for-RegEx-calls-on-Pyth.patch b/meta/recipes-kernel/kern-tools/=
files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch
>> new file mode 100644
>> index 0000000000..e87067c8ac
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWar=
ning-for-RegEx-calls-on-Pyth.patch
>> @@ -0,0 +1,60 @@
>> +From 1f64368e4e82e47cd0e0dfe37b0e1b8958566d21 Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Tue, 17 Dec 2024 01:25:29 -0800
>> +Subject: [PATCH] symbol_why: fix SyntaxWarning for RegEx calls on Pytho=
n 3.12
>> +
>> +Python 3.12 emmits a SyntaxWarning when using unescaped
>> +character inside a RegEx string.
>> +'''
>> +recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid=
 escape sequence '\.'
>> +  if re.match( ".*\.config", opt ):
>> +recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid=
 escape sequence '\w'
>> +  x =3D re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Co=
nfiguration", line )
>> +recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid=
 escape sequence '\s'
>> +  if re.search( "^#\s*CONFIG_", option ):
>> +'''
>> +
>> +According to [1], use raw strings for regular expression
>> +
>> +[1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-chang=
es
>> +
>> +Upstream-Status: Submitted [linux-yocto@lists.yoctoproject.org]
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + tools/symbol_why.py | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/tools/symbol_why.py b/tools/symbol_why.py
>> +index 326e84f..4864378 100755
>> +--- a/tools/symbol_why.py
>> ++++ b/tools/symbol_why.py
>> +@@ -158,7 +158,7 @@ for opt in args.args:
>> +     elif re.match( "--ksrc=3D*", opt):
>> +         temp, ksrc =3D opt.split('=3D', 2)
>> +     else:
>> +-        if re.match( ".*\.config", opt ):
>> ++        if re.match( r".*\.config", opt ):
>> +             dotconfig=3Dopt
>> +         elif not ksrc:
>> +             ksrc=3Dopt
>> +@@ -213,7 +213,7 @@ if not os.getenv("KERNELVERSION"):
>> +     hconfig =3D open( dotconfig )
>> +     for line in hconfig:
>> +         line =3D line.rstrip()
>> +-        x =3D re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Ke=
rnel Configuration", line )
>> ++        x =3D re.match( r"^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*K=
ernel Configuration", line )
>> +         if x:
>> +             os.environ["KERNELVERSION"] =3D x.group(1)
>> +             if verbose:
>> +@@ -492,7 +492,7 @@ def split_option( config_option_str ):
>> +         opt =3D m.group(1)
>> +         val =3D m.group(2)
>> +     except:
>> +-        if re.search( "^#\s*CONFIG_", option ):
>> ++        if re.search( r"^#\s*CONFIG_", option ):
>> +             # print( "option is a is not set!!! %s" % option )
>> +             m =3D re.match(r"# (CONFIG_[^ ]+) is not set", option )
>> +             if m:
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/m=
eta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index 8eff00821a..7d11889eda 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -16,7 +16,9 @@ PV =3D "0.3+git"
>>
>>  inherit native
>>
>> -SRC_URI =3D "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=
=3Dmaster;protocol=3Dhttps"
>> +SRC_URI =3D "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=
=3Dmaster;protocol=3Dhttps \
>> +           file://0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-=
Pyth.patch \
>> +"
>>  S =3D "${WORKDIR}/git"
>>
>>  do_configure() {
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208889): https://lists.openembedded.org/g/openembedd=
ed-core/message/208889
>> Mute This Topic: https://lists.openembedded.org/mt/110188794/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [b=
ruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B9EEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 14:41:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.25735.1688654502008121209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 07:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jW7uhHDl;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso1142455e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 07:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688654500; x=1691246500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ohDDjHppe/afcnmBbU9rRWbsS3YN4IL6KgYzTp5uqc=;
        b=jW7uhHDl2EsBNrDJWigbAKMjBBhWAg76mKG7Cud+bqHdnL2uRxfahwQ1JX5XmTg/86
         xnYMk/B9uCbplvzlDlbj0NK2ZKHpfrBG/e/DHIsBxsjwrId1k+VeGbwxgFMGbu+As6NN
         mYR4scnYi1l2/+qFy7G4K6cUshWPBoEzfQn/6IbQ1H3/HgyFZdCUK+ApMYWcuroCctVc
         nTjuuy0qke08PMDOlPKyD3YP18ubyIRC3wsrRTnYUqA2jEG0e8eECWL3zscwP+EvPs9j
         EgyXCbHZB5vHgDyBDmI8S2Yyph4nV4lWVFGVS8XZuUrNTBYPgg7PwR0b1eDrcsY9CZiz
         MDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688654500; x=1691246500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ohDDjHppe/afcnmBbU9rRWbsS3YN4IL6KgYzTp5uqc=;
        b=HFJMu+COolYjkIEDdyBE8bGEfmx68oGsSNaekxr4St4yjzUPO+OVZNWgZvsWf9bfP8
         gtZcLsnLUh4qU+6hv9/mk/Hh8dYF8f8swsINEiAI1zixiCE814mmKOwgZiiShweMW6vT
         HeZqdhgjUMkmw034ZxtWy6IlAMaSJ4omUMCZnRttvCFREnneF9y2wtXK/NbpymCtEdEc
         Qd1J5SU+Bxo6z1ozFUck6jw7r/Xjibq0I1yXsXRknhcYIkJAtp+Vkq1fl7tEh2GOSI+X
         m+YUx5e+CTbORbdmLQBLlh6j67zfOBt/PPOZwqfyKSbKLOL2nLruz28N1VjaXVZ1R1t/
         YNVA==
X-Gm-Message-State: ABy/qLYEV/vjPqp/HJymdCSM1uvPmo1hROO1RBZe+JGndzFnxyM5o/Hf
	Bza+OVO3C+gwqNaJVqlWpuKKxxmhGuf/rnwXFRQ=
X-Google-Smtp-Source: APBJJlEqnMe8kLNyKwAs9YzEHjnkGGfAGG5C0XV//7HoAhFFiSmudFjQnbS1kyy/MZsrPACTDCN5U4h2MxC+9d0UtDs=
X-Received: by 2002:ac2:5f86:0:b0:4fb:7c40:9f95 with SMTP id
 r6-20020ac25f86000000b004fb7c409f95mr1514599lfe.47.1688654499837; Thu, 06 Jul
 2023 07:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
 <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com> <5633c982-9553-5ee8-167c-04c56577d5e5@baylibre.com>
In-Reply-To: <5633c982-9553-5ee8-167c-04c56577d5e5@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jul 2023 16:41:28 +0200
Message-ID: <CANNYZj8PW4efL+U1b6HJwyD+24AT3eaYQRxKz5Ai98x1pVbh5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 14:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183951

The issue here seems to be that python ptest failures are not reported
as such? Does '-c testimage' succeed for you, and do the logs for it
then still contain the fails? That lack of fail reporting must be
addressed first, then we can look into the fails themselves.

We have plenty of ptests which do pull in the target toolchain (that's
why you always see it building even for images that aren't going to
have it), so I dont think it would be a problem for python.

Alex

On Thu, 6 Jul 2023 at 16:30, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>
> On 2023-07-06 09:50, Alexander Kanavin wrote:
> > I don't understand. We run python ptest all the time, and it doesn't
> > report fails, so why do we need to disable tests that aren't being
> > reported as failing?
>
> This is what I see when running the ptests with core-image-ptest-python3
> (I've already got another patch in to fix the cgitb and zipapp failures):
>
> ----------------------------------------------------------------------
> Ran 210 tests in 0.382s
>
> OK (skipped=26)
>
> == Tests result: FAILURE ==
>
> 403 tests OK.
>
> 3 tests failed:
>      test_cgitb test_cppext test_zipapp
>
> 28 tests skipped:
>      test_asdl_parser test_check_c_globals test_clinic test_curses
>      test_devpoll test_gdb test_idle test_kqueue test_launcher
>      test_msilib test_ossaudiodev test_readline test_smtpnet
>      test_socketserver test_startfile test_tcl test_tix test_tk
>      test_ttk_guionly test_ttk_textonly test_turtle test_urllib2net
>      test_urllibnet test_winconsoleio test_winreg test_winsound
>      test_xmlrpc_net test_zipfile64
>
> Total duration: 23 min 1 sec
> Tests result: FAILURE
>
> >
> > Besides that, I believe that yes, adding toolchain bits to the image
> > is actually fine.
>
> It could be. I discussed this with RP and thought he didn't want to be
> adding those dependencies for python3 ptests, but I may have
> misunderstood, so maybe when he's back we can discuss it. The
> core-image-sato-sdk image doesn't have this problem.
>
> Trevor
>
> >
> > Alex
> >
> > On Thu, 6 Jul 2023 at 15:46, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> >> This ptest requires gcc, g++, and binutils to pass. This is a lot to add
> >> for one test, so disable it instead.
> >>
> >> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >> ---
> >>   ...-test_cppext-omit-from-python3-ptest.patch | 37 +++++++++++++++++++
> >>   .../recipes-devtools/python/python3_3.11.4.bb |  1 +
> >>   2 files changed, 38 insertions(+)
> >>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
> >>
> >> diff --git a/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
> >> new file mode 100644
> >> index 0000000000..9fca815368
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
> >> @@ -0,0 +1,37 @@
> >> +From 11f77795efa9aa15b0459006a16e3bbc72ec69b9 Mon Sep 17 00:00:00 2001
> >> +From: Trevor Gamblin <tgamblin@baylibre.com>
> >> +Date: Wed, 5 Jul 2023 14:29:33 -0400
> >> +Subject: [PATCH] test_cppext: omit from python3 ptest
> >> +
> >> +These tests fail when running python3 ptests because gcc, g++, and
> >> +binutils aren't present. This is a lot to add to the RDEPENDS, so
> >> +disable the tests instead.
> >> +
> >> +[YOCTO # 13298]
> >> +
> >> +Upstream-Status: Inappropriate (OE-Specific)
> >> +
> >> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >> +---
> >> + Lib/test/test_cppext.py | 2 ++
> >> + 1 file changed, 2 insertions(+)
> >> +
> >> +diff --git a/Lib/test/test_cppext.py b/Lib/test/test_cppext.py
> >> +index 465894d24e..93b71d5100 100644
> >> +--- a/Lib/test/test_cppext.py
> >> ++++ b/Lib/test/test_cppext.py
> >> +@@ -17,9 +17,11 @@
> >> +
> >> + @support.requires_subprocess()
> >> + class TestCPPExt(unittest.TestCase):
> >> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
> >> +     def test_build_cpp11(self):
> >> +         self.check_build(False, '_testcpp11ext')
> >> +
> >> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
> >> +     def test_build_cpp03(self):
> >> +         self.check_build(True, '_testcpp03ext')
> >> +
> >> +--
> >> +2.41.0
> >> +
> >> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
> >> index 6b074c48cf..6a471e706d 100644
> >> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
> >> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
> >> @@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >>              file://deterministic_imports.patch \
> >>              file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
> >>              file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
> >> +           file://0001-test_cppext-omit-from-python3-ptest.patch \
> >>              "
> >>
> >>   SRC_URI:append:class-native = " \
> >> --
> >> 2.41.0
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#183947): https://lists.openembedded.org/g/openembedded-core/message/183947
> >> Mute This Topic: https://lists.openembedded.org/mt/99985618/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>


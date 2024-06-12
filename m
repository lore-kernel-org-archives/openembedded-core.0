Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44BDC27C77
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 16:54:57 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.1531.1718211290418885450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 09:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9rO2CIo;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6f8d0a00a35so21440a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718211289; x=1718816089; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEgJeQ6JW81I0HfuAz5CmKPYU+zaVECS5Ae7EifXYWE=;
        b=Q9rO2CIoE+yLY/Vq5kuw1RVUcIxCEK18QNLQbRo6spxrZOt3iBFu1xo6fWDAgyeMHm
         ohxfUy2QkoChgG3LooT283kaZt6zyg4lr2lnhK4v+29v5OYQRdbihA/8LmlieVA/VVaw
         5RgzrHJfQncs8OjZ3mVgzKSWv0tisjmjQ+64xlavoUl9FKLjYJxJJac3XOslIlRCRGqx
         /kTf3Ia5XkzAbvtdB21iAHNs+YH6wXiuaeIMFthMqRHeSF17HJzNhcRbjj7Nodjqz0Yi
         g1SFbS26eoE6aSLNW0ykj1wSchAFWbOnExRwaot2z2IHqWxMAET5ABAZkjWCmwI7h7pI
         x4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211289; x=1718816089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEgJeQ6JW81I0HfuAz5CmKPYU+zaVECS5Ae7EifXYWE=;
        b=ar656mXyZC2Nx5gLlfhXQUkt9lVouiZQpqENtOsSKatENgnLDX98ijlNnYaOd0xWTS
         9l+8c2BEO9borFh8G8rfwqv0UDKzkmFpYczMg6ceMTB+feTaxJei3oyqP05623cg9WiW
         8/SF50KHm7IrHEu1iORAd2FMNth+2LmpvzdLD+A2pp5FuV+MpWoxhZEjO0aDi6ZtdXoN
         pNSlWJJHPMH38ffolxYZcmx7OsbHJrMy5R8NYzVSA8LoR9wRuQykdDUaqfWabiWVwcic
         hM8TTdvpMgz7BJMHjOTOkqCxSpkFGH4ydn9MUpS/WOolG+2Y9b/TmNt8zUGvb2Bu+39l
         frOg==
X-Gm-Message-State: AOJu0Yx3tEu6klTb8ewfQhv4LliEcM9qwexG8ynpfKUXkJW6rXumLYVC
	E5PXGkKWKCzCmFVERZvcEgIN1kwWfan0WFuy2UKqx0WrNKbOEqPMj0HQUBEP9rEfCQrsqyOdu2Q
	cxO7Y0zeERFHrmo+89y42TJhNSiQ=
X-Google-Smtp-Source: AGHT+IFe8ftYOxjZG2kYTlPFjxENtajg+NFq/G8K+aeBqpRReknEigxyVUWT2LqMp4xHCKY2KWAxyKPOc6I4PPyJY98=
X-Received: by 2002:a05:6870:7193:b0:254:c41a:2b29 with SMTP id
 586e51a60fabf-25514c02defmr2498084fac.13.1718211289400; Wed, 12 Jun 2024
 09:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240612150528.173057-1-tgamblin@baylibre.com> <9962354a-e69a-4167-805b-b831bad5cbf0@baylibre.com>
In-Reply-To: <9962354a-e69a-4167-805b-b831bad5cbf0@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jun 2024 09:54:21 -0700
Message-ID: <CAMKF1souNPJUfkZtOoZk8weERSKor2dSq-=T3TMdrhocLQssag@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: skip test_concurrent_futures/test_deadlock
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 16:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200577

On Wed, Jun 12, 2024 at 8:10=E2=80=AFAM Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
>
> On 2024-06-12 11:05 a.m., Trevor Gamblin wrote:
> > These tests are causing hangs on the Autobuilder, so disable them for
> > now.
>
> Note that this was submitted for the 3.12.4 patch sent recently, so
> it'll need to go on master-next with that.
>
> >
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ---
> >   ...-test_deadlock-skip-problematic-test.patch | 30 ++++++++++++++++++=
+
> >   .../recipes-devtools/python/python3_3.12.4.bb |  1 +
> >   2 files changed, 31 insertions(+)
> >   create mode 100644 meta/recipes-devtools/python/python3/0001-test_dea=
dlock-skip-problematic-test.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-sk=
ip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_=
deadlock-skip-problematic-test.patch
> > new file mode 100644
> > index 0000000000..f0a7cfd39b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-prob=
lematic-test.patch
> > @@ -0,0 +1,30 @@
> > +From d7e3f26e7094fbe20e2271d75f18ac3b23a67f58 Mon Sep 17 00:00:00 2001
> > +From: Trevor Gamblin <tgamblin@baylibre.com>
> > +Date: Wed, 12 Jun 2024 10:29:03 -0400
> > +Subject: [PATCH] test_deadlock: skip problematic test
> > +
> > +This test hangs frequently when run on the Autobuilder. Disable it in
> > +testing until the cause can be determined.
> > +

I wonder if it is something like -
https://github.com/python/cpython/issues/109832


> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> > +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > +---
> > + Lib/test/test_concurrent_futures/test_deadlock.py | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/t=
est/test_concurrent_futures/test_deadlock.py
> > +index 1db4cd0099..fd07895a17 100644
> > +--- a/Lib/test/test_concurrent_futures/test_deadlock.py
> > ++++ b/Lib/test/test_concurrent_futures/test_deadlock.py
> > +@@ -90,6 +90,7 @@ def __reduce__(self):
> > +         return _raise_error_ignore_stderr, (UnpicklingError, )
> > +
> > +
> > ++@unittest.skip("skipping problematic test")
> > + class ExecutorDeadlockTest:
> > +     TIMEOUT =3D support.LONG_TIMEOUT
> > +
> > +--
> > +2.45.2
> > +
> > diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/reci=
pes-devtools/python/python3_3.12.4.bb
> > index 49c134fc7c..64cd5d0bc0 100644
> > --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> > +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
> > @@ -31,6 +31,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/P=
ython-${PV}.tar.xz \
> >              file://0001-test_storlines-skip-due-to-load-variability.pa=
tch \
> >              file://0001-test_shutdown-skip-problematic-test.patch \
> >              file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as=
-failu.patch \
> > +        file://0001-test_deadlock-skip-problematic-test.patch \
> >              "
> >
> >   SRC_URI:append:class-native =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200576): https://lists.openembedded.org/g/openembedde=
d-core/message/200576
> Mute This Topic: https://lists.openembedded.org/mt/106633970/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


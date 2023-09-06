Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE1FEB8FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 13:33:33 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.9078.1694007203667399250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 06:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P7g3oWh4;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so6133347e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694007202; x=1694612002; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IBNLbwLREaK15Dcb6pwI4gy6LZ0YmsCH8JMyupT/Qg0=;
        b=P7g3oWh40OV8/Jlv7VBIN9+nlIXohyvfHlY5Qr6AWmjxthj6fFApQaSR6kyJndaijA
         GX3FEoeilZm8p7JgZsW23DmyDPQEc0hYH11N4SCW+ZVHu6JYw3hJoDFAz2YQd2ntmV3F
         y2FnIfxR+TJB+/cB4/mGGIEhMs9rTaxYI9oaeR6xD2sTkWYxZsvsrENlsXEbO4XtcB4a
         dKKq0KbBkHYfP21zryGHGYx0E9Fk/R9Y5ZQgR4min5Jfsy382F6hoAbykT9h9A/0A5Tp
         eoJ41582Sr3jsj7BJLYonAMbIEodAPXNJLvWjTnvqLqScyB3Gj5PlQQG8YqzNpkJ4xgk
         j8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694007202; x=1694612002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBNLbwLREaK15Dcb6pwI4gy6LZ0YmsCH8JMyupT/Qg0=;
        b=W2eShZbhGCgo0ihzGtHUQHV0+nyFrL3k0B61iZoa4KyoGU5Sil+KPwvUs9MHchFIlS
         2EyLZjm6w7Rwy4aGKzTt7OHA9MvZy5MNs55UoU0lcT0o5NAW4XbfIIlzZcQXAEglKnEi
         mOltuqkMo0OT5CUQRikLUQQxsmSvTo05mJeIF5ZGWzI+f8ScQnQLNKPEVzXU0kPJW6HD
         /r3f4jibaK5LVRhOMedvND9UkSpp3kjgzaVt2rr2FuTDGa4FOq340Jlw0LgxLahBAG9c
         OOwA0Uvp8cQsgEDUCOoqnQP9vJERnjRwY0gJ75m2sgvQitJzfNwX83FHW/rNyFcoJLqF
         jsHQ==
X-Gm-Message-State: AOJu0YwBzDW6ayMat4Sml+Le0TEwThUakZWJGqzHAC+p7iCuvDg0bx0C
	8P8GQuhgoq1V8Zm7p4mFDwukB8DPO7Td5xwonUc=
X-Google-Smtp-Source: AGHT+IERHAktshLFnU6IYH2T6v4zqvCQHs2GP0mi3+OQuh1jGfkmc9U4PAGLZhSR9MSSvb2e+2rHoUlOwc5Z0y6Q0vU=
X-Received: by 2002:a19:c21a:0:b0:4fb:911b:4e19 with SMTP id
 l26-20020a19c21a000000b004fb911b4e19mr2087956lfc.35.1694007201549; Wed, 06
 Sep 2023 06:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230906132311.1710272-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230906132311.1710272-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 15:33:09 +0200
Message-ID: <CANNYZj_vyqj1Aus=J=+R=fSr0uxoTH2wOA3_PEHyu6zVuqn9Pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: capture ptest regression test failure logs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187316

Please submit upstream at the same time you submit here.

With openssh it's not complicated: https://github.com/openssh/openssh-portable

Alex


On Wed, 6 Sept 2023 at 15:23, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> When tests fail, capture the sshd and ssh client logs from
> the failing test run. These are needed to investigate
> the root cause.
>
> Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ...ss-Makefile-print-logs-if-test-fails.patch | 34 +++++++++++++++++++
>  .../openssh/openssh_9.4p1.bb                  |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
> new file mode 100644
> index 0000000000..bcadbbed0b
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
> @@ -0,0 +1,34 @@
> +From 554f7baed050f89ffc2a7192d3071e8c5420f6d3 Mon Sep 17 00:00:00 2001
> +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Date: Fri, 25 Aug 2023 10:35:28 +0000
> +Subject: [PATCH] openssh regress/Makefile: print logs if test fails
> +
> +Some tests are failing in CI runs and reproduction has failed. Print
> +the captured sshd and ssh client logs if test fails. This should
> +help to fix the root causes.
> +
> +Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +---
> + regress/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/regress/Makefile b/regress/Makefile
> +index d80bf59..a972dff 100644
> +--- a/regress/Makefile
> ++++ b/regress/Makefile
> +@@ -229,7 +229,7 @@ t-exec:    ${LTESTS:=.sh}
> +               done; \
> +               if [ "x$${skip}" = "xno" ]; then \
> +                       echo "run test $${TEST}" ... 1>&2; \
> +-                      (env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || exit $$?; \
> ++                      (env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || (echo return value: $$?; echo capturing logs; cat *.log; exit 1); \
> +               else \
> +                       echo skip test $${TEST} 1>&2; \
> +               fi; \
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> index 3f232a839d..2c85780e4d 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
> +           file://0001-openssh-regress-Makefile-print-logs-if-test-fails.patch \
>             "
>  SRC_URI[sha256sum] = "3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187315): https://lists.openembedded.org/g/openembedded-core/message/187315
> Mute This Topic: https://lists.openembedded.org/mt/101192324/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


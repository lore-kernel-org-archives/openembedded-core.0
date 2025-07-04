Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D07FC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:18:56 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.8661.1751620729785567808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q4iJ5m2T;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ff16e97d1eso25900056d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620729; x=1752225529; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjx83fx8uY+9I0nad+OJocP5lFAUZS1zL2Xy/LJeE5s=;
        b=Q4iJ5m2Ts53L3hf9u9vp5Bpc33vdEr/sq4z5ZrE7/7kckXVissBKSdURry0aOyxl+t
         N5cmYQnfpXklVraYAj8lyfOWLSgWvuuf+HO2qOdTqdybMI+LV8lOWOUMaKMuTFq3tsiv
         CkNumWAb/dzpSfwk33JF4P3OJheLCnOWwt9fuGLoiFrltMnRz2rXG/johq2uN8m6O05s
         TpwnHZ/AVHpAFTNMAYlvJ4i06se5G4oLlHh8q3mfcz5FxWmfsZCob+/EDfiUYx349Shc
         M16QwXzD/H2RGEqcq/rItiwajpFrZ8M09xlTdMa3OOXImIELH/5yRY3N6q/lQX9VICmJ
         a4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620729; x=1752225529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sjx83fx8uY+9I0nad+OJocP5lFAUZS1zL2Xy/LJeE5s=;
        b=i0Woh9RT6FFcNJuc4Mkk5QaK0zdXxZfJB0qcF+mTZK2lbAjktorKUpLLJZtT/l67lW
         64ziQ/mXhr/MlfKXr8z2tCWmr4kzbGpK94U5cheWnSuI5jU07IHW0CHm3spDXrFf/HaH
         PogyFXmHMP2HFjxobXDFg/POAbg9BVO4Otoej3Q+m87G9DUy2v3jlVg+s5rjpaTh52Op
         saMMvmGSmmEwU4Mds18JsljbZdCgOw+0ZkEggYSqvIH4RyYWU/2vld1ghS9UV7QVtj00
         Wo1+cBnmGmpG9w+9YdHhSqe2nhy13h2v8TR6FhmWyH5smOSntaBwFm+eaOAlR69Q/Olf
         zf5w==
X-Gm-Message-State: AOJu0YwAlEg7xnksHBklA9Gk4+9mJm4HhIiJJaj6+PmK2ZuZYsqOi+BE
	HHJoRL+AIgJ912gPh/mNyUkOi6Mabn5vZZRReJpaIKMFtiuSjyXe5+VbJiERhFZxHlIPY932fgp
	cXFgMFSEeqdk4b6mJsGWT+TjyVsbhlihuKg==
X-Gm-Gg: ASbGncthbNWp5KEY8Egx7i+lKJvEFo87TOu8HKLgaOY57rxxoTJlojwPCD/i2LAQjIl
	8lrLTOFWuLmICUxypWEnZhyOuuaIsb6CEdjlRAkHJgCRUf0joDAVRVjCCNWmAgiISzwb8LA2P5L
	s4ndc+zBoXu0PwP/0feLvljtEkLjvTOOPmmxJa/2yAcb38H3UUWMp1MranFOegf5R72TyVHewh0
	Eh3DQ==
X-Google-Smtp-Source: AGHT+IEjzVWDnrXBJQFJn2ovc793sPum4mLb9bz+8lJYh0xB/H45PjVuxNFPmGzU+WZi6YNpXOaxanXgwEAGldIxiWc=
X-Received: by 2002:a05:6214:390c:b0:702:c126:fa75 with SMTP id
 6a1803df08f44-702c57c0c31mr33467836d6.19.1751620728689; Fri, 04 Jul 2025
 02:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250704091015.707-1-wangmy@fujitsu.com> <20250704091015.707-2-wangmy@fujitsu.com>
In-Reply-To: <20250704091015.707-2-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Jul 2025 11:18:36 +0200
X-Gm-Features: Ac12FXzEQ9dnAUTnshaJq1tXFY_N3GjCKg7Gk078U054dLZvMkwqz-Wl_hu8SvY
Message-ID: <CANNYZj_-pU182ZTzH-qpTRwnJ9ZNAB9jX1wVtXifXED=1FtrfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] lttng-tools: upgrade 2.13.15 -> 2.14.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219911

On Fri, 4 Jul 2025 at 11:10, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-compat-Define-off64_t-as-off_t-on-linux.patch
> 0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
> removed since they're not available in 2.14.0
>
> 0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
> 0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
> removed since they're included in 2.14.0
>
> disable-tests.patch
> refreshed for 2.14.0
>
> 0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
> added to fix do_package error
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> @@ -84,10 +81,6 @@ do_install_ptest () {
>          install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
>      done
>
> -    for f in tests/utils/tap-driver.sh config/test-driver src/common/config/session.xsd src/common/mi-lttng-4.1.xsd; do
> -        install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
> -    done
> -

This removal needs to be explained.

Also it's good to try running ptests and verify they still run and pass.

Alex


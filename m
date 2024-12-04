Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C356E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 19:24:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.23685.1733340267171089629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 11:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2V8/WLd;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53dd57589c8so1381153e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733340265; x=1733945065; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TVPw73I9m85MGcoaHrt5UdTQLNnxUwXpJGQ+VcFu2g=;
        b=S2V8/WLdl4uwLUF0rSTOK8gdgknfBOpkS37JYQ2JhE1jwePX6g0yF1Ds7tiXYNuFxQ
         YR5mcteHF5dmAS76vd51JKIIFbEWbQrQlGVvSFaKMlZ4xOrys0/RCcvzO8QNsID82elL
         HbVwLLtF943tElztf4rLQhKao0g41UhD4x6VTRsYq0JkLclUJi78iOVSwLqDK2b28cnM
         5HlQkqs5qHN/Pc2Yn8swJp6iIAbQmtoSAhSyP6/7t+9OcfF4SHRT4cDWDggi++0rtxWT
         8uZsAXG5hgjsEizkNnCk5gZUW9ScG4vYlhhSp2Sd0qAK/Ii9jvKeVRMpw6vgHeVqMbyi
         iuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733340265; x=1733945065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TVPw73I9m85MGcoaHrt5UdTQLNnxUwXpJGQ+VcFu2g=;
        b=CE8sJstlC0VMNVN5Oj0a8YT37ic5poa4liUokvtxbvVM2W/0FCpuERnO1XtI1sSe7N
         ecF3HJEVVtC8/aK9hONFUoq4kEdtQOgiyJGzpMTATlYLDwsVM22W77u5Yswyx63gOr/h
         32hXdQ3daYcxRuew2AE9dtiSjq5dI5zdV7N0t/YCxXI0tvHyY3qfaGmRCh1xfNsBKbXC
         5o11ZY7CnU3DOn6OUeYJQFoPr0ET8fMOWDYi3HvGVSGPxiNdXVtT13vMlxFtPSadQCfR
         Rh4vUP7bJbCYrPW/UMACJsQm+fz7a6hj0E+eyh+UzlHfj/V/otPlMvoFfyVLgCYMKzB8
         Tfag==
X-Gm-Message-State: AOJu0YzselTyECARHusa6F9Enl8svuWOyeAtSXhB75gYH/A3eN2vwnev
	PLwiQv1vGtCFNYozeYTQmLY4mIGDsFjLv4LsNvz1zwvG/8LbfBhajyVs3aCLTnAEjVX1koc+Qv5
	PAVtUk6N4WAltFOD/UY+QKW57ocDHOg==
X-Gm-Gg: ASbGncuACAzDGo0DuVOA9+HLCOR5LqvK5xGrxjlbq7pinxUOou+OCVMnxiNdAzjgh/A
	ZdQnhBf9MWoCnrYeJyPuIUWeXLrENPoOgkUelRHCOhcbgaA==
X-Google-Smtp-Source: AGHT+IFn9pIJ56cmY5kxkDUxrnIxIfVMLnAawT0ppMlluxzAhwtZGEUtrrhHFirc/fFSdSkhSS4+aYHXpXrvBfAtfLc=
X-Received: by 2002:a19:e00c:0:b0:53e:134f:e948 with SMTP id
 2adb3069b0e04-53e2190a8a9mr144279e87.25.1733340264950; Wed, 04 Dec 2024
 11:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20241125081500.4048680-1-hongxu.jia@windriver.com> <20241125081500.4048680-4-hongxu.jia@windriver.com>
In-Reply-To: <20241125081500.4048680-4-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 4 Dec 2024 12:24:13 -0700
Message-ID: <CAJdd5GanQHGooSz0V1jV-NuDfKkdqjt1Ms2ZypYqvz5peP1=mA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 3/3] oeqa/selftest: Add SPDX 3.0 include source
 cases for core_image_minimal build
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 19:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208323

Is there some advantage to this patch over the test_gcc_include_source test=
?

On Mon, Nov 25, 2024 at 1:15=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> $ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
> 2024-11-09 09:17:54,600 - oe-selftest - INFO - Adding layer libraries:
> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta/lib
> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-yocto-b=
sp/lib
> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-selftes=
t/lib
> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/meta-openembedded=
/meta-oe/lib
> 2024-11-09 09:17:54,602 - oe-selftest - INFO - Checking base configuratio=
n is valid/parsable
> 2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include selftest.=
inc" in path-to/build_spdx3-st/conf/local.conf
> 2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2024-11-09 09:17:56,653 - oe-selftest - INFO - test_core_image_minimal_in=
clude_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
> 2024-11-09 10:41:16,654 - oe-selftest - INFO - Keepalive message
> 2024-11-09 11:37:53,091 - oe-selftest - INFO -  ... ok
> 2024-11-09 11:55:18,638 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2024-11-09 11:55:18,638 - oe-selftest - INFO - Ran 1 test in 9442.187s
> 2024-11-09 11:55:18,638 - oe-selftest - INFO - OK
> 2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS:
> 2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check=
.test_core_image_minimal_include_source: PASSED (8396.65s)
> 2024-11-09 11:55:35,490 - oe-selftest - INFO - SUMMARY:
> 2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 9442.187s
> 2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 8384070219..c785f5445f 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -174,6 +174,20 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
>          # Document should be fully linked
>          self.check_objset_missing_ids(objset)
>
> +    def test_core_image_minimal_include_source(self):
> +        objset =3D self.check_recipe_spdx(
> +            "core-image-minimal",
> +            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx=
.json",
> +            extraconf=3Dtextwrap.dedent(
> +                """\
> +                SPDX_INCLUDE_SOURCES =3D "1"
> +                """
> +            ),
> +        )
> +
> +        # Document should be fully linked
> +        self.check_objset_missing_ids(objset)
> +
>      def test_core_image_minimal_sdk(self):
>          objset =3D self.check_recipe_spdx(
>              "core-image-minimal",
> --
> 2.25.1
>


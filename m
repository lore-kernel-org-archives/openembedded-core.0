Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F520C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:24:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.11150.1645453496195066101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=iVzOmjGo;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id j22so1303817wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dcRWR1uGmLXkQXp4vd/KB/nuAm6yhL/PU8RlBfk3VYk=;
        b=iVzOmjGoWmItRML7OdepDphNigcqPiQ6WNFhNJkYO7FhjXoq9BT5WNrS59zMY2Z8zL
         hLKdPK+jLFH6XqnqDXZZNkYxzftBkdu7k+U7VfE4z7Y34Ok0mtk9A3z6TAKj2W0gnFSJ
         hfuANkcgApeh/1TdcnAtycCszR6x0+xZ6A4Qlnu5RD16jJwtS5WItj628TTiKxIMUdc5
         se4F11BLxDZ9zaRG1vKUfJw66u94GlMZgHcNCJ2bZJv3/pWZYyPciu9N+qK9+iSt7c9J
         5R8leFjKv0Dh34R526l1xt51zmNsQicfDl8wwk7YraQcE5L9wPonxw5yryTO4lY8wjl8
         e8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dcRWR1uGmLXkQXp4vd/KB/nuAm6yhL/PU8RlBfk3VYk=;
        b=kbnjKTCbHYeFp05EvSbu+dZ6CmEUrazKgoEpv6DV5ZMGrO2jY2keKzpWXBii+rGMCs
         cztvx5APQYI+StZqDIsKmojaMXssvMOITAOB8xUKPAbr0dL4IhOTpqtKI8Ajp6UJDFKT
         KFs1vFh3F39I2oIQsQ2aFTTxZWDIxPLDfCoWbXJSsO3cTeau4s/jgNOwEwL3o++unj/x
         Lysr+DJzblyeN/eiM/5ihFexMROZC5EbVBRiBq18LNDdkDGHLfUKPUDFg/FwsOhNxJM9
         qHWDD9UzUxrBvbIikrKWFjt5jLXIGPIgmF6X3A2uT++jiJwxCZ0pBP4VjeSfhp4GI3Qu
         sk6Q==
X-Gm-Message-State: AOAM530679PUIv6v/hDEZrlWQf41xgP6Qo+WIvNjIlG8UcreYQMbg1H9
	bJtIs20wRtN7UbM0s7GPB5sHcQk30ZKKeAjaiawmEg==
X-Google-Smtp-Source: 
 ABdhPJwN9ZHUWIi89/yQpzWFTJ1AV7z8qQAywTd4mQpDvonGwU5mSMXX4Zk6wKhoO59Xl6osVqANCd0PLDje6lACvFo=
X-Received: by 2002:adf:fd48:0:b0:1e4:99d8:48bd with SMTP id
 h8-20020adffd48000000b001e499d848bdmr15537025wrs.497.1645453494450; Mon, 21
 Feb 2022 06:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20220221085118.2267900-1-quaresma.jose@gmail.com>
In-Reply-To: <20220221085118.2267900-1-quaresma.jose@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 21 Feb 2022 14:24:43 +0000
Message-ID: 
 <CAAnfSTuxOD2LVkod3wTk7K=w_Q_6KjbYoa_-FqD1WHy0hqy0jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] meson.bbclass: add support for running
 the meson tests at build time
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:24:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162053

There are *so many* limitations of qemu-user I'm not sure this is
actually useful.

(speaking as someone who tried this with Python a while ago).

What recipes has this successfully worked on?

Ross

On Mon, 21 Feb 2022 at 08:51, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> The generic exe_wrapper introcuced in 40349dc5 can be used to run the
> meson tests when build the receipe. This patch add the meson_test task
> on the meson bbclass that adds this possibility.
>
> The exe_wrapper will run using the qemu usermode and because of that it
> has some limitations, so don't expect the same results when it runs
> natively on target.
>
> Running the tests at build time is upstream way for testing but is not
> possible in OE as we always croos-compile. This can be useful in some
> integration processes and for debuging and it adds the possibility to
> run the test in an interactive way using the devtool build for example.
>
> There are two variable for that:
>  MESON_QEMU_WRAPPER_TEST_ENABLED: this enables the test when it's "1"
>  EXTRA_OEMESON_TEST: this is used to add extra args
>
> Some results when using this patch in the bigest meson project
> on OE-core are the folloing:
>
> cat <<'EOF' >>conf/local.conf
> MESON_QEMU_WRAPPER_TEST_ENABLED:pn-systemd-boot = "1"
> EOF
>
> bitbake -c do_meson_test -v systemd-boot
>
> Ok:                 821
> Expected Fail:      0
> Fail:               95
> Unexpected Pass:    0
> Skipped:            33
> Timeout:            0
>
> cat <<'EOF' >>conf/local.conf
> MESON_QEMU_WRAPPER_TEST_ENABLED:pn-glib-2.0 = "1"
> EOF
>
> bitbake -c do_meson_test -v glib-2.0
>
> Ok:                 197
> Expected Fail:      0
> Fail:               76
> Unexpected Pass:    0
> Skipped:            0
> Timeout:            2
>
> cat <<'EOF' >>conf/local.conf
> MESON_QEMU_WRAPPER_TEST_ENABLED:pn-gstreamer1.0 = "1"
> EOF
>
> bitbake -c do_meson_test -v gstreamer1.0
>
> Ok:                 95
> Expected Fail:      0
> Fail:               10
> Unexpected Pass:    0
> Skipped:            1
> Timeout:            0
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/meson.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 0bfe945811..020a59a3c0 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -179,3 +179,19 @@ meson_do_install() {
>  }
>
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> +
> +EXTRA_OEMESON_TEST ?= ""
> +
> +do_meson_test() {
> +    bbwarn "don't expect the same results when it runs natively as it will run in qemu usermode (that has its own limitations)"
> +    meson test -C ${B} ${EXTRA_OEMESON_TEST}
> +}
> +do_meson_test[vardeps] += "EXTRA_OEMESON_TEST"
> +
> +MESON_QEMU_WRAPPER_RUNTEST = ""
> +MESON_QEMU_WRAPPER_RUNTEST:class-target = "${@d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') == '1' and d.getVar('EXEWRAPPER_ENABLED') == 'True'}"
> +
> +python() {
> +    if d.getVar('MESON_QEMU_WRAPPER_RUNTEST') == 'True':
> +       bb.build.addtask('meson_test', 'do_install', 'do_compile', d)
> +}
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162019): https://lists.openembedded.org/g/openembedded-core/message/162019
> Mute This Topic: https://lists.openembedded.org/mt/89289917/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


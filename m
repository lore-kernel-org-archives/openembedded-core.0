Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53773C54752
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:36:03 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.8862.1724834152946409543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=co8tfOnr;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5334e41c30bso6983980e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724834151; x=1725438951; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CORHnrAGhG299ECxpboMKxHUL6s+NpajtCWr/RhKZXg=;
        b=co8tfOnrmSLlkAJf42ElvrZqhVtnSImZdMvMcjF1xrSHqtHfs+UKQvCC9FsBRrvL2a
         2szFqUKZnzEVPedJAB8WbSju4u3N0i0Wduhje0/3KQDf45/oT0B2LpyL/XB7T+gKMBd5
         b6NyF7YM+B+UPKgNsAnDYoiI21FJpl2GZRKDRIh3WmN/0djCFMZdZxu5a78j0CQzFWpM
         rHZ+6Ivak48WaKc+o+tKlmLhMbCrt07SuiG5SLFLKfOr5fYGsbhqIo6jp3ui4kKFdjTi
         i02v1pUXJvov5fYV7CgIkSCpOEdCEQwLtABD+FuZip40kzDaLwOxQy6ql8hpW8+o5bLd
         xUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724834151; x=1725438951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CORHnrAGhG299ECxpboMKxHUL6s+NpajtCWr/RhKZXg=;
        b=iRMYV8VXGI++eYrOJgH7qK7Ko9KYJjLlYl0oxvmf0SN68mzZfW52yFPX2OAyvnUa7n
         xu+ilVLFYZ4c9Rn+U3KzFdBCX1vcWCv6TFCPLQx+kfsat/f2G0pHATmUzqxGPlzCuz8w
         1OR1YnQSy1lpMQZV94el+Lock8qS2RtSAC1hyWDu4Vf4WNwwS2kjSgtiN94x6SpaM4O6
         3eauhO7geJY6A3KyjKmVQQ0dVF/N7mJLOe05tt1rO/AHcgpQrnCfjOoO+t/3DtUXz4D+
         BV6lw4itodxMF47hoQ6+8yhFDb+iieUpVhmtKnB0VLWaXb1iUHGZVm58GUjzaNBCzuEU
         Kyig==
X-Gm-Message-State: AOJu0YwpF/QwTZYGSUE2o8ZslO1BQ4bOwHuOb8/gr+rlMJlhjdmn/tK5
	/zKy/W9dTsIRU3yokpk9a5XJBwR0svcRgFW7OJXLu+/S6zYQDSA88B+/1dYvb6VIE91hZkN+NK4
	o3yaI5XWqANrIT2Zbvw2zcDEJ2ZA=
X-Google-Smtp-Source: AGHT+IH7QVSu1D9MUwWYb5aCkku6AXhrI398PucJ7/yMr9fBBQQguA5n/Htud7doZ6H/MNViSdmMdpAtzXtBEttNLfQ=
X-Received: by 2002:a05:6512:234b:b0:52f:42a:a2db with SMTP id
 2adb3069b0e04-5343878542amr10916100e87.28.1724834150204; Wed, 28 Aug 2024
 01:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 10:35:38 +0200
Message-ID: <CANNYZj9KSfNg=VOBHqFAFOHpoGTPJe7s8rEii-gDxp-t5K=Uig@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to
 solve conflicts with polkit
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 08:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203872

This is really not the right way to resolve the issue: both recipes
install files into this directory and expect those files to be present
where they put them.

Is the real solution installing systemd or polkit but not both maybe?
Or if you need both, then you should look into why package manager
thinks they conflict in trying to create that directory.

Alex

On Wed, 28 Aug 2024 at 10:26, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Error: Transaction test error:
>   file /usr/share/polkit-1/rules.d conflicts between attempted installs of polkit-125-r0.core2_64 and systemd-1:256.5-r0.core2_64
>
> polkit also uses the doc '/usr/share/polkit-1/rules.d'.
> polkit has a priority of 100.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-core/systemd/systemd_256.5.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
> index ee656c81e5..1c408d075f 100644
> --- a/meta/recipes-core/systemd/systemd_256.5.bb
> +++ b/meta/recipes-core/systemd/systemd_256.5.bb
> @@ -848,7 +848,7 @@ python do_warn_musl() {
>  }
>  addtask warn_musl before do_configure
>
> -ALTERNATIVE:${PN} = "halt reboot shutdown poweroff runlevel ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
> +ALTERNATIVE:${PN} = "halt reboot shutdown poweroff runlevel rules.d ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
>
>  ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
>  ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
> @@ -874,6 +874,10 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
>  ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>  ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>
> +ALTERNATIVE_TARGET[rules.d] = "${datadir_native}/polkit-1/rules.d"
> +ALTERNATIVE_LINK_NAME[rules.d] = "${datadir_native}/polkit-1/rules.d"
> +ALTERNATIVE_PRIORITY[rules.d] ?= "50"
> +
>  pkg_postinst:${PN}:libc-glibc () {
>         if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
>                 sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203869): https://lists.openembedded.org/g/openembedded-core/message/203869
> Mute This Topic: https://lists.openembedded.org/mt/108138529/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


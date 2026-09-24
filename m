Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F163C98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:05:15 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.569.1790262311202830280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 08:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UwQqAuW/;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so11682605e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790262309; x=1790867109; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NuXAZnpTkzYrTqQrvwClcOzb73GGDH0QE/1vNM74XJU=;
        b=UwQqAuW/z8iYsa26qxjbIelS2RDVDzffAtiz+KlhDU/mBmG0VMDasfSu19n7BUoQ/i
         B1kzklCMQEN4IqLHkW3IzCwsbSVbGdrtiINQIx0CgvY4OgfkLBVfpU0r3E6mDBbrMvkw
         48WXqWEYdOH2jE+/1hmsKj/fZsL1JkJRtIvsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262309; x=1790867109;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NuXAZnpTkzYrTqQrvwClcOzb73GGDH0QE/1vNM74XJU=;
        b=zitUcONd+gG5uujv+aDgAT7oCc+n7Tqe9IJ/pPI1itQKK/k5ktmFNZUf+a3V0SGqXu
         5FBzc2DePxIXwaq/xeZtU58BCsQTdrCfO3U0KB4Jwbav8u1igA6tsQqAi4eRSto1i/F0
         Gqr99SYcxz23lW3qutLbyMK83yCR+Awo6MwoEFodjbfYUnA4lU59rJdrYHp6tMnxVKk7
         zhC6OSjzBtHTjb2rWNsOvChO1C5n5Ashyb3MKBm9wIKrg8yHoZZpckWjDrm8MrLn21dU
         VAkXhEn2rPMMtg+ZO66kb8Vu5ikurWN4qmCxAQiGNaLlqPEaHoQeNqMBmwPW1SLnCPe/
         uS1w==
X-Forwarded-Encrypted: i=1; AKwUvByGkmQ58EhC7TZa3L0R1okyktJoOM23/uh7mYx3SqUz1PM+wG2tmD2vVS/2zSudp3vmre8DoM/6lE5JDb2u3/AC2g==@lists.openembedded.org
X-Gm-Message-State: AFuF++ntTAwIMeieOBGxYAkuPs98CDKSdHeV/f7d5/Qk8jdjS0cUdY26
	CAliRe+2EfEMbQ1SDrdxZlvyTcXpIUAPHc5gaIVoBVtIna0V4Z3v3/SuG5tRXtcnGIE=
X-Gm-Gg: AYBFou1TK2DWEatrGvpwQmbTqmLngi03zzdtmfs1oSB+qSvHNo+voh6iWgiqIcLyY2Q
	wiEOtWAkchPDwM/IwUmo6ATxLqiyo+u2nfxdttzETVvtCm6xjhsifV81lbuMOcZEfKiCMVq/Zhv
	g7/G8Cgw4gnQJFoWkvob+20XpG/XkCzCyoJzRxYU4JXGCFMop4xWhpW46iqHjaztUj22cIILUkZ
	CvAkyz1dq+PMMAVnoEcQ0fJJ8YKfZ0w6LwBrNePbgh1Y8Lz1sKiimzJ4550bwNzfnMcz5IUUx2j
	UdBR0q+leRyEpSL4NbW2Z1mluNepPYeaPJZXBrQzBMeqimyHZ+1/kXIs+NV+vSxPZFGRY/CIUt2
	f49NENtBXqStIs/b7ADHaepGjTLojJEr7MQZR9cb/vUNLSTY62JsCJ8QqW/KFt0/9tQno6UHKjd
	h8YaqKUzWpoYcegmgrM5bNvfW0DEYtTYcO6kBfroscml61JQSshl+1azs1dKfLyuCkgtxXhJ5FE
	Wdb5E+QmM4l6LNrfoMP5/Qe0C1KghSNKJB8tSV/iWtsTEOPjgaFw17KtdEb3g==
X-Received: by 2002:a05:600c:8b22:b0:49e:7d25:f397 with SMTP id 5b1f17b1804b1-49fe66d30c4mr48898835e9.15.1790262309358;
        Thu, 24 Sep 2026 08:05:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49febb20146sm4195085e9.2.2026.09.24.08.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:05:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 17:05:08 +0200
Message-Id: <DLNN0UKBU6W9.DBNVVHMCG8DZ@smile.fr>
Subject: Re: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout
 on slow targets
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <pratik.farkase@ericsson.com>
To: <pratik.farkase@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260917144042.10045-1-pratik.farkase@est.tech>
In-Reply-To: <20260917144042.10045-1-pratik.farkase@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 15:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246589

On Thu Sep 17, 2026 at 4:40 PM CEST, Pratik Farkase via lists.openembedded.=
org wrote:
> The flock ptest starts flock in the background and waits only 1 second
> (hardcoded "timeout 1s") for flock to spawn its child, polling with
> "pgrep -P". That budget only covers process startup, so it depends on
> host speed. Under emulation (qemuriscv64 under TCG) spawning bash and
> flock can exceed 1s, so the child is not seen in time and the test
> aborts with "timeout waiting for flock child", failing intermittently on
> the autobuilder.
>
> Backport a test fix that raises the timeout to 30s. The poll loop exits
> as soon as the child appears, so fast hosts are unaffected; it only adds
> headroom on slow/emulated targets.
>
> [YOCTO #16425]
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>  ...ncrease-wait-for-flock-child-timeout.patch | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-fl=
ock-increase-wait-for-flock-child-timeout.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index b30fb04e05..249ae09545 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -23,6 +23,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idm=
ap-h.patch \
>             file://0005-tools-add-non-newmount.conf-config-gen-profile.pa=
tch \
>             file://0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-sock=
et-.patch \
> +           file://0001-tests-flock-increase-wait-for-flock-child-timeout=
.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "66ac7c0e725278eb2b039e3104f2c91119341d941b41bac7=
a285c695f940bd57"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-inc=
rease-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/uti=
l-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
> new file mode 100644
> index 0000000000..60b6c86eeb
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-w=
ait-for-flock-child-timeout.patch
> @@ -0,0 +1,38 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Pratik Farkase <pratik.farkase@est.tech>
> +Date: Wed, 17 Sep 2026 12:00:00 +0000
> +Subject: [PATCH] tests: flock: increase "wait for flock child" timeout
> +
> +The flock test launches "flock ... bash -c '... sleep 3 ...'" in the
> +background and then waits for flock to spawn its child using a hardcoded
> +"timeout 1s" around a pgrep poll loop. That 1 second only covers process
> +startup, so it is purely a function of host speed. Under emulation (e.g.
> +qemuriscv64 under TCG) spawning the shell and flock can exceed 1s, so
> +pgrep does not see the child in time and the test aborts with "timeout
> +waiting for flock child", failing intermittently.
> +
> +Increase the timeout to 30s. The loop exits as soon as the child
> +appears, so this does not slow down fast hosts; it only adds headroom on
> +slow/emulated targets.
> +
> +Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/4639]

Hello,

This patch is now merged (Congrats :)) Can you send a follow-up patch to
update de Upstream-Status?

Thanks!
--=20
Yoann Congal
Smile ECS



Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23BBC982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:05:01 +0000 (UTC)
Received: from mail-qk2-f21.google.com (mail-qk2-f21.google.com [74.125.230.213])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5145.1790019882743556162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 12:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=eaS41GwG;
 spf=pass (domain: baylibre.com, ip: 74.125.230.213, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f21.google.com with SMTP id af79cd13be357-93910cadea0so210683885a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790019881; x=1790624681; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iBrmzUL9tbMeYbbakUcIpFna9KFSPJJP7C+CmBUM2eU=;
        b=eaS41GwGKjo3IhyuUZCqMEu/PqrJTbEmEjB4xXbNam38JjKunv9C6ZDZ6E4ajbhL6S
         YaYROv3sQzGhDgdCQSne8oiDFWKq/ksMcvG1UVsucetIJNO4nVT04WyGXN+ZjiM44cVX
         tkLlmqkxPY/titUjjR0jHfsLLD3AMRw502Y4RDce3cslEYjt6pAI4P7p2OgOex9eEwjN
         xfTZbdoRmptlObpvZ1Eg5OdndKCrmbvZ4bL0jWdD+nGgtX+qQ3m/NfexiLpvafYlh3Uc
         oPGadrsbheKNrIYvPOfor2I3G6NKJLOj6RGWu7zBBWvJhmyhr5K0h8DBAwYoTMfkIwJ0
         91uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019881; x=1790624681;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBrmzUL9tbMeYbbakUcIpFna9KFSPJJP7C+CmBUM2eU=;
        b=uxrvsUaC8SiWulXec+q8BAOqvd8b7sahvRMcn+m/Q35Z8uwZKryMQvaXS/D4sHFbo5
         kXgPGAvN7kJ6uUXxgKynW/kYzigt2Nyuwco+cSpbt0FgdszaxeuaN4Yq8+30v9QWf3Jm
         O1BmSv3u45/NmnOEyzofGuxGRxIcWUTbkiwGleWww2Wt+6KRMmmSXm+hr+7+7qdEDub7
         iGEEP2+gtfW0ejNkbq4rv/bvPa/KaEhQvoYIdfU1cSmP9aumO8ubXqWxnjTIZWLEwhUj
         gziVdwVI8ijd9gG9SNcdbGwdIHq16lC0pHwGg2hf+M69sQO+Hu/c5MIIxQTtZ2CRS0lS
         UOUA==
X-Forwarded-Encrypted: i=1; AKwUvByz5qPMYswdVklcHB5FHmNrs6lXjXoCMpZCUDVlfPR02jLDeH2KTFj7FlcJ5N8C1tTPPQ9bG8C9ie7UKh/CIXCs1Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++nh6TvDm8bpr9Lf3/n6tnzGNsYRGQ9B/1VB/H+6Pl5iso5zeWcD
	D+YjZZHT5Iia2IYodV1At6x5wD4NayYJaVpVpdTuX4Mou5+HaAglwQJzkEQG/Si8VLs=
X-Gm-Gg: AYBFou139O+Q0g0CvMpAOUCsDkZowwP4WbT9YIfW2X6aXqO1N5duncCMra+ODQKxD3L
	p7heje/4231cZ3jYY7QKGnzFSMsdfEOYT2TAZTqacon/U7BCzOKe9NIecfXi/wmyCoUU18EyNBg
	7SYHs9eH8Clbxi2NbW3HYGhFoubweHdXFbqs6jiGaDhMaRCaEECZED8NQwGK9o8fM/2GogSm4Ki
	x7vo33AntLYX5b6YsdEpdF5KDnnHrhfHeD6muAAH8rz4VoII9QI4YAZpgZ9U/+qPer/sIOVBM4e
	BwrjJrvANJMv5C2F6G8LWDfWnkjo/nSTi9Spc3SIqAHFV2/nQGfCQZsGyvURzcOICeorkh/gwFz
	ITnn7jK1MVI+R1JTt9psNJaCyWyVtbKywXcCy5lBibGqngXVk4MCwmaXn1Y1hXSZmKJwDDEx1fr
	LRpU8A6qiqLchQ1jBSGVeGc5HaWG2Ug2rENNPn7TEaUhtptGKkfaKwSpG36DELZPxFTIzUMQIXD
	UTzxUBPaRuZ2pUGupHNageKd1dJxcKQ8V4=
X-Received: by 2002:a05:620a:2b8a:b0:93b:d7a2:dd27 with SMTP id af79cd13be357-93c15e89827mr219737485a.55.1790019881333;
        Mon, 21 Sep 2026 12:44:41 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c197c0918sm2938785a.5.2026.09.21.12.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 12:44:40 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 15:44:39 -0400
Message-Id: <DLL938ATXJZ6.KL4GU5AB1OH0@baylibre.com>
Subject: Re: [PATCH] ptest-packagelists.inc: disable gnutls for RISCV64
Cc: <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260918090731.467954-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260918090731.467954-1-joaomarcos.costa@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246347

On Fri Sep 18, 2026 at 5:07 AM EDT, Jo=C3=A3o Marcos Costa wrote:
> Timeouts have been observed (very frequently in the past weeks)
> in the autobuilder, and a bug [1] was filed at Bugzilla.
>
> For now, it's not quite clear what specific test case is causing the time=
out.
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162

I think that this change is too aggressive given what we actually see in th=
e AB
issue - most of the logs seem to show a timeout at the same part of the pte=
st
run, after the 'mini-record' test. I'm doing some investigation locally to =
see
what the heaviest tests in the suite are, so that we can more surgically di=
sable
only the problematic ones instead.

Trevor
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 79e27f617b..9b264657bb 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -163,8 +163,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools stra=
ce"
>  PTESTS_SLOW:append:libc-musl =3D " libc-test"
> =20
>  # These tests don't yet pass for riscv64
> -PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl glib-2.0 zstd"
> -PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl glib-2.0 zstd"
> +PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl glib-2.0 zstd gnutls"
> +PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl glib-2.0 zstd gnutls"
> =20
>  # These tests don't yet pass for musl qemuarm64
>  PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2.0"




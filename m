Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066B2C982FD
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 03:12:35 +0000 (UTC)
Received: from mail-qk2-f30.google.com (mail-qk2-f30.google.com [74.125.230.222])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5951.1790022204892761591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=O5Dqg8U4;
 spf=pass (domain: baylibre.com, ip: 74.125.230.222, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f30.google.com with SMTP id af79cd13be357-93a222edc62so366885285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 13:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790022204; x=1790627004; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Aw1UNFpG9q33LQrcZcIUl4uJXWQpy1m6H/SQbVsVKEM=;
        b=O5Dqg8U4JhHI9SmWSDWUbJ4G6eJM7QJUqpF4fQAub64BuhFk5sMiwtJ3SedOFiJ9xt
         0OvaoAN1fuqSJHM8/6EfE/Fk9C+tn9Bsbb3yYkD5qjtM5RwdcSc6H6cSnoaGJhLn1uJ0
         8bfVVsV0+P3bX8gxidUNili4ytUl5dYr1K/GVG1MOolcPv5vTx0lSIcNfky9JhhkXGfy
         Oa3kP5sT4GCPAgkKQVyI4f8Wh4N/flN+h4fRNIv5M2kmB1xqZOt4ISL+ZNViWRtXi1im
         lrRmYN/t+arF6yZtPC83QtNwCeor8g7Qvl3/t1XLTvYbm+cf2myvEzZ/yztsBgVdqzb0
         o8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022204; x=1790627004;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aw1UNFpG9q33LQrcZcIUl4uJXWQpy1m6H/SQbVsVKEM=;
        b=pfuBoMNEsRLlLK/x456esR0hKwSMldCy187rRyoI0ZWfqmJ7TsGkSJpfq2WfgRmXlK
         EABzFtAYIAZ/+7T61VXRqAuWrg4Jie8zzLGsU0EyljXcCQWvm2NeUkvy6QLh7GNZnEJc
         OsJnOSmny5qYz72FKrq4RRHebjRM53eBGad/CHKeJfAQbWpGpl7NoEyhEjj5ef5lFvLg
         XDqiOmBhDU+KhIfqRNcvNTjJ6tI3ERSQ+BwE8CsOR+IwbGL8QcKIuOWK+pbrjNMfXAO+
         DYKSZasm0iBnXgAKRp2yw8QAtA45HjDdVCGvbj0DHjTNm/+KCTqohKsdEPxjMCIyCGCX
         lYOg==
X-Forwarded-Encrypted: i=1; AKwUvBwRO3ANn2V4Ezx7c6Ea8H2Nx5MwZ1lFu2a5myZrmiSz9br9ptCVrXpJMwcoAprRHTJMvCWxkPYf3L0DXFwTqjMjdA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lMO4PAXdvYh0OHx6Y7IUFb/355zkiOsysT7+7n/RPmVQXfb2jK
	gfy4nVzH4m4zCORg+wl9fk9JbIiV5QnMKZfAhJwoFWeLly7/LLsEoWEpJCUeyqdp9JYFNJ5QvHB
	JDvrO
X-Gm-Gg: AYBFou3Uzi01htktt5W6zFYFgqh4hPp1DYMpKMcOBTELWtfQ49mAed58lEHwn7OJRg/
	tvUr9uanSlK/mkPhw6w3tI3szy0YUSG/hD2zQEvh55wlY1B08civG8tGzQw3eUcbS1yI2HGlVXk
	dHan/qB6FCMrDyxQ0a1CBKUt770Bll+vCNJ6z9qEnWIJj5TA+3q3MWVgPv91M+f+Zbd0IeioeEr
	NlQjo7uV6vvhfCDWKEKVM95nvnGYKkMtvumTrfBOuSClqDkmg1mg+oAuiocgPdFDJ+LL/9vfFrX
	ST9vV7RsnrFlprn2NtP6gK6cmQ2rteagZ/6u3lcWtjVDFAbsof7zEAkSaU+ZEuxvebK5cWXs+vZ
	VPhFFQ6W1qv9ROWan4y7/SBpEU/aYQesQ2yh3hF9WxZglWxcml20u3wwi151s/yjPSBp9pJHtYS
	VsRozjqVPkw5ZM4ry5bXA6wVbsSUypk6m8vvnWCACPK0E8c+f1f6O53QVF3wyuIOwMA6/XBmzHF
	dYIDDEtJah4yMNNORgJlpqNGWrG5EBRmA==
X-Received: by 2002:a05:620a:458d:b0:93b:ea92:215c with SMTP id af79cd13be357-93c15e39f5emr229206885a.21.1790022203698;
        Mon, 21 Sep 2026 13:23:23 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a603dasm9279785a.9.2026.09.21.13.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:23:22 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 16:23:21 -0400
Message-Id: <DLL9WV35J102.2UNYBH63VLF77@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 03:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246367

On Fri Sep 18, 2026 at 5:07 AM EDT, Jo=C3=A3o Marcos Costa wrote:
> Timeouts have been observed (very frequently in the past weeks)
> in the autobuilder, and a bug [1] was filed at Bugzilla.
>
> For now, it's not quite clear what specific test case is causing the time=
out.
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162

After modifying the gnutls ptest so that it outputs rough test durations (i=
n ms)
and collecting a log, these seem to be the worst offenders:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedde=
d-core (master)$ grep 'PASS:' tests.log | sort -t'(' -k2 -n -r
|PASS: mini-record-2 (187880ms)
|PASS: record-retvals (145390ms)
|PASS: rng-op-key (63820ms)
|PASS: rng-op-random (63330ms)
|PASS: rng-op-nonce (63260ms)
|PASS: dtls-rehandshake-cert (61360ms)
|PASS: dtls-rehandshake-cert-2 (61230ms)
|PASS: dtls-rehandshake-anon (61030ms)
|PASS: mini-loss-time (60130ms)
|PASS: mini-dtls-hello-verify-48 (30050ms)
|PASS: tls12-ffdhe (27790ms)
|PASS: x509sign-verify-rsa (18460ms)
|PASS: x509sign-verify-ecdsa (16050ms)

mini-record-2 is longest runtime by far, and is consistent with what the
Bugzilla bug shows - if you build core-image-ptest-gnutls and watch the out=
put,
mini-record-2 comes after mini-record, which is the last on that runs befor=
e the
AB log timeouts. Do you want to submit a narrower patch, which conditionall=
y
disables mini-record-2 and record-retvals for riscv64?

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




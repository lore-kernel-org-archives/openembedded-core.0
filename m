Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C44C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 12:57:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8558.1783601826222590258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 05:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aow+Rr86;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so19319375e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783601824; x=1784206624; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rhg/gbgbGTGc8+xyckKuAs8MTHPXNQ07X+NYHVuZlog=;
        b=aow+Rr868CeemqYxIBFESINpGJ5BD8xfXVgA72xOAVA4KK6fwFIBsKOAJNT6GBVB2I
         PY+lzW3TFSjBmPhvh6l1c5tSO7IyUE5ffgmHVzs5o1eDhC8JdOQcdD1EcV6tWIGoRz8a
         YVna/l8ROQjBCsYOSns1jGLJU2SH8vMy/m64k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601824; x=1784206624;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhg/gbgbGTGc8+xyckKuAs8MTHPXNQ07X+NYHVuZlog=;
        b=kMlTFh2TVMgg+7kCjBdYqYn6PrNonXhiz6jYvsfy8aquCH4iO7ip5FQ7QUIXPXvZg/
         LYfH6b6qm5D+CydFrsv66jvTL7OD+KEf1Rnw34h6YoPb3nkwQLsEVoIEwU+rcst7jm0S
         nwxH9TCFJyg78pgN8l0A2n3i+TqecSYtz0NrHWScg28i4YrlHNjX4X3LvjP1yDY/oZ2w
         o+OP3JBivWIdGvrCCGBMFBA8NLf8IPXyC9mMbOAXhcl4RupFRaoYLYbF6l35o2Gnr5dX
         pmTLuzzm0tovymjTZvO2HdpZUu6ii1pQdNEZ6YgSRxD9bplKCGr9NYYumnKBzLZ6gj9h
         2Kfg==
X-Forwarded-Encrypted: i=1; AHgh+RpDQS2F4LZouuyTeD3ftyjG7A3irO9byts9F2URKd+5OQl2d/L3TRaPsMCNIYnOTymZo7B/9Um5W1iOgRA7xV2+aA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVWrYvhMBIcX/4wAtC+TyAkODvywAcqxFPZwqiK8IXBtFzQCzC
	fCaBmcAuySo8Fk2UIfBRbi4K5d3UOTlkZkNMFzZjCi0Qe6B2EAlHPXqkjrcbtFT/sWtfNRxYyzK
	mcflPBOI=
X-Gm-Gg: AfdE7cmUhqityZytDsiTPuB0mdn93fimoDo9/lKaO5S//8Z5JVTObbqIzLWhWp71r0N
	VzwAUF2c/qcaBh30aTvLo3p2aqwq++spKsi9g3L6ERmk5mC/qT5x25RHmsy+rcnZEVworaPInBf
	W++++domjGKX4/u84pFHqdhsWoggUu+OFH931NbT/OeED4OyHGR0CcacJk88M8nmKf9oDWAoELC
	bgSlrDDGL/CPX33SuuWssWNYWisPMR4xBCDeGzzN5HBw2z493mmOYsZ4xpZ4+i4ZC5rr3ExdTf3
	1fNyku68hBYwT5oR820BF8seF3OVBIYe5on33WpcaQEIUrKzR11N0lceNoqwXVDyPmMaO0aAnR6
	3tLj4fAA+YM5MuCK/ZMTzJ2lLfbl1KOw6LuysEn6SAgqqSY6a6xroN0I08WZ3n4z4njyqVjiw2k
	hGRPstz6VZGNSs1pjqyNL5DJqA92ZfWrEk9d8cdAZtF6Zjl9cmRSVHuPGw9VpGCl33Xf8cH61rz
	IZfmw==
X-Received: by 2002:a05:600c:34d3:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493e68c699bmr73827685e9.16.1783601824267;
        Thu, 09 Jul 2026 05:57:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccaf1sm105669895e9.2.2026.07.09.05.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:57:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 14:57:03 +0200
Message-Id: <DJU22U2G07GU.PPROM8FFZ9V5@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
 <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
 <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
 <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
 <Haixiao.Yan.CN@windriver.com>
To: "Pritam Srichandan Sahoo" <PritamSrichandan.Sahoo@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v3 1/1] gnutls: fix CVE-2026-33846
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260709125006.1802142-1-PritamSrichandan.Sahoo@windriver.com>
 <20260709125006.1802142-2-PritamSrichandan.Sahoo@windriver.com>
In-Reply-To: <20260709125006.1802142-2-PritamSrichandan.Sahoo@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 12:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240579

On Thu Jul 9, 2026 at 2:50 PM CEST, Pritam Srichandan Sahoo wrote:
> Backport upstream fixes for DTLS handshake fragment reassembly
> vulnerability (CVE-2026-33846).
>
> Includes:
> - 4f94e5cfe1f2: add basic DTLS fragment reassembly test
> - 9deffca528c2: shorten merge_handshake_packet using recv_buf
> - 65ab33fa54e3: add validation checks for DTLS fragment length and bounds
> - cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816)
> - bb427ff74dba: add fragmented ClientHello test coverage
> - 092c65d004e2: match DTLS datagrams by handshake sequence number
> - a2b41be83a1a: add test for mismatched message_seq handling (#1839)
> - 68b2fb63c8df: link mini-dtls-fragments test to gnulib
>
> These commits are included in gnutls 3.8.13 and are backported by
> both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream
> (gnutls-3.8.10-4.el10) using identical commit selection.
>
> Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.=
com>
> ---
>  .../gnutls/gnutls/CVE-2026-33846.patch        | 864 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>  2 files changed, 865 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.pat=
ch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> new file mode 100644
> index 0000000000..86e62afded
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> @@ -0,0 +1,864 @@
> +From 4f94e5cfe1f252a431e41642b0752e7e0daf43b9 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 20 Mar 2026 16:09:40 +0100
> +Subject: [PATCH] tests/mini-dtls-fragments: implement a basic DTLS test
> +
> +Upstream-Status: Backport
> +[1] https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0=
752e7e0daf43b9
> +[2] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd=
4bb1bf4cbd1fc0
> +[3] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b=
7df3d383d1ff78
> +[4] https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb=
101fb058565d87
> +[5] https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8=
511e873f762743
> +[6] https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84=
d801ac49a09f78
> +[7] https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf549=
58da91a656550e
> +[8] https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8=
c955f4910c01
> +
> +CVE: CVE-2026-33846
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver=
.com>

Hello,

I'm sorry but this is not what I meant by "squashing the commits
together". What I want is:
* You send 1 patch to the oe-core ML
* this patch adds multiple patches files in
  meta/recipes-support/gnutls/gnutls/
* One patch file per upstream commit
* In each patches, Use the syntax
  Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/XXX]

Is that clear for you? I'd like to avoid wasting your work.

Thanks!
--=20
Yoann Congal
Smile ECS



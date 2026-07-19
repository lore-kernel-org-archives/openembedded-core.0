Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1C5C4451B
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 21:08:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3531.1784495291653256618
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 14:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tFqD77Sp;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so4881345f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784495290; x=1785100090; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5oLKAVDRAClzqEeSiBoXcdhoVavTtm5jbyEXW+vN/U=;
        b=tFqD77SpEMzesV3psjpZjuqSZh/jR8yxbRWp5pVwwQNz+69PM9+3PfpP7ggYj2L2L8
         s5a9XWeYQE6BzB//xFBUD1wIwfPOTWP3rSU9mtr+dEKe5jY2UYyDHa3z13bHiFIy8ki/
         Nph7vTSPEPK3I84nvztDU3rpXq2WkdQZ+YVe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495290; x=1785100090;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5oLKAVDRAClzqEeSiBoXcdhoVavTtm5jbyEXW+vN/U=;
        b=SVCqknPi7yQw+LjTqmKdpX7Fc0hs7rt6iPAu8I6+HMy9qQsVAUsQiOsNonOocFzYZK
         ioNdIZ/2fNAET389Ros0wK4NIL+KmxNeB74Un9vuqyOUE+PjkyltzQcDpJaV9OY0kDDj
         DQwy6/Xk2l7FBtwZycDw/ZpfhPI2n6x0nZagz5JE2e/Zao1uLef369yEw/Emi/zhl8k5
         izT4VnIdN0JdQphNPF+Gg/b/DD1MRwDdnvVcjRQUiPj43WTL9qBuTzyl47XPv1inYtxo
         9ppu6GX19kJv2s2vHr/70ImS8vHf8jhqejobNxTG9kgHELFa7tOqZZLwh5ZaNgR4c+GW
         8S/g==
X-Forwarded-Encrypted: i=1; AHgh+RouKSNkPLJr1l9Qc+TenI2fVTuZRnA/6YFs2ptTWBBNWhg2pwoDOFhfhe72YrgA7JPkRErzluNTa8ujBCYog6fmjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzehy51KZdwLzRqGtOeeGP41LiznnLjNpKo9We/TSntQeW8kMI4
	9M4lzWWv1J+qiQdA6zBdtSB4VLZshpwc34LaZEcQQESZmDLakC5xVY5kfwuoQbxOonA=
X-Gm-Gg: AfdE7cmFxxFx4Z8kSZe4bS/fNjBla/+ZhPrIGNzzaxsAMVe4ghkffHSXOQRpJFMM2ys
	CTbiclDxg17vmSONhcbYhtrkQLtTLpu4OchNbOlmgZam52zW0hXAEoTxAPSbsfPQ1OUPNnzdn6W
	R5+f6csv48FCOPgIovJ3muuYGD9lgPvELy+XsRZeUJmpocxg3MAo5OB8IbS1+I/XLaBPc5bsm+r
	tNnqPred3qTIxvjZ2St1fnsb8D4tQZRofWhQ3Ukf+Lh+dyrIMCDxBDEWi9nV1NRnWnREd+lsYfV
	BH4/moHSvCpC6GdSrc6hBbepR7DQ2ZzFPIOyCfykvAgixXv5S/53kOOMX9Y1LFZ72mrPN39F2ol
	gNkXvkuxu3mJaOCYhRood7EXpujYfVDM6eEWW3Ym/I1jwnJTzLvVcCOiIREJMoVWIS1UxUGTpkz
	42vzToZJku7RhtmFoiTIHbfr/XN+fd+WI8yJTW4McvL5Pi1OLQ8/QFjNsr7ng9ESWI6Zk=
X-Received: by 2002:a05:6000:4386:b0:47f:703b:1851 with SMTP id ffacd0b85a97d-47f703b18afmr5566492f8f.59.1784495289690;
        Sun, 19 Jul 2026 14:08:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee0086sm25761571f8f.30.2026.07.19.14.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 14:08:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 23:08:08 +0200
Message-Id: <DK2USAD17JSN.158GGJ855VAMV@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <pascal.eberhard@se.com>, <wahid.essid@se.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 2/3] python3: fix CVE-2026-11972
X-Mailer: aerc 0.20.0
References: <20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com> <20260706-fix-cves-python-scarthgap-v1-2-8d51db14f7ac@bootlin.com>
In-Reply-To: <20260706-fix-cves-python-scarthgap-v1-2-8d51db14f7ac@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 21:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241301

On Mon Jul 6, 2026 at 1:01 PM CEST, Benjamin Robin via lists.openembedded.o=
rg wrote:
> When using the "tarfile" module with a file opened in "streaming mode"
> (mode=3D"r|") the tarfile module did not properly handle EOF, making arch=
ive
> parsing take exponentially longer.
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
>  .../python/python3/CVE-2026-11972.patch            | 58 ++++++++++++++++=
++++++
>  meta/recipes-devtools/python/python3_3.12.13.bb    |  1 +
>  2 files changed, 59 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/=
meta/recipes-devtools/python/python3/CVE-2026-11972.patch
> new file mode 100644
> index 000000000000..0752ba372dcc
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
> @@ -0,0 +1,58 @@
> +From a83ebdb495a9cbd28a03675acdeda235fade90b3 Mon Sep 17 00:00:00 2001
> +From: Petr Viktorin <encukou@gmail.com>
> +Date: Tue, 23 Jun 2026 15:13:30 +0200
> +Subject: [PATCH] gh-151981: Make tarfile._Stream.seek break at EOF (GH-1=
51982)
> +
> +CVE: CVE-2026-11972
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/f50b=
f13566189c8d0ce5a814f33eff3d89951896]
> +
> +Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>

Hello,

Like we discussed for wrynose, this patch lacks the co-authored-by it
has upstream. Can you send a v2 with this fixed?

Thanks!
--=20
Yoann Congal
Smile ECS



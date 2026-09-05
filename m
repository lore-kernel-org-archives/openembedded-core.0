Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E0EC79F8B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 22:29:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3963.1788647391177729536
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 15:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KxIWbXHy;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4957eefd361so16595205e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 15:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788647389; x=1789252189; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTq2eK9dUBGdkJGkVsQSCSRxQSo3xDU+uYH91KgXseM=;
        b=KxIWbXHy2L+3z5f5Sdsl7c2PLbTgiV6d3338TY5+DVxcb+5KMM4M6F8tMR10woF9ev
         aahhzGyYtCtobeGqKLvIxce46XPFwB6MasFvkrNMEKgpFTh79OE3NfmMWEMS8oUCdWwi
         pBObJW6B1nrRmGmizIewyk5coiGkG6Y59YZCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788647389; x=1789252189;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTq2eK9dUBGdkJGkVsQSCSRxQSo3xDU+uYH91KgXseM=;
        b=sYWKprcILJUBkXtvYBhTJKfFBGKwfSaisnebMxXdYx4KHiutXj6rwbMO5MBhawO9Nv
         hktIA3xbvlyBAeorB3YOup17Cv0qmO7Igw4EiYIW6baUaEVFZObd+yMbC6WQWmepRcJa
         JbI2D8Tlpja7C9aLHvc8OSHqk8doOSqMDondad/DSOLMpcdDUh8cOK8ngxjIEdSPs6Yl
         RWoIYHJowz6/mtRSXbP6W6+j/gGrUvGCagb94R9E2sPWGF7qoA7zwotkxpIpxBONKcd7
         DC+KCTjkkH9Y923hwQV+1kaIPajt0g0g3PZc5NQq1MJmBZ+Ldd3cfL+pxKM1jAAJSsiJ
         zsyg==
X-Forwarded-Encrypted: i=1; AKwUvBxp/cr3M05UgP/8b/2W9I4gw/0skN8XeJGDNK5xEcfrL4wy4VBGMB/vwPiZOTQdy4Jhi5YRNdDjP4ete8UahUbYlg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mU9n4iBjeNzb6uUtLAe8s1ROLwPyxTl0ZECpvACZZhJrkRlD2U
	Ac5oa/9Y056i6qUDbLGxoVgC4qlrbyCNe7CHHvMuxwOAOdRNSIMv1ZVk+JQFYwxc7WY=
X-Gm-Gg: AYBFou05Wb4brLu6Eki2CIe1J+MyvBIFWBq+09VaSdxLl3cgco6ZuXDdknCHT2RKPov
	fOSqJ5NkWl2PT9CWRqlcHcp6NZ648Saej7EWTYJLrzU4a3xxlznkHulchTVCObTs1QNp4+46FQv
	JTA8BOxkL3HQ9BbCJfl92RuEt7hZt3NbnyMJsnRQcVRtqsQ61HSM6NrtfUsIDkcJ5QhqMi13XqE
	iSH5g/7zwo4Y/2jTcHB43ZpVknUPuSPSsh/rQjhca6cYwdBF1iLvpEwfw2xfB5bJU73Lz3SccNN
	kXnVNlw6ayQTbcvC2xvWpHeWM1icudztbfDbYtciW9+FSFtbF2+S50fhbZsSesHNq7t/uCoFvMn
	z4g2HPYliAzHsq35KHfBal+Ts0GPIc1bn5TqXrplExOCODX7GtoV7qWzj9o0QsIMfLaLyKN97K/
	MsAuE0fLumqjjEWkkI5NNSsiqtgcRU4yxF32aZgfDi53UfADe36ktnAZAdiXXXI0dUIPW0CaVg/
	+/wX6ardztVqJmP+uXYD/EGmPA0w2O94Jkn02VOSkrtu3LY/uVrwQ==
X-Received: by 2002:a05:600c:1991:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49cf824f7damr133929655e9.11.1788647389328;
        Sat, 05 Sep 2026 15:29:49 -0700 (PDT)
Received: from localhost (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm12985418f8f.19.2026.09.05.15.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 15:29:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 00:29:48 +0200
Message-Id: <DL7QKYPK5OC1.1P2BC87C6OB5N@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] testimage: avoid symlinking
 missing qemu boot log
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.tatrai.ext@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 22:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245193

On Tue Aug 25, 2026 at 2:56 PM CEST, Peter via lists.openembedded.org Tatra=
i wrote:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>
> When qemu test runs only produce suffixed bootlog variants, the base
> bootlog path may not exist. Guard the symlink creation and log a note.
>
> (From OE-Core rev: 7a6596925cb0eb8dd48a0362a51875cdd60152bc)
>
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
>  meta/classes-recipe/testimage.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index 33b1c13f9d..744de5d7de 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -395,7 +395,10 @@ def testimage_main(d):
>      # Copy additional logs to tmp/log/oeqa so it's easier to find them
>      targetdir =3D os.path.join(get_json_result_dir(d), d.getVar("PN"))
>      os.makedirs(targetdir, exist_ok=3DTrue)
> -    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog=
)))
> +    if os.path.exists(bootlog):
> +        os.symlink(bootlog, os.path.join(targetdir, os.path.basename(boo=
tlog)))
> +    else:
> +        bb.note("testimage: boot log not found at %s" % bootlog)
>      os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.b=
asename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
> =20
>      if not results or not complete:

Hello,

"(From OE-Core rev:" usually indicate a cherry pick but here this is not
a direct one.
Commit title/message changed and the master commit contained more diffs
that were not cherry-picked here.

Modified cherry-picks are fine but modifications should be minimal and
the non-trivial ones explained.

Can you send a v2 with the above suggestions?

Thanks!
--=20
Yoann Congal
Smile ECS



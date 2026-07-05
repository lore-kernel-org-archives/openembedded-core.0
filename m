Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37D5C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:03:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.139500.1783289031559237318
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vDr4a1DW;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso24443825e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783289030; x=1783893830; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=de1NBZu9ZkztgUrAjWxrXHJus8VehaEirpGH+LF8cMA=;
        b=vDr4a1DWuTHOHGF4ZD2rJVlP7ugWTkOfGcv1LMNMU0r872v42JxzVoqQwMvHzmHiIa
         +2zIpTcR53pYf7W2mh/B1ug8XGv2Ir0893SEs0B4B3nzjQz8QPYgpblQvHM5vs2NiyeA
         4rfx6vbs2cBUlX///MHD20njOIjbwcLxgWw9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783289030; x=1783893830;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de1NBZu9ZkztgUrAjWxrXHJus8VehaEirpGH+LF8cMA=;
        b=AlPR/N8o/FqLFDpkhT4IsfEk0ju7uuFozm3gdSI2bgyKUqXw8UXAnGWVUtFU63OthX
         d23QL1CuVPVk2l3aqPCeTWdKXNIl6kJBMA1cf+kySTV7MbwGI/NLdH8nzysQAWJKdG/5
         PxDMlLn9E09/lbk/i8XDV1lzoJlVWxXQlJtUMnq0tZVZM1GvxT8mmXF4QOCANJK8wvlb
         yIKodaz69aoTq3WNAi1q0Ifa9OsCh5gi0F0wurrGIN28QiHrAMusxXCYoApKvHDXvBUL
         +TrJr/xZSN90GntF1E8yrsaf5YzgycWaNnC9jXowqNwsvz+NJdaCaqCAokAXJlT615fQ
         nYgA==
X-Forwarded-Encrypted: i=1; AHgh+Rplc9I1fu4i54m5j6jexubKuL+YsUhP/san4QcQUQjdYnaBPjlJYMEFyvfczxO6wVzJ4NCIQ1AjBBZdl8R8/Kg9og==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywqj8joRLAZSCo41ZalQr/JISTp06Cbn/7DaiAocXNpoJK5hb0t
	Zs0ud7Ayy689ZHFqjmBI0Quyjz9wRvjh4UNLFOmc4WP/ihhrx+mtoduz1xLCa2cY+Z4=
X-Gm-Gg: AfdE7cnWl5vwurNwW9BBsGJdpXcIqA12pf8AP6TkgKogqWPRX0ywX8PaDQCpPztPhE4
	8NbDoACpaYhSgxL6TGLO6UvzdMLQLk4lIR60AJ/J52pwuEURw4nfh+cy5xe2DCgQB82LaaPJ6FK
	eFQd6StmkPWlr1BI9E588i/TyZOlvtJymUYCug2WQHxixgG/vUkzoaNGD6cIYEqFr/wGR3pczBD
	11eFZSxQ6jC77DT7I0o7jZLswFW3+OZ6pppzml41J+k1Eq4MDUSnVzTttWWtvJMM67OARCtN8E4
	a9pz6tuZwyeeB0OEDbvGj+sTjiIiLx/DTW1dvk6Uryf9gX5B+dbuZBJPWBi6sLWSS6Bp0qT/fFH
	JCY1nmdmGk20aOA+HesvPQsJ04sP/vyDlBLoazwlw5qcPAtjVAX+bR+lf/2TJCE5DiEoRDk6nk6
	ZxLqlT/GyC2ep+Ffo=
X-Received: by 2002:a05:600c:37cd:b0:493:c82d:f3fb with SMTP id 5b1f17b1804b1-493d11f6d3fmr97766425e9.28.1783289029697;
        Sun, 05 Jul 2026 15:03:49 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm387616195e9.13.2026.07.05.15.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 15:03:49 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 00:03:49 +0200
Message-Id: <DJQZ7ABAP9UE.1YN66ML3FTCEH@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH v4] curl: fix CVE-2026-5773 - wrong
 reuse of SMB connection
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
 <20260703092551.87871-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260703092551.87871-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240153

On Fri Jul 3, 2026 at 11:25 AM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
> connection pooling. Without this, a second SMB request to the same
> host reuses a connection authenticated for a different share.
>
> Reference: https://curl.se/docs/CVE-2026-5773.html
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> Changes v3 -> v4:
>   - Rebased on latest wrynose (5d1aa5c806c0)
>   - Refreshed patch context to eliminate fuzz on hunk #2
>
>  .../curl/curl/CVE-2026-5773.patch             | 48 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-5773.patch
> new file mode 100644
> index 0000000000..1b60191da8
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
> @@ -0,0 +1,48 @@
> +From e5c7f93734345260820ca46b29db85f75d277399 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sun, 5 Apr 2026 18:23:35 +0200
> +Subject: [PATCH] protocol: disable connection reuse for SMB(S)
> +
> +Connections should only be reused when using the same "share" (and
> +perhaps some additional conditions), but instead of fixing this flaw,
> +this change completely disables connection reuse for SMB. This protocol
> +is about to get dropped soon anyway.
> +
> +Reported-by: Osama Hamad
> +Closes #21238
> +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
> +
> +CVE: CVE-2026-5773
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575=
d6412dc0ff532acdf94de35a6c2a571]

Hello,

The referenced upstream patch does not have
"Signed-off-by: Daniel Stenberg <daniel@haxx.se>".
Why did you add it?

Regards,

> +
> +Note: The upstream fix targets lib/protocol.c which was introduced in
> +curl 8.20.0. In 8.19.0 the SMB handler flags are still in lib/smb.c,
> +so this patch removes PROTOPT_CONN_REUSE there instead. The effect is
> +identical: SMB connections are no longer pooled for reuse.
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + lib/smb.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/smb.c b/lib/smb.c
> +index 00297ad..c15fdce 100644
> +--- a/lib/smb.c
> ++++ b/lib/smb.c
> +@@ -1242,7 +1242,7 @@ const struct Curl_scheme Curl_scheme_smb =3D {
> + #endif
> +   CURLPROTO_SMB,                        /* protocol */
> +   CURLPROTO_SMB,                        /* family */
> +-  PROTOPT_CONN_REUSE,                   /* flags */
> ++  PROTOPT_NONE,                         /* flags */
> +   PORT_SMB,                             /* defport */
> + };
> +=20
> +@@ -1259,6 +1259,6 @@ const struct Curl_scheme Curl_scheme_smbs =3D {
> + #endif
> +   CURLPROTO_SMBS,                       /* protocol */
> +   CURLPROTO_SMB,                        /* family */
> +-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
> ++  PROTOPT_SSL,                          /* flags */
> +   PORT_SMBS,                            /* defport */
> + };
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index d58b774011..3326f478b5 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D " \
>      file://disable-tests \
>      file://no-test-timeout.patch \
>      file://CVE-2026-6276.patch \
> +    file://CVE-2026-5773.patch \
>      file://mbedtls.patch \
>  "
> =20



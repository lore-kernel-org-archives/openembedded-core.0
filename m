Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E0DC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:10:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23818.1787670645012433310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 08:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u/QLB4AX;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-480001972b8so1257993f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787670643; x=1788275443; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hc+IsxbCoZFRiyaOux110LQEJ4AUZzJ+DjQ2LYasff8=;
        b=u/QLB4AXUpQhVJ9y9GceBsVZsqz0mvI1y6ZjdwbC6w5qUFqK0MKevksatP2P+E6sxw
         ZCa18ZZj/OLOSQiC7yP9nXf6BnlNJe+7yoJjFS36Vh/jbUbFTzRJmbDKFKis2sHVnSqa
         aNbTRIOeHIUrFU/AJCyUqiNmpLPv8KhoSYt3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670643; x=1788275443;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hc+IsxbCoZFRiyaOux110LQEJ4AUZzJ+DjQ2LYasff8=;
        b=qshEdqB41QJ2bYITI/FSTbes99m1CNCFsv7cCU4J7zmUqIHqerPMAU79P08zjCbdnj
         EBquXeDkmJrUwM2jzHN9Ce78uNgz8At2qcfAy1edZymABVJvb0iJyPiF0dC6UJVFKocj
         IzKGbml6NdP0ZIX20utpyRJcRHZGquga6E2u9Ne2f3SfAVBooFzmXVhPUhMPTvlcvJ9z
         Xecr6F50yX985uua2LMaZE6bOeOclQC0uL7/zusv7hKXeeWeSEtWW4G3FEgFSybpOQOS
         d+63ws39D+IamUycbcIx+xiEZHNFWstCaN7V+DF17pv91voRfkCZbg+oYelg+0mjcj66
         Zf7A==
X-Forwarded-Encrypted: i=1; AHgh+RqRqYuW6GGSF6XiTb5wLmjlODqA6hY93hJH0JpeIaOXqt+HuIeCiyzhOLb1dA/gZuxtAu56Edg6Fl1YcYdSaszKIQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kMwEB4zQX6OKxnAPaEcZCX+NyNVs4OPT1zg002rHVuF03IWQwM
	WF82pmX5jTK/X6QFnTqdX6xsJd4n+WUsTcSABr2Vtah7CDrnPHhlpQVYl17wipZrAI0=
X-Gm-Gg: AR+sD101PuW6j6Ns/lJE8p2uvpknMbGn55OfpvmLJ5iBvJNaR5OpiAeZSx44IHqVCFb
	NjjW2xBE06gBLYeVqyt5Xa4B2rfIPHOKDk/sgy31HiEOhw+0qI3P8tvP3gMmyyHwBYQI4Wv/VI+
	WhZoNAyPRGk7zCXAm5crlhqSPNwuy7HOB7H5OeMGw8EwIp8dcmoPSgkzJliyun2xgAutqUuakHn
	2YP86fcR4YVFEk8uflKyuu41aVEK0AifHVFr6AQXkOjxuGncL603RSSXgS5cBMaH0SRJ588NPTy
	qOPkOFBbasPUsPYCCxrQvW6/ENVUKjrYsW5CJ1AzRLnIf9iTP9vLMGwa/xG+xPw7LHVG4+8EJcd
	wUNTwc2hwIOwrJOz4Kie/LaCRXZ/PcyLWva6ksXwdxneaFFrGBMNzZQHLrwT4ASKjUt1TkkELz1
	956gaXlXev5SrhV57cXH6XerQ7f/l5HJoVDbk8O0c+QBYS9Ej6YtUf/s5vb6mCIvR0UEvIwS8vw
	OrVkZDWmRvSIdEzvDh5lZ17/MC0SX7OuPTZVq0g3zijpwmdyQ==
X-Received: by 2002:a05:6000:1447:b0:47f:f20d:8d4f with SMTP id ffacd0b85a97d-482c0b99930mr44055891f8f.18.1787670643078;
        Tue, 25 Aug 2026 08:10:43 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69b7fsm12163155f8f.2.2026.08.25.08.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:10:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 17:10:42 +0200
Message-Id: <DKY4CRPZO0WH.QWIHIK4VRSNJ@smile.fr>
To: <bhavesh.maheshwari@einfochips.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][Wrynose][PATCH] curl: Fix for CVE-2026-9079
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260730092746.1991111-1-bhavesh.maheshwari@einfochips.com>
In-Reply-To: <20260730092746.1991111-1-bhavesh.maheshwari@einfochips.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 15:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244247

On Thu Jul 30, 2026 at 11:27 AM CEST, bhavesh.maheshwari via lists.openembe=
dded.org wrote:
> Pick patch from [1] mentioned in [2] taken from NVD report in [3].
>
> [1] https://github.com/curl/curl/commit/88c7e16cceec816a2df45c89
> [2] https://curl.se/docs/CVE-2026-9079.html
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-9079
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  .../curl/curl/CVE-2026-9079.patch             | 289 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 290 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9079.patch

Hello,

This series does not apply on top of the review branch anymore:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wryn=
ose-review
| ERROR: curl-8.19.0-r0 do_patch: QA Issue: Fuzz detected:
|=20
| Applying patch CVE-2026-9079.patch
| patching file lib/setopt.c
| Hunk #1 succeeded at 1694 (offset 15 lines).
| patching file tests/data/Makefile.am
| patching file tests/data/test1648
| patching file tests/libtest/Makefile.inc
| Hunk #1 succeeded at 100 with fuzz 1.
| patching file tests/libtest/lib1648.c
|=20
|=20
| The context lines in the patches can be updated with devtool:
|=20
|     devtool modify curl
|     devtool finish --force-patch-refresh curl <layer_path>
|=20
| Don't forget to review changes done by devtool!
|=20
| Patch log indicates that patches do not apply cleanly. [patch-fuzz]
| ERROR: curl-8.19.0-r0 do_patch: Fatal QA errors were found, failing task.
| ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wryn=
ose/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/temp/log.do_patch.47557=
1
| ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-=
core/meta/recipes-support/curl/curl_8.19.0.bb:do_patch) failed with exit co=
de '1'

Can you please rebase and send a v2?

Please note that there are other pending curl CVE patches, I'd recommand
reviewing/testing patches to identify conflict at the earliest.

Thanks!
--=20
Yoann Congal
Smile ECS



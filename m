Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15345CA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 12:57:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6425.1791896265412365748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 05:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H9IdsB2W;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so23154905e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791896264; x=1792501064; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zjt9rx8hmeJPIMOnnDQiPXlmSVxkSQ1vW/oASDq4Jbo=;
        b=H9IdsB2W72vH66aa77zRzA8rKqGfDXnEp57XT9fioLXu7U9vlo0f9Ok5HTa6vzfTJ9
         HQgkE0uYcCDxuvE/y/GqlXYFpu2aa4bpkdqksPkDWQo9N/FB/ekKmJRAMLy1xDoh6l4E
         F13VPVVtZuDbHJMJ9WGLemwr9JfXc/m+lwprI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896264; x=1792501064;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zjt9rx8hmeJPIMOnnDQiPXlmSVxkSQ1vW/oASDq4Jbo=;
        b=N20005fPDeQKTafpr3z/QDYoqsNw+0sY9E0eqDozDQQs9e94BEWRCDGbK5LQjMeJqO
         R5Z+R53xNd3Vw4pjeCe3w6BkP6IcRnsQdz4Z54WRWZt6HOp0eU0miJ908qJrpz3SvgDJ
         0glrIVq6wOYLktBdrTTeWmS6m0ih1seVp2NgrOf34h3kZRGFz/p0y4xa3xkr5lPWWug2
         hcBFo2HKs8qEiPPSBRHk2NEfBN8TYwZ6DW12jLL75CGrZZb60QEDTDFRWS/NfFBkkAFk
         1DO81cJvV+VyqbISjiOeCqOTeGCL00IXyytQrFGOZNMquPDvg+79MoQyeXkWnOKENWVh
         i1OA==
X-Forwarded-Encrypted: i=1; AKwUvBzJhyHlVomybSPWaumVofxlCdL2Jf2A5v0MT8N6AKQJnma2ORJ5YgbkKLwff1dL8yRAMNY4Qe1zCaigMVJ7C2qVNA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIR2M27o0JdTDi3q6SBKgJ4uPftUq8bH0vLxwxoY2SPtXDqHi/g
	40ZVAam62QI4cpd4u9EK7uuqbIlNNeM36sqJV7bsaLFDw7Mlqng06qa9dNUUwN5HaU+GtgK45D2
	TLb0L/kE=
X-Gm-Gg: AYBFou2lTtPZvvuXTi9fO0hPMR7gTw/EeCDvp8rk2PxvhsEtYZ2t6NXQs7A+KPYIXj3
	SNevG51js+qb1Un98ChIkausNxcKO0Mj60Nz8tbqXJrdWBdWpVuf77w94Zlqqm0yKENdF/DPjlH
	6AF5fmVfCSODHBpHk2bqUdE0Hf4EK3aYT0qvRnCnlsBA7c4Fjix42gYJySur145or+pFMiEQw9F
	H84yNU4u/bl8yXo/AfeJdkI44+fqSO6HMuN47SEZTk1MTySvCxkFwuZSmIagNznhMynQ41e1844
	8eY3f6XKFtciAK4ysk7TLd1b3Tihq3RqIICrfQcnkcy90le1ZZwtihkAzZjPV9O4NwwvEEab4I8
	6l7N6RiSMegmcdyaWoA87FKQs8pcKqd+kDL72DHLZXTdQPPXQywmgYwx+HOFveBnCSA6XBN3R8E
	s6+MA0tAlD0Etjc06GV/cswx+XG1rMz7KXmQi3DEqsYXylRqYJ1Psa60uzXEnb/8oIgMq1h6gCv
	471dPAkS2zTxB9Rx00aLdEWR04JBTgSJumhwyGYs0jtNB1BVQRHvL+i+EY=
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr226690905e9.12.1791896263527;
        Tue, 13 Oct 2026 05:57:43 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm254408215e9.2.2026.10.13.05.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:57:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 14:57:42 +0200
Message-Id: <DM3Q7MN7ZUP7.X96W6FEAUBGT@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2] vim: Fix for CVE-2026-73076
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261007112343.774232-1-hprajapati@mvista.com>
In-Reply-To: <20261007112343.774232-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 12:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247725

On Wed Oct 7, 2026 at 1:23 PM CEST, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd=
0d452
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-73076.patch            | 136 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 137 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-73076.patch
> new file mode 100644
> index 0000000000..9ef6aec99a
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
> @@ -0,0 +1,136 @@
> +From 581a2f3ac9c6f96a26324f6b2c8c11415fd0d452 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 24 Jul 2026 17:43:51 +0200
> +Subject: [PATCH] patch 9.2.0847: [security]: vimball: code execution via
> + .VimballRecord file
> +
> +Problem:  [security]: vimball: code execution via .VimballRecord file
> +          (tdjackey)
> +Solution: Forbid arbitrary commands, fix broken directory deletion code,
> +          refactor code
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-73076
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/581a2f3ac9c=
6f96a26324f6b2c8c11415fd0d452]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/autoload/vimball.vim | 58 ++++++++++++++++++++++--------------
> + 1 file changed, 35 insertions(+), 23 deletions(-)

Hello,

That patch changes in a non-trivial way from upstream. Can you check
that all those changes are intended and explain them in the patch
message?

Thanks!
--=20
Yoann Congal
Smile ECS



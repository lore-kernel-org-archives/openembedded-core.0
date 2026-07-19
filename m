Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AC9C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:23:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7152.1784474615235671025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pcvgnGsC;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7027ca11so449693f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784474613; x=1785079413; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYLMct5g1TMuSHvUMYl/i+SyhgQIfuCPAVHbVl528aY=;
        b=pcvgnGsCt9mmTIUCebivbiydyCsYlBxZE6XEilalAg0yWBg4206JUosf9CDNc8yEnA
         YcYLJG/rvDDqE5YzXvzbxsPHdinQSIFVbEhJBhm7Y62kEFYWIjdxyg3V5BWKg2PdGquH
         rOUGBxsgofq78pFErYT1jFIdWJlWGrYSCwKZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474613; x=1785079413;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYLMct5g1TMuSHvUMYl/i+SyhgQIfuCPAVHbVl528aY=;
        b=EefuIWXmfhxYzSdPYY+1RwZaRTeCRSz1yW1+UJyfUXZSjY+SX2NNLW8e5YNG/CjcSl
         wG57WCervYihblEEYNYkTouZ1wmaAfcazoSxG9NUvwzMjsleFW9Qin6FmpLVCSVgksoQ
         Iw/foCl5bj7Vay0qsrLNsXyQYVm9hXmAKCArXGVlH/5nH0PbtwhpNBFxVVw/pEnw3fV2
         zBK6M/KnHwXxjWVNqEG4fJDi53hYfmAEMjGyC7mkWZmXYHngyhpS9aW4by1zypeiv6Kq
         SlsslAzEJvtwvtZVmB1YKtd24r/+dNJaEX4DGGtEtyFVajs1WvAoKQiGgqKK5lJBgHQY
         pB+g==
X-Forwarded-Encrypted: i=1; AHgh+RpyB2E95qOG9xLQNoO7y05fdwTyUDVlFJokXLcS+hlqj1VDJYZfDpW2X+IqQMibo8zdtprzHOUEmu7zdZ6sUPsK4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWXwsepF1kE8CEyobVgozmK1BCKexPBDhYOXy33nVlU2fYGoKa
	qVPuAAC9s0woDjHPf96NDYxsa5rEpDacLHFpW2V0OWL7KgoUrv2rALHhDqcN+Zm6XxU=
X-Gm-Gg: AfdE7clUM4sK59Px8+YnQIIB7Nw9V95B8d/s0vCWe8Dyl4ifvxYs0lGI0OWGrvDlWMy
	0wZrc01cmmjaglwrklF5xHd5/yr6ciMDIbubc70NhK5aeuDb3eTaOXV6qrE7sOqiQidIH2YWCR0
	MtAtakawcglfJHWp+Fjz04t+XE/MV52IepwaeswpMT4uwFMv3LER4myxEwDPghWoUwLR7gEsL9j
	MFxAWGeiwAgKRTBoxf/yDkzMnwzn/zWm2XciV8j3b+MR42wQ3UaO+9gqbyM9n8bWipwFO5Ot425
	AofOyifYqF5EtBF0oLNlnf2w50Yyj8vJf9zhfKQQT5Zg7TwOBWP9fYyASl+/1il3fbwbVxIsZnL
	YcdlBfkyT5i3LEX+dLVaCNqE/6IQ/ZB6fJ4NAgLJ95HuHWak+zWmg1h3AhhBuXLceEP8zt7whhA
	uMnHZQ7fIzhwHkRhrSgeSya9HXHhdlAr0sVqHz8IGLvcFvIIzcr1WR52qHA8ltZKVLamc=
X-Received: by 2002:a05:600c:c097:b0:495:5a91:8027 with SMTP id 5b1f17b1804b1-4955a9182a8mr24822305e9.5.1784474613379;
        Sun, 19 Jul 2026 08:23:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6b85970esm15592937f8f.15.2026.07.19.08.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:23:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:23:32 +0200
Message-Id: <DK2NGFYC221R.2ZGB7E3EHC3QX@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 01/10] expat: fix CVE-2026-56403
X-Mailer: aerc 0.20.0
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260717060437.2910653-2-deeratho@cisco.com>
In-Reply-To: <20260717060437.2910653-2-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241291

On Fri Jul 17, 2026 at 8:04 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> These patches apply the upstream fixes shown in [1] and [2], as
> referenced by [3].
>
> Upstream pull request mentioned in [4] contains both the storeAtts fix
> and the related xcsdup overflow hardening so adding both source patches
> explicit, even though the published advisory description names storeAtts
> specifically.
>
> [1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d856=
5f6bf1cf245f648
> [2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c0983=
70a8362aed47b15
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403
> [4] https://github.com/libexpat/libexpat/pull/1232
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../expat/expat/CVE-2026-56403_p1.patch       | 81 +++++++++++++++++++
>  .../expat/expat/CVE-2026-56403_p2.patch       | 52 ++++++++++++
>  meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
>  3 files changed, 135 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
>
> [...]
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta=
/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> new file mode 100644
> index 0000000000..b578cb60cc
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> @@ -0,0 +1,52 @@
> +From 2855ce68a1ce9732267c06734427930364ab66c1 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Fri, 22 May 2026 00:43:52 +0200
> +Subject: [PATCH 02/17] xmlwf: Protect function `xcsdup` from signed inte=
ger
> + overflow
> +
> +CVE: CVE-2026-56403
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1=
47c8f36d6277d5c6011c098370a8362aed47b15]
> +
> +Backport Changes:
> +- Add stdint.h and convert count and numBytes to size_t because
> +  Scarthgap 2.6.4 lacks these upstream prerequisites.
> +
> +(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + expat/xmlwf/xmlwf.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
> +index fd4fc3f8..7bbdb303 100644
> +--- a/expat/xmlwf/xmlwf.c
> ++++ b/expat/xmlwf/xmlwf.c
> +@@ -45,6 +45,7 @@
> +=20
> + #include <assert.h>
> + #include <stdio.h>
> ++#include <stdint.h>

Hello,

Same question as the wrynose reviews:
https://lore.kernel.org/all/DK0Y76VFY9IE.2KH0G9SO8XT0U@smile.fr/T/#m9932c3c=
d0b7d0659653d92b0a3ae69577fb780c8

Since I'm trying to merge the fix from Peter:
[scarthgap][PATCH] expat: patch CVE-2026-41080 - Peter Marko
https://lore.kernel.org/all/20260505205229.2139449-1-peter.marko@siemens.co=
m/
... the new stdint.h include might not be necessary.

Can you follow-up on this series when that merges?

Regards,
--=20
Yoann Congal
Smile ECS



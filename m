Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D662F10F287A
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 23:16:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1394.1774653377332096065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 16:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H7pUC9ti;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fd27754bso24652335e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774653376; x=1775258176; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjH/pq/vbnTtZqZcUWjZO9hrb7A/Up37gQN7ssUKZSY=;
        b=H7pUC9ti4EEtNGd6DudLH2nYzlSWEsN6YPFhYLEQcowNeQwjZE1GGLn/GC9CsiyqXa
         SfxrH6sDzm/q+BioVGlB+LiIQ/dpxjqiftwLKC0hyCmQBikbnlZtg4FgzAJ2o0UuvKcb
         isoljmxk4Hg3+nLJaUnhvZhfORn/esd1ivFlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653376; x=1775258176;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjH/pq/vbnTtZqZcUWjZO9hrb7A/Up37gQN7ssUKZSY=;
        b=l/Pnb9l12O0wuAsIN+I2RIxUapVYANHvAEkkSbHfpu57oLH60b28EN/Ghim+fYpFnj
         +jNv0c+kWgwFxFFfErkYR5RlBrVKTYDQ3Cgx5MgwxiL3f8JmvWq43dcHbAaoj4YaDzmY
         qJXzSRbbzYxZ29LAZjrGZ78GxZBRnvRZegp6fQ9FhGQRzizvKmfVbmflzVlUHSUAXv5d
         wfqqSpYJPqPksyvYCd+s2p3NjG0mQWLJWMhoAt7qGFBj9sE21YZrcIcYsblkgybGUmhM
         yadqWt0ELuKKKlPksB8F1uDtUPKJjH5N1ZfWmpsnZUu3Wx/rE1Jv1OCDwTtFkD7jV7XH
         LczA==
X-Forwarded-Encrypted: i=1; AJvYcCXT8nV8/iIvFDStvlZj9go68Hd+qyDGZdDNAaELSWnL2edrwOGaR0GX+UOhopEOZ0sXvgy7lJdj2AyHpocYpEA2rg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgnGP6nnKq/1Iqh7Z4ybQx/JgBHe8yspTxl0Gzrz6U8hBdExMw
	DhtBaCjrDG81+AqRsImJfLDOmUa/VvlARPQS5hWrU/E3zV1QhKjV7Q9zeL/BFqU9rbA=
X-Gm-Gg: ATEYQzxkTOQfFdMg5w2KgOa1sHcBefKjhewP6NHxNc7dojw7nOnbJNnsxJpLbSIXayH
	bHpePj6+aQ3pHSxL/onFQihCh86sWdyjyG5nxzGb78Yy/JsxL7+dwdK3MOGllB4mBw1DsmF4qYL
	tK3Mml9YszJ+gYAsDqmbQF7atWY9NieB/8QIQ+cE4RfcbfrnlQD39vo+wDW6EvFtkOsMw9TSDWK
	qm4n7zIpCktkgA9D5MysNlj2OG9NypkPvM2PQj+x+hvr5N26WHI0cb4BWdThFNMV0lshFsuBPyL
	GSpB/5fFptXlQyKU20eVvT0J+de3TZPL9JnPcoCqHfAzlUcMTnNW17RDEdgBu83bsoBhPYWClKZ
	RbY3ej88HMFoBZsTtwuypFAO/LZnEgE2bklyNxrq6AOwMQiM/oMmgih3/mr2sVzURuaQqpG1mIE
	g1W/Ae8haVLzXiawq8orcFgePUZXlBT0+i31mT/u1xh3k510FQDaZxhD0k/wVOhLLOepObeqszp
	HqUaGWXpY0LhfavVpI51KdPnA==
X-Received: by 2002:a05:600c:a06:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48727d59ce3mr74588805e9.4.1774653375594;
        Fri, 27 Mar 2026 16:16:15 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873069961esm11213965e9.12.2026.03.27.16.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 16:16:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 00:16:14 +0100
Message-Id: <DHDY49JI73ZR.Y4O2QDGQW9JI@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] libxml-parser-perl: fix for
 CVE-2006-10003
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260324050227.41834-1-hprajapati@mvista.com>
In-Reply-To: <20260324050227.41834-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 23:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234109

On Tue Mar 24, 2026 at 6:02 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick patch from [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2006-10003
>
> More details :
> https://nvd.nist.gov/vuln/detail/CVE-2006-10003
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

As far as I can tell, this CVE also applies to whinlatter and
master. You need to send the fix there before I can take it for
scarthgap and kirkstone.

Regards,

>  .../libxml-parser-perl/CVE-2006-10003.patch   | 73 +++++++++++++++++++
>  .../perl/libxml-parser-perl_2.47.bb           |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-200=
6-10003.patch
>
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003=
.patch b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
> new file mode 100644
> index 0000000000..e9a4b692d2
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
> @@ -0,0 +1,73 @@
> +From 08dd37c35ec5e64e26aacb8514437f54708f7fd1 Mon Sep 17 00:00:00 2001
> +From: Toddr Bot <toddbot@rinaldo.us>
> +Date: Mon, 16 Mar 2026 22:16:11 +0000
> +Subject: [PATCH] fix: off-by-one heap buffer overflow in st_serial_stack
> + growth check
> +
> +When st_serial_stackptr =3D=3D st_serial_stacksize - 1, the old check
> +(stackptr >=3D stacksize) would not trigger reallocation. The subsequent
> +++stackptr then writes at index stacksize, one element past the
> +allocated buffer.
> +
> +Fix by checking stackptr + 1 >=3D stacksize so the buffer is grown
> +before the pre-increment write.
> +
> +Add a deep nesting test (600 levels) to exercise this code path.
> +
> +Fixes #39
> +
> +Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
> +
> +CVE: CVE-2006-10003
> +Upstream-Status: Backport [https://github.com/cpan-authors/XML-Parser/co=
mmit/08dd37c35ec5e64e26aacb8514437f54708f7fd1]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + Expat/Expat.xs   |  2 +-
> + t/deep_nesting.t | 22 ++++++++++++++++++++++
> + 2 files changed, 23 insertions(+), 1 deletion(-)
> + create mode 100644 t/deep_nesting.t
> +
> +diff --git a/Expat/Expat.xs b/Expat/Expat.xs
> +index dbad380..f04a0cf 100644
> +--- a/Expat/Expat.xs
> ++++ b/Expat/Expat.xs
> +@@ -499,7 +499,7 @@ startElement(void *userData, const char *name, const=
 char **atts)
> +     }
> +   }
> +=20
> +-  if (cbv->st_serial_stackptr >=3D cbv->st_serial_stacksize) {
> ++  if (cbv->st_serial_stackptr + 1 >=3D cbv->st_serial_stacksize) {
> +     unsigned int newsize =3D cbv->st_serial_stacksize + 512;
> +=20
> +     Renew(cbv->st_serial_stack, newsize, unsigned int);
> +diff --git a/t/deep_nesting.t b/t/deep_nesting.t
> +new file mode 100644
> +index 0000000..8237b5f
> +--- /dev/null
> ++++ b/t/deep_nesting.t
> +@@ -0,0 +1,22 @@
> ++BEGIN { print "1..1\n"; }
> ++
> ++# Test for deeply nested elements to exercise st_serial_stack reallocat=
ion.
> ++# This catches off-by-one errors in the stack growth check (GH #39).
> ++
> ++use XML::Parser;
> ++
> ++my $depth =3D 600;
> ++
> ++my $xml =3D '';
> ++for my $i (1 .. $depth) {
> ++    $xml .=3D "<e$i>";
> ++}
> ++for my $i (reverse 1 .. $depth) {
> ++    $xml .=3D "</e$i>";
> ++}
> ++
> ++my $p =3D XML::Parser->new;
> ++eval { $p->parse($xml) };
> ++
> ++print "not " if $@;
> ++print "ok 1\n";
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta=
/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> index 803164f713..6a36b763a8 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> @@ -8,6 +8,7 @@ DEPENDS +=3D "expat"
> =20
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/T/TO/TODDR/XML-Parser-${PV}.tar.g=
z \
>             file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
> +           file://CVE-2006-10003.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "ad4aae643ec784f489b956abe952432871a622d4e2b5c619=
e8855accbfc4d1d8"


--=20
Yoann Congal
Smile ECS



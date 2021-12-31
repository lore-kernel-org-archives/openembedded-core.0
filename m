Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF04C433F5
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 15:38:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.13358.1640965118541325381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 07:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JnohhbMo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id t26so56513087wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4O5ibdGbaw3ZOF1da77zRBdATP9FfcrEUYpPBKtwi9I=;
        b=JnohhbMoWEw1Ix8Pklwk6b0xD3bzK07sSTiXc4lQef/2Q5neZNjYuKYJa4maEg8nJ/
         wPWy5s8fe2v/VD8oRhS3WVN5b4lFeJR3Ykt51KwjWyapklYRjB7jQ4I6fWlmuyMYxRYJ
         PVlJLN+KkjEXnDmqWGh9wjXIupOD0wqyyD6/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4O5ibdGbaw3ZOF1da77zRBdATP9FfcrEUYpPBKtwi9I=;
        b=1+CpvxoI3LEuKPmjqnxOAfaNsZ6Y3jLspYk1lu7d9+EXgfEP4EjovTP8hDW4jPK6Ic
         TA/dmMAT045ZEuKgNKkiP97za7RehhA7FS2n6dQpRcssxtMVW8SoxEN/DzF5QG3FDNGT
         bUdCJRgzmVAQznrBuNRCVj6jXSn1uf5duQh0vgWCaJQVr45AXJDMPm2h3Y3fXw6hwNmf
         w1DyY5H6zQTcfoie5/zY8x+Z+ne9z1fe0atBlrm9MjdOvOnBNuwqG9Z1KgAkE1EHXPUA
         ebF1af8ulA5NO74lWQp4jo0Lji59FQ2kw/rhRm2t8XtP9MZLTTlGimhDz80KCXPohcBo
         UF9w==
X-Gm-Message-State: AOAM532FDlj1UTIOqIk/Bj92ElbeqP7lYEt96uuIX4ec7Sd4W6TEvza8
	+M7F1MswRBgNd2mtc6WggHD2fg==
X-Google-Smtp-Source: 
 ABdhPJwnoW7Lc0T+mZOrUF7amZy36ISb6/QQFfPnJjUNs6MpWSXPR3d9/DFirLT/UN+5rWtmmtyA1Q==
X-Received: by 2002:a5d:44c9:: with SMTP id z9mr29073777wrr.330.1640965116807;
        Fri, 31 Dec 2021 07:38:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d452:abd:d38b:ab0a?
 ([2001:8b0:aba:5f3c:d452:abd:d38b:ab0a])
        by smtp.gmail.com with ESMTPSA id
 g5sm30278176wrd.100.2021.12.31.07.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 07:38:36 -0800 (PST)
Message-ID: 
 <6d4b04f6048055fe85d131679cbfcfda33a97035.camel@linuxfoundation.org>
Subject: Re: [OE-core] [V3][PATCH] rpm: fix CVE-2021-3521
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 31 Dec 2021 15:38:33 +0000
In-Reply-To: <20211231022140.33421-1-changqing.li@windriver.com>
References: <20211231022140.33421-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 15:38:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160089

On Fri, 2021-12-31 at 10:21 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../rpm/files/0001-CVE-2021-3521.patch        |  57 +++
>  .../rpm/files/0002-CVE-2021-3521.patch        |  64 ++++
>  .../rpm/files/0003-CVE-2021-3521.patch        | 329 ++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.17.0.bb       |   3 +
>  4 files changed, 453 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
> 
> diff --git a/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
> new file mode 100644
> index 0000000000..b374583017
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
> @@ -0,0 +1,57 @@
> +From 9a6871126f472feea057d5f803505ec8cc78f083 Mon Sep 17 00:00:00 2001
> +From: Panu Matilainen <pmatilai@redhat.com>
> +Date: Thu, 30 Sep 2021 09:56:20 +0300
> +Subject: [PATCH 1/3] Refactor pgpDigParams construction to helper function
> +
> +No functional changes, just to reduce code duplication and needed by
> +the following commits.
> +
> +CVE: CVE-2021-3521
> +Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/9f03f42e2]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + rpmio/rpmpgp.c | 13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> +
> +diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
> +index d0688ebe9a..e472b5320f 100644
> +--- a/rpmio/rpmpgp.c
> ++++ b/rpmio/rpmpgp.c
> +@@ -1041,6 +1041,13 @@ unsigned int pgpDigParamsAlgo(pgpDigParams digp, unsigned int algotype)
> +     return algo;
> + }
> + 
> ++static pgpDigParams pgpDigParamsNew(uint8_t tag)
> ++{
> ++    pgpDigParams digp = xcalloc(1, sizeof(*digp));
> ++    digp->tag = tag;
> ++    return digp;
> ++}
> ++
> + int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
> + 		 pgpDigParams * ret)
> + {
> +@@ -1058,8 +1065,7 @@ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
> + 	    if (pkttype && pkt.tag != pkttype) {
> + 		break;
> + 	    } else {
> +-		digp = xcalloc(1, sizeof(*digp));
> +-		digp->tag = pkt.tag;
> ++		digp = pgpDigParamsNew(pkt.tag);
> + 	    }
> + 	}
> + 
> +@@ -1105,8 +1111,7 @@ int pgpPrtParamsSubkeys(const uint8_t *pkts, size_t pktlen,
> + 		digps = xrealloc(digps, alloced * sizeof(*digps));
> + 	    }
> + 
> +-	    digps[count] = xcalloc(1, sizeof(**digps));
> +-	    digps[count]->tag = PGPTAG_PUBLIC_SUBKEY;
> ++	    digps[count] = pgpDigParamsNew(PGPTAG_PUBLIC_SUBKEY);
> + 	    /* Copy UID from main key to subkey */
> + 	    digps[count]->userid = xstrdup(mainkey->userid);
> + 
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
> new file mode 100644
> index 0000000000..b93a1d5404
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
> @@ -0,0 +1,64 @@
> +From c4b1bee51bbdd732b94b431a951481af99117703 Mon Sep 17 00:00:00 2001
> +From: Panu Matilainen <pmatilai@redhat.com>
> +Date: Thu, 30 Sep 2021 09:51:10 +0300
> +Subject: [PATCH 2/3] Process MPI's from all kinds of signatures
> +
> +No immediate effect but needed by the following commits.
> +
> +CVE: CVE-2021-3521
> +Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/b5e8bc74b]
> +

The new tests also trigger for the missing space above after Backport. It does
make me wonder why you don't see those test failures. I've tweaked the patches
in master-next to fix this.

Cheers,

Richard



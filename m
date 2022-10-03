Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66998C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 15:47:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.1585.1664812038496813337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 08:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=viz4kSJ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id 13so23082787ejn.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BjfencwYhfLc40wegZCMRWRRXnfL4HeiQTHII+pycnI=;
        b=viz4kSJ6ksjeV+ICFWSqE/KOPdHvEDwEOBan6EdtquKJz7yc2ckjjN3d8FEUDXkLPE
         KFmSB4hYrtbm8/9XhHGgM47bc5he+f5nVQGDL514G7+GQH8hPLPdsGo6bbPWBx1qMEYX
         8T1zvhY3zvYqlqFgheEHaRqubT8EEUZMZdFtV8+eUAJtOCo72s8rFhyfKT/GmC9cENn2
         9ph+e+L6nzY3KXzNoFEprYGK0fi3yKhbIQlhJKArD5zsbUse9rTZ5k5lpjYbrf61CKcn
         mPzX2Nbv3Nu6vdZabuJRLU6sAjMxsXmRak3mZdV2pibGes3uH6Klw4jQ8rBMxmcTPAB0
         h/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BjfencwYhfLc40wegZCMRWRRXnfL4HeiQTHII+pycnI=;
        b=0O9mQMPBKJ55pKW9VV9ai7/vOgYOl/BO4E7YnFDS0KD3TwJJeId15UqLRFqmhUY701
         g6PgBbP9INhZyaOUnQfZwlFkRmR53ZL+woKqSukFLmt3+cjCxWwqpnsU2XRRbcD3AYqb
         NxB3vzbvuqu7GGvPif9pJL6JQrX2kabeBg4YZPMFgUa7SZ8YILsR0COJH86iDo0L7PPr
         Zwn/FOyJXcGIql/gEsHwtavg3XH5uU+EH8MXrOuCx+R5kNHKHXB9gTeM2AR0MAjS4ifr
         Hmbybo/gnGZcFLwFrIZ/MjGOt/Ohbo9SDLVNFpJSeHPkw+OAYIk2RhQBbFgmPemTLEpe
         gKmQ==
X-Gm-Message-State: ACrzQf0UmK6aQPIKiVQ/uFZC+cqwxJtbxmd6DtfhBh2bqS9HmTj+ekdE
	51tNNbCkL0BPBLAzUWBH+jLpkKOCn31aQnr+G4ugjA==
X-Google-Smtp-Source: 
 AMsMyM6g77X3sQZ4oa6Cj7nYcsTiPaU5xrRDK/nzQzu+Nbd612eID7C925Ua5QEok1LfnQ/+mkGoWieht5CqJ8Zbrus=
X-Received: by 2002:a17:907:1b1c:b0:72f:9aac:ee41 with SMTP id
 mp28-20020a1709071b1c00b0072f9aacee41mr15435717ejc.56.1664812036795; Mon, 03
 Oct 2022 08:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221003112812.866-1-mbriand@witekio.com>
In-Reply-To: <20221003112812.866-1-mbriand@witekio.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Oct 2022 05:47:05 -1000
Message-ID: 
 <CAOSpxdb_fvWZvW-2aMF0AMYrrekqaBxhRotKFriZ=xQfLn7Mqw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bind: Fix CVEs 2022-2795, 2022-38177,
 2022-38178
To: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
Cc: openembedded-core@lists.openembedded.org,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 15:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171363

On Mon, Oct 3, 2022 at 1:28 AM Mathieu Dubois-Briand
<mathieu.dubois-briand@hyprua.org> wrote:

Patch is missing your Signed-off-by:

>
> ---
>  .../bind/bind/CVE-2022-2795.patch             | 60 +++++++++++++++++++
>  .../bind/bind/CVE-2022-38177.patch            | 25 ++++++++
>  .../bind/bind/CVE-2022-38178.patch            | 26 ++++++++

All three patch files are missing Upstream-Status: CVE: and Signed-off-by: tags

See "Patch name convention and commit message" section at:
https://wiki.yoctoproject.org/wiki/Security

Thanks for helping with CVEs!

Steve

>  .../recipes-connectivity/bind/bind_9.11.37.bb |  3 +
>  4 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch
>
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch b/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
> new file mode 100644
> index 000000000000..10d8e6140bb3
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
> @@ -0,0 +1,60 @@
> +From cd73ad5f5380304627e3c14bc8ff5d8e8794607c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <michal@isc.org>
> +Date: Thu, 8 Sep 2022 11:11:30 +0200
> +Subject: [PATCH 1/3] Bound the amount of work performed for delegations
> +
> +Limit the amount of database lookups that can be triggered in
> +fctx_getaddresses() (i.e. when determining the name server addresses to
> +query next) by setting a hard limit on the number of NS RRs processed
> +for any delegation encountered.  Without any limit in place, named can
> +be forced to perform large amounts of database lookups per each query
> +received, which severely impacts resolver performance.
> +
> +The limit used (20) is an arbitrary value that is considered to be big
> +enough for any sane DNS delegation.
> +
> +(cherry picked from commit 3a44097fd6c6c260765b628cd1d2c9cb7efb0b2a)
> +---
> + lib/dns/resolver.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
> +index 8ae9a993bbd7..ac9a9ef5d009 100644
> +--- a/lib/dns/resolver.c
> ++++ b/lib/dns/resolver.c
> +@@ -180,6 +180,12 @@
> +  */
> + #define NS_FAIL_LIMIT 4
> + #define NS_RR_LIMIT   5
> ++/*
> ++ * IP address lookups are performed for at most NS_PROCESSING_LIMIT NS RRs in
> ++ * any NS RRset encountered, to avoid excessive resource use while processing
> ++ * large delegations.
> ++ */
> ++#define NS_PROCESSING_LIMIT 20
> +
> + /* Number of hash buckets for zone counters */
> + #ifndef RES_DOMAIN_BUCKETS
> +@@ -3318,6 +3324,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
> +       bool need_alternate = false;
> +       bool all_spilled = true;
> +       unsigned int no_addresses = 0;
> ++      unsigned int ns_processed = 0;
> +
> +       FCTXTRACE5("getaddresses", "fctx->depth=", fctx->depth);
> +
> +@@ -3504,6 +3511,11 @@ fctx_getaddresses(fetchctx_t *fctx, bool badcache) {
> +
> +               dns_rdata_reset(&rdata);
> +               dns_rdata_freestruct(&ns);
> ++
> ++              if (++ns_processed >= NS_PROCESSING_LIMIT) {
> ++                      result = ISC_R_NOMORE;
> ++                      break;
> ++              }
> +       }
> +       if (result != ISC_R_NOMORE) {
> +               return (result);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch b/meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
> new file mode 100644
> index 000000000000..7a76048b4da9
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
> @@ -0,0 +1,25 @@
> +From 2275d217a8ceb6f970749b364a075651052c04f5 Mon Sep 17 00:00:00 2001
> +From: Mark Andrews <marka@isc.org>
> +Date: Thu, 11 Aug 2022 15:15:34 +1000
> +Subject: [PATCH 2/3] Free eckey on siglen mismatch
> +
> +---
> + lib/dns/opensslecdsa_link.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/dns/opensslecdsa_link.c b/lib/dns/opensslecdsa_link.c
> +index 83b5b51cd78c..7576e04ac635 100644
> +--- a/lib/dns/opensslecdsa_link.c
> ++++ b/lib/dns/opensslecdsa_link.c
> +@@ -224,7 +224,7 @@ opensslecdsa_verify(dst_context_t *dctx, const isc_region_t *sig) {
> +               siglen = DNS_SIG_ECDSA384SIZE;
> +
> +       if (sig->length != siglen)
> +-              return (DST_R_VERIFYFAILURE);
> ++              DST_RET(DST_R_VERIFYFAILURE);
> +
> +       if (!EVP_DigestFinal_ex(evp_md_ctx, digest, &dgstlen))
> +               DST_RET (dst__openssl_toresult3(dctx->category,
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch b/meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch
> new file mode 100644
> index 000000000000..4e98ca4ef96e
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch
> @@ -0,0 +1,26 @@
> +From 87d51359fd84b8d61ff427c69105524344e1da9c Mon Sep 17 00:00:00 2001
> +From: Mark Andrews <marka@isc.org>
> +Date: Thu, 11 Aug 2022 15:28:13 +1000
> +Subject: [PATCH 3/3] Free ctx on invalid siglen
> +
> +(cherry picked from commit 6ddb480a84836641a0711768a94122972c166825)
> +---
> + lib/dns/openssleddsa_link.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/dns/openssleddsa_link.c b/lib/dns/openssleddsa_link.c
> +index 8b115ec283f0..b4fcd607c131 100644
> +--- a/lib/dns/openssleddsa_link.c
> ++++ b/lib/dns/openssleddsa_link.c
> +@@ -325,7 +325,7 @@ openssleddsa_verify(dst_context_t *dctx, const isc_region_t *sig) {
> +               siglen = DNS_SIG_ED448SIZE;
> +
> +       if (sig->length != siglen)
> +-              return (DST_R_VERIFYFAILURE);
> ++              DST_RET(ISC_R_NOTIMPLEMENTED);
> +
> +       isc_buffer_usedregion(buf, &tbsreg);
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.37.bb b/meta/recipes-connectivity/bind/bind_9.11.37.bb
> index afc8cf0b3b0c..2fca28e684a1 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.37.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.37.bb
> @@ -19,6 +19,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
>             file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
>             file://0001-avoid-start-failure-with-bind-user.patch \
> +           file://CVE-2022-2795.patch \
> +           file://CVE-2022-38177.patch \
> +           file://CVE-2022-38178.patch \
>             "
>
>  SRC_URI[sha256sum] = "0d8efbe7ec166ada90e46add4267b7e7c934790cba9bd5af6b8380a4fbfb5aff"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171360): https://lists.openembedded.org/g/openembedded-core/message/171360
> Mute This Topic: https://lists.openembedded.org/mt/94088047/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


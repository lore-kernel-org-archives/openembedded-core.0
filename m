Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B26C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 16:17:52 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.9439.1668097067116252781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 08:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ki5s5EnE;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id ud5so6279646ejc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bSdnL+g+Bl+qetwvp1HrAwk97Yd966HP/V5w8xcqUEE=;
        b=ki5s5EnEOd7+XRaZ7Wbt+eL2F729gFRDKpxcxQ3qLOurDiAMLdYrGhjDQkdaaiXBNf
         KYkNnxvTpUthIGQnv3myQG9y0eMu4Wadw8rGnNsWVCEzPZAhgOHrtXmWmpZclDMxyByT
         Q9AsVnN3y9j+TkuCQcJEWnqenToXv74sxW10ClBf7Rjeu/OTj3Wf9U8bNij23gP+GIXh
         lF25dTwuq96A3FfwMi1W3nSHHj1PKfGwhdNIa7YKR7IRUM/Kv5y2YH/TQ0V08rMUEA7/
         cicaD+lkEoMg/YQ7R24XCc7kRJZGh13Sc1iwpkpEJld2Wqs+JcOcwxukrnmvCB0i2S15
         na8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSdnL+g+Bl+qetwvp1HrAwk97Yd966HP/V5w8xcqUEE=;
        b=QbiUxVDU2b5QAlHi05CilfcM34agBKAV/p3rZBlX5Y7DZ5fJFwCbT0l9QyN/P2Mj1Q
         rLIV9ZcpZKTvDYzQhheKsRMYI8AgEdQS2F4O/Pu0S/TtBmjHlvhjjv4kwnlO/g971vaW
         IZ+nOgS3FoD7AZG+3Ql64A/n4QlpogVKfYanQWpyVWAzvFn6oGN/2zKYj4FJkh3rZCKj
         ajq/lo48dbR7kCbbQCEJaYnYl3ghuA9tlSPFDHUb60irABGL+4naKq08HFMcVmsT9rcf
         NJ2jgfO70euAfQINXxcOjjARvBaMSrpBXYhYFQy27oydkLdU5h1SBd95DgeqCb+fEyzg
         TAdg==
X-Gm-Message-State: ANoB5plbMYKs4UYxFKruZimPHTCh7wW3vKzEyyycfYtp6fTV9VMFMEAA
	RKgEFTt5e1lhJ+BUODZEUMyU9ZsQo+Ar9abqWwNicw==
X-Google-Smtp-Source: AA0mqf7E8McpVC5LeTxOz11CsKlVZr+O5Q0kZ9jxGeD7ZSuCwkakUsbbDoy7iZD8Nr/EfSfL06IF0QnGkPeI7tVBn6o=
X-Received: by 2002:a17:906:5fce:b0:7ae:8a4b:301 with SMTP id
 k14-20020a1709065fce00b007ae8a4b0301mr5821860ejv.92.1668097065319; Thu, 10
 Nov 2022 08:17:45 -0800 (PST)
MIME-Version: 1.0
References: <20221110062840.52346-1-vkumbhar@mvista.com>
In-Reply-To: <20221110062840.52346-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 10 Nov 2022 06:17:34 -1000
Message-ID: <CAOSpxdZiDzPAM3xtfqA_GnMk=mH=0b_-VzYzCyxny-9KEgLukQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: fix CVE-2022-32221 POST following
 PUT confusion
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 16:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173082

This patch doesn't apply.  It appears you are not at the current dunfell HEAD.

steve@hexa ~/Repos/openembedded-core (stable/dunfell-nut) $ git am -3
~/Downloads/dunfell-curl-fix-CVE-2022-32221-POST-following-PUT-confusion.patch
Applying: curl: fix CVE-2022-32221 POST following PUT confusion
Using index info to reconstruct a base tree...
M meta/recipes-support/curl/curl_7.69.1.bb
.git/rebase-apply/patch:37: trailing whitespace.

.git/rebase-apply/patch:39: trailing whitespace.
--
.git/rebase-apply/patch:41: new blank line at EOF.
+
warning: 3 lines add whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-support/curl/curl_7.69.1.bb
CONFLICT (content): Merge conflict in meta/recipes-support/curl/curl_7.69.1.bb
error: Failed to merge in the changes.
Patch failed at 0001 curl: fix CVE-2022-32221 POST following PUT confusion

Steve

On Wed, Nov 9, 2022 at 8:28 PM vkumbhar <vkumbhar@mvista.com> wrote:
>
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../curl/curl/CVE-2022-32221.patch            | 29 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32221.patch b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
> new file mode 100644
> index 0000000000..ad1769e19a
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
> @@ -0,0 +1,29 @@
> +From 9f9f2ed81151b1063eac5fb0eca5bbb195cbfe79 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Mon, 7 Nov 2022 12:51:19 +0530
> +Subject: [PATCH] CVE-2022-32221
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/a64e3e59938abd7d6]
> +CVE: CVE-2022-32221
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +
> +setopt: when POST is set, reset the 'upload' field.
> +---
> + lib/setopt.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/lib/setopt.c b/lib/setopt.c
> +index 4648c87..48f789c 100644
> +--- a/lib/setopt.c
> ++++ b/lib/setopt.c
> +@@ -486,6 +486,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
> +     }
> +     else
> +       data->set.httpreq = HTTPREQ_GET;
> ++      data->set.upload = FALSE;
> +     break;
> +
> +   case CURLOPT_COPYPOSTFIELDS:
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
> index c3d629108a..a5795c5038 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -13,6 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://CVE-2020-8284.patch \
>             file://CVE-2020-8285.patch \
>             file://CVE-2020-8286.patch \
> +           file://CVE-2022-32221.patch \
>  "
>
>  SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173069): https://lists.openembedded.org/g/openembedded-core/message/173069
> Mute This Topic: https://lists.openembedded.org/mt/94931188/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


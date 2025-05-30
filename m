Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AA3C5AE59
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:34:09 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.2268.1748572448468909360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 19:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkN6XWyM;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7376e311086so1577362b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 19:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748572448; x=1749177248; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZAqa1Jj7Up9FcwUt+d4la/LRD/13t1NcTxiLsKN57s=;
        b=NkN6XWyMuUGPQOXPm9lro+vPjBQMBbJlNEczmbtCPA1ObedVyoXjLqViv/wXQWbp9a
         cEZlXWGg8bcQUQ5qrIZy3xr2kb9aM7I+rBN/K6C4PxGNUKTVuqy53gmm9zpK/EIkxER5
         2pQ4Bo2k/8IPvx+JFWTYASQ+wAXWoFx80bktwINPz/gueUjtIc5vKWvFAA8/zD9+l5zZ
         IpSgeLDL+92Vf/LT3Dq6/iDS6oD1faKntUGC/ehUppzZWISPerAK2ofW/z2ayaNEoCwB
         baXb5YW2TBl+EmIkvkCdgX0R1VLZQw7HcRCSaFm9TLURuutnS7i/DABacUC30TH32NHS
         U7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748572448; x=1749177248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZAqa1Jj7Up9FcwUt+d4la/LRD/13t1NcTxiLsKN57s=;
        b=HBEhYJ1ZCCBNkDfq7wNoc329vhfLfuLMp3vxPZUCrsYVm3iQCr8l5vhehijkQBk0A+
         FjYEoItF3EYodjZyCwrJVWryckrZ0CvhNRsT2Y1E4oMR3pibt1LJtljJLuXpl/cpnxUB
         zrLxgcfO4daUYOstdYnhds0LSd1i+KUnNMk51DsfWcpJwIGcEahLTrmBcQfhg3KRjxwo
         azVLJia/JOu8WKJZX7IgZ0dV7LE1ccccbDZ+AWRr7xMHjMhugeGc3RrZL1RpWzwCYbqG
         DIFRaujKhdoS31wALGyrFdGhlVa/NFCevz4G7qrCoDFS2aceM9FRCa4JccYFdXSL7BWE
         wKvw==
X-Forwarded-Encrypted: i=1; AJvYcCUJoITJPkSa4Hiaf6Iw92Zu1oN8SPDIOqJVC0r+ilK7aaJWC3JjzGmObMx6D+oEubW3ldjzZuM0M60MTmjOhfyLhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuyP9B5vsyY1Zhb5fSzirhCh70lgtK2eWZktHNww104W2v3kt9
	/REt4QEZqBq1QNScSWDIXuXdttWt+P16MjGYVaVR7BFfCDQx2Fyq1rfTV8LYTKbH
X-Gm-Gg: ASbGncs3XxtLwgOkULh9TGCMtzS5nAZMfbQm113V3tjlntBHIWglfThK2orGYG3/IoV
	CPMnjwlPwf9k8eKbqLnCAfMU972nLNFIxD2IKqYAMkB2qBPPN3h5FkKo15D0zRQ6SOQwwYJmBWa
	+L9cuV8INEnLAzhECJiAUKcUh45JflfAjxfIQlctViJ4YUuG2R6kE4J+jZ+qYkdz8ZloWXwy9Jt
	NsLo+kbX7mqInaAz1kLJYCExOJ1INMrboYTxTsKV0xWSPy3fQ5xnytVnO3sbzjdX/JOanKxIYwx
	OVqjSANVJ4CklvsTIwoOxM2jwQ8CGec52EJlLMBgLPK6PZk2bu5zqmLoligvmMfqzhGkbS+MCSi
	HX7vUyUbKd+Z8yKGmp818NTD4d56ICT+4+xtR
X-Google-Smtp-Source: AGHT+IHY71CRpLL8IP3dE+DaorHRL0FdY8FzAzsTvtUFvlKLqS1FESBq5lFgvD82j4Vow4dGYVEZTQ==
X-Received: by 2002:a05:6a21:164e:b0:1f5:931d:ca6d with SMTP id adf61e73a8af0-21ad94f095amr3011368637.1.1748572447814;
        Thu, 29 May 2025 19:34:07 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:791c:f54:adbb:c8c1? ([2601:646:8201:fd20:791c:f54:adbb:c8c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeabb13sm2077691b3a.62.2025.05.29.19.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 19:34:07 -0700 (PDT)
Message-ID: <7f4a1cf8-8886-4593-9278-d40f3e09599e@gmail.com>
Date: Thu, 29 May 2025 19:34:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] libsoup-2.4: Fix CVE-2025-4969
To: hprajapati@mvista.com, openembedded-core@lists.openembedded.org
References: <20250528061230.70782-1-hprajapati@mvista.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250528061230.70782-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 02:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217459

This recipe has been moved to meta-oe in master, and I think this change 
will be desirable for meta-oe/master as well. Would you mind sending it 
there as well ?

On 5/27/25 11:12 PM, Hitendra Prajapati via lists.openembedded.org wrote:
> Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086
> 
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../libsoup/libsoup-2.4/CVE-2025-4969.patch   | 76 +++++++++++++++++++
>   .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>   2 files changed, 77 insertions(+)
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
> 
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
> new file mode 100644
> index 0000000000..d45b2a2cb0
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
> @@ -0,0 +1,76 @@
> +From 07b94e27afafebf31ef3cd868866a1e383750086 Mon Sep 17 00:00:00 2001
> +From: Milan Crha <mcrha@redhat.com>
> +Date: Mon, 19 May 2025 17:48:27 +0200
> +Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
> + members
> +
> +The boundary could be at a place which, calculated, pointed
> +before the beginning of the array. Check the bounds, to avoid
> +read out of the array bounds.
> +
> +Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086]
> +CVE: CVE-2025-4969
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + libsoup/soup-multipart.c |  2 +-
> + tests/multipart-test.c   | 22 ++++++++++++++++++++++
> + 2 files changed, 23 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
> +index dd93973..b3611db 100644
> +--- a/libsoup/soup-multipart.c
> ++++ b/libsoup/soup-multipart.c
> +@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
> + 			continue;
> +
> + 		/* Check that it's at start of line */
> +-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
> ++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
> + 			continue;
> +
> + 		/* Check for "--" or "\r\n" after boundary */
> +diff --git a/tests/multipart-test.c b/tests/multipart-test.c
> +index 834b181..980eb68 100644
> +--- a/tests/multipart-test.c
> ++++ b/tests/multipart-test.c
> +@@ -562,6 +562,27 @@ test_multipart_bounds_bad (void)
> + 	g_bytes_unref (bytes);
> + }
> +
> ++static void
> ++test_multipart_bounds_bad_2 (void)
> ++{
> ++	SoupMultipart *multipart;
> ++	SoupMessageHeaders *headers;
> ++	GBytes *bytes;
> ++	const char *raw_data = "\n--123\r\nline\r\n--123--\r";
> ++
> ++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
> ++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
> ++
> ++	bytes = g_bytes_new (raw_data, strlen (raw_data));
> ++
> ++	multipart = soup_multipart_new_from_message (headers, bytes);
> ++	g_assert_nonnull (multipart);
> ++
> ++	soup_multipart_free (multipart);
> ++	soup_message_headers_free (headers);
> ++	g_bytes_unref (bytes);
> ++}
> ++
> + int
> + main (int argc, char **argv)
> + {
> +@@ -593,6 +614,7 @@ main (int argc, char **argv)
> + 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
> + 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
> + 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
> ++	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
> +
> + 	ret = g_test_run ();
> +
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index b986e2eea2..df97a68b9c 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -31,6 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>              file://CVE-2025-32912-1.patch \
>              file://CVE-2025-32912-2.patch \
>              file://CVE-2025-32914.patch \
> +           file://CVE-2025-4969.patch \
>             "
>   SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217335): https://lists.openembedded.org/g/openembedded-core/message/217335
> Mute This Topic: https://lists.openembedded.org/mt/113339715/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



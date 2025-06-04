Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F54C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 12:13:12 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.15030.1749039187230628126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 05:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mGLfAl36;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso3092897a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749039185; x=1749643985; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xg1ffh8UgPJR602m0fAqfRQQ/O4gTPx7InMDW+PUGr8=;
        b=mGLfAl36bv/Tv7psFK34FLP3w8vvTl1+Fle8UxtiMw+U3SkSjFf5FAeqhdy0RNnBo2
         Ovuiph9TaHW+mpIyQpXOe9Ll7MerJhdcU+JpmVUaCSXxf7lWa82O5CrnJpfZW+OhkX+3
         jIl5R26ePlioOOIe8hImsrZfZ5zTrna5+UtVEky5eLjq10cbCliu6bI9PP9ORCHj9K3r
         WzZ86DsfUXCAhIEuLq33Fl9xUlhVkMiPGgVWXpyOTXJHhzCg/nUxCtWH0jdA+GMP5tZr
         PiDch77CBHOvb8ycVLhaYsHLP9JXIXxZfkpz9gytntudHfgvRwzD607EoWHozjRArY6Z
         Treg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039185; x=1749643985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg1ffh8UgPJR602m0fAqfRQQ/O4gTPx7InMDW+PUGr8=;
        b=uiHROSKF7nVI1zV2k0aqZEaWCr9bsKsa3Lz3J602k90o6o3pducSU8xDC/dvYa27+w
         paxAKaNUQg5ZQoXKvAct0jSN7Bivuah86q9emgsUTSvTHZe0ljdFQO7X+eqpENkpPoUh
         KjydAG7Nj8BAirAxxBHMKSbAU7OdU4cf1jRSsnzwRGFR4QqcvyOU18+kX1JlXvNC4B0V
         1bEXZGxwE+CaaEWUDV1ziszkCzJ359Itq7GzsuN4SkUy6EuZSDqfqKDZl5RgGNdwD7e2
         KwvEa8tx3VXM5nzB6s5u5qhPTAyJf9eGCLHbdgOKYHSlyvzqW3JiJvl/CyKwEoK0p9wM
         EQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVOXpVBGA83gfsyg1hBnJ6/KlY82Gi7cKwJJKC51K6XQoVgcXSGPIKxbTuPL1WCYDuaJb7plXOePxLfLA/sFGWOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywr0iJ134YkT/lUVkeypl5AMT77YaL192VH3pVmt/ZL1KwZHrkV
	FWsJbh/ewg4QTC7P2QIX3UrssMlzEvpIjBdfH/a3u5gINHCbrFZwLdDJXiQxSw==
X-Gm-Gg: ASbGncs0NVae+xmNmtafNouEyCnSxqIAcuSaGWv1C0K4gPLQuXosmCnXxvOcvTiTjjI
	39ixamKcRuF69giseX/gDpKo3FZt0w/Q+U8is9bAnU1rNFQVTT67hCsYaOWkYDT52o4yJX0GQ1E
	e8etJJrDlYhHTqEx4MJSH5cFaHFMComJCizae1ApNp3UqsFquxsnRnP/NDc2lDe5wZLpsPW385Q
	alCL5JO3vivt1cq88/TmVZG7tqYAcabytvQL2UAUsj4FvViqcMzLlXFj4CHoMw6dVKi19owm9Fi
	HBbBDjOr3H4bO3EPMR4jh/Ph6xMRXM4DVVL7Vzgpf5h5w7CBB5K8xkV89RM=
X-Google-Smtp-Source: AGHT+IGuDT+NjlzF2ghx3kMNhGvB/Pq9IlJ2BVjflYNm7qu7x/xuXZgzCoWZkbaIp5PgtB+zC9JJCQ==
X-Received: by 2002:a05:6402:430f:b0:602:241c:345 with SMTP id 4fb4d7f45d1cf-606ea38db52mr2367816a12.23.1749039185112;
        Wed, 04 Jun 2025 05:13:05 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606bea242d3sm1907963a12.60.2025.06.04.05.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:13:04 -0700 (PDT)
Message-ID: <be3d0085-1099-401c-b4bc-d30b19cf5b12@gmail.com>
Date: Wed, 4 Jun 2025 14:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH V2 06/14] libsoup-2.4: fix
 CVE-2025-46421
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <20250604113426.464818-1-changqing.li@windriver.com>
 <20250604113426.464818-7-changqing.li@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250604113426.464818-7-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 12:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217942

On 6/4/25 13:34, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/439
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 48 +++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
> new file mode 100644
> index 0000000000..64706f43aa
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
> @@ -0,0 +1,48 @@
> +From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Wed, 5 Feb 2025 16:18:10 -0600
> +Subject: [PATCH] session: Strip authentication credentails on
> + cross-origin redirect
> +
> +This should match the behavior of Firefox and Safari but not of Chromium.
> +
> +CVE: CVE-2025-46421
> +Upstream-Status: Backport
> +[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
> +
> +Test code not added since it included some headers not in version 2.74.3
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-session.c |  8 ++++-
> + tests/auth-test.c      | 78 ++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 85 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
> +index 83421ef..8d6ac61 100644
> +--- a/libsoup/soup-session.c
> ++++ b/libsoup/soup-session.c
> +@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
> + 						   SOUP_ENCODING_NONE);
> + 	}
> + 
> ++	/* Strip all credentials on cross-origin redirect. */
> ++	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
> ++		//soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_AUTHORIZATION);

I think for libsoup-2.4 this would be something along the lines of

soup_message_headers_remove(msg->request_headers, "Authorization");

or wouldn't it?

> ++		soup_message_set_auth (msg, NULL);
> ++	}
> ++
> + 	soup_message_set_uri (msg, new_uri);
> + 	soup_uri_free (new_uri);
> + 
> + 	soup_session_requeue_message (session, msg);
> + 	return TRUE;
> +-}
> ++}
> + 
> + static void
> + redirect_handler (SoupMessage *msg, gpointer user_data)
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 3f66099361..d37b553a92 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -35,6 +35,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>             file://CVE-2025-32053.patch \
>             file://CVE-2025-32052.patch \
>             file://CVE-2025-32050.patch \
> +           file://CVE-2025-46421.patch \
>  "
>  SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217933): https://lists.openembedded.org/g/openembedded-core/message/217933
> Mute This Topic: https://lists.openembedded.org/mt/113464308/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



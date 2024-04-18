Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3CBC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 23:41:25 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.8460.1713483677817287831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 16:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jm1N5k1M;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6eb8ea5ac95so827547a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713483677; x=1714088477; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF3K6v9iCWmRDhJ3ze7nuu67N16pou+KFhBIzV46/IY=;
        b=Jm1N5k1MBF84jkYNcsYWUAA6O4ZoOxAt/UBM5CAvmhkF3Oihve6RAVmq9M0PnfvCak
         LsP0D+fpwENQEpTbVI7cDmtuY/Ap6AM+Udlz5KRvc6pPIYXDGfBOYD/jkzhPDfpA/VJr
         y+5qRFrjSjlF21pFYfwb+vITM41H9dpll+wEQ4psjh/vjxzgEdHpvO8aedvBeHbLN58j
         XxsPLZxer3u91rVY9z0Q9mJPhO63NhJqfpgXXyjzHrp491NsXRu82nKHafPoAPbobWT2
         ND56Ntbsgj9Umf9zMYDKUQkWSSAfTMl3/KVh3imv18Y9hpqb9l8YRhzibHFcWoYLWVcV
         UGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713483677; x=1714088477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IF3K6v9iCWmRDhJ3ze7nuu67N16pou+KFhBIzV46/IY=;
        b=WpOIXLlEY3dgKUzxvpKnti5CkstLESQNPvtsPdeqcBrqgHSPDHVh1PNKQ4XWuN9r4l
         uxB98vnies2Gtdz6JSctbsKJZ84+rTTMOjpfDfkNzmxFwKyU3aHzUXKVw9CJ/U0Loj+M
         LQvDNdHW8QEH8nA7gY7MNNgvCavL85ZlAZAlCCB29LXM0V7J2b3fn1qspHH4SKtEl1YV
         0wfm/nzr3hLKIXehYi8wy8Cz7QykhrbtHldhldgx2tKkR/8vHonpzPw6iGB64NWESfaN
         SxyIf86mrOD+0cwS1mCIIhCWl8JS6LpRKBmylBiMYu5IGG4Zu7dnNf7cMe0NtimbYoXM
         VXQQ==
X-Gm-Message-State: AOJu0Yxzq87E1op/IAiYjihXSMviK5mSu8Mzpxor+SAJ8EFB/z5NxWSQ
	9S3LuUk9QqAWDLZx1m3J5PutJumvW4JucGzzFg/4Kbd7At90zEBSiVea2Ulk8i12juKHX6E/Zrs
	0InWZUltdwX6luWMH4T2H0+NK4eYqwyMB
X-Google-Smtp-Source: AGHT+IE7rMq/vjIOQn2GUvuhqq8Z+vndnlGyfINnxeJk294r/XpGgTQ+38L1RCTS8vgx3CHkZDxj38/zUM/z3FALlvw=
X-Received: by 2002:a05:6870:b00b:b0:235:489e:95e9 with SMTP id
 y11-20020a056870b00b00b00235489e95e9mr692193oae.25.1713483676765; Thu, 18 Apr
 2024 16:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240418080501.3170793-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240418080501.3170793-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Apr 2024 16:40:50 -0700
Message-ID: <CAMKF1srLmUhRpXfKLgXTowh6jCRLqP4iHcwkjfgK9QEUG+QyTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] git: Backport patch to fix with curl 8.7.0 onwards
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 23:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198525

On Thu, Apr 18, 2024 at 1:05=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> bitbake-selftest was failing on a github url on hosts using buildtools.
> The issue was tracked down to the curl upgrade 8.6.0 -> 8.7.1 and there
> is a fix in upstream git we can backport to address it.
>

Thanks for tracking it down. LGTM

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...98a77463e9d24c19c8d9473fd2152d5840c4.patch | 195 ++++++++++++++++++
>  meta/recipes-devtools/git/git_2.44.0.bb       |   1 +
>  2 files changed, 196 insertions(+)
>  create mode 100644 meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d=
9473fd2152d5840c4.patch
>
> diff --git a/meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d9473fd2=
152d5840c4.patch b/meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d947=
3fd2152d5840c4.patch
> new file mode 100644
> index 00000000000..cd04cef30df
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git/eba498a77463e9d24c19c8d9473fd2152d584=
0c4.patch
> @@ -0,0 +1,195 @@
> +Backport a fix from upstream for curl 8.7 compatibility.
> +
> +Upstream-Status: Backport
> +
> +From 324231174247c70e66908b78924908fbfcebed19 Mon Sep 17 00:00:00 2001
> +From: Jeff King <peff@peff.net>
> +Date: Tue, 2 Apr 2024 16:05:17 -0400
> +Subject: [PATCH 1/3] http: reset POSTFIELDSIZE when clearing curl handle
> +
> +In get_active_slot(), we return a CURL handle that may have been used
> +before (reusing them is good because it lets curl reuse the same
> +connection across many requests). We set a few curl options back to
> +defaults that may have been modified by previous requests.
> +
> +We reset POSTFIELDS to NULL, but do not reset POSTFIELDSIZE (which
> +defaults to "-1"). This usually doesn't matter because most POSTs will
> +set both fields together anyway. But there is one exception: when
> +handling a large request in remote-curl's post_rpc(), we don't set
> +_either_, and instead set a READFUNCTION to stream data into libcurl.
> +
> +This can interact weirdly with a stale POSTFIELDSIZE setting, because
> +curl will assume it should read only some set number of bytes from our
> +READFUNCTION. However, it has worked in practice because we also
> +manually set a "Transfer-Encoding: chunked" header, which libcurl uses
> +as a clue to set the POSTFIELDSIZE to -1 itself.
> +
> +So everything works, but we're better off resetting the size manually
> +for a few reasons:
> +
> +  - there was a regression in curl 8.7.0 where the chunked header
> +    detection didn't kick in, causing any large HTTP requests made by
> +    Git to fail. This has since been fixed (but not yet released). In
> +    the issue, curl folks recommended setting it explicitly to -1:
> +
> +      https://github.com/curl/curl/issues/13229#issuecomment-2029826058
> +
> +    and it indeed works around the regression. So even though it won't
> +    be strictly necessary after the fix there, this will help folks who
> +    end up using the affected libcurl versions.
> +
> +  - it's consistent with what a new curl handle would look like. Since
> +    get_active_slot() may or may not return a used handle, this reduces
> +    the possibility of heisenbugs that only appear with certain request
> +    patterns.
> +
> +Note that the recommendation in the curl issue is to actually drop the
> +manual Transfer-Encoding header. Modern libcurl will add the header
> +itself when streaming from a READFUNCTION. However, that code wasn't
> +added until 802aa5ae2 (HTTP: use chunked Transfer-Encoding for HTTP_POST
> +if size unknown, 2019-07-22), which is in curl 7.66.0. We claim to
> +support back to 7.19.5, so those older versions still need the manual
> +header.
> +
> +Signed-off-by: Jeff King <peff@peff.net>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +---
> + http.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/http.c b/http.c
> +index e73b136e5897bd..3d80bd6116e9e4 100644
> +--- a/http.c
> ++++ b/http.c
> +@@ -1452,6 +1452,7 @@ struct active_request_slot *get_active_slot(void)
> +       curl_easy_setopt(slot->curl, CURLOPT_READFUNCTION, NULL);
> +       curl_easy_setopt(slot->curl, CURLOPT_WRITEFUNCTION, NULL);
> +       curl_easy_setopt(slot->curl, CURLOPT_POSTFIELDS, NULL);
> ++      curl_easy_setopt(slot->curl, CURLOPT_POSTFIELDSIZE, -1L);
> +       curl_easy_setopt(slot->curl, CURLOPT_UPLOAD, 0);
> +       curl_easy_setopt(slot->curl, CURLOPT_HTTPGET, 1);
> +       curl_easy_setopt(slot->curl, CURLOPT_FAILONERROR, 1);
> +
> +From c28ee09503ffcb1f32cbb30dc57fa810cdac122c Mon Sep 17 00:00:00 2001
> +From: Jeff King <peff@peff.net>
> +Date: Tue, 2 Apr 2024 16:06:00 -0400
> +Subject: [PATCH 2/3] INSTALL: bump libcurl version to 7.21.3
> +
> +Our documentation claims we support curl versions back to 7.19.5. But we
> +can no longer compile with that version since adding an unconditional
> +use of CURLOPT_RESOLVE in 511cfd3bff (http: add custom hostname to IP
> +address resolutions, 2022-05-16). That feature wasn't added to libcurl
> +until 7.21.3.
> +
> +We could add #ifdefs to make this work back to 7.19.5. But given that
> +nobody noticed the compilation failure in the intervening two years, it
> +makes more sense to bump the version in the documentation to 7.21.3
> +(which is itself over 13 years old).
> +
> +We could perhaps go forward even more (which would let us drop some
> +cruft from git-curl-compat.h), but this should be an obviously safe
> +jump, and we can move forward later.
> +
> +Note that user-visible syntax for CURLOPT_RESOLVE has grown new features
> +in subsequent curl versions. Our documentation mentions "+" and "-"
> +entries, which require more recent versions than 7.21.3. We could
> +perhaps clarify that in our docs, but it's probably not worth cluttering
> +them with restrictions of ancient curl versions.
> +
> +Signed-off-by: Jeff King <peff@peff.net>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +---
> + INSTALL | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/INSTALL b/INSTALL
> +index c6fb240c91eb90..2a46d045928a11 100644
> +--- a/INSTALL
> ++++ b/INSTALL
> +@@ -139,7 +139,7 @@ Issues of note:
> +         not need that functionality, use NO_CURL to build without
> +         it.
> +
> +-        Git requires version "7.19.5" or later of "libcurl" to build
> ++        Git requires version "7.21.3" or later of "libcurl" to build
> +         without NO_CURL. This version requirement may be bumped in
> +         the future.
> +
> +
> +From 92a209bf245c6497f3742b9df7a1463ddf067ea6 Mon Sep 17 00:00:00 2001
> +From: Jeff King <peff@peff.net>
> +Date: Fri, 5 Apr 2024 16:04:51 -0400
> +Subject: [PATCH 3/3] remote-curl: add Transfer-Encoding header only for =
older
> + curl
> +
> +As of curl 7.66.0, we don't need to manually specify a "chunked"
> +Transfer-Encoding header. Instead, modern curl deduces the need for it
> +in a POST that has a POSTFIELDSIZE of -1 and uses READFUNCTION rather
> +than POSTFIELDS.
> +
> +That version is recent enough that we can't just drop the header; we
> +need to do so conditionally. Since it's only a single line, it seems
> +like the simplest thing would just be to keep setting it unconditionally
> +(after all, the #ifdefs are much longer than the actual code). But
> +there's another wrinkle: HTTP/2.
> +
> +Curl may choose to use HTTP/2 under the hood if the server supports it.
> +And in that protocol, we do not use the chunked encoding for streaming
> +at all. Most versions of curl handle this just fine by recognizing and
> +removing the header. But there's a regression in curl 8.7.0 and 8.7.1
> +where it doesn't, and large requests over HTTP/2 are broken (which t5559
> +notices). That regression has since been fixed upstream, but not yet
> +released.
> +
> +Make the setting of this header conditional, which will let Git work
> +even with those buggy curl versions. And as a bonus, it serves as a
> +reminder that we can eventually clean up the code as we bump the
> +supported curl versions.
> +
> +Signed-off-by: Jeff King <peff@peff.net>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +---
> + git-curl-compat.h | 9 +++++++++
> + remote-curl.c     | 3 +++
> + 2 files changed, 12 insertions(+)
> +
> +diff --git a/git-curl-compat.h b/git-curl-compat.h
> +index fd96b3cdffdb6c..e1d0bdd273501f 100644
> +--- a/git-curl-compat.h
> ++++ b/git-curl-compat.h
> +@@ -126,6 +126,15 @@
> + #define GIT_CURL_HAVE_CURLSSLSET_NO_BACKENDS
> + #endif
> +
> ++/**
> ++ * Versions before curl 7.66.0 (September 2019) required manually setti=
ng the
> ++ * transfer-encoding for a streaming POST; after that this is handled
> ++ * automatically.
> ++ */
> ++#if LIBCURL_VERSION_NUM < 0x074200
> ++#define GIT_CURL_NEED_TRANSFER_ENCODING_HEADER
> ++#endif
> ++
> + /**
> +  * CURLOPT_PROTOCOLS_STR and CURLOPT_REDIR_PROTOCOLS_STR were added in =
7.85.0,
> +  * released in August 2022.
> +diff --git a/remote-curl.c b/remote-curl.c
> +index 1161dc7fed6892..603c11ba667246 100644
> +--- a/remote-curl.c
> ++++ b/remote-curl.c
> +@@ -1,4 +1,5 @@
> + #include "git-compat-util.h"
> ++#include "git-curl-compat.h"
> + #include "config.h"
> + #include "environment.h"
> + #include "gettext.h"
> +@@ -960,7 +961,9 @@ static int post_rpc(struct rpc_state *rpc, int state=
less_connect, int flush_rece
> +               /* The request body is large and the size cannot be predi=
cted.
> +                * We must use chunked encoding to send it.
> +                */
> ++#ifdef GIT_CURL_NEED_TRANSFER_ENCODING_HEADER
> +               headers =3D curl_slist_append(headers, "Transfer-Encoding=
: chunked");
> ++#endif
> +               rpc->initial_buffer =3D 1;
> +               curl_easy_setopt(slot->curl, CURLOPT_READFUNCTION, rpc_ou=
t);
> +               curl_easy_setopt(slot->curl, CURLOPT_INFILE, rpc);
> diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devto=
ols/git/git_2.44.0.bb
> index 90e555eba7c..3ae02f29387 100644
> --- a/meta/recipes-devtools/git/git_2.44.0.bb
> +++ b/meta/recipes-devtools/git/git_2.44.0.bb
> @@ -10,6 +10,7 @@ PROVIDES:append:class-native =3D " git-replacement-nati=
ve"
>
>  SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=
=3Dtarball \
>             file://fixsort.patch \
> +           file://eba498a77463e9d24c19c8d9473fd2152d5840c4.patch \
>             file://0001-config.mak.uname-do-not-force-RHEL-7-specific-bui=
ld-.patch \
>             "
>
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198504): https://lists.openembedded.org/g/openembedde=
d-core/message/198504
> Mute This Topic: https://lists.openembedded.org/mt/105594103/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


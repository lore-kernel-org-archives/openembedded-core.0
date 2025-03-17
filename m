Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BDAC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 12:19:44 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.50402.1742212387831649602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWm7DPhG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so6460728a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742212386; x=1742817186; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fczrd43O8vamlSBccE6+EwN3CFqybeQ5NKROKQSsLw0=;
        b=eWm7DPhGDyhdYzrlg/aUEIyyeYknjAFzxxjiZWx2gbMguk9fERNXLhDt2RqWVVv1ia
         Qe7drS5hxIldR9CljH/bWfv7AY099tGugnFqnmZFCzDF5MH89poYDJ/+KWbQ0no5BVeo
         icfUXzXIbE6a5QIqyhRnr1407UM0hBkyIIq2sxLuGb/C6OEtFjphGSNvAkeWVWl2Ir20
         l/sFqn50JKB6fWF8ZVS7bWHHj6RG6/d8BWWJbr3EXzAzGBASGr7eBzhNuZVE6XEW2Ezx
         taNla0mFFQqXgf1jKYO4eJIKCP6IV2gfs0co0QoV2odQvMzyuWImQMVBNE2ZxKoqp4Dd
         NhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212386; x=1742817186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fczrd43O8vamlSBccE6+EwN3CFqybeQ5NKROKQSsLw0=;
        b=EvjaTQv0ZckKMNf9L6Qu51J9MCAhfKSfANExPUDAGv0NO4bGQFPD7hTz4XkRBvlZvb
         SoIU4zDUzXR4SIpNOlqML/OKNTJ+AwJj/59U/LFl7RSxujmb4JOpEH3FAkUc34q+y/LD
         UraU1jCVgRi5lI/y96yuffA+dgfcSePmZfuLJCmRkgUooGrnI71RYGBcXySD/qwhEJqk
         DGQcePMne6LAhtcoNmhtzOv32kJwzjOs5i/UaOLAdL2MsW8pen5KMkJygjSly7EtuDg6
         MuL6Ut9+1ji3NFd4Ix613T3tb5eGF/ERMYNwsPm2rbc6n/9SYEHik7q+7vbHso+SnKA0
         7PhQ==
X-Gm-Message-State: AOJu0YySVSpj3A3is+UgHRuI7rSqNnt2PlebM4kZMD5gupluCkceqi31
	dhp8LbHGLGe+H2Qu4uKq9D73nrqhBRU0qr2Scyismvjjd/LxJP0YVlhEzEg4P/RT491dVeG8ivf
	TdryggCep9W9JanOqCuEgdYWuDEM7cw==
X-Gm-Gg: ASbGncuMLMu3psNrNiM2w6cCOwIb3D+yFfN+69pjv2Vp1kGZuIwkOJ2SAXDsUKOrhuS
	seM1rqdkIqNSDfxbH6S2fHJODxtbsqhUx0PbDLy/o847hANdopXc45NG4/VZp/OfeISSmsfmlVl
	If9E/6wjTG3+nj4c1EHk+uVsHr46sAaQVRVFzNQg==
X-Google-Smtp-Source: AGHT+IFxnEN9g6OsLW3Do7d9ADaVkCS9B+d34/8rRTOKk0S4Wy1luCmDnCawfC1OkUjd9FNpeqLZQS/rP7m0RXXVQw8=
X-Received: by 2002:aa7:d481:0:b0:5e8:bf18:587 with SMTP id
 4fb4d7f45d1cf-5e8bf1805f7mr8330622a12.16.1742212385974; Mon, 17 Mar 2025
 04:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250314144539.2885974-1-frederikbraendstrup@gmail.com>
In-Reply-To: <20250314144539.2885974-1-frederikbraendstrup@gmail.com>
From: =?UTF-8?Q?Frederik_Br=C3=A6ndstrup?= <frederikbraendstrup@gmail.com>
Date: Mon, 17 Mar 2025 12:52:55 +0100
X-Gm-Features: AQ5f1JrXoQ7c9Q0NJ70EL-NzXt5CHuxxT9P4rm3Jn_gxqlqYXfmDMN6H3wi58R0
Message-ID: <CADs2FCHRm4-fjjNJyCTB8s_ch6mP62FPjNgp4jKYP=E_tmxK_w@mail.gmail.com>
Subject: [PATCH] Check if version is actually a file
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Frederik_Br=C3=A6ndstrup?= <frederikbraendstrup@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 12:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213209

Recipetool incorrectly made the assumption that version is always a
file, but when it's a directory, the call to open fails

Signed-off-by: Frede Braendstrup <frederikbraendstrup@gmail.com>
---
 scripts/lib/recipetool/create_buildsys.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys.py
b/scripts/lib/recipetool/create_buildsys.py
index ec9d510e23..0a08fc64ca 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -808,6 +808,8 @@ class VersionFileRecipeHandler(RecipeHandler):
             version = None
             for fileitem in filelist:
                 linecount = 0
+                if not os.path.isfile(fileitem):
+                    continue
                 with open(fileitem, 'r', errors='surrogateescape') as f:
                     for line in f:
                         line = line.rstrip().strip('"\'')
--
2.47.2


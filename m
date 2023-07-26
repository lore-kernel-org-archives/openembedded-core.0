Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CE6C001B0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 11:20:09 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.8616.1690370401677743521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 04:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HJ7fG3qo;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b962c226ceso96506231fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 04:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690370400; x=1690975200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YnlLjljMt0hHCjHiyczZlw9qpJ7ynUKK5hLq1x1l3+M=;
        b=HJ7fG3qoFTob7YFB7Stbh+Y0mfAjydCi3JNHU6V6SJA/P87r2tk1tDyO4/SWYdD2zJ
         lUhQpZCyBKf6fkyzsJGwjw2QCFQeN9AT5C5hUCNedrBWmWhWB93R5fiJ2NAmpn1s5wQB
         bB8bcOCgxQCS+WplzEULhV+BCi4xlliro3pxJb6MAhNN//+fWQ0YOwxxBq0doHY6+GsK
         r3GmqKao5UwysNboUeERMcIPSiENzr+psp4QRj4Y5mxVs+LNTz93uTArrU/7Hfazhngh
         b8YFGEe5q7QmDgqY6sQjft0kiWReSgS8MDXBSM7qMncIByQhxgvG5lAY5xS+YzHFpAlx
         9ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690370400; x=1690975200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnlLjljMt0hHCjHiyczZlw9qpJ7ynUKK5hLq1x1l3+M=;
        b=ECk2qfiH+eobQagxaxsaeLXeCwpm/NQcDUG228x4glVQA27szm7QDJgx6zz3sGLyWm
         tHAu7gkX43IGBZaDvCwbtN4K7pzmHOBzUmoZeXAn5cQIJapsMMTQxSOyTTItNak6bq4b
         dDE7qJkTFOqdtzr4YOlPMys5P7zFnD9Wpv+bhdbxRYnNf0A2nND/6aWSVdctNc/pmF62
         9Az+4Xqt/u4tD75cXTf1RhfXakXKTEwXxPofkxBaEDOKIRvQW1HBjzbT6eQ73cS+Y2q0
         h2fNw53eYVF0amSiLD5fQg57hYeij6E8S3m38EvAETU71fLVEi4vbA33qEqpJlfoRygD
         DHYQ==
X-Gm-Message-State: ABy/qLa/H1tFiPS6Ktg5/iOKs/3QQCKWjwv+S1NfbJ1HtQSpp91JSNXH
	5LgOPOp2oAZ4dWW9gFy3rb20sLPj74WyI9PRU8M=
X-Google-Smtp-Source: APBJJlGGCqk5tKqnqrGKUvw1b+hHjLMihumnvidijof5mr8FYrEd79GOJIi5lus3X71lUwyjBXMhRCtzC0K6JQRy1Jc=
X-Received: by 2002:a2e:9303:0:b0:2b6:9f5d:e758 with SMTP id
 e3-20020a2e9303000000b002b69f5de758mr1320937ljh.9.1690370399501; Wed, 26 Jul
 2023 04:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230726110946.129932-1-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20230726110946.129932-1-enrico.scholz@sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Jul 2023 13:19:48 +0200
Message-ID: <CANNYZj_kQcXA6hfDJBCMrE9DjP5dkoHsFwozzM5oKpuMzecNyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe.data: allow to mask out secret variables
To: enrico.scholz@sigma-chemnitz.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 11:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184877

Please no. These things can leak out in a million other ways (e.g. if
you publish logs), it's better to just scrub them prior to publishing
with a post-script. Having secrets in bitbake variables is a bad idea
to begin with.

Alex

On Wed, 26 Jul 2023 at 13:10, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
>
> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>
> Some integrations require that passwords or secret tokens are
> assigned to bitbake variables.  E.g. the meta-dependencytrack
> layer has a 'DEPENDENCYTRACK_API_KEY' or my sstate-server requires
> a 'SSTATE_SERVER_SESSION' token.
>
> These secrets will appear in testdata.json which can easily leak them
> when the deploy directory is published publicly.
>
> Patch adds a special 'secrets' flag for variables.  When a variable is
> marked with it, its content will be replaced by '**masked**'.
>
> E.g. formerly
>
> |    "SSTATE_SERVER_PATH": "HKBOZ8C279S4iwBA",
> |    "SSTATE_MIRRORS": "    ... https://sstate..../api/v1/download/HKBOZ8C279S4iwBA/sstate/...
>
> and now
>
> |    "SSTATE_SERVER_PATH": "**masked**",
> |    "SSTATE_MIRRORS": "    ... https://sstate..../api/v1/download/**masked**/sstate
>
> Corresponding bbclass contains
>
> | SSTATE_SERVER_PATH ??= "-"
> | SSTATE_SERVER_PATH[secret] = "true"
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/lib/oe/data.py | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
> index 37121cfad2b7..57a8e5b5e049 100644
> --- a/meta/lib/oe/data.py
> +++ b/meta/lib/oe/data.py
> @@ -5,7 +5,9 @@
>  #
>
>  import json
> +import re
>  import oe.maketype
> +import oe.types
>
>  def typed_value(key, d):
>      """Construct a value for the specified metadata variable, using its flags
> @@ -23,9 +25,10 @@ def typed_value(key, d):
>      except (TypeError, ValueError) as exc:
>          bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
>
> -def export2json(d, json_file, expand=True, searchString="",replaceString=""):
> +def export2json(d, json_file, expand=True, searchString="",replaceString="", mask_secrets=True):
>      data2export = {}
>      keys2export = []
> +    secrets = []
>
>      for key in d.keys():
>          if key.startswith("_"):
> @@ -38,12 +41,34 @@ def export2json(d, json_file, expand=True, searchString="",replaceString=""):
>              continue
>          elif d.getVarFlag(key, "func"):
>              continue
> +        elif mask_secrets and oe.types.boolean(d.getVarFlag(key, "secret") or "false"):
> +            var = d.getVar(key)
> +
> +            ## When secret variable contains a placeholder (is empty
> +            ## or single character), show it.  When it is too short
> +            ## emit a warning and exclude it completely from output
> +            ## but do not mask out its value in other places.
> +            if var is None or len(var) < 2:
> +                bb.debug(1, "variable '%s' is marked as secret but seems to contain some placeholder; showing it" % key)
> +            elif len(var) < 8:
> +                bb.warn("variable '%s' is marked as secret but content is too short; skipping it" % key)
> +                continue
> +            else:
> +                secrets.append(re.escape(var))
>
>          keys2export.append(key)
>
> +    if len(secrets) == 0:
> +        secrets = None
> +    else:
> +        secrets = re.compile('|'.join(secrets))
> +
>      for key in keys2export:
>          try:
> -            data2export[key] = d.getVar(key, expand).replace(searchString,replaceString)
> +            var = d.getVar(key, expand).replace(searchString,replaceString)
> +            if secrets:
> +                var = secrets.sub("**masked**", var)
> +            data2export[key] = var
>          except bb.data_smart.ExpansionError:
>              data2export[key] = ''
>          except AttributeError:
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184876): https://lists.openembedded.org/g/openembedded-core/message/184876
> Mute This Topic: https://lists.openembedded.org/mt/100368202/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


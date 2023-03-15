Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD71C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:58:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.12418.1678895876156200930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KaUVF9oq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id r27so24880444lfe.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678895874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMzvcw1zequHOYoYaDJLhb+cyWdbnEqHxxyE5tUglN0=;
        b=KaUVF9oqkfjo598jv80taS8VlpDRvhjcxa4zPgF46NqDFHTKI9Glv5Bo5vNltHn7sS
         WpNVSsAWmBZCOKYLVMIVVLMmkN+MmRDqcNE8gX//qVuPEO8R92G+Xmros2NV+JfCDoOh
         VkHrKBN8xUg5+Bz3VH2pdm1DuFK+m7Fyj18t3EEtn1Yh3a6ZYCXEiJqquaaUTvf9lv/z
         w5wT8Ra8lHZ9TUZBHqzzFOgfqC7MA+ZEdwb0p4CixibdYAc3PSH164pxwUGRaw4jQMqh
         0zcoxdndayph2eQ8SfV2YODE9uQKaG4Oevu6F89Pa4Krq08pR5cBnNvLwMDn7B/3dxJF
         tXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678895874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMzvcw1zequHOYoYaDJLhb+cyWdbnEqHxxyE5tUglN0=;
        b=JJ2j7CdPuLUvfvfCmL58Hwtqkmv9r5WjMYmt+fOQoZxoxiJYQGmPUocE56PQGwvRhd
         x0BzOn3qzPXUIOMp6WOnfD1TjtGRlvsiEu/PCKci6qZT7u9+ggd2vE6B7s2713xOX8tP
         rxrdGBXufpWMuvUNsnCDOuyq59wWeHd9uPnBIAk4zF2aG8bp74rbQYXTzDMMBLpLy4l9
         9xF4Sio8STPajElilHGzPq5+I4CmWLCeguFv2fupNlWceFu3aGkMpTPCaFaODhMXTnrl
         a566eaCT0iyn0gqpwENLtEjC/IjnCFb7C/IcjdqT5Hb9LuEmfbITnhaqhxFxaOISmnbG
         X3Ww==
X-Gm-Message-State: AO0yUKXxiwk8UJkZh7g/H73qkKwVHjFOWUPRFvcuaLQyqb7QsjNCZs6i
	Juh3w0kIoeqZVjrPDSp62bT1UqA8zFZ6iUn6Ct0nGS70
X-Google-Smtp-Source: AK7set+fIvFndYosJaj40sSOLbRDQ3yxzS9lorwxTa3OYk31wKq05yKw99JxIbTAWEQ86iqjgBXX+viTYWnaCYClBK0=
X-Received: by 2002:ac2:562b:0:b0:4e8:426d:123f with SMTP id
 b11-20020ac2562b000000b004e8426d123fmr2149151lff.11.1678895874286; Wed, 15
 Mar 2023 08:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeoOSGvNNQOq78-Nh4hqqX-C1nYWjM7uMH_S+ofbHhxEDw@mail.gmail.com>
In-Reply-To: <CA+cAkeoOSGvNNQOq78-Nh4hqqX-C1nYWjM7uMH_S+ofbHhxEDw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Mar 2023 16:57:42 +0100
Message-ID: <CANNYZj82PHeV-Gp2M4nkD2KniggLr=pSNjS6dMBP_P8PEzEDkw@mail.gmail.com>
Subject: Re: [OE-core] cargo, git dependencies and devtool
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178647

devtool simply isn't meant for recipes which pull multiple sources in
SRC_URI. Also, we do not have a devtool maintainer :-/

You can poke around its code to see if it can be addressed
(easily-ish), but I suspect you have to write a different recipe for
the 'myrepo' item which can then be 'devtool'-ed, and stage the output
into sysroot, e.g. classical oe-core 'build dependecy' flow.

Alex

On Wed, 15 Mar 2023 at 16:53, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Hello again list,
>
> I continue my investigation on developing a rust project within
> openembedded environment. After discussion with some of you, I have a
> project (binary) which will use some custom library crates (and so
> these rely on other git repositories).
>
> In order to simply build the project I need to add this patch
> https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.10212-2-alex.kiernan@gmail.com/
> (with little modification to support uri like
> "git://git@my_repo:7999/myproject.git")
>
> After that ports, the project was built successfully. Now I want to
> develop in it ;) and so I use devtool (like I do for python or C
> project) and I have another set issue.
> I get back to having cargo trying to clone these git repos during the
> build (which is forbidden since no network access is allowed except
> during the fetch).
>
> I search a little and it seems it is the externalsrc.bbclass which
> remove the git url in this line:
> https://github.com/openembedded/openembedded-core/blob/master/meta/classes/externalsrc.bbclass#L76
>
> I confirm that by issuing bitbake -e on my recipe and looking for
> SRC_URI modifications.
>
> In my recipe I have something like:
>
> | SRC_URI += " \
> |    crate://crates.io/aho-corasick/0.7.20 \
> |    crate://crates.io/async-broadcast/0.5.1 \
> |    git://git@myserver:7999/myrepo.git;protocol=ssh;nobranch=1;name=my-crate;destsuffix=my-crate
> | "
> |  SRCREV_FORMAT .= "_my-crate"
> | SRCREV_my-crate = "main"
>
> And after a "devtool modify" , the git dependency disappears ...
> looking at the externalsrc class, it seems pretty straightforward to
> know why the url_data.type with "git" doesn't end in local_srcuri.
>
> I would like to have advice on this if possible, if someone has
> already encountered this use case in the past ?
>
> To my opinion, devtool should treat these SRC_URI alike but how can it
> make the difference with the primary git repository (the one which
> contains the top project) and the other git repositories ?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178582): https://lists.openembedded.org/g/openembedded-core/message/178582
> Mute This Topic: https://lists.openembedded.org/mt/97630658/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


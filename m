Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311DEC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:53:31 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.12235.1678895609635808023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nCXT5DUn;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id y14so19941359ljq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678895607;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ym4KmKY1Gt2IzLt2/sevBw8rckUtmBCVm6tmCPKCBck=;
        b=nCXT5DUnefIzmFfhjRCsWXRgh8lvGe6jhSJJxXFi/YvPf/Uj+DAQEfKv96nGpQHLye
         oR9OFYrPNqeBjS2YItozdTUYh6SSi4wJ8d7+xKUwsbNSN6DWrK05A15ZKeKBU3oqV2sV
         /SPjLonWfVM5QnuLK96fitccg3Yqzco2tqvSgitiGP5ZzA7AtKeQzTfLW/MXSKoCGkjs
         DKdq8GWKB31F5UPmRW1RJzRVU2WV4yB96qngO1YdKPk3TjLBNIyv1ieYRq56hvVIkZnC
         nNBu5KiyRyb9vAzhDqfZev0NxxLo0bHE8o8hIgAUHJPKCGDqjWtwQi1tEgoXnPvI7/cZ
         F/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678895607;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ym4KmKY1Gt2IzLt2/sevBw8rckUtmBCVm6tmCPKCBck=;
        b=lQJZFPxsB5dbzPqmaTSVpV3zEo7ZRwRREY+ln6SGHfHW8lqdaJLtIBkuW3XfS+BXFQ
         8inqM0UNp+MzOYAq/tn7jA1bIuJ0tw3cLKFqRdR8iWSYGm9B0a1KbtcjYacU3Xv33SFb
         cSRbjaW4ofW3krQM5bgUNTRLM5nV05lVp0rUfDfccGaegnZ810dG9UQQMv0jmGzZF8tS
         npeL7nKIp7ag6wY96cpBGvjxjjNJ+Ga0OIdYJvYXOwynN64C7sLdMIYblyNgYAuaC6uE
         TWK1Uoz9IJ9VXcuKDq9sdJjHDC1cA58cKLdexRoP7JuD8OlC5HyG50DmukgCKfKsJaCU
         2Vew==
X-Gm-Message-State: AO0yUKX87H6kRLsm1taCxyxhAsxC2oVZGNJDpm8cjdrul9sQomrAR71Q
	51Ci1JH3XfQr7Rv8w/CYFAGwqz2vRZhMnfLZy04PCKjRPkI=
X-Google-Smtp-Source: AK7set/RFht+FdbUTGv/1mKlSoyOVdZGr6HcSgHdS3zAcER1WWq1L5ua8YRRVTARtd8971uALWwwuBptBFKrWUNW8z0=
X-Received: by 2002:a2e:909a:0:b0:298:b32c:e4f9 with SMTP id
 l26-20020a2e909a000000b00298b32ce4f9mr539095ljg.3.1678895607366; Wed, 15 Mar
 2023 08:53:27 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 15 Mar 2023 16:53:15 +0100
Message-ID: <CA+cAkeoOSGvNNQOq78-Nh4hqqX-C1nYWjM7uMH_S+ofbHhxEDw@mail.gmail.com>
Subject: cargo, git dependencies and devtool
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178582

Hello again list,

I continue my investigation on developing a rust project within
openembedded environment. After discussion with some of you, I have a
project (binary) which will use some custom library crates (and so
these rely on other git repositories).

In order to simply build the project I need to add this patch
https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.10212-2-alex.kiernan@gmail.com/
(with little modification to support uri like
"git://git@my_repo:7999/myproject.git")

After that ports, the project was built successfully. Now I want to
develop in it ;) and so I use devtool (like I do for python or C
project) and I have another set issue.
I get back to having cargo trying to clone these git repos during the
build (which is forbidden since no network access is allowed except
during the fetch).

I search a little and it seems it is the externalsrc.bbclass which
remove the git url in this line:
https://github.com/openembedded/openembedded-core/blob/master/meta/classes/externalsrc.bbclass#L76

I confirm that by issuing bitbake -e on my recipe and looking for
SRC_URI modifications.

In my recipe I have something like:

| SRC_URI += " \
|    crate://crates.io/aho-corasick/0.7.20 \
|    crate://crates.io/async-broadcast/0.5.1 \
|    git://git@myserver:7999/myrepo.git;protocol=ssh;nobranch=1;name=my-crate;destsuffix=my-crate
| "
|  SRCREV_FORMAT .= "_my-crate"
| SRCREV_my-crate = "main"

And after a "devtool modify" , the git dependency disappears ...
looking at the externalsrc class, it seems pretty straightforward to
know why the url_data.type with "git" doesn't end in local_srcuri.

I would like to have advice on this if possible, if someone has
already encountered this use case in the past ?

To my opinion, devtool should treat these SRC_URI alike but how can it
make the difference with the primary git repository (the one which
contains the top project) and the other git repositories ?


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC49C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 12:22:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.9334.1651234928595317018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KwTxE6ls;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id k2so10573073wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=A+iiNU1UWdOK9/QFUlneVolRvMpki0X5QXqQUKeMKyk=;
        b=KwTxE6lsyYDJH8zKB3RfD2jHxRxKO+l5G61qGo2IFlNIuiEA5VW7LSm77GJ0FvW8Jk
         hgiTA4RT5KsCW8wX51Ae2YvVV8FT/Q85iDzHqufwfh6HQIrc4HBhG69BTV0LkaMWcsKA
         w24C5TjJR3jIrm9Fv+idrZg7B/2hjgJgYYwss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=A+iiNU1UWdOK9/QFUlneVolRvMpki0X5QXqQUKeMKyk=;
        b=REuIHkRZOOCbLx7UCJT9sE6EvUh02yrmAnKmpcC6azR/AluZ18eqy/jzOyS/r4EVag
         8ZyjlxAqGk2kS7VAagaWmxcyUTRS/m0nV2UZWjqfmRH65gUcu8BxcxVoZlqjSMlK+WtZ
         iapeqMy8UFyoLmQMlm+XM5nEFCTptHx2XVg+a4sUEwPeIfU1QQy4Z5R8RoVSA8ttPBK/
         IkAEtDPV0+HNriGXN9hiKIQwSVkS9Ro0Wcy0qn1UsVpuR/1Tjj9KzosIo5Nrf2B8qOe4
         78fleO8T098pMFuCRg/VLVjhpapmKdwiFE5qX8LZbQzLHgKaOgjwNxsEe7gJc1yKh/eo
         mmjQ==
X-Gm-Message-State: AOAM532Kyc0iKRA/ZBxiljaZyoVWfV7D2sz64nETR2kpRDWSUGMmve4V
	GZ971rhFt54paST5NSVRVJpdoOW4z90XnA==
X-Google-Smtp-Source: 
 ABdhPJxWGRonrJRwJEF1LzuuLNM9bHzvnaN9ScRp5ODQKQo9DvzCfX46XHtDggJP0V9RjE5sTzMZMg==
X-Received: by 2002:a5d:6391:0:b0:20a:e4c5:c247 with SMTP id
 p17-20020a5d6391000000b0020ae4c5c247mr15411969wru.516.1651234926854;
        Fri, 29 Apr 2022 05:22:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:480b:fc7a:f316:cb3a?
 ([2001:8b0:aba:5f3c:480b:fc7a:f316:cb3a])
        by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b00393f143efd8sm7087948wms.16.2022.04.29.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 05:22:06 -0700 (PDT)
Message-ID: 
 <45f20b28ba385221f04e0a157d7a6485c8233a04.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] base-passwd: Disable shell for default
 users
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2022 13:22:04 +0100
In-Reply-To: <20220428094932.1411461-1-jiaqing.zhao@linux.intel.com>
References: <20220428094932.1411461-1-jiaqing.zhao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 12:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165008

On Thu, 2022-04-28 at 17:49 +0800, Jiaqing Zhao wrote:
> Change the shell of all global static users other than root (which
> retains /bin/sh) and sync (as /bin/sync is rather harmless) to
> /sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
> 
> Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ---
> v2:
> Fix indentation in bbfile.
> ---
>  .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.5.29.bb         |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
> 
> diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
> new file mode 100644
> index 0000000000..dddc93ca35
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
> @@ -0,0 +1,57 @@
> +From 91e0db96741359173ddf2be083aafcc1a3c32472 Mon Sep 17 00:00:00 2001
> +From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> +Date: Mon, 18 Apr 2022 11:22:43 +0800
> +Subject: [PATCH] Disable shell for default users
> +
> +Change the shell of all global static users other than root (which
> +retains /bin/sh) and sync (as /bin/sync is rather harmless) to
> +/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
> +
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
> +Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> +---
> + passwd.master | 32 ++++++++++++++++----------------
> + 1 file changed, 16 insertions(+), 16 deletions(-)
> +
> +diff --git a/passwd.master b/passwd.master
> +index e1c32ff..0cd5ffd 100644
> +--- a/passwd.master
> ++++ b/passwd.master
> +@@ -1,18 +1,18 @@
> + root::0:0:root:/root:/bin/sh
> +-daemon:*:1:1:daemon:/usr/sbin:/bin/sh
> +-bin:*:2:2:bin:/bin:/bin/sh
> +-sys:*:3:3:sys:/dev:/bin/sh
> ++daemon:*:1:1:daemon:/usr/sbin:/sbin/nologin
> ++bin:*:2:2:bin:/bin:/sbin/nologin
> ++sys:*:3:3:sys:/dev:/sbin/nologin
> + sync:*:4:65534:sync:/bin:/bin/sync
> +-games:*:5:60:games:/usr/games:/bin/sh
> +-man:*:6:12:man:/var/cache/man:/bin/sh
> +-lp:*:7:7:lp:/var/spool/lpd:/bin/sh
> +-mail:*:8:8:mail:/var/mail:/bin/sh
> +-news:*:9:9:news:/var/spool/news:/bin/sh
> +-uucp:*:10:10:uucp:/var/spool/uucp:/bin/sh
> +-proxy:*:13:13:proxy:/bin:/bin/sh
> +-www-data:*:33:33:www-data:/var/www:/bin/sh
> +-backup:*:34:34:backup:/var/backups:/bin/sh
> +-list:*:38:38:Mailing List Manager:/var/list:/bin/sh
> +-irc:*:39:39:ircd:/var/run/ircd:/bin/sh
> +-gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
> +-nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
> ++games:*:5:60:games:/usr/games:/sbin/nologin
> ++man:*:6:12:man:/var/cache/man:/sbin/nologin
> ++lp:*:7:7:lp:/var/spool/lpd:/sbin/nologin
> ++mail:*:8:8:mail:/var/mail:/sbin/nologin
> ++news:*:9:9:news:/var/spool/news:/sbin/nologin
> ++uucp:*:10:10:uucp:/var/spool/uucp:/sbin/nologin
> ++proxy:*:13:13:proxy:/bin:/sbin/nologin
> ++www-data:*:33:33:www-data:/var/www:/sbin/nologin
> ++backup:*:34:34:backup:/var/backups:/sbin/nologin
> ++list:*:38:38:Mailing List Manager:/var/list:/sbin/nologin
> ++irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
> ++gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nologin
> ++nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
> +-- 
> +2.32.0
> +
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> index 9a27ad3ab5..ef7792ae49 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -14,6 +14,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://input.patch \
>             file://disable-docs.patch \
>             file://kvm.patch \
> +           file://disable-shell.patch \
>             "
>  
>  SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"

This change causes a couple of ptest regressions in sed and strace:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3185/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3432/steps/13/logs/stdio

Cheers,

Richard




Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C8BC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 16:09:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.8851.1650989349904356218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 09:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wlg/EcwE;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so2064193pje.1;
        Tue, 26 Apr 2022 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to
         :references:from:organization:subject:in-reply-to
         :content-transfer-encoding;
        bh=kaRBE2itETDdzN5OkMt3+NYvSCediYYkd9zBR4S3rp8=;
        b=Wlg/EcwEAHLiOP+XBBnvzSVp43GXEviCWhdVp/IQyTrursv+5Y7p6uYjH9yS0yJruh
         hqkM6OCHEswUFPqaSMVTnRLmoVBX6jJa5PzbIuiNiMY+d8jYVYtqE+fCBu+cjQEkuY3a
         hW6pvPvG6334NXYd4wWhDVGS+crYhmOJf4szQFoizarnT6+BK2BIZSgvSNPpFQy/VEph
         I7JFOaIx8fOGZwDPLLs2io1bKyBdRrknFFQQJ93MPMUJt3CukfTryAqrYayRjHzE5rv3
         JSfLQqSMj1/o4H55O27v8fX9BOceoZH/cpPprcrUhBXoH3iS9KUBvhJNJAEzTmjqtCk5
         7qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=kaRBE2itETDdzN5OkMt3+NYvSCediYYkd9zBR4S3rp8=;
        b=YzWXHGTHqNa/EVkf0YoyWoARxIN5kTX+5tg9VI+CZDtsDITevnfZkt+URKvLY+10VA
         2LOj99VMh74vHAHjWvHp4PlY0JY3l+NplowKJpoA9TnqD31oXubR6LLnq5VGo307j7gF
         Rs3SMbKkA8UpLUzpbsssuSzTOQJHR10WJjV6SvcXKE3QMvBXdpDRCFswGu5eW5VgWSAU
         GiliYwVqRSUAkisWZMyd1WPdGxHEN7kkIPau+hPgd4fGCbXHzykmrJgaWxRhJ2BMFaRO
         RZ+N7UtjkApzWYp55MKz8IwRItSM+x6IMRJ27B8EC+3ksrSqYHCeEyb74gdjLNYe/jxB
         XFJg==
X-Gm-Message-State: AOAM532e/AMlMBib30tz+AtT6r62nJeVMzidx5DNPQ4zOHo6F2q6VE2T
	jN6QHC0mCOGcsHgg4/XqUgA=
X-Google-Smtp-Source: 
 ABdhPJzCwfqD9ZiM7u1ej3uxGVFC39qZZVG7StiI/dMP1Q5JhaXCZRU4g8Ub+UABK7n9i2JGxchjnQ==
X-Received: by 2002:a17:902:bb90:b0:156:2c05:b34f with SMTP id
 m16-20020a170902bb9000b001562c05b34fmr24546317pls.53.1650989349176;
        Tue, 26 Apr 2022 09:09:09 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:7cd2:3e2e:157d:406?
 ([2601:646:9200:a0f0:7cd2:3e2e:157d:406])
        by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b004fac74c8382sm15948247pfv.47.2022.04.26.09.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 09:09:08 -0700 (PDT)
Message-ID: <5e82785b-14bc-5a4d-a807-fdaa58afee5d@gmail.com>
Date: Tue, 26 Apr 2022 09:09:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: 
 <CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
 <CAApg2=TjNwub9WsLfh1ZAA8hfMVDPgTYVCELotUfGRGpO9gu8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: CVE-check failing on world with meta-openembedded: diff.gz file
In-Reply-To: 
 <CAApg2=TjNwub9WsLfh1ZAA8hfMVDPgTYVCELotUfGRGpO9gu8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 16:09:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164879

Hi Marta

On 4/26/22 5:20 AM, Marta Rybczynska wrote:
> 
> 
> On Fri, Apr 22, 2022 at 11:07 AM Marta Rybczynska <rybczynska@gmail.com 
> <mailto:rybczynska@gmail.com>> wrote:
> 
>     Dear all,
>     We're running cve-check on a world build containing oe-core, meta-oe
>     and more. We have an issue with the lockdev recipe
>     (meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
>     <http://lockdev_1.0.3.bb>), which causes a fail like below:
> 
>     $ bitbake world --runonly=do_cve_check
>     ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found:
>     <path>lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff
>     ERROR: lockdev-1_1.0.3-r0 do_cve_check: Failure in searching patches
>     ERROR: Logfile of failure stored in:
>     <path>/lockdev/1_1.0.3-r0/temp/log.do_cve_check.8709
>     ERROR: Task
>     (<path>/meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb:do_cve_check)
>     failed with exit code '1'
> 
>     The issue is caused by the fact that lockdev_1.0.3-1.6.diff is
>     missing. When we look into the recipe, it is downloading
>     lockdev_1.0.3-1.6.diff.gz file Please note the additional extension.
> 
>     Stripping the extension comes from oe-core/meta/oe/patch.py, from
>     the patch_path function, which is figuring out if a file is a patch,
>     and returning the local path if it is so. However, at the moment
>     when we do_cve_check, the .gz file is not uncompressed.
> 
>     I'm wondering how to solve it.
>     1. Add a dependency to make sure eventual patch files are
>     decompressed first?


I think this option looks best or perhaps we should drop applying debian 
diff entirely since debian seems to have dropped this package

I think regardless of what we do with this package it seems to be a 
limitation of cve-check process which perhaps should either be fixed or 
documented.

>     2. Do not consider this as a patch file in the scope of cve-check ?
>     (this is more a part of the source then an actual patch that might
>     be fixing a CVE)
> 
>     This is the only case like that we have in the build. Please note
>     that removing ".diff" from the extension list in patch_path() is
>     solving the issue.
> 
>     Any comments or suggestions?
> 
> 
> Khem,
> Any feedback about this? From the history it looks like it was you who 
> changed the recipe to use the .diff.gz file.
> 
> Thanks in advance,
> Marta


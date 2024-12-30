Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE33CE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 11:51:41 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.61169.1735559498401571734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 03:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jviQkrzN;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd43b08674so50723486d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 03:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735559497; x=1736164297; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YsAsDnYxzRZdRYNE10jbj+am+2Ohgg8wGVCTWfuZiRw=;
        b=jviQkrzN7d7Klxio/Eky77bM/YxjOfpWlqTS+TL+YHuUlaFm8rZgmXnqC1+zLiI2Zk
         EBX+0z+1r9+DfGN0Kqxx2rWJz71D16Jsl4SdF0YYMQ8/fYB1k1Qn558EF5X+/WZe2bzQ
         eraC1Ioo6Mtbwp+f3GK8Y+An5ypLnlTVZ3+SzZn/Rel0DmiehKUtW4GaT+xjqIWBe1s/
         KL+3rPcYd6wDtM/hk6MMg5CbzUSKli2HfrRwapVEzV8tDt6JkalTj7zEzfPN3QtyiLHL
         oDMWO9H+xBip2/xQyx/BgFjQzvMPSfkzcPNaz6V4LswTth8oQTyjqU9lsvgHx4Jp5MYS
         Uu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735559497; x=1736164297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsAsDnYxzRZdRYNE10jbj+am+2Ohgg8wGVCTWfuZiRw=;
        b=sUo/OXawqhWB9vq62HBMXf9+GE0ndUlbw4XCFORY+ak05Js2oMPBq2lY4pgH2SFDvS
         56q8YOqy25QGpls4XyjqpbB5B25aT5awhXWp+EdQk8Fuw5qHoWiOVHPMVS/iDsoJccQz
         x+io90TvXRLq4GSdlhnzoj7JMSkc82Z/3W5rpq7ZeGu/lQSmAmT9BS8kr+tV23TuwgQ4
         6/ZGyWMwwWfX+eWnyQNDCjEbnszjPUjU8zvpJfgT/NV6BiCG1chYDaM+ES6TOGOVf7md
         FUHmf57PTKnRS6p6ehbDAgf2edxzlI95IXBEPWz4saqXltkHnlt4yrFdusEjUT6EybGt
         bOcg==
X-Gm-Message-State: AOJu0YxSWbuPGhlJA2jQklfWPABekr2+OEfDyut3HoHnw7scafLDUKUp
	BOsF3WDKQzWsnJsIcrjNcPQMn5tU3xRsu0zrgsWpjnDBAImO13L0+LQ+PSAxmyHatXJYchY3OeC
	wQKjYvv0mKI9bsROMj6oVAmzSs0wugD0e
X-Gm-Gg: ASbGncvhXlFNNMtAD7g5hM6ZqAKun7b1doyS6vQ5fOH+d2hHkZC7Wy2XeCWZp3b7mmu
	npnKxojqPA3mkkm3zpRuFARRZVLDJtWM6aR+GhIDZVZPifRQpo6N4az3bCI4JhV8qWacosam+
X-Google-Smtp-Source: AGHT+IHsHPiNzfH9SFfpJl+PtCxyoMoTrXXkxVKRs8QkSs67soGrW2UURTQUZsmwy23ni8hqFVwt3Qw/tK0p5Apw4mI=
X-Received: by 2002:a05:6214:260b:b0:6dc:d101:2baf with SMTP id
 6a1803df08f44-6dd2332d04emr597346086d6.17.1735559497323; Mon, 30 Dec 2024
 03:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20241230073100.229869-1-changqing.li@windriver.com>
In-Reply-To: <20241230073100.229869-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Dec 2024 12:51:26 +0100
Message-ID: <CANNYZj89uUtY6Wpuc0FX=26kjbCuc5mu1cRhu+oPUQhZCUFjTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: Lower the length of TMPDIR
 limit to 400
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 11:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209158

I don't object to the fix, I just want to point out that this seems to
deal with the unfortunate case of "C programmer's disease":

C Programmer's Disease: n.

The tendency of the undisciplined C programmer to set arbitrary but
supposedly generous static limits on table sizes (defined, if you're
lucky, by constants in header files) rather than taking the trouble to
do proper dynamic storage allocation. If an application user later
needs to put 68 elements into a table of size 50, the afflicted
programmer reasons that he or she can easily reset the table size to
68 (or even as much as 70, to allow for future expansion) and
recompile. This gives the programmer the comfortable feeling of having
made the effort to satisfy the user's (unreasonable) demands, and
often affords the user multiple opportunities to explore the marvelous
consequences of fandango on core. In severe cases of the disease, the
programmer cannot comprehend why each fix of this kind seems only to
further disgruntle the user.

http://www.catb.org/jargon/html/C/C-Programmers-Disease.html

Alex

On Mon, 30 Dec 2024 at 08:31, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> When TMPDIR has length 410,  bitbake uninative-tarball will fail at
> do_populate_sdk with error: Failed to open backup database:
> "TMPDIR/work/x86_64-nativesdk-pokysdk-linux/uninative-tarball/1.0/sdk/image/var/lib/dnf/history.sqlite"
>
> sqlite3 has a hardcode max pathname limit 512, refer [1], and there is a
> check, refer [2], pathname + 8 > max path name limit(512) is not
> allowed.  So the pathname length need to <= 504.  While, length of
> "TMPDIR/work/x86_64-nativesdk-pokysdk-linux/uninative-tarball/1.0/sdk/image/var/lib/dnf/history.sqlite"
> is 505, so error happened.
>
> We had met similar issue [3], and refer the comments, upstream reject
> the change of the hardcode length, see [4][5].
>
> This patch try to improve and workaround this issue by lower max TMPDIR
> length to 400, at least for distro name length <=13, the build can
> success.
>
> [1] https://github.com/sqlite/sqlite/blob/master/src/os_unix.c#L180
> [2] https://github.com/sqlite/sqlite/blob/master/src/pager.c#L4777
> [3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12374
> [4] https://sqlite.org/cgi/src/tktview/c060923a5422590b3734
> [5] https://sqlite.org/forum/forumpost/0b1b8b5116
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes-global/sanity.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
> index a0b2508e11..7b8a497d5a 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -760,8 +760,8 @@ def check_sanity_version_change(status, d):
>      if not oes_bb_conf:
>          status.addresult('You are not using the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
>
> -    # The length of TMPDIR can't be longer than 410
> -    status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
> +    # The length of TMPDIR can't be longer than 400
> +    status.addresult(check_path_length(tmpdir, "TMPDIR", 400))
>
>      # Check that TMPDIR isn't located on nfs
>      status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209146): https://lists.openembedded.org/g/openembedded-core/message/209146
> Mute This Topic: https://lists.openembedded.org/mt/110339915/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


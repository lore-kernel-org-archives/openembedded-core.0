Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EF3C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 21:52:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.4477.1667512322158151765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 14:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Enr/dXqO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g12so4633390wrs.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zWpl+R4Hlth6Gl+wqhcsm0QGdkubGEtcnC464LPx10=;
        b=Enr/dXqOhejY+fmAJ2r2BoWuxEWT7PxczUzj0RGFSsAqPS42jQvRAFPUNEMkCRVOhG
         +2kKCKdHt26MX/3MVSZpwBbnpQTwQYoNlVwmRcXdvjstHfd/CuhJXR7W/LgOpY7rWy24
         FKyWVq9RjNZOIQM1eOItSJiqwId4vPpnUjG4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zWpl+R4Hlth6Gl+wqhcsm0QGdkubGEtcnC464LPx10=;
        b=XlOnvJAQ7z2GLzJa5leDvYoncmxP1+PpqDH8dwkrOUVXD1EeDWbEnJVuM73duQGtDj
         nzrAvIFy4J1yj3p4LsGbRzQj3n8nj5aKFnD3o4yhBTgBo9gcLdDyq4V5R4qinEqSc2NU
         Dz/q0yHejIdc267R9skCAVEfAbIuVDiqEDhjHRAubY6+t9PLVyWT0heDOqUj9KeubG/P
         lz3MrFtae6mYX7uzJ6DOwyI9pcYAINjg8KnpNqwd7Rvxvw+nsMrwA1NKiQnsZ+EgU/1n
         UxjyXerRRtt4zFMANN2d+hOmX62e0RxKBuQyjO39UBiRqAWKK7NbzRnCmyAR9K7P93+n
         LIJA==
X-Gm-Message-State: ACrzQf1oTjBqBbEnUtI3bACOENML5/EIOl2sLyzV8RrnaE8e8tahB/xf
	2B2btkiFwUwZos8MxlFgJNSKUQ==
X-Google-Smtp-Source: AMsMyM4FHIAk5hvFyN0wUoQOtePgQiM8crXoHpb5hP5lvBYq605t4cCdZXtgx040IHpD/QUJGquD2g==
X-Received: by 2002:a05:6000:c3:b0:236:a261:a2a5 with SMTP id q3-20020a05600000c300b00236a261a2a5mr20603204wrx.137.1667512320358;
        Thu, 03 Nov 2022 14:52:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28c5:bec7:4f4d:2683? ([2001:8b0:aba:5f3c:28c5:bec7:4f4d:2683])
        by smtp.gmail.com with ESMTPSA id e11-20020a05600c218b00b003a6125562e1sm926791wme.46.2022.11.03.14.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 14:51:59 -0700 (PDT)
Message-ID: <6f749c3ed28b0bfa7be8e55c5e9c9befbea15c09.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: make ext2/3/4 images reproducible
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Nov 2022 21:51:57 +0000
In-Reply-To: <a4cb2d144c4987413a90c6dfa4821c7ae27be753.camel@yadro.com>
References: <20221103152607.3940380-1-s.zhmylev@yadro.com>
	 <70a1078f7098f7f1a83b88edac014be98b2da46b.camel@linuxfoundation.org>
	 <a4cb2d144c4987413a90c6dfa4821c7ae27be753.camel@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 21:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172655

On Thu, 2022-11-03 at 18:53 +0000, Sergey Zhmylev wrote:
> Hi Richard,
>=20
> Thank you for the comment!
> Well, the environment described in reproducible guides currently does
> not provide binary reproducability due to extfs implementation.

Agreed, there is an issue here. I just don't think the patch looks
quite right.

> Moreover, building on some FS (for example mounted with noatime or
> not supporting crtime field at all like UFS) makes the extfs creation
> process totally not reproducible in spite of any modifications on the
> source files.

You're arguing we need to set crtime, ctime and atime which I can
believe. The mtime however should be fine from the package manager so I
don't think this patch should be changing it.

There may be a case for just setting the others to mtime instead of SDE
too?

> I've checked the behaviour under multiple conditions, double checking
> that I've set as much reproducible stuff as possible, and it comes
> out that in certain circumstances rootfs files have incorrect
> timestamps -- they're set to the build process time.

Which timestamps though? Isn't mtime ok?

> So I'm sure that if the user set SDE to a particular timestamp, we
> should also modify atime, ctime and crtime.=C2=A0
>=20
> P.S. overriding only the time later than SDE could have also been an
> option, but in reality we can not surely gather stat info for each
> file without debugfs or similar tools and this will tremendously
> degradate performance of already pretty slow image creation process.=C2=
=A0
> Due to this I suggest the patch I've sent.

That stat information should already be present?

Cheers,

Richard



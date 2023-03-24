Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B8AC76196
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 09:50:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.97396.1679651398570455164
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 02:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f3d6WLvd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so572477wms.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679651397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=356KQUDQ4P8/0n2K78IiK20END/ePB62fB2Yj5Ka7+U=;
        b=f3d6WLvdurG143ka/iZ3bO1QKJm+LU42BOnESAltwjh3n4fju3eN/4UQAsHSPuzGfd
         ojdF8HgBa44Kr4XfRkKPM1eoPHGvDAwQ0xpSVIv2nv0Gtfd6im1Ic4/CHZ3yeBv8IaQP
         6AhXqPxAzYiwnaHTN0nDwC0z2rbUb3SUIK7mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679651397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=356KQUDQ4P8/0n2K78IiK20END/ePB62fB2Yj5Ka7+U=;
        b=Tz/lZs3o5O7fOC4B+91aPSpqz+OM52brWqEUsQcILzbD30JQ4yPHDeagbfH0vMQBtD
         w6Fxa98YSHC/BYgsTFDpAAhAdlZNKIVZHRGktJssnoJC3juz96UECd4uR0WzzvZr8jeA
         +aUzRN/QvQkEpJbLQ3/b61+mYm8XbXxsAYDhKZ2LTIBkmZjRDqliAZ8EC+GvKi5TaoS0
         CUZ1N9UwqPWYKnPgVHbIf5B2mgjoNs7Ypve6z5inlH9sDPyhCYiDfGYQa+BZAzh06ZXn
         M+a2p5WZydmcVLMQk253CgenIMNZn7E75bXPqgIpm381pnfCmnFFMcvGkRVLiTHbzrrR
         cfZg==
X-Gm-Message-State: AO0yUKWhsddNiEMvJ8pQvhrmW9K4wv7GUYr+dZSjM9BQACrAYHDLaD4B
	lVNRJAxiryj7HEYrgHXQZKDPnA==
X-Google-Smtp-Source: AK7set+PEoeG7JP/JFH2uXC5ih+iVgFJJcbRrMcVhp9jevRb1cGa/tO00hzUxriypR2ahVeZhOc8VQ==
X-Received: by 2002:a05:600c:acb:b0:3ee:4f92:907b with SMTP id c11-20020a05600c0acb00b003ee4f92907bmr1924191wmr.14.1679651396808;
        Fri, 24 Mar 2023 02:49:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b274:32b5:9a06:2db7? ([2001:8b0:aba:5f3c:b274:32b5:9a06:2db7])
        by smtp.gmail.com with ESMTPSA id j36-20020a05600c1c2400b003ebf73acf9asm10248792wms.3.2023.03.24.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 02:49:56 -0700 (PDT)
Message-ID: <eeabd37da174f94ea4952f8b5bb02b249a732b08.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] package: moving field data process before
 variable process in process_pkgconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2023 09:49:55 +0000
In-Reply-To: <20230324083620.2028587-1-xiangyu.chen@eng.windriver.com>
References: <20230324083620.2028587-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 09:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179026

On Fri, 2023-03-24 at 16:36 +0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> Currently, the latest version abseil-cpp contains a new library named "ab=
sl_log_internal_format", it's
> basic package config(.pc file) as below:
>=20
> prefix=3D/usr
> exec_prefix=3D${prefix}
>=20
> ......
>=20
> Requires: absl_config =3D 20230125, absl_core_headers =3D 20230125, absl_=
log_internal_append_truncated =3D 20230125,
> absl_log_internal_config =3D 20230125, absl_log_internal_globals =3D 2023=
0125, absl_log_severity =3D 20230125,
> absl_strings =3D 20230125, absl_str_format =3D 20230125, absl_time =3D 20=
230125, absl_span =3D 20230125
> ......
>=20
> Normally, the process_pkgconfig() would process variable data before fiel=
d data in a .pc file, but in the
> absl_log_internal_format, the field data in "Requires" section contains "=
xxxx =3D xxxx" format, the
> process_pkgconfig() treats them as normal variable and using the setVar()=
 in bitbake's data_smart.py
> try to process. The absl_log_internal_format field data contains "_append=
_", this hit the setVar() checking
> and finally bitbake stop building and reporting an error as below:
>=20
> "Variable xxx contains an operation using the old override syntax. Please=
 convert this layer/metadata before attempting to use with a newer bitbake.=
"
>=20
> This patch move the field data process before variable process to avoid t=
he process_pkgconfig() treat the field
> data as variable.
>=20
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>=20
> Changes:
> V1 -> V2: changing the package.py instead of bitbake's data_smart.py
> v1 thread please refer:https://lists.openembedded.org/g/bitbake-devel/mes=
sage/14525

This looks like a much better fix than the workaround in v1, thanks!

Cheers,

Richard


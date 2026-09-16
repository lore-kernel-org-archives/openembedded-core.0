Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E154DC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:34:09 +0000 (UTC)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10248.1789547639354293826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hhnqBJaq;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso979244a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789547637; x=1790152437; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PTxbATaVi1yrFwz3VoqlrGYnq2hwv12S69x2t1Yk9Iw=;
        b=hhnqBJaqjzaDZIAwr1W4hd839gkkqIUzRdVg0s7GkYDdJkfunIptTsKTU13I86wDgO
         QdC2LTzN54GoyMQNCgv7b9KCaGrMnt4Ut0z2dyVaHVoGaUGs1Nu5UNZno9EM/vcjOCyM
         R4UjCn89HVE1/w+ptkiZZL/9rci1zCVlj93mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547637; x=1790152437;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTxbATaVi1yrFwz3VoqlrGYnq2hwv12S69x2t1Yk9Iw=;
        b=jR2uz0FGITwucuDMJWP7OdHS+1x7PfZyOrrdnTG0CjiButZ2J129czzonjCdgRlU+W
         /REzwiX1K8MSdleWnkaa/lnrBaae3mhTqToyuWZ3+xo68mNDl4agYBFtHaeRsB3Rm4D/
         zaIIGFxOiBJgHjqrU4Fwa0zsypWG1nWGB4iFLMlCyy/l+25++BHsYa5s6lZaWFcbUoFX
         Ki6Cr/w7qmYwQv6weNBM5gnKxa9sjwjFbrPz1IN2WNjJZ0hPTXnU7MlH6wyj2oGy8ogl
         hybDyot4ferzy/NoLGkdKNHnHlR7ZnM85J+Hf7U/LEQmmZqm7wl93M8VgHyfHRjSms9f
         Mm+w==
X-Forwarded-Encrypted: i=1; AKwUvBz++qoAZu6EgFtFnirqeOGEXz857Dinu94bn2O1QxfPZMXUNSGOF8QU3fnPA6u3+4O/mDHFTD3OzUQPTVRP4P/i8A==@lists.openembedded.org
X-Gm-Message-State: AFuF++m2vFMME/WgqpUJl9KFPTBiOdRIt6TumGOP3aSAitmZyDwskN+o
	gwFIl7t3pk+kX//xLCfTzcynGsn0l8qys8c+ZjXaFru1J08vZnIp6Dtq0LXnlyRqEHE=
X-Gm-Gg: AYBFou37634HhUtijLoQv0WXA0pRBF6jPuK2rW+DGYyFhkhYGBTaOg1143827b1OwBC
	MWhbL9ZTqo+bygdAfaqN7aO0K35nhmzZFNlelpeaxkIEdvXJnWuAGgpKHvd261Pu6hIpnLWPPVC
	qY4p3HFoRvKv9L6bnLSKfvmV6/Q164ZGXGcFaJc2EDnhuODY+GV6q+wTs43Q4hcVpqF56ei2BtS
	u0trYfVaFTnNkY6v576pvL3mIUDBhnLgsaJzx35N0LyQGUXNloeaeOLr4ffaBlRZ9YyFjYfjVh3
	qUjGpID+lCw3ELLzuiQFDYgZZoKXASGMuKsX/DKOUlyti4f1FbaUeoeJ7O13l3yzVYYnr5mv151
	63W77RgY7qeC7Ea3fXpqbnaOVX8fRktzc+la306CjqOBPU7OfCFGUqoD4L6ah6sYu/UN0H75vJz
	PklslJlurh45SxC0rhTf+JesWdLihtGvG3TTP4SgRNL5KQ1AK/QoYQY/wBwIOc/Fj8jWrENLJK1
	1O0tc6WFzfT2HTYP0kfjlYVxOA0mupkhmzmWIat8SyOUDc7CrIakWpwG6yVUzMV
X-Received: by 2002:a17:907:a689:b0:c26:2a5:819 with SMTP id a640c23a62f3a-c29e533436cmr183531366b.18.1789547637502;
        Wed, 16 Sep 2026 01:33:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09? ([2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48ce9csm85738966b.25.2026.09.16.01.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:33:56 -0700 (PDT)
Message-ID: <233a6dcc8a610dd6e09031e619a2437c43b3dfb1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] sstate: fix access to a cached object
 rewriting its modification time
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, "Haener, Michael"
 <michael.haener@siemens.com>,  "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Cc: "zhanxusheng@xiaomi.com" <zhanxusheng@xiaomi.com>, "Marko, Peter"
	 <Peter.Marko@siemens.com>
Date: Wed, 16 Sep 2026 09:33:55 +0100
In-Reply-To: <14700b98da9c582f0c74951364179b091cb911df.camel@siemens.com>
References: <20260910211821.48424-1-michael.haener@siemens.com>
		 <20260911070121.39436-1-michael.haener@siemens.com>
	 <14700b98da9c582f0c74951364179b091cb911df.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245937

On Wed, 2026-09-16 at 08:05 +0000, Adrian Freihofer via lists.openembedded.=
org wrote:
> Hi everyone,
>=20
> Thank you for the discussion in the patch review meeting. After
> discussing this further with Michael, I=E2=80=99m providing a summary of =
the
> technical details and the various perspectives shared:
>=20
> =C2=A0* Release Timing: Given how close we are to the next release, we ha=
ve
> =C2=A0=C2=A0 decided to put this patch series on hold. Modifying these cr=
ucial
> =C2=A0=C2=A0 lines of code carries a risk that is not feasible at this st=
age. We
> =C2=A0=C2=A0 will revisit the implementation and timing immediately after=
 the
> =C2=A0=C2=A0 release.
> =C2=A0* Architectural Goal & Cache Management: Our primary objective is t=
o
> =C2=A0=C2=A0 move toward standard mtime and atime behavior. Currently, no=
n-
> =C2=A0=C2=A0 standard usage makes it difficult for different environments=
 to
> =C2=A0=C2=A0 interact with the cache as expected. Adhering to standard be=
havior
> =C2=A0=C2=A0 allows for better cache management, as it for example provid=
es the
> =C2=A0=C2=A0 necessary telemetry to identify objects that are "old" but s=
till
> =C2=A0=C2=A0 actively "in use."
> =C2=A0* We will have a look a the sstate-cache-management.py script and
> =C2=A0=C2=A0 check if the script can be extended with some prune features=
 which
> =C2=A0=C2=A0 we need on our infrastructure.
>=20
> Follow-up Discussion: We also recognize the specific performance
> challenges with Kubernetes CephFS (particularly the server-side
> propagation of atime changes). While this is a key driver for these
> improvements, we will address the specific CephFS optimizations and
> related performance impacts in a follow-up discussion and dedicated
> discussion to keep the current architectural changes focused.

Thanks for the summary Adrian.

Just to expand on a couple of details:

* I did recently change some of this code with the intention of
  making=C2=A0it consistent with atime, mtime, file extensions and=C2=A0
  symlinks.=C2=A0The previous version was a horrible mix of=C2=A0
  different=C2=A0behaviours and sstate=C2=A0cache=C2=A0management was strug=
gling as=C2=A0
  a=C2=A0result. This was likely a=C2=A0cause=C2=A0of some intermittent AB =
failures.
* Whilst this may improve cephfs, we're worried about how this=C2=A0
  may=C2=A0interact with zfs+NFS or ext*+NFS and the possibility of
  noatime, limited (re)write access=C2=A0and other mount options.

We do limit the areas we interact with shared data usage but this is
one of the areas we do and we need to be careful about changes here as
a result.

Cheers,

Richard




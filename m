Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8086C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 07:58:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2566.1788422335613595306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 00:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VGPvuczJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso13522135e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788422334; x=1789027134; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cg5n5YKF7AVZ+NOvBp7bDP/3xwoPmHs9tRDS19w5L9o=;
        b=VGPvuczJCZInGWIx/SSVrBsrDxgwgmJcCYL7qPLSXToQ/B98PoERZBuhWlXBG1dAEL
         /y/h0oIv/en1ByOxnugWmdEJlp753SwvaOAnIBYBeVPTNWyeDJ8jAO3QCKLvomohYn6U
         6Y2iswF/+fUH9X3qaVsmk9J2B2/1LFDBoDn00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422334; x=1789027134;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cg5n5YKF7AVZ+NOvBp7bDP/3xwoPmHs9tRDS19w5L9o=;
        b=l6zF3gvMdj77ddohoyOXpDE0IkyJfajb2Aa6HABv0bFt0KsdARz/ejgmyKfJpXsUHJ
         iwAM3meFeO58TIRuIouu2wgTC1ESacpQZ/iBa2H4Gm7lj9x6bvOM8vNgvh5g9JRvHLCB
         wW0bSOs4Y46PH3UhoxgC0eaWfiRhH5FrW6T2l89phn/RP/9bTLgvtoCi8GeAUTBb66AN
         YIRfhDym3vtO0/qq4+Shp75Y3h/ANKJSoL/3UqNZcxwwun77mbXWo2xb0o4ARRQ/Y/vl
         LG/+dZ4Ry8Qqa9JwP+7H46KXKIwyr3svsL5XV70SVxpHS3jRclj3MNVjRVI89Cxe9xRM
         TUKw==
X-Gm-Message-State: AFuF++n1SjsRoyrR74vnmERIZLBt/Z6cIIXrGqwncsX7Mri4fzWTpMZ2
	elW/fP9+RpdpCL3bORDRqlmp/+i0rrvQ8LPIf5KHySyFjaC/LUc2+CEQ6qD1vda+gLLlOHqoeod
	szec+ux4=
X-Gm-Gg: AYBFou34zZl2DSx6BemSnbUQGkc7VPfQxhWtbWKPLlqB6I6IbyK78Pmi+AJpGICQALF
	Jaciy5SMmuAifgAEhXhSCulMLSyD3HqOdrbQ3NYaymWVSmxW8rqJPBVi8SfDIaaEez3A+3ar3Q5
	2hc3bSiQWlUusEAr0WkkLGg0VJhmLi3NobQXU6c/jsSCcep5Ri+7K+kKPO9HOAqiEvNRrj40Kpf
	uyTLb8mMNjJ430iQGWccnupoR9G18uU5aLCS0yuTdxZY2NdtR+R/yagsP6ChTF5Wc+uhpM5JYUs
	DQA7lpk5d09+UtjLDZFx55NBJIiNIwt2mPHc/w421+J5odXBUAFfWDgOSO+jpygtB/iZVo0LC4x
	AOwxZdWb3H733IHRGv5R30oxGtxUGDLg/pa87KZHnDI/HtZbpYXistGF+p4kCtGHfvl3aDId38c
	vOpCzsXaQ3aK0cJ5Sj+qmhdx17GJ8io38V5LtReWv+Vu89mckwHr2gZOMHYFTstiL97FeOK7jq1
	jXyGAYGQpBkqfaJQw1r5ZoY0pRshBwIJX71mucUZ2+evB6y5F4SnQ==
X-Received: by 2002:a05:600c:4715:b0:49b:9161:db26 with SMTP id 5b1f17b1804b1-49ce5843bc0mr170827285e9.14.1788422333660;
        Thu, 03 Sep 2026 00:58:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41? ([2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7ac52c3sm75199065e9.4.2026.09.03.00.58.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:58:52 -0700 (PDT)
Message-ID: <28d2a313b1c66aa90c10b35c85c88186abc087a2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] python3-lxml: upgrade 6.1.2 -> 6.1.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2026 08:58:52 +0100
In-Reply-To: <18D1BC8F7721B412.3984255@lists.openembedded.org>
References: <20260903064403.3848874-1-richard.purdie@linuxfoundation.org>
	 <18D1BC8F7721B412.3984255@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 07:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245016

On Thu, 2026-09-03 at 07:44 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> Bug fix:
> =C2=A0=C2=A0=C2=A0 LP#2165901: External parameter entity parsing was allo=
wed by default (with resolve_entities=3D"internal").
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0.../python/{python3-lxml_6.1.2.bb =3D> python3-lxml_6.1.3.bb}=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-devtools/python/{python3-lxml_6.1.2.bb =3D> pyt=
hon3-lxml_6.1.3.bb} (95%)

Probably breaks systemd:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4412

Cheers,

Richard


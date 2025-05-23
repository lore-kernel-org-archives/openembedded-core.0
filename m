Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB00C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 05:42:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.42173.1747978946714240702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 22:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TFw8RYXk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso88910215e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 22:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747978945; x=1748583745; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HEdJ0UG8rJcAsxFnRvv2sjYPxSagJy98XwpLyeMPep4=;
        b=TFw8RYXkUyM6xWVGaGpSoWPwwWDlFXNBIULRsSaenaXaCkeCeGSxadBvmSDj1hAvvX
         zTxnpLkc0V2UsfQWZZgsCNaTdden0+hVIYlWRHuHyd0g55o6HSb4s5GcR6phDBEAermz
         0iTFFrjuH2kcVe1SNhuqS4zoBVtukx99VuVdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978945; x=1748583745;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEdJ0UG8rJcAsxFnRvv2sjYPxSagJy98XwpLyeMPep4=;
        b=ce3JLDFELnIQgmmePtDWb9PXyR+guEk2k1f0JfzKTVdU5QuWdlZm1/Zwt6im/B57aA
         2eFi1UrRKMOC1eZpWQyQ9C2AgC2yYqEkB5jVk9RPscBqTWWDw6VRWfkoDa92/xLniTo8
         8/RwjF/wBwVELe8DYh9maLc126/5E5a676FaD38Hnr1/tU2t4Ckd896v0Mk6TJiEo3Xt
         J0TXlGBXvyGSGqxx0Qn6pAhPOr1gwf99IwwxB8uesAcNRIl5zcLnJ23jfhS7t88FDdBv
         YY9rqFiU4WNqBFxGkT3cxvqY6a/8VhZAdXasvbXeFrs3/1AANx5zsymD4erGofonG2L4
         tFSg==
X-Forwarded-Encrypted: i=1; AJvYcCVD1NoEztKVwQrjwMRzrSibkr5n+U54SnleP6E15FrJtGSTgKKPAiZ5yeoLnF8BiJ092LVhWR2SrlMhPwP+yX6/tA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyurE5qB7HnvWzGzgoMn7274fEstME9STdb4qxqinF+GXKptpHG
	rYTLHxZlWgv9lwl7y6UrO2g2zBscBUuexRxjzKX2Ys7uGiapP171WCWUGSAkJFaSP5E=
X-Gm-Gg: ASbGncs2Ll7yD4giALWo+NQ8PJiE+uHQTkkZUR3I/pdQH6ylv17Y76vkkcaQvKwcj2o
	ENo5ayVX+ZxDMiw3sZD+3lBzX/d3Rb5ToAhaJvLGOCiI0rU7NqVRZpRjzfWAz7dD5Eb0OHXo4hK
	Ts7oWezNg4lIK2qqa8S8j3GNf///XpfZSII9S14cxVy+Dt/mkGhDDslikf3A79hyhnBFsS/jLli
	O9bvuu+vDmQcuQHGxQSCiuLvsI5QOGcA/WvFYA6KH2+EwDHfKd2o7OtuR9CnuqLR2lXt+5jlNQk
	o6ZPDR3UFdpb+SNwSFXFwnbxcYdpitmAZVMrXDbv8SsmJ3uh4MZwl3rj1tJxWGHESwkfUUlJJ7X
	Y2XXD7yXj7vhL1eZaaITSG+N6P/wN2fT3ydGWfGiigEPOjO5WhPw=
X-Google-Smtp-Source: AGHT+IGjF3uCVmfY+07pz8RCGPwuo1gnKoweIbmAFb7ncu3fmowjVmYq4NlrwDymAqGLNePuPKBp1w==
X-Received: by 2002:a05:600c:83c3:b0:441:a715:664a with SMTP id 5b1f17b1804b1-442fd6607c9mr220531185e9.20.1747978944939;
        Thu, 22 May 2025 22:42:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ce1:6977:eef7:c59d? ([2001:8b0:aba:5f3c:5ce1:6977:eef7:c59d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1825457sm133264455e9.1.2025.05.22.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:42:22 -0700 (PDT)
Message-ID: <7bc2bb3a7f938d67c37031baff442ce95bf52bf1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 00/16] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de
Date: Fri, 23 May 2025 06:42:20 +0100
In-Reply-To: <1841F71260544116.22209@lists.openembedded.org>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
	 <1841F71260544116.22209@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 05:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217175

On Thu, 2025-05-22 at 22:36 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Mon, 2025-05-19 at 13:07 +0200, Adrian Freihofer via
> lists.openembedded.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > This patch series re-writes the FIT image related code. The goal is
> > to fix [YOCTO #12912] which is a long standing issue.
>=20
> I ran this through testing and there was still one oe-selftest issue
> remaining:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1610
>=20
> oe-selftest -r distrodata.Distrodata.test_maintainers
>=20
> should reproduce. I think there were challenges with the recipe
> sometimes being buildable and sometimes not so this might not be an
> entirely straight forward fix to work everywhere as I seem to remember
> reporting this one before on an earlier version.

I realised this was just a simpler missing maintainers entry so I
quickly added one for testing to master-next rather than drop the
patchset again. You should probably send that patch if you're ok with
it, assuming testing works out ok.

Cheers,

Richard


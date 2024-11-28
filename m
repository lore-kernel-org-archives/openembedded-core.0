Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B368D69102
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 11:58:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.93156.1732795124988954712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 03:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VgPf9+O6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4349cc45219so6551595e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 03:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732795123; x=1733399923; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b70a/HAOpnoENpx7tq/FE7+S1JCaV0Y637ILpq9v7s0=;
        b=VgPf9+O6/FK2IvAVPQCHNWdtJ2bqKQyYo9VFSogKpqLHO8A9esyw9GbCE+2JoB2G5G
         bfdVTTfUEBe4hoYonivcN+1I73RAQ0jMs7twFs3AxUpMBmbnZy31Cvg/ACp6sRulrUPG
         l2BQT93FFlOm9dlT1aUNfZ1FkwZOkoOmtS4r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795123; x=1733399923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b70a/HAOpnoENpx7tq/FE7+S1JCaV0Y637ILpq9v7s0=;
        b=OihKwBqtdZ1au+xIs2QA/QfNJrBdcMB5zkuWYNrwG1Z+FhzR+FsSBx4KogrTze+fWs
         mSVAKIzkIFsOwA774qObBpSMyT7vDW5moWfDaY20YovjS9PKddh0SJi64SI6V1JnciAa
         ugff4dQXDhzKwIbH0M8Pk28+nQz7W5nxnlflzlYiCPbgmo3O1VcEb4cDIlphdwMtAlU/
         1nVF8onHOQlDhPiPTzgCQpXClMD4IvHDnw0FDaB0yCEs0wQhkPHB3PMtxRk49f+eEGuu
         G3myYOLdnWU0YfmFBzbKKO8G6nvZpO3qGugI9C/BzsBhk4MX3PZ2XnZfghHK9cVRyWnN
         m/2A==
X-Forwarded-Encrypted: i=1; AJvYcCW5paaDeyzGXcfaOuB0hfV/cywGtt9eeRajVTCsDbQYWde01JEWQmRJQaYlmFfTvPWElmuZ4b02/XnxULzpHJjCwQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDO0oP+wfGwKoKLZZXnWU9hq0mYbJo4fPnCMOUWu/XpIADzozm
	rUEr6QBtOWv/47SgJTrOrmkwYL/V5L0StbCYNlTjprxOlV++6mYcoWQ3z7iERh4=
X-Gm-Gg: ASbGncvJRkP5Z+IqXyFsCx+4d3m4iefYxuNhz2DGmzmyElt05bsGJarJsMh4XV8wvVO
	kmUz5HckG6iOasbLcWkkR4+aW1U+KPkmJF2Dh/ilt8QttFQK+O+EIEHNcJBLdPz11nlZPG+a34O
	3saRTt/LoKZHEbSEmQJnw62gcBGobHyO6/9bwltn/Lbt5DYTC80f+IOoUppDnta00erzqSVY4BY
	Fkou10KbrlOmTQGu2G3BCbxavYeqXATLcDhmEnJ/B0rEHwhtrvdxz+VKC7ffWOtpX5E3lpSn/JY
	z/1W4Wv4FbhdSLqEXR2HMpCG0LHFvfySIzMfTng=
X-Google-Smtp-Source: AGHT+IE5RrOQ7Snx+HWl/Ntw2gbgMvW28WWjhxkeLBJuUidb2/Me9CHP7uALrRc5AD9dnztXkdmywQ==
X-Received: by 2002:a05:600c:5488:b0:434:a962:2aa2 with SMTP id 5b1f17b1804b1-434a9df2761mr55593705e9.33.1732795123285;
        Thu, 28 Nov 2024 03:58:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:930d:1506:79bd:20bc? ([2001:8b0:aba:5f3c:930d:1506:79bd:20bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc63b6sm19915245e9.22.2024.11.28.03.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 03:58:42 -0800 (PST)
Message-ID: <83062184283c9a80138d75f9abecf30cd8dcd782.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Update vector logic
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: colinmca242@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 28 Nov 2024 11:58:41 +0000
In-Reply-To: <Z0hadK8D8_0rGH2E@bootlin-mathieu>
References: <20241127125945.3211089-1-colinmca242@gmail.com>
	 <Z0hadK8D8_0rGH2E@bootlin-mathieu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 11:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207986

On Thu, 2024-11-28 at 12:56 +0100, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Wed, Nov 27, 2024 at 12:59:45PM +0000, Colin McAllister via
> lists.openembedded.org wrote:
> > The database used by cve-check currently stores the access vector
> > and
> > vector string for the oldest CVSS version for each CVE. This should
> > be
> > reversed, where the newest possible CVSS version is included
> > instead.
> >=20
> > Signed-off-by: Colin McAllister <colinmca242@gmail.com>
>=20
> Hi,
>=20
> I believe this patch breaks some selftests:
>=20
> 2024-11-28 13:29:06,536 - oe-selftest - INFO -
> cve_check.CVECheck.test_image_json (subunit.RemotedTestCase)
> 2024-11-28 13:29:06,539 - oe-selftest - INFO -=C2=A0 ... FAIL
>=20
> https://valkyrie.yoctoproject.org/#/builders/48/builds/463/steps/14/logs/=
stdio
>=20

Is that not from the ongoing NVD issues meaning we can't actually
obtain a new updated database? :/

Cheers,

Richard




Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F3A697CCE0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 18:12:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w6so1177574wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 10:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=l3vgVMFwzNT5JSKKmzPt6CeUh5te4VyyA06W02/J2Ls=;
	b=J8DmIWMNoCX0XrpqxYp1Uuls8ZF+Ddx798rmc9KvnZ8sUvMZW3ot7FZl26NQMO5W23
	unPL3aSoxwUhHiszDJweA451o0O5RP6MoD398/JpA+tB58mb9r//Do8yB8sFiSJ9iNCZ
	tWXfE+cdS6lhk40kQuCcg/LnJvJe3OGJu7NHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=l3vgVMFwzNT5JSKKmzPt6CeUh5te4VyyA06W02/J2Ls=;
	b=XUn8FB817GMNIhmE/zPJWUK7+8rD+HRQmuXGhunZmuW4FTxpDMZY7GHQy4P5clP4vP
	eFHMn0QxWWzECLpTjUj2cX14uLsCVcTRF4LhZCXGRNJ10vECdDfwSMyn0lXaHf/BAXgc
	hrgoNMiCl8Pn4PShRsg7P5YNyo7rOoeJ6f369DBg7AtO9z7VdF/JWedLTCFRn1pCJeIQ
	I1GzD6ebc7u35kpfoSCsHBJgFNoTvX2bTI4Yand9rhRsPSbCW8q7QAGNPRn1KQxcs7sc
	rZBQ+ASSJd5vsdZrKZGeeKjusSr4igRST4pxAx3DCp+mEY1Kc4jzcreILWRSjsYl6AKE
	kX5A==
X-Gm-Message-State: APjAAAWgbxxM+/Coz0zg14NdzeGGGahkyKQG4sSIzUSLQ9ndr/FcxWR/
	3InrLKfAkK1HqUj2LZMS2AUatw==
X-Google-Smtp-Source: APXvYqz6XP3ZPTyCIh0DmltmOF/d6ov6iF2TJ/OgX8Ncq3GU7UeWwr3GGgByLMm1lAhe+9xM1zGxMQ==
X-Received: by 2002:adf:f690:: with SMTP id v16mr7551795wrp.139.1551550371592; 
	Sat, 02 Mar 2019 10:12:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id u4sm3420731wmb.25.2019.03.02.10.12.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Mar 2019 10:12:50 -0800 (PST)
Message-ID: <c77e986f7f1db21123fa9f0eed5392b2562d2ce4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 02 Mar 2019 18:12:49 +0000
In-Reply-To: <20190301163639.26436-1-luca.boccassi@gmail.com>
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
	<20190301163639.26436-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] swig: fix build with musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Mar 2019 18:12:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-01 at 16:36 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Building with musl currently fails. The fix has been committed
> upstream, so backport it.
> Note that it requires the recent change to use autoconf's
> do_configure
> as it modifies a bison file which is used at make-dist time, so it
> triggers an autoconf rerun which was not working previously due to
> the
> custom do_configure step that was removed recently by:
> a9b1f9eca963 ("swig: Fix configure failure")
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: fixed upstream metadata format in patch header

Fails in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/585

May need a bison-native DEPENDS?

Cheers,

Richard



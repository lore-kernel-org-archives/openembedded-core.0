Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 251E36C118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 14:52:37 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id o125so3214678qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZQkgwDYUKgJePyPc9JhmSJl1vjp/5dV2k4LoHdYY3hQ=;
	b=sRAvkHmhFFIJnX9QbGKvXyhD+2SyR5MuPxaHurmY8zFGZgILgg2wS9hBkdjW8lG6EZ
	6M1BDSGCGc18nHt/SsEoS7I9jbV4r2SM5eISxtbPcLn0htK/qg5Ze7o7mXA3LqXORpyr
	Z9lQQEorKS0dLkEkkXFoYkCrRPESt2A2U20NsaNICah8G+sV+pxwLUYMsJ907R3OwGLu
	AYeARLe9X+jBPeZHEGvDuw/vVFP7+QkwCrmAQA5CozM0UFoTNa1dJQwIQ51Q0DUSVwfk
	3lFZZwNA+1gjReE4qNqbqGK9IMTO2wAIS1176Cv24I1PklO4hrgJxXCWFEEZQZHeU8ww
	p1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZQkgwDYUKgJePyPc9JhmSJl1vjp/5dV2k4LoHdYY3hQ=;
	b=HljSJGGydap6K4NjzYyq2hVEz2QKuRcY0OZT8XUUrAwBYKjEVsjUHaqvZNBeQO6xjA
	UXSKFLmxJFOOe5jOYwg1qWh/ZMWLhtyQ8B5VUb4OKAgt5gM5CUmvjP3OQQx66uGQU+jC
	7Lcku6m/ml7hSVQDdGU858oJoprLEep61LlQ10EW0fCnDHJsgVU0T7upfKlIBObK8k4G
	sqoEJ20Y17vxL015pkijxEhchAlixHRPJ4uJVBq/d8a4l8dYLtFcs8r7VnUvBE0+38x+
	mTf6zy4kQ9w5fBCYEv6hiMVe4R5y8vPmZ+76vLduWjzB9G6ogniiGPGdaYPA1IV+PD3I
	C+SQ==
X-Gm-Message-State: AJcUukehrs4m622rTQOwWCNDUH+LzkeMNTZhWdbvvt4UWDQrkw5Et6CI
	lY9PiWf1UHjisdwhCd5G+umZbaLHkhRG1kkAhsc=
X-Google-Smtp-Source: ALg8bN5rCPfqSBYVQsbVp3+BRu0Wk3tJQ0ll+Udgjdcd4S1WpKkQ7kAMF2zOBme7zL7F6Z0zftL/NDRMvK7MsRL/atw=
X-Received: by 2002:a37:d408:: with SMTP id l8mr2553529qki.315.1545403958646; 
	Fri, 21 Dec 2018 06:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20181221142351.71820-1-alex.kanavin@gmail.com>
In-Reply-To: <20181221142351.71820-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Dec 2018 06:52:12 -0800
Message-ID: <CAMKF1sqY8tVKDuqof1D7J33-hPxh_3dN2Ngb+X1k=U1gGeww5w@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add --enable-new-dtags to linker
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
X-List-Received-Date: Fri, 21 Dec 2018 14:52:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 21, 2018 at 6:24 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Various versions of ld have different defaults for this
> (even between e.g. Ubuntu 16.04 and 18.04). This has the
> consequence of putting either RPATH or RUNPATH into the binary,
> depending on the linker, which have different priorities
> vs LD_LIBRARY_PATH env var. Also, I think, the original
> executable binary is looked up for the tags when resolving
> a dependency of a shared library when using RPATH, but not
> RUNPATH.
>
> Let's make this deterministic.
>

this change is fine in general. What we have to understand is that
--enable-new-dtags actually sets DT_RUNPATH instead of DT_RPATH.
DT_RPATH has higher precedence than LD_LIBRARY_PATH; DT_RUNPATH has
lower precedence.

with this change we will let LD_LIBRARY_PATH override our
settings. So look for case where we might have assumed that
we are setting DT_RPATH so no environment can affect us

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 64800623545..732e4f93328 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -573,6 +573,7 @@ export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
>
>  export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
>                          -L${STAGING_BASE_LIBDIR_NATIVE} \
> +                        -Wl,--enable-new-dtags \
>                          -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
>                          -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
>                          -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


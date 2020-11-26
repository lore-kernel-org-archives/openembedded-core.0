Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.5983.1606402030777548404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 06:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VfL8e8kH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l1so2405320wrb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2020 06:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yKTUfmwTJxBcNy3LZwru0QX2GEd37HgFG21ExmVBdDk=;
        b=VfL8e8kHQr+Bj9H129Hp4G3TMrJJGjP/dDZHTKKKb5XvTIEPHmTRm3zCZwv0DYdTqh
         HgwBjwuutVb0RaRmo6jHrs6MViMOIrf+TsR+4bkWngXziMMTujQg9e10v1xuylmSxnyT
         iH02kjZMCig/sCB6vKxyvVQ4Il0UL1vpOe6wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yKTUfmwTJxBcNy3LZwru0QX2GEd37HgFG21ExmVBdDk=;
        b=L4cE1Jcy2zWj/gtkeR6XQXaubObOhlVJtaU663kK1CfvoeypURkyeLHBrBJLLIUhkd
         yLp0VvDD8C7mCf51qggxiSkGqH6d2MaCR7M4co3pRiAVxCzL1omIiysr7IgvFu1a/q4Z
         JRRGM1s7geYRv2FHUQpZBmH1OJqPR52z7aQKDLH1sy/MK2VpsgTQZSc2vGD7TAqc0e2w
         bM9OBViV1Ip8yP63GUwoVZ5w2N6X8WvKdF9JCUYfMIgRqDWNwLc7Y1SBJjT63a9n5nvW
         E7oHJJGWwnjx5cEYbGG0UNTOrTJqdS6AWK4P6naEaHzMQLfLkZBRNWRfWoDioXsnZl+E
         LepQ==
X-Gm-Message-State: AOAM5320HWg2kAYCNo/RVZqnZCxqcXXyQs+2Ihcz1Z3sxyAEZYWayBEY
	jYxnqP6wB/UiU3IOKrcSR40P+A==
X-Google-Smtp-Source: ABdhPJw/qf6CRy0WV/hrcWoqOlmnn+qkKJGdjOYii4T4atwBIs5w0Z3lH6Y8dag7UAbWOBLi4Q5R/A==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr4294286wrp.230.1606402029237;
        Thu, 26 Nov 2020 06:47:09 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:80f3:d3bb:2355:c387])
        by smtp.gmail.com with ESMTPSA id k16sm9548255wrl.65.2020.11.26.06.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 06:47:08 -0800 (PST)
Message-ID: <4ddd2873ff90af2675c690fd44ab8881ff609a70.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 3/4] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2020 14:47:08 +0000
In-Reply-To: <9b62c1babb6a53472329d57fa6ec2ac8ed70a3f8.1606312002.git.pkj@axis.com>
References: <cover.1606312002.git.pkj@axis.com>
	 <9b62c1babb6a53472329d57fa6ec2ac8ed70a3f8.1606312002.git.pkj@axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-11-25 at 14:48 +0100, Peter Kjellerstedt wrote:
> Introduce PSEUDO_IGNORE_REAL_PATHS and make it contain the canonicalized
> paths from PSEUDO_IGNORE_PATHS, obtained by passing the latter to
> oe.path.to_real_paths(). This is needed since pseudo's
> pseudo_client_ignore_path_chroot() will compare the ignored paths to
> paths that have been canonicalized.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/bitbake.conf | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

This looks like a good way to fix this, except I have a strong dislike
of "REAL" variables.

> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9742fe4fe2..4862095a1b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -685,15 +685,16 @@ SRC_URI = ""
>  PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
>  PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
>  PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> +PSEUDO_IGNORE_REAL_PATHS = "${@','.join(os.path.realpath(path) for path in (d.getVar('PSEUDO_IGNORE_PATHS') or '').split(','))}"
>  PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@','.join(d.getVar('BBLAYERS').split())},${CCACHE_DIR}"
>  
>  export PSEUDO_DISABLED = "1"
>  #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
>  #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
>  #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
> -FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
> +FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=1"
>  FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
> -FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
> +FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=0"
> 

I'm wondering if we create a function in lib/oe/utils.py and then use
something like:

PSEUDO_IGNORE_PATHS=${@oe.utils.realpath("PSEUDO_IGNORE_REAL_PATHS")}

?

Cheers,

Richard



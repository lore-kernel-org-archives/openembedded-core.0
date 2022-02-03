Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE78C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 21:32:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.660.1643923949398522678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cNJHlIlU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id l25so7496540wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6s59O/Ck+lFBcgoTWDj+AkwIcsEefwSKjrbaftNRYqc=;
        b=cNJHlIlUW6QI6Qormx6Qk8lYZV519GdlQ8Pz88BNe+susaZYoqfCNj7blGst/8eDNS
         fQmvKAzArqWh695hkXllBbcgxsWkSwPEevqPaU9M3q+oU/6OzLhh1Ig6lo3eA4sf7Yad
         Kxt7jJu/HgpiecN8fPICDkD0IsqyO1SZGGsiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6s59O/Ck+lFBcgoTWDj+AkwIcsEefwSKjrbaftNRYqc=;
        b=sPxH7PvCDmDTUoxIv0uepZ4ytP0p3VJSJ7ixmrwIFBF45va6eGnYQa+ZQoHp3f+ZAn
         skr2yr3UeyXaVc8yg6xBwPxSvyme35A9QTZVc3JStHKoCq10de4jQtz9iLz8dIHyN/f4
         L7jOmQ43V/+TZO8I3N7TeSJq2h8aW8OjbxuKaD7yHXmEIpxMkKeTFU9JPKjxLiSVxaT0
         jSgnVVEUKonHn5NW5XROPang55Qyr49JcACWhJguNpPVskd3EemB/iVtsocmFEvTNMYt
         0RscxtL2Mbh704KUHyT9w6+XpxB2pT1cSPW0VQIHATHFlbXM6Dt9dPc+G/mWblMfBHkz
         zVSw==
X-Gm-Message-State: AOAM5309KvzLOsqxjkVb/aUhXvopfsFlPR8iv18kw3DnviqmMyPXRhcr
	PPJK4HAr5l1+rZ359ZNa6kSKJQ==
X-Google-Smtp-Source: 
 ABdhPJzmjl/l/fCz6mA5XoJhPw78dtRIkrmx80aoyJBgyKUF+rl85AX2e4MX/nFsdLmDu7bldQNFnw==
X-Received: by 2002:a05:6000:109:: with SMTP id
 o9mr29955422wrx.567.1643923947657;
        Thu, 03 Feb 2022 13:32:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7818:26e5:4f1b:504a?
 ([2001:8b0:aba:5f3c:7818:26e5:4f1b:504a])
        by smtp.gmail.com with ESMTPSA id
 y7sm20445643wrr.74.2022.02.03.13.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 13:32:27 -0800 (PST)
Message-ID: 
 <4a2c1df38eb689e14356178840a975971d2f15df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] Split split_and_strip_files()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Feb 2022 21:32:19 +0000
In-Reply-To: <cover.1643766962.git.pkj@axis.com>
References: <cover.1643766962.git.pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 21:32:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161319

On Wed, 2022-02-02 at 02:59 +0100, Peter Kjellerstedt wrote:
> This is my third attempt to make it possible for me to hook into the
> split_and_strip_files() function. We need this to be able to rename
> the debug files for some packages to avoid conflicts when installing
> them.
> 
> In this version, the first patch splits out the part of
> split_and_strip_files() that is responsible for setting up the
> variables used to implement the various debug splitting methods
> specified by PACKAGE_DEBUG_SPLIT_STYLE into a new function,
> package_debug_vars(). This I believe to be a good thing in itself as
> that function is way too long anyway.
> 
> The second and third patch are not needed to allow me to hook into the
> split_and_strip_files() function, but they simplify the APIs used for
> passing the variables returned by package_debug_vars() around.
> 
> With these patches in place, I can now wrap the package_debug_vars()
> function with the following local wrapper package.bbclass:
> 
> require ${COREBASE}/meta/classes/package.bbclass
> 
> PACKAGE_DEBUG_FILE_SUFFIX ??= ""
> 
> # Provide the original package_debug_vars() as org_package_debug_vars().
> org_package_debug_vars := "${@d.getVar('package_debug_vars', False).replace('package_debug_vars', 'org_package_debug_vars')}"
> python () {
>     bb.methodpool.insert_method("", d.getVar("org_package_debug_vars", False), "<code>", 0)
> }
> 
> # This version of package_debug_vars() wraps the original package_debug_vars()
> # by calling org_package_debug_vars() and then appends PACKAGE_DEBUG_FILE_SUFFIX
> # to dv["append"] and dv["staticappend"].
> def package_debug_vars(d):
>     dv = org_package_debug_vars(d)
> 
>     dv["append"] += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
>     dv["staticappend"] += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
> 
>     return dv
> 
> The definition of the org_package_debug_vars() function is not very
> pretty, but it seems to work, and this solution means a heck of a lot
> less maintenance than to try to maintain a backported version of the
> over 250 lines long split_and_strip_files() function (as it was before
> my changes).
> 
> //Peter
> 
> The following changes since commit 74a8a74a553a33dc5f41939f8070d75e6d57d3da:
> 
>   busybox: Add shell arithmetic to work with poky-tiny (2022-02-01 07:32:08 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib pkj/package_debug_vars
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/package_debug_vars
> 
> Peter Kjellerstedt (3):
>   package.bbclass: Split out package_debug_vars from
>     split_and_strip_files
>   package.bbclass: Make package_debug_vars() return a dict
>   package.bbclass: Pass dv (debug_vars) around instead of individual
>     vars
> 
>  meta/classes/package.bbclass | 127 +++++++++++++++++++----------------
>  1 file changed, 70 insertions(+), 57 deletions(-)

I know I'm often negative about patches so I just wanted to mention I like this
series for a change! :)

Definitely better than the other patch with all those variables.

Cheers,

Richard



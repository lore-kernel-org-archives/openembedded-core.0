Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE943C77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 06:56:27 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.10412.1683701780202881790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 23:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=MmyJgx7y;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ac90178fdaso52130931fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683701778; x=1686293778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2CbibF4Vf8Ewy654q4IuGZSePsayTr//BZwruybmPk=;
        b=MmyJgx7y5BQ1LF4NrPMf7cuy/NU72WLPGbdCLKds0cq5bYR9GmCjWMQ/6MJYZDkMyA
         +eIeRr0/M+W/Frf7B+EA/VIE4svhmsusy6X0ddH7x/DlwJYhuecp0vmgO6fLrj2SH8QB
         BD6e30KYJ6Tm1Yr5qERmcG0n679h84KMKu6NmaJcDwd+H9OWtwM7slpQItOHTGLTy5IC
         YhPC64hnUaGsMp4IEUW+gOlH+W2tFn8s8YM1FmtacYrVec8YB9pIOgpr2WOBHh+XgyQ6
         WUuUmiijfePT1FiRGte+nW4wyRYsTCJbs5IPWx0W+6YyMXSYNS+tTwSph8fcmKCgTreQ
         x3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683701778; x=1686293778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2CbibF4Vf8Ewy654q4IuGZSePsayTr//BZwruybmPk=;
        b=DB/mB8vFXgkV8GvASubugRwY4AK3VP507fAXw+ZlSetexgToj8xLn9795mRyjAxYgu
         wObRt8836J4X5KOKBJMVuBIfejZkXMgEdu8gHdfeH+CM7/swfP2zxnvlxT+6V99drbnY
         3UJwZ15C313+kmnnHLGtMKp5fkolqiMIXXzN+oLc/Ok0pofkncK3wJvRk5MFWKMuNJUR
         wCw8P/fpIGLA+msZ2lExUq30gMbWD9Zuo0nR7fjtyhRxWvPI7WV8+I1bPx07Ha4j/pW5
         RX1BdbOlU/3VOQiN6WKUQo1Pl8xXJZWdwYIOhAFKMnon+P5LD6gFIMOiAJCXXqt/vLV1
         yJhQ==
X-Gm-Message-State: AC+VfDzbHn+w+wScqj9fG+GWBVGULBEQ/1dGbRHzdp6Atz6hujQYPOy+
	5J+vlrXdw9kIz2ITuHU2Pv3vaQ==
X-Google-Smtp-Source: ACHHUZ6FWOAx+SPDsxLLDpkIZTSe+CU4SWGITNr1VyFy0hGaX9m+WtJnrMhrKJG5RwtW8M6PwLT9pg==
X-Received: by 2002:a19:f602:0:b0:4f1:8dfa:aec9 with SMTP id x2-20020a19f602000000b004f18dfaaec9mr1026496lfe.69.1683701778164;
        Tue, 09 May 2023 23:56:18 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id g24-20020ac25398000000b004efee46249fsm610313lfh.243.2023.05.09.23.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 23:56:17 -0700 (PDT)
Date: Wed, 10 May 2023 09:56:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Douglas Royds <douglas.royds@taitcommunications.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Message-ID: <ZFtAD8/wId8I4TKc@nuoska>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
 <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
 <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
 <1a9baf9413cc3e405433806ec3e5f122e2a42793.camel@gmail.com>
 <A0C7DB9F-2B4E-4777-B233-694B7BCA3A73@arm.com>
 <ZFoTGY6DwttCmQ27@nuoska>
 <3661ef44-1856-783e-e89c-e87cf94c2487@taitcommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3661ef44-1856-783e-e89c-e87cf94c2487@taitcommunications.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 06:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181102

Hi,

On Wed, May 10, 2023 at 09:37:13AM +1200, Douglas Royds wrote:
> On 9/05/23 9:32 pm, Mikko Rapeli wrote:
> > On Tue, May 09, 2023 at 09:02:59AM +0000, Ross Burton wrote:
> > > On 8 May 2023, at 09:57, Adrian Freihofer via lists.openembedded.org<adrian.freihofer=gmail.com@lists.openembedded.org>  wrote:
> > > Is there any defined language that we can simply adopt?
> > Since a lot of people talk about SPDX solving these issues would be nice
> > to know how that is going to work. I can't parse
> > https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k17-linking-to-a-code-fix-for-a-security-issue
> > and figure out how to mark a CVE issue which has been ignored after
> > analysis.
> 
> 
> Perhaps this?
> 
> https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k16-linking-to-a-vulnerability-disclosure-document
> 
>    To communicate that a package is not vulnerable to a specific
>    vulnerability it is recommended to reference a web page indicating
>    why given vulnerabilities are not applicable.
> 
>    |"externalRefs" : [ { "referenceCategory" : "SECURITY",
>    "referenceLocator" :
>    "https://example.com/product-x/security-info.html", "referenceType"
>    : "advisory" } ] |

Thanks but IMO this does not encode the information that analysis has been
done and the issue can safely be ignored, but I'm not an SPDX expert,
and frankly I should not need to be.

In recipes CVE_CHECK_IGNORE variable the ignore list is clear, obvious, and there
is usually a comment or a commit message explaining why. And
the reports generated by cve-check.bbclass for recipes and images show that the
CVE issue can be ignored and maintainer should check the CVEs with
"Unpatched" status instead.

Would be nice for these tools to firstly support yocto upstream stable
and LTS maintainers work in detecting and fixing CVE issues, and secondly
support maintaining CVE security issue/patching status of older releases
with complex layer configurations, when anyone has to use an old release due to
BSP etc dependencies (fact of life which IMO should not be completely ignored).

I have backported the cve-check.bbclass and other CVE management related patches
to really old yocto releases and these frankly saved the product from being
the usual embedded SW security nightmare to actually have only a few
known minor known CVE patching issues when shipping to customers. Older
versions of SPDX standard and open source license checks helped to
identify embedded open source SW but did not really help in the yocto
operating system/rootfs side CVE security patching.

Cheers,

-Mikko


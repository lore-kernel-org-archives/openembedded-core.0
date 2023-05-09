Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AF3C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 09:32:21 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.27655.1683624734034569323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 02:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=N5QGPyzK;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f00d41df22so33698215e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683624732; x=1686216732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ybD+0KFBsQY3gwoSwsd42s+DRcNdKz4WKdoCHuQaKos=;
        b=N5QGPyzK09R2lS2rJUBsCgX7Z9QXesGqhMaO7N4kNMpLcbB99y1hn9xR1F5uI/uFv9
         1nQmQ97dq/2Hhl8x1KOZ2i5qy7S+QpIpf6tcXUUEXPXr+leWPPIjP/ly+jOcLnKzOXzk
         YneGDGH/Fnw0CCU+QoDwd4wHoq77CXDE4Tg5rSUwBRoK4oL9jrXhVEescZxC/v4NJUYw
         vAe013CT10WmWPrG0RzQM+zHeqLZPJzg0H0zQrghW4Gyl7lsxza3/pTz0LnyU47W7diZ
         hfHjLvNj4pyW6J3jw4abrvnsu2iDZ9nw+NHIU2cOXD9yWEcqNqgxE0CQ0JM8tYRY0xGV
         ibfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624732; x=1686216732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybD+0KFBsQY3gwoSwsd42s+DRcNdKz4WKdoCHuQaKos=;
        b=Pbk8npcvFmXs+ts3mrP7CJIF6VW2rmFvQu6RmZe7H3BRF9T9wZHEcmLOrQifMpfaon
         w2vXveezMSrVb2cJK1t2o9zueVnNaBwfWUcGxZXkPm22szgOuFeBiJewiP+KUz2/MQue
         PJpJHX1LT4KYcJHNxweAqd+lxAkEh3XmBsdkfX8cvtuY3Hhn2PPc5PRGofhtTeOj535N
         7CZEC+gG/IXRZeEbMHW3ygl1PYb6wtuzeOHz6P9q/Z/hrTz40pOWlPzI+ojs0++fMBY9
         bfNmruKLQd+mYDkNiEIv7pRuZl/0QVbqZHiqWgFNfU4u97ipH0bH2kuZ2YQ14ph+izJK
         0PNg==
X-Gm-Message-State: AC+VfDxWE/1E+x0ULf9tEjTt1Wp1wEme5OKPEimR4r7TS55BX15SHzGi
	Q3N0c7b0Bh2zQ71/txJoYyY6eQ==
X-Google-Smtp-Source: ACHHUZ7IyKDzd96dqEYbRix3HdIW/+a7FzW20QAIBpYX2GHH2rfNBTc6JF296CzXQCfDWqM2S0jGPA==
X-Received: by 2002:ac2:4311:0:b0:4ac:b7bf:697a with SMTP id l17-20020ac24311000000b004acb7bf697amr598210lfh.4.1683624732230;
        Tue, 09 May 2023 02:32:12 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id u27-20020ac24c3b000000b004edd490cf77sm282887lfq.275.2023.05.09.02.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:32:11 -0700 (PDT)
Date: Tue, 9 May 2023 12:32:09 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Valek, Andrej" <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Message-ID: <ZFoTGY6DwttCmQ27@nuoska>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
 <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
 <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
 <1a9baf9413cc3e405433806ec3e5f122e2a42793.camel@gmail.com>
 <A0C7DB9F-2B4E-4777-B233-694B7BCA3A73@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A0C7DB9F-2B4E-4777-B233-694B7BCA3A73@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 09:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181038

Hi,

On Tue, May 09, 2023 at 09:02:59AM +0000, Ross Burton wrote:
> On 8 May 2023, at 09:57, Adrian Freihofer via lists.openembedded.org <adrian.freihofer=gmail.com@lists.openembedded.org> wrote:
> > The patch from Andrej tries to solves a real issue: The CVE checker
> > distinguishes between two types of patches. Ignored (= not applicable)
> > and patched. Patching is only supported by adding a real patch file to
> > the SRC_URI. However, there are other ways a patch can be implemented.
> > For example, a recipe that uses the git fetcher would update the git
> > hash to a commit that contains a fix instead of applying a patch file
> > to the recipe.
> > 
> > But I fully agree that the comment (originally suggested by me when
> > Andrej and I were discussing the solution) is bad. Maybe it should read
> > as follows:
> > 
> > Normally, a CVE is treated as patched when a patch with the name of the
> > CVE is applied. CVE_CHECK_PATCHED allows to extend the list of patched
> > CVEs without adding a patch file to SRC_URI.
> > 
> > Regarding the SBOM: It is important for customers that the CVEs of a
> > product with SBOM can be correctly identified as repaired or as
> > ignored. However, I'm not sure if the SBOM part is properly addressed
> > by the patch. The create-spdx.bbclass uses the function
> > oe.cve_check.get_patched_cves(d) which should probably handle the new
> > variable as well. We will check that and come up with a V2.
> 
> So I’d suggest we deprecate CVE_CHECK_IGNORE and add a new, more flexible, variable instead.

Flexible but usefull and with clear definitions and checks which make
sure that only those definitions are used.

> How about a CVE_STATUS, which doesn’t have a direct value but has flags for each CVE:
> 
> # We moved to a git SHA that incorporates the fix
> CVE_STATUS[CVE-1234–0001] = “Patched”
> 
> # We disabled frobnicate
> CVE_STATUS[CVE-1234-0002] = “Patched”
> 
> # This is Windows-specific
> CVE_STATUS[CVE-1234-0003” = “Not Applicable”
> 
> I’m not sure of the exact list of values the flags should accept beyond “patched” and “not applicable”. There probably does need to be a “reviewed and don’t consider this a problem” which feels like ‘ignored’ but I’m not a fan of that precise word.

Sounds ok as long as the output reports as easy to read as now.

> Is there any defined language that we can simply adopt?

Since a lot of people talk about SPDX solving these issues would be nice
to know how that is going to work. I can't parse
https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k17-linking-to-a-code-fix-for-a-security-issue
and figure out how to mark a CVE issue which has been ignored after
analysis.

Debian has a bit more complex state for each CVE (and also non-CVE
security issues) which relates to package and distro versions.
I did not find clear definition of the states but at least
https://security-tracker.debian.org/tracker/data/json has the raw data
available.

Ubuntu seems to follow Debian a bit but then also adds more complex
states in the (at least) public database at
https://ubuntu.com/security/cves?q=CVE-2023-26117&package=&priority=&version=&status=

I think the data coming from CVE checker needs to serve the needs of the
distro maintainers so that their life is easier. SPDX and SBOM are
supposed to help but I'm afraid that they don't unless they actually
help with the maintenance and start to solve the problems there.

I'm used to the CVE checker ignore list (previously whitelist) and know
how to use it. Wether the data comes per CVE or as lists for each of the
state as variables is a small detail, as long as the generated report is
readable.

Cheers,

-Mikko


Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B20C7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 07:58:08 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.16884.1684742282187082401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 00:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=X2U+yJxK;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f3b4ed6fdeso2274198e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 00:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684742280; x=1687334280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oDBw0e8dO8R9cpE9OUDBieGPLMY1A6bWdG7i1mNb9xs=;
        b=X2U+yJxKJM6EuDyowjcEdf+hX4k0Bdac2rxGwjrI1Qa6yaEdovtrF1mTQj2x0ULScf
         tpdAZgBDM4MGjcpjPiHWUQbDens53fBY0qaeUJ1tOaJfc83yXqHWeg/R+Avmi2xR3DpO
         2J7DfKEUeZXUSWS+pclFK60k14wE4MibSPQ54H0Ee00kHk+4kTPXmQRLKLxAjGwIqPh6
         EsU5WYLfVu4kxElC7TpXXw9rUCKLfy5MZhRipuysHCtdni4BugemyBPft/7+sdSHZ8NV
         0CkMBAgCHm8L5zcLGgRs4+Qp6INPFrOvWKTqOZZCKBMlo7so8rDQ02Xl2IQ3AqWSJxwH
         g6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684742280; x=1687334280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDBw0e8dO8R9cpE9OUDBieGPLMY1A6bWdG7i1mNb9xs=;
        b=mBF19k2b6fyAOM/Bd9qtdWV+Wl62YIXqXJekRv9tQM+X4Rpur9iRwKpEXVe55ErzbF
         J+1huH1M3R25+B/mbg1RnOwpMMpAzVU0joSGzcKDjUTvO74NDPIdu1aRYHWMb1f+0njR
         z7F4MGSBn4+QVhYBIK2n4DCTEQCCHZdK/wrvSmTS1JVO8XuL+lDf6ALCZ315LAkfyPht
         yv+kvC7utG70NMqPLbDpiaYbE1l4RGFCTMYOmEb694ksjz22b5Icwy24JYeUR08jTpAd
         5QVf6KEZNbn5VxI/1hUCi0rD3eJSad5JqwSwxDPXyb4SqorCII9/ddsh7VnBuqkg7Pv8
         OTPg==
X-Gm-Message-State: AC+VfDxp0P/dPu8S4w0y8Msn2gMkr12I5stDZYO0RER3+Rk3eed1pYSX
	jlh1OymTXE9EKta0a5sHd2omoQ==
X-Google-Smtp-Source: ACHHUZ5wmK3ksxprIJCFGSjOfluWAqo1qIWX2TwtgEfiPqjUXCmPmWTK42QF7lY7WYVB/Ime/IFdig==
X-Received: by 2002:ac2:5217:0:b0:4f1:4051:d77b with SMTP id a23-20020ac25217000000b004f14051d77bmr3217441lfl.60.1684742280204;
        Mon, 22 May 2023 00:58:00 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id f20-20020a19ae14000000b004f3afe4ce20sm883394lfc.191.2023.05.22.00.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:57:59 -0700 (PDT)
Date: Mon, 22 May 2023 10:57:57 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: andrej.valek@siemens.com, openembedded-core@lists.openembedded.org,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Message-ID: <ZGsghWIXfholEAdA@nuoska>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <20230519062420.37015-1-andrej.valek@siemens.com>
 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 07:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181584

Hi,

On Fri, May 19, 2023 at 03:11:57PM +0200, Marta Rybczynska wrote:
> I'm missing a status to cover the situation when the NVD (or any other
> database) has an incorrect entry. We have quite many of those. This might
> be a temporary situation, but not always.
> 
> SPDX (the 3.0 draft) has some other possible reasons
> https://github.com/spdx/spdx-spec/blob/vulnerability-profile/chapters/profile-vulnerabilities.md
> What looks like interesting ideas are:
> * "Can't fix" / "Will not fix"
> * "Not applicable" (SPDX language: Ineffective) when the code is not used
> * "Invalid match" (this is our NVD mismatch case)
> * "Mitigated" measures taken so that it cannot be exploited
> * "Workarounded"

To me the SPDX details don't seem very usable when actually maintaining
a linux distro for a long time. Anyone from major Linux distro
stable/security teams participating in the work?

So I'd rather compare to Debian security tracker CVE status data and ask
what our LTS and master branch maintainers and those in the community
who maintain yocto based SW stacks need. Do the maintainers want to read
SPDX output, for example? What common statuses do the maintainers want to
encode for each CVE?

Debian security tracker https://security-team.debian.org/security_tracker.html
shows states:

 * vulnerable: binary package with specified version in their distro
   version is vulnerable to the issue

 * fixed: binary package in their distro version has fixed the issue

 * undetermined: it is not yet clear if the issue affects Debian and
   their version of the packages

And "vulnerable" has sub states:

 * ignored: the issue does not impact Debian packages

 * postponed: no security patch updates will be provided, e.g. such a
   minor issue that update will happen for example via normal package
   version updates to next stable version

There are a lot of additional "standards" and sub states when looking at
CVE data in the tracker (info not public, no upstream fix available, not
supported configuration etc), but those major high level states are enough.
And then there are security relevant bugs without CVEs.

I've been happy with "Unpatched", "Patched" and "Ignored" states for
each CVE detected by cve-check.bbclass. There could be a few more sub
stated to "Ignored" and the "Patched" state should better reflect reality,
which this patch set helps. But I'm happy with that.

I'm not so happy with the SPDX states names and meanings.

Cheers,

-Mikko


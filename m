Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9014CC678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 12:15:24 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.12724.1678191322435207587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 04:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Lg8U/cTO;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id t11so16802323lfr.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 04:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678191320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b88AEgukFFRk/QQ9GbRAa0YXQXbqRFy9dJiSICA+xJw=;
        b=Lg8U/cTOyZL6C6qicm+OxU0qbN4EZqwocQbM8c+vFfbZgVEtweye27FuvAetHfigh1
         r8a6GcYFhOD7DNmrU5754ttHv8CHtvEnkCP18Ey4Q2k1MwT2dZTVKF/cYx69FaummSV2
         HtCnuE24uJbgu74JuFXlBlc+LtWvISm60IW6zn5ZubnaEz1g7RBNA1cFer3eUeqaA4Y5
         3TVnU0HAm9pp3YXuA/Pc8Q1N8tTjk4EOkXTs4WAU8/va+an4HW/l3n+7BoOG0RzIHUtL
         ZT11Wz6wE6u5ubsp0JNihaQhfD88uVm+k3ZY/9eRV1XSFw84kl/JhxweoGmd99kLm2JW
         2Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678191320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b88AEgukFFRk/QQ9GbRAa0YXQXbqRFy9dJiSICA+xJw=;
        b=iyNUomqcFRcGAqK4J8zOpbzEpg+LqrNwnVLfIhEUaP1srn3ztwAG8oPNIIhTnxmyWZ
         s2I8KQ+0qdtykTLacpbhFrPoyzL+c/+jeO6adm1Fr2BbvPUr1rEGG1JwKuL0XaQ7qSL+
         L8DD1z3DUrWRdTzjEukUBRtIqMOdOPJ8WtOORYqgf+4JaL+9mTIb2uXtM9Ls1OmgbcZM
         lv8Z1eeDtCXld1llS7CIlV0oJGDN20fuJ32OC27+LPBSLNfu9enp6/2pBdfc4gL4MNFi
         6mlVJrqoxyJU2TPPcopQhqrBIlDuFf5BmZXE3+jrXwUiM0NTAgSPbLHxW//vBRu6d47r
         hoBA==
X-Gm-Message-State: AO0yUKUpsh/KBBlPrupjcGbNnPFXy9j+TAcyjO2rVede2kjLVS/nf6P5
	JZDG7gKy5eEm3cFjL5DVxi0FsA==
X-Google-Smtp-Source: AK7set8ia/ciJwwdHLZG1MrBiX6vnO7WMlxDR2Xi4Vk+/3nYYzlawgjELjD6O3GyZJxiPmxCMbfP9g==
X-Received: by 2002:ac2:5a0f:0:b0:4dc:8192:c5e6 with SMTP id q15-20020ac25a0f000000b004dc8192c5e6mr3824264lfn.13.1678191320553;
        Tue, 07 Mar 2023 04:15:20 -0800 (PST)
Received: from nuoska (85-76-135-75-nat.elisa-mobile.fi. [85.76.135.75])
        by smtp.gmail.com with ESMTPSA id f25-20020ac25339000000b004b567e1f8e5sm2012836lfh.125.2023.03.07.04.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:15:20 -0800 (PST)
Date: Tue, 7 Mar 2023 14:15:17 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	"Valek, Andrej" <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>,
	Ricardo Salveti <ricardo@foundries.io>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
Message-ID: <ZAcq1Vp/h8ofNwl4@nuoska>
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
 <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
 <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 12:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178105

Hi,

On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote:
> Hi,
> 
> At Foundries.io we intend to update the docker version on the kirkstone
> branch to the latest available upstream, currently v23.
> Looks like the better approach can be doing that in the mixin layer,
> for that a new kirstone lts branch will be required.

FWIW, meta-virtualization master branch works well with kirkstone and
docker can be updated that way.

Many layers remove layer compatibility with older LTS releases even when
technically recipes still work, at least with very few exceptions.

> This requires a golang update as well but the golang on master is broken
> for some cases when -linkshared is in use and we are still debugging this
> issue.
> I pretend to start this backport when I can stabilize first the golang 1.20
> on master.

Cherry-picking go patches from poky master to kirkstone also works once
the kirkstone specific security updates have been reverted.

Even if Alex disagrees, CVE patch backporting is needed when SW
components break APIs and ABIs between releases. For mature and API/ABI
compatible SW components the updates are trivial, but even with them
there are exceptions and surprises.

I think yocto maintainers can make sensible decisions and compromises for SW
components and features which get updates vs which get CVE security patches. I
think many "development only" tools can also be updated quite freely
also in LTS branches. For example CVE and SPDX tooling, maybe even
bitbake itself, git, subversion etc. gcc and libc do break things on major updates, same for
clang. go, rust, perl, python have possibly more stable updates so those
could be aligned with all maintained branches. If no-one is posting CVE
patches for complex SW components to LTS branches then I'd update them
to latest release or even master branch rather than keep the affected
CVEs open for ever. If there are not enough maintainers/resources, then even
breaking the API compatibility is ok. nodejs, rust, go, webkit, tiff etc are
really pain to maintain and thus updating them to latest release should be
considered even if APIs change.

Cheers,

-Mikko


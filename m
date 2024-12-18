Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A511E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 21:46:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.116863.1734558408974373777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 13:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SZZ+Psya;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4362f61757fso1154475e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 13:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734558407; x=1735163207; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcTUC63TstTWPVM80tJMZhacmB+42c2JX+qAItXbFXI=;
        b=SZZ+PsyaIUKEZ6m5ke2g5cptuVqdC9HjzSVeSe2kJy+hmLIrmk+ieG1IsmF7ubOnuJ
         sPESrK119aTfLQjGinF47Icgw22k4mgKNLEr4b+Hjo0u5Fe0PQBW5yQ9YYJIfdzSnVtS
         Kz6R5w5wn/LCtPLk/7/7Qq3bAURnCICOqViOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734558407; x=1735163207;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcTUC63TstTWPVM80tJMZhacmB+42c2JX+qAItXbFXI=;
        b=hK1VhC9wV5FJdA5SyT9pfCP5BLZZXdSEd1EFN/R0wR2cj4S+YmEc3seF4oDtL0nEcF
         UqRrf7JZSZjCWnIOVTihxe/Bw5JAEXpynUeloXeZKzvIsilKttP7YaWmsX8Yq1jCE+aO
         YPmyhc0NDCbcLo31h9rZcfvmzKUSqvNhr/Km/SRNg9J3Qz5u9fGzzpsCQNCqE0NfgCFR
         n533tPMTRcczZ8N1AAHlhy/yCuPKP0rhsJm3OVk3t/qTzIBUVCSMitTP8Ad2uecjbwdi
         pfsOmgwPTLAVDrATuxHwh1nnOLz24k2I/FJVYGb2oS03STtfM234CS2k323oXmxraXWJ
         0zdA==
X-Forwarded-Encrypted: i=1; AJvYcCVjuOJQVnljTY+ZHZ13XQYn4/OUSUmMVF32NlKvBo4OJKsx/bHJ6vOEyPwKbMj72X0Ielv4MjJQtcYVJ4DAM6cpSw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywz6AtElpS2aBmdIjpvPa8Da+dZgPhjoEw7aMSgxcCxI4zx7EdF
	8MnsTXw5IatdYKpnUfYL8Al/lwx0DWsIkSrbO4v5v7SlND4NdLwl1N7BnPYzgNA=
X-Gm-Gg: ASbGncvCu9phzqXonhBW7bxDol+6tOI9ln/zb47XkxmaBn3GHcIALgBDSlapETTLxKW
	GomesW9/dy3/Y3JsteReGXyLfAgC4qY0Iq432QD8LFvbKZiQS/GkJNGBayabXFTb1w78RVeZylc
	FcD/czl8JW9gXAtr/2tSUpoCBxnCMDIc4MCbVOqxSCTUI7xNw28QzVApayVdeTmntffC8TRf8fT
	WbkGZ8WvMPeiYHqLCy1qEL1AErQKyzOiOqRa3Ed85s9FDQ8XY+VmrTqiDm0n0LUxmu1n/W5DYsh
	4AojWex0ZfeTJg62R0rjOdOXNbsUQ6H4zJCWfHX1m14=
X-Google-Smtp-Source: AGHT+IHebR2XwYa+EFDvAS/DhaEXmag0VWAOUR8jm9OlLxTTzz254nh3BxJ6SVI/hmi2e3zRWqQr0g==
X-Received: by 2002:a05:600c:4fd1:b0:434:f819:251a with SMTP id 5b1f17b1804b1-4365535b124mr41289205e9.9.1734558407333;
        Wed, 18 Dec 2024 13:46:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b46:925e:df9:832d? ([2001:8b0:aba:5f3c:4b46:925e:df9:832d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2a4sm31430765e9.27.2024.12.18.13.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:46:46 -0800 (PST)
Message-ID: <f0e141bc9d660bf76b2e4e555a39730cacf0fb28.camel@linuxfoundation.org>
Subject: Re: [OE-core] cve sqlite database 'malformed' issues are back
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: colin.mcallister@garmin.com, openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2024 21:46:45 +0000
In-Reply-To: <13203.1734556933388258298@lists.openembedded.org>
References: 
	<d3df2bbe890a456a7d967d27ad0821067fa492ee.camel@linuxfoundation.org>
	 <13203.1734556933388258298@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 21:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208879

On Wed, 2024-12-18 at 13:22 -0800, Colin McAllister via lists.openembedded.=
org wrote:
> Sorry, I've been away from a computer for the last week and am
> getting caught back up on cve-check developments.
>
> One of the ideas I've been mulling over since the cve-check
> discussion in the engineering sync last Tuesday is why there's a
> local global CVE database to begin with? If the solution is to move
> to having something JSON-based in DL_DIR, couldn't there just be a
> smaller database specific to each recipe?
>
> Instead of downloading a whole database, each recipe could run
> something like "do_cve_fetch" to download the CVE data associated
> with that recipe's packages. Based on the NIST NVD 2.0 API, this
> could be done fairly trivially, where the CPE is passed with the API
> call.

In theory we could do that, yes. We've been trying to avoid making too
many API calls to NIST though. The current way we capture the data in
one go/recipe and then have the copy there which we can mirror/archive
as needed.

> The major downside I see is that each recipe would have to make a
> NIST API call, which could make builds slower. I also don't see a way
> to specify the CPE in the CVE change history API, which I believe is
> leveraged to do incremental updates to the current sqlite database.
> So I'm not sure how a recipe-specific CVE database could be
> incrementally updated without just re-downloading all the CVE data.

That may be a problem if we can't tell when we need to update or not
:/.

> If the CVE change history API were to add the ability to specify a
> CPE, that would make this much more realistic, I think.
> The advantages with this idea is that the CVE data will be more
> tailored to a specific build, where the whole database isn't needed
> to be downloaded. I'm guessing that this would reduce disk space,
> especially compared to the whole JSON dataset being saved in the
> DL_DIR. If the API were to become faster and more reliable, I think
> the overall network throughput would be less too.
> I wanted to share these ideas with an email thread raising this issue
> with downloading the NIST database. Once again, I'd be happy to lend
> some time and what little experience I have to help address this
> issue, no matter what the best agreed-upon solution is. :)

Just for the record, the malformed database issue has been tracked to
an unfortunate interaction between the way sqlite uses timestamps and
NFS which we use for DL_DIR. There is a simple fix of touching the
database file after we update it which might work around our build
failures. We shall see...

Cheers,

Richard



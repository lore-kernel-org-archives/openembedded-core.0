Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CA1EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:47:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.17296.1686833225024410924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 05:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=TCh5ZrYb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f8cc04c278so17677915e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686833223; x=1689425223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=itudLqBuU16pVuKikNT/VxGwCmMydu5wnFeRoEMmvTM=;
        b=TCh5ZrYbosNBaWPkEdRc4E7HWWkS93cHOvQ84jNyjfBGG0C0IGiypgKWsbSzjy0Hps
         PB42xjnH26q1jpYHv44EPJmh5L5XouXG9qtG/vyv3OZ9YGUH2mJ5YWunO8tstOToRtLi
         u3X6+dJ99/4lo7rcG24Ox9RnzKEKwbO0t99bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686833223; x=1689425223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itudLqBuU16pVuKikNT/VxGwCmMydu5wnFeRoEMmvTM=;
        b=l5sX9/MZuBeUoCT9RvuYa4sUTZbPzpaV8vQfKvQAp8ABKmgQbUrcwgUKUQL5HsaA3e
         CGyAz4pKL5wEcQEzdxLTqSSOJH0OXc1QdKj7BIz1WOA1hzjgS0WFUMfHRXMZJ0aTM/9z
         tqaELUW/kLgVgR6UJ9+BlpxC0BiQhc8ABLr4CqJyCeCr/3B8UDtqFh1YyentOaKYDhD7
         K4YmEKFHWXzxfQl+o+OTW22+VDFuOd1+/O2GCU3VDyp7ii8BubXqRuseZrv+S88ydT6f
         cwVRja0jjhkyrnMRkId5MM9H0OI027naq1NBZQSzYzVOtJuwk33J19Iz4ez8Hr7CbCPo
         FhEw==
X-Gm-Message-State: AC+VfDwuN3Lsf+Sk4Nr/XWI1umjrsDXObNr2k6qf6Cza+3IR7sh2aNx3
	e86SGcWrI5JSGjQs14xM+EiXxw==
X-Google-Smtp-Source: ACHHUZ6NKsBKBQnO1mWr1n8BhJwQx00MEz7MUzV24GOI/UndEaYzVcA64j56amdgIOT9zIMN+MgMzQ==
X-Received: by 2002:a1c:7713:0:b0:3f6:2a6:e2c with SMTP id t19-20020a1c7713000000b003f602a60e2cmr13144055wmi.9.1686833223207;
        Thu, 15 Jun 2023 05:47:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1? ([2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1])
        by smtp.gmail.com with ESMTPSA id l17-20020a1ced11000000b003f810be0231sm16747085wmh.32.2023.06.15.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:47:02 -0700 (PDT)
Message-ID: <1e1f24ae6c40daf2016a7e129cc211b9f1ddb71c.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v5 1/2] cve-check: add option to add additional
 patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: andrej.valek@siemens.com, openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Date: Thu, 15 Jun 2023 13:47:01 +0100
In-Reply-To: <20230612115743.52686-2-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230612115743.52686-2-andrej.valek@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182855

On Mon, 2023-06-12 at 13:57 +0200, Andrej Valek via
lists.openembedded.org wrote:
> - Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_DETAIL] +
> [CVE_STATUS_DESCRIPTION] to be more flexible. CVE_STATUS should
> contain flag for each CVE with accepted values "Ignored", "Patched"
> or "Unpatched". It allows to add a status for each CVEs.
> - Optional CVE_STATUS_DEATAIL flag variable may contain a detailed
> status. Possible options for each status:
> - Patched
>  - fixed-version, backported-patch, cpe-stable-backport or other
> - Unpatched
>  - vulnerable-investigating or other
> - Ignored
>  - cpe-incorrect, not-applicable-platform, upstream-wontfix
>    not-applicable-config, not-affected or other
> - Optional CVE_STATUS_DESCRIPTION flag variable may contain a reason
> why the CVE status was used. Both optionals will be added in csv/json
> report like a new "detail" an "description" entries
> - Settings the same status and reason for multiple CVEs is possible
> via CVE_STATUS_GROUPS variable.
> - All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
> value "Ignored" like a fallback.
>=20
> Examples of usage:
> CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Patched" or "Unpatched"
> CVE_STATUS[CVE-1234-0002] =3D "Ignored"
> CVE_STATUS_DETAIL[CVE-1234-0002] =3D "not-applicable-platform"
> CVE_STATUS_DESCRIPTION[CVE-1234-0002] =3D "Issue only applies on Windows"
>=20
> CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
> CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0002"
> CVE_STATUS_WIN[status] =3D "Ignored"
> CVE_STATUS_DETAIL[detail] =3D "not-applicable-platform"
> CVE_STATUS_WIN[description] =3D "Issue only applies on Windows"
>=20
> CVE_STATUS_PATCHED =3D "CVE-1234-0003 CVE-1234-0004"
> CVE_STATUS_PATCHED[status] =3D "Patched"
> CVE_STATUS_DETAIL[detail] =3D "fixed-version"
> CVE_STATUS_PATCHED[description] =3D "Fixed externally"
>=20
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/classes/cve-check.bbclass | 89 +++++++++++++++++++++++++++++-----
>  meta/lib/oe/cve_check.py       |  6 +++
>  2 files changed, 83 insertions(+), 12 deletions(-)

I'm afraid I really don't like this :(. Why?:

* we now have three different pieces of information, "status", "detail"
and "description" when we should only need two

* this needs a group mapping mechanism which is confusing above

* the information is spread over multiple differently named variables

* two pieces of the status information are connected in a hardcoded way

As a counter proposal, consider:

CVE_STATUS[CVE-1234-0001] =3D "not-applicable-platform: Issue only applies =
on Windows"
CVE_STATUS[CVE-1234-0002] =3D "not-applicable-platform: Issue only applies =
on Windows"
CVE_STATUS[CVE-1234-0003] =3D "fixed-version: Fixed externally"
CVE_STATUS[CVE-1234-0004] =3D "fixed-version: Fixed externally"

CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"

which conveys the same information with a slight bit of copy/paste but
not at a level I'd lose sleep over. To me it is a lot more readable.

Thoughts?

Cheers,

Richard



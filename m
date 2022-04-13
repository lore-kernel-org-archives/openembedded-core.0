Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E579C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.1052.1649812898466970335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 18:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fzWop+JT;
 spf=pass (domain: linaro.org, ip: 209.85.217.50,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f50.google.com with SMTP id j16so280905vsv.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 18:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r3b6Ciqm+LcTdrlt5KJL9AKTej92H5B3UPIQi1A5i14=;
        b=fzWop+JTRRRMjJFs8qvbnAqs3KNzYxVCl4Ssk8MGq5iY/Z6nv4eILWpVjpFN37KEK5
         A3rEuOQ7EOitIx1WzpdEyYWXo/EKs7rod8HBP7u012dlZptTqbb+9wyOfvz7OtjD5VaA
         Zy6ndAzgYrMOTx3JLAg7Eet0oGy+iGFbbD3PEJK+V/E0FHiAEiOxFuMIypvd6rLs6fa6
         WFlxrLIX3WEyceIdC6LH8JvF1NdW1gYKWortS25yF4AQ5f1o+WvGtOaUruPB3CiR8MFu
         4aJp/dbIhVOP2sYe2BZMZqMDX/ouzolhQSau/x2y/K9V8pa6aFdJZwBeQC5S31GMpLYW
         J6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r3b6Ciqm+LcTdrlt5KJL9AKTej92H5B3UPIQi1A5i14=;
        b=yu5GrwhZMIX0TGeWtg3H7w5GlhTF+0N8KUj+vqndVMhvP22WWtgYXp1laUIt5r9Dkj
         bGY3j4Gcrzedc0B3ISJPOnrClnH7t8HAvZxMHUlXp+VjD32CP4NdA0qEllQaQqIGTs7o
         an5eCyDrpHItxPmjVWCqtM+pzu7Oi0fB3fS5prWXiuw/maa0tJZJ2Zy9oOdlfpaSnSIe
         IvxUOE69tQ10eMUqWn4ZsucAz8aG+1nVwqgP7rBoZWrdYwEHmlrw5+6V9kZRN6xJCh2W
         rXGLAANV0LLDPyTQuuPdq7sMfxM6hsCpqnatfo0rtILEkeu/InUKSSNJaRVq1y3sFeeL
         fh/g==
X-Gm-Message-State: AOAM532WHXov8dPN165yTmLcL9UovjqZ83WelOPO6+6u3SWORWVdRUuH
	C/JVYWtMEWRqzFf9JmoP/tf3P6tU2t71+gdCSMUqIQ==
X-Google-Smtp-Source: 
 ABdhPJxiPMm/r648WDnwv1EpEe0fAtCCTiOlZ95Atdg6f+senN9vzg5GvOPYz3ieTF2b/1S5JkLCxlmFMMJ5grsfowc=
X-Received: by 2002:a05:6102:3e21:b0:32a:ba4:debf with SMTP id
 j33-20020a0561023e2100b0032a0ba4debfmr1730943vsv.70.1649812897516; Tue, 12
 Apr 2022 18:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Tue, 12 Apr 2022 21:21:26 -0400
Message-ID: 
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164297

On Tue, Apr 12, 2022 at 5:49 PM Steve Sakoman <steve@sakoman.com> wrote:

> I added a debug option to the failing command and did another autobuilder run.
>
> You can see the output here:
>
> https://errors.yoctoproject.org/Errors/Details/654608/

Okay, same error, "Hash Sum mismatch". And if I squint between all the
URL-encoding, I can see the md5/sha1/sha256/sha512sum values.

The "apt update" command is doing the following:
- fetch the file called "Release"
- fetch the file called "Packages.gz" --> error occurs here

Looking inside the Release file, it is plain text, and contains the
md5/sha1/sha256/sha512 sums of both Packages and Packages.gz (and also
the first two lines of Release).

Manually checking each of those sums reveals an inconsistency: all the
sha256 values inside Release are incorrect, while all the other
md1/sha1/sha512 values are correct.

And when we look at the URL-encoded debug info... the sha256 value is
the correct one for Packages.gz (as computed manually). However it
does not match the (incorrect) value within the Release file. Thus it
seems apt-get is justified when it complains about "Hash Sum
mismatch".

Going back to my Ubuntu system, and looking at the generated Release
file... all the checksums are correct, including the sha256sum.

So I am now looking into how Release file gets generated... as the
problem appears to be there... and it happens on Fedora but not
Ubuntu.

One additional point to add: on the same Fedora 35 system, I did a
full rebuild *without* with xz/gzip CVE fixes, and the apt failure
still occurs. To be certain, I nuked cache, sstate-cache and tmp (so
basically the entire build directory) and the rebuild took several
hours.

Ralph


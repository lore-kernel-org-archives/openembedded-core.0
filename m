Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D73BC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 08:14:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.45952.1739175272755879322
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 00:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=khKoKFkP;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54504a6955aso1551408e87.2
        for <Openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 00:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739175271; x=1739780071; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgFLH1QMalx9nR9Xk25X1UUFXerQSk5/I3jWylDRxl0=;
        b=khKoKFkPhh0N/aXlWLv9S01d293e3cOtnK3YrAZs9tpHdfI+yFpp9TJ7hzhkQ+xcgP
         XiQth17YtRo4OvzmcsK2gyIgXH3tYT326NPaTqiLF7Cd7I32Tp69/B+2QT6YSP9ZF+Vm
         OwaLeFMWFO6i+v714CmewSFWywFUhSlaSmfUWUiA+vudRqy1BGmEtuciR97L5HqbTpUr
         lIUagV6XNYzAlOx5C0lMSs2tLOEz8Hqvgqmnt04wYJ6mPU8wHlExgr2UkPRqKGoQ+xsk
         fHcTwqe9MdYl3Q/sKPBdOtv7LLzfZlidT9Zl071tJJo9LGLh91hA4SST/NQt42q18L1t
         cRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739175271; x=1739780071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgFLH1QMalx9nR9Xk25X1UUFXerQSk5/I3jWylDRxl0=;
        b=QWeTpA1lbUbapQSCtfqxCQtDHefbLqqtmXCJHXSIKv1SXblWRmUUOR+Ss4qcA/ThkD
         vTSmiSVjTv+29BJIL1qmrT3kYkuBiPn/KnPRuZivxjQ/oAgiX8rt/g+60/5LGWZlhAMp
         fuAGBVslaTN0w053aOfc7GVF/6rxtquHt4Ca6sI01QUi4ggiqi3tKZPFrR4QP6V3/wFX
         /tnqCimI7g6fMB5gCyjJA/Wh6kKx8NlPCEI+AXrww6z72Jcjn4OkjV6Ld3jbM5dN02BO
         9iAG67ZAwDsnYp/9JovwOAfPxLnqeaBY6HjI+jlwglXnqCbgU6dFam9NHIfq0MtuQDls
         HVTA==
X-Forwarded-Encrypted: i=1; AJvYcCVj24Wk4zDvRIDjqO4/mF+VWVfp2UqIc7U9dsENT70lb730yhPJGlZTwe4nE/IqFMBsWMUL97TZCxfa4K6bstUmwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7PlycxPgqsZ7u6Pt5uQjbl28kb/k/XFQBfSt5arn+H4JtfEPs
	hnIr4LeAKORa0YJeAkjKJT4Xbu6/7r4dLzbjGkc/ktIjyERCx6y7HjiJuMhb9KQ=
X-Gm-Gg: ASbGncuhxMjZXTLZzpaiJ6CXSLDYwMIe37D8akV5SZabq2JeoTQbWzIGH41eyiT5bdN
	lMzqwkChRvzmOc2YBxpOf3bsTODqP6a4mlSBZ59kozvcxnJXjL7oGd/VULTerR9oBT0d6i5rlpR
	iSPM332wLPkUrFcM7ijJnIbdqJF7iXF74mYZOS7LUDocDR/OTpCyZT6wcVT/CJrXooSZPK4/Kg+
	maRlnXLGYmrzyiftJTlj9sWz33kquIIZ+KgSwHh/Sg8GHVy95YjOFFHaW9+SvAVdhAB+kWagpNS
	nDAFnt+nw8FtB3Uy8tqR+tJaof1SfzIJsdMZm7ve
X-Google-Smtp-Source: AGHT+IFNAEVuRcZEoB9nl7K86KwyiNimtLACpAjxKJC3KnwHFMH2Im50+IKVy7G8A2LOhUYUU6gdoA==
X-Received: by 2002:a05:6512:2389:b0:544:e61:a1f1 with SMTP id 2adb3069b0e04-54414a9d026mr4008171e87.14.1739175270578;
        Mon, 10 Feb 2025 00:14:30 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544106040b4sm1172254e87.226.2025.02.10.00.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:14:28 -0800 (PST)
Date: Mon, 10 Feb 2025 10:14:25 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: uvv.mail@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] systemd: Build the systemctl executable
Message-ID: <Z6m1YdpNtlNbMekB@nuoska>
References: <20250207071043.96282-1-uvv.mail@gmail.com>
 <26132cfd426a1494d8c42c1f8d1b6fbd347ee353.camel@linuxfoundation.org>
 <1949d535-d442-476f-85b6-55b018c4057c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1949d535-d442-476f-85b6-55b018c4057c@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211079

Hi,

On Mon, Feb 10, 2025 at 09:07:57AM +0100, Vyacheslav Yurkov via lists.openembedded.org wrote:
> On 08.02.2025 19:34, Richard Purdie wrote:
> > On Fri, 2025-02-07 at 08:10 +0100, Vyacheslav Yurkov via lists.openembedded.org wrote:
> > > From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > > 
> > > Instead of the python re-implementation build the actual systemctl from
> > > the systemd source tree. The python script was used when systemd didn't
> > > provide an option to build individual executables. It is possible in the
> > > meantime, so instead of always adapting the script when there's a new
> > > functionality, we simply use upstream implementation.
> > > 
> > > License-Update: Base recipe is used
> > > 
> > > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > > ---
> > >  �.../systemd/systemd-systemctl-native.bb������ |� 23 +-
> > >  �...-meson-add-install-tag-for-systemctl.patch |� 25 ++
> > >  �...2-meson-Bypass-certain-config-checks.patch |� 64 +++
> > >  �.../systemd/systemd-systemctl/systemctl������ | 366 ------------------
> > >  �4 files changed, 100 insertions(+), 378 deletions(-)
> > >  �create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
> > >  �create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0002-meson-Bypass-certain-config-checks.patch
> > >  �delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
> > Unfortunately this showed circular dependency errors in testing:
> > 
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/76/builds/933
> > 
> > Cheers,
> > 
> > Richard
> 
> I believe the failure comes from util-linux. Any idea how to "inherit"
> conditionally only for target builds? (without creating a separate native
> recipe).

Set a variable conditionally and use that with "inherit".

FOO = ""
FOO:class-target = "bar"

inherit ${FOO}

Cheers,

-Mikko


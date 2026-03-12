Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEBE1067036
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:12:51 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22497.1773324761989120747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=irsdfjhz;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64c97997b0fso870433d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773324761; cv=none;
        d=google.com; s=arc-20240605;
        b=Zre6hsBvMY61bmgbYThset7JHi1EhDQ8Xswy59FY8su4ULEaAFnd+WSz3V5HO5nWS/
         0Xlz7YCdqV36vfiXV1g9dKQBX+0n3apgaRwnv14PeinHIAynBYidpc+368sDjQI2iBbJ
         AJ30qSeTvO/j0dzjomPCa4SPSn2KE2oC0b2fdZKj3iE3+jxmZqnsvmzBYoW/02mysC9M
         9LCdiPuSrPNNjOjE95fFFSj/WqiLuLY1GxSenh6bogHeK/VZDe/DQcVC96JSH7JKXXRH
         t4/x8pC0Ismzx4X/HTypduOvzrLD2yf9VpVFtQPa3GtRTdc0O5DtbjLaxT7T9C+sP6fw
         f+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QMGTCOlamV2hgvHcWEE5NyfQqNVEVGfWlYcFIXHOloQ=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=Lkz3IvKbXRvDHY9WYcq90NfoBHsj1wTii+rdndKDYExSgI25ZOWVXphD7QK2wmtuGN
         T5K7K6GQ3E7I6Jm1aProG4/UkJTm6uFcY8mF1LOIdbj8ftj+0kes9/ybTU2WBe/cRQE/
         krHWUiCyFRmPmAn1g8HqNm+FkpdomamtGISvg6Vry2utiIYajeo/lZ5sHxb0MLv/qTSK
         yXhuA2IT8zLPHkepTrA/PsypU3ctyJ+HX7+W8HcJy0okDrJRqGveGKOHVz2lDdtxqEyA
         6lqTHctGH+OGcMx2uif8eL4MeZk4wWsmJCtqgpbDBvCsVw2H27ERUlWSDkxmzxqCB3Vr
         0OKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773324761; x=1773929561; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMGTCOlamV2hgvHcWEE5NyfQqNVEVGfWlYcFIXHOloQ=;
        b=irsdfjhzAEmrvfsjTXATnQ7R/6Vo4v0jrHHpN46S7Xr+JZn8Jyxokj5mlqopuvHO+C
         +J6rjyG4LqhFKPWnAAD3sDmoKniuQFIJ4jLdRPVUKMXBYfR4PuJ6x/QRFmGLUotHlfDI
         c8tZphn6MA1AS65aIg3lUgtTbbPmUUhzhTNtCD/UhxSL0zQhJxSTYTguV/jBxnusL7lZ
         KgpYAHQTegn2JExZ96GeDnbrmI0rhViNZMiDzkCNln2P5qGtbV6ygJZhoc7pyPUiBZ2N
         EW1GYHCDBAp8xLLi5OEYgsphMkq+UkxdN3pdNbh850OG8sX2izT0GsTux/9YOMcJ9XfH
         VXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324761; x=1773929561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QMGTCOlamV2hgvHcWEE5NyfQqNVEVGfWlYcFIXHOloQ=;
        b=XE5V8ubmr11bst/rToXQS5R0joGlyD24vtZvJjuxmr0w+qV9e/TbLEcYJ2BDnahBDa
         0gdYYLQbqaPqXIgARejlctj2pCIccVmY+EXqPRAewYOndZzUIqQF6XcuZUp0U+SB69XN
         Fa6wW6+3e4hnkSmUmoCyLATy0JfN5VU8cakREc1vXmaBZY35eb63RvCNg5PYbDFb80MN
         TgIe5zpBMHrNbaBRUHx7iriAmUYPHYWUhscpYE2DKROfX9YfXliGq2iuGQyTipo7EiRm
         0Hq4CJh8nmZl2vCaf5uP/UAzGpE2Jo2XAawLQ/TZ2UieFlX5ZgmiPbAq+A2wL9MRiYFL
         YK9Q==
X-Gm-Message-State: AOJu0Yx0+3swXVtLDqPskGLHjG5FuhkHIkhmP9iKL2J36xdURBgcBXp9
	cUbzazCgH45U/mDPCnEUq5YJocehCcu6BJg+if69BW8qTEW+e7GqzidEV6iSkAvEh8QL/yjsgE2
	MNntFU8Dht0pdY1QDtwgf4lFl14DP+/stSA==
X-Gm-Gg: ATEYQzxlp8hTsozTHbWfNAloSZ6F/+YbQc4txwkuRplpnCTu3frwFVL1TM5mUD8ZXTK
	6tkEdwKM1VNRWdF/mGkVyS0Lp3dnk2Ntnj7QbtXsokK8SDXiAMxGcqGWYBF8BrHdHx2guX8WOch
	SJudC3fJUukMJsRhx581ojUyY8unJEAIHlZn8hE6yhHQza6vGTAnNOz4IvQKZocasrbaf/AroGc
	u3uf0ARHAo3qxLS3htgPGmOQNA1aWfGLIbTXDY1Fpkm88+2UN6qw33tcsY4ip1zYpwXMRLCSedt
	n45K8/dF/ODmpNTeJXpy+Q==
X-Received: by 2002:a05:690e:118e:b0:64c:ed48:dc8c with SMTP id
 956f58d0204a3-64d658a7c32mr6352290d50.89.1773324761065; Thu, 12 Mar 2026
 07:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-5-JPEWhacker@gmail.com>
 <3e79cdb1a950e22ceba17475844843bcc02cf680.camel@linuxfoundation.org>
In-Reply-To: <3e79cdb1a950e22ceba17475844843bcc02cf680.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 08:12:29 -0600
X-Gm-Features: AaiRm53PFKFqTP1AakK7KNvS58RQff_HNVMqtexFneTAFJRlIbR0-fFpaoTrwqM
Message-ID: <CAJdd5GY8LTEvU9mJqa+V9RKyZomnXHPpRaqAWngG50RkXuP0Ow@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 04/15] spdx3: Add recipe SBoM task
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232969

On Thu, Mar 12, 2026 at 5:50=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org=
 wrote:
> > Adds a task that will create the complete recipe-level SBoM for a given
> > target recipe, following all dependencies. For example:
> >
> > ```
> > bitbake -c create_recipe_sbom zstd
> > ```
> >
> > Would produce the complete recipe SBoM for the zstd recipe, include all
> > build time dependencies (recursively).
> >
> > The complete SBoM for all (target) recipes can be built with:
> >
> > ```
> > bitbake -c create_recipe_sbom meta-world-recipe-sbom
> > ```
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>
> With this change I got a bit confused as it wasn't obvious which task
> you'd run just looking at the meta-world-recipe-sbom recipe.
>
> Should that recipe do something like:
>
> addtask create_recipe_sbom before do_build
>
> so that the recipe actually triggers the thing which it is there for?

Yes

>
> Cheers,
>
> Richard


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A191DCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:18:08 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33348.1779358686758594557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ash2kGJ5;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9144163319fso543937985a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 03:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779358686; cv=none;
        d=google.com; s=arc-20240605;
        b=gLVbIhjH+VE/8BQMSPoO8rcZfu/w7+ja37f/Rav88cxhRhGgce+IXh9TV/+XJyUwo8
         SwUYIqB4lfzPFXdXnS7le4XiVjQVOgcLdWT0G6KqUn8ANYJrCMTGbyKScVIAEfM1oSGw
         fiRcvAviLdVpKdWe0cj6SEP1VqryFhe46uBjw8/mwgvm29CuzJSmDtu8miegvQYNc916
         HzEXXQBaMzBQbJZ+ksFKBJdS+eIdXVBQKpLdgV1AX+9IBJZ0Mmw6hGSWKTzhdveVCwvV
         YugdA+BjJyicxuUE4sxoP3J80Kcp42cDoAFXYJkKbUoHCvT0bETz9I5LQgvE/VoOx8+q
         tMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W5kw6vQYUx5Qstwe3+TdiyEWPvd8XoRTn8DK3DVOeCo=;
        fh=rzuZt43ugKt/9TXWRdHW706tndUsIxAawErjlWEgkLE=;
        b=J3Z6WaZDCoTh1OPvox1N2f54ZD8XNjEiYXsDDGSUfumwfEaBzikMESTMeWnJVuuKvh
         T0uuTBG+O8pMDWRDQGGi7iG/4iWLrm3ruixZbCQshCmUz2V+1Z0tGdNt4hJbZGVEYZkN
         N5OX/moElgwf5YlblEsebtEtDzCuAvbLVPbP2REBb5IbMOZ+t2tgnk31uYweC1pOh/v+
         L2EdwiqR1293OvZbMlQ0Bwd89HOxZiWagOYy+K3CCD1LEsz8YwC8bckZifZeuB6JImNZ
         W/ZO6Myv4ThZxRj+WNLVMtpO/BkZrx1GO+fgF4YLP8ZvoeAvpg0HOIxomuex3qaH+EmB
         IZAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779358686; x=1779963486; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W5kw6vQYUx5Qstwe3+TdiyEWPvd8XoRTn8DK3DVOeCo=;
        b=Ash2kGJ5Qk3DE5i0qPl5RurlVSRW9uN/Qw3yn6JjaFCI/dooHcYyviBU1x7ZV2cT9J
         mIix06i7PKaPkjVXzzZBIaZ0fLYt3cxbqP6JYvAbaMfnSalp5YQx9IBkfb3mM5Y8mh94
         fL3ePI0xV4plOBwMYbnxOKyqmW0s0OkNitrA/J24862I8HR0MXz0mkiHOa0kXQX+5NuR
         oT/Up2SwUqIoBRJf7F66v1c/biq3hQ72Tl+8nu+4PxBv7K5QrUslHH0AwJVdnqRvf/MF
         oCsX2Ue0xGhuzp8dkFdClACOIOJmJLMK5kmMPS6NnRR9WQAVppKGSI2cfKBLmV9EHKzK
         rtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358686; x=1779963486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5kw6vQYUx5Qstwe3+TdiyEWPvd8XoRTn8DK3DVOeCo=;
        b=Tv13R2o5N4eHeq07XyAnrDMuqJirXHDhOAb999djlVFLBBxylVwofDsRixejMArHqz
         f7gtsFYtxqflqyPFqoudOk1Z8QcF1AOgO/XX3gdM2T2/W7HW+f390HHgrvwH3DGvwuXy
         FQqcKs2RKdD4KrW42ErWZlJxECCxYUQttjkgHy0bXTAEdRCZlKPz+KBTRb0Ux5GggigN
         G16od05lBKskXA5fk1ZFZ9d0bdkQ0J0ZBDyH+hpVMR7YWuySp2SPjuAGucagVbZKHOhS
         sAhrqXXN1MFjTq5+gJp4tVBa9LIJT0vLk3C/Q4jLsBXsj15pRfUDhxXzYR8157xKOPj5
         q4Rg==
X-Gm-Message-State: AOJu0YyEvvMaJaG770khi7SHgxAmI7dnYC5983LfWTHNTfXKeuZRIjLT
	DnOZPe387lW6PpgiKpaY3Kp4TjKy5mb0gciZymP1Y//jCjhOTYatcLIehbuWP8GXRdxEorcyzRh
	do146+ozx8ebvOujIJUrHd0huU8YakTE=
X-Gm-Gg: Acq92OFp5CBJTjgyg4RQbrUK/flQYwDd7kcFH13XUauJRhWXDFfmkiwMP2g3K3n4F0Q
	MBmMyOde74zEX99qDF/Iz4iAJ75mFi3iSbAL1KpAMvrQ6BYfL8yue5rJmfuP5+KLrtH4ni1FrON
	iDEUEdps0sc4fy6y3VYISU2UEqitEjhSGdbcEewpfNy4/D8y9UZ6o0HKZgjdtTm+T/SIkIFq41L
	mwTBjm8zOmrwy+pyO5bkpmb14vq0j43HB9FKhIvZoNBwYusUAE9sUsR1m7hUnv35tS7zVp1ITr8
	GCfM2+B2jhcPt9NQZ8ZblAWviVdcBSr0JXTzlCa9DA==
X-Received: by 2002:a05:620a:2586:b0:8cf:d5f3:9a1a with SMTP id
 af79cd13be357-914a2d2e0cemr261827385a.51.1779358685704; Thu, 21 May 2026
 03:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260518135925.2579226-1-daniel.turull@ericsson.com>
In-Reply-To: <20260518135925.2579226-1-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 May 2026 12:17:54 +0200
X-Gm-Features: AVHnY4JHxgp2x14A7gk8NZU-SbW5XW3MPKhE9Jyr0kcc4JK_9NFYbdYIzZ1evhw
Message-ID: <CANNYZj_b1FwJ888KMGpMSvBHQTWw6ns_M83Z3hn5WQHbi-_WCQ@mail.gmail.com>
Subject: Re: [PATCH v4] devtool: upgrade: extract changelog between versions
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, ticotimo@gmail.com, 
	Tim Orling <tim.orling@konsulko.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237498

On Mon, 18 May 2026 at 15:59, <daniel.turull@ericsson.com> wrote:
> Output is written to workspace/changelogs/<pn>.txt and cleaned up on
> devtool reset. This allows AUH and other tools to pick up the changelog
> without implementing their own extraction logic.

The patch review pointed out that this has been tested on a small
handful of recipes, but before the change gets accepted, we really
need to perform an industrial-strength set of upgrades with it, e.g. a
typical AUH run on all of oe-core (possibly rolled back in time to
include even more recipes), and then shake out all corner cases,
unexpected fails, and pathological changelogs. I was going to make
that run, then I realized that the companion patch for AUH has not yet
been posted. Can you make that please?

Alex


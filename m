Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.22155.1600262811695248949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JbjzgSU8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t10so6960476wrv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=T++0GWXJiTwNbjfyz7fhlE0kxfiNPL4MiCow/F6AYXc=;
        b=JbjzgSU8qd5UIZHKc9fPjOO5YJkY9DGY/4fMo8w8CZTYtBH0CkDorJpGb9U0F0+Bv4
         sduCWPGTpu1Zdc5uwfLoA9OZ9osN+NUS1mtk0GUJtGEyZFxCAL+ij9rh/levE2R9aEJ/
         lXsyFvcGcIHyvgL9LEGWh8ZdBY7c6kFTr9jDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T++0GWXJiTwNbjfyz7fhlE0kxfiNPL4MiCow/F6AYXc=;
        b=ZUXn6l8mcScoDPDsaCAoXre0K2kVmj2Bvmn8rbPMRGWGSh+fsmP3gbMEtX1iXm4+3j
         yC6pNcWo3NMfqZGUZ8YqQ0rfQJaPiN+IfqgUCr48krmpZJ1MPpL+6Tflgmyl8P0yU+sK
         /wXfHIWsqwh7O+sZ5agbh22j+gIZXx8vWo7sLrnZYoUH5ZNtxA4jaT5LoUDb+JbGAkhn
         XP705sKLnhEnrOCwTY6idAY+j2oVwN8iidtG/VJFN8MWa8v6RH/bMEv+7/ZNpjS4IctH
         v/XZ06TtOKruJoJyLSruF87Kp4L6a+fNHcXvIidIRW2dBsH17e/1FiatU5SKhz6O69j1
         uatQ==
X-Gm-Message-State: AOAM5326NxR+Z7zJMkOk4zXuNGmRcfahllhsxHRPmbBJMLffWAqFiotV
	QLO4pfBETZ4sGRIwdmU9SVIYHw==
X-Google-Smtp-Source: ABdhPJxqT8fCwJm3TGQeWFZfwSnGEUy5tqLKX/7VQXqwkF95PjltGt2oKo7w8HTyxzp5S8zDej7bTw==
X-Received: by 2002:adf:f50a:: with SMTP id q10mr26573734wro.319.1600262809984;
        Wed, 16 Sep 2020 06:26:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:532:7978:4951:c36c])
        by smtp.gmail.com with ESMTPSA id h16sm35093596wre.87.2020.09.16.06.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:26:47 -0700 (PDT)
Message-ID: <8c3f76c48201397cc3f90fa89cda85a4fa739b76.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2020 14:26:46 +0100
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-14 at 11:13 -0400, Jon Mason wrote:
> There is a large number of Arm Tune files located in
> meta/conf/machine/include/, and to support the current and upcoming Arm
> cores, more are needed.  Adding more files is simply going to make it
> harder to find the relevant ones for an OE/YP developer/user.  Also,
> there are problems with stale and erroneous configs (see my previous
> series), which will only be exacerbated by having more files.
> 
> I am proposing a reorganization of the existing tune files by including
> them in the generic family include file.  For example, the
> tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> tune-cortexa57.inc would be moved into arch-armv8a.inc.  This reduces
> the number of files from 12 to 2 for ARMv8a, and that is excluding the
> 13 I am adding in this series that would otherwise be unique files.
> 
> To use, simply add
> ...
> DEFAULTTUNE ?= "neoversen1"
> require conf/machine/include/arm/arch-armv8-2a.inc
> ...
> 
> Which is arguably what should be done anyway (instead of taking the
> default of the tune include file).
> See the qemuarm64 patch in the series for a working example.
> 
> Of course, by removing the existing tune files, current users are going
> to break.  A simple script can be written to use sed (or similar) to
> replace the relevant parts for those users that would be affected (at
> least for those that are in the layer index and update regularly).

I've just looked at this in a bit more details and I'm worried.

The intent is the BSP includes the processor/core tune file that its
based upon. The BSP should usually know which one is present.

That tune then presents the possible options which the BSPs selects
from but the end user or distro can override.

With this change, you get all tunes and you don't know which are
compatible with a given core/processor. I'm not sure that is an
improvement.

I appreciate not wanting "lots of files" but we need to consider the
usability too.

As others have mentioned, the errors are fairly obvious with diff
between the files (or a GUI like meld).

What are the advantages this brings other than fewer files? Am I
missing something?

Cheers,

Richard




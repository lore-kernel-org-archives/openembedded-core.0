Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C3DC27FCDC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:48:26 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id t129so39974749qke.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CAhYaD2pZ7CyJzIqL4j4sgwIGQMmsyebDERFRHMIhSQ=;
	b=pe/kALhT6PZM2i4LjK2TF75gC2qjRN/S/AkAqvZIPjUey0XSjxr/uw6vzWHlMFJBih
	dJhftMjYeXPgjw4aVvwpfcz0bZTfHq6p/xFulDVZjm/rMd3GQ/cSgXp6zOSTdPIGx8gu
	l+Rp6eARuhMzIgH4vpWCB+k45u5NtXs+9s5uM7YVHEjoP+QYoH1tvulJCk3oYMkm92a0
	JoaXCvNSdhx4YThGYiuuXHOMcn+BOjKiiXJX8zja9TTrD0tf5/lolp1V8YRElnNb78zk
	7VBETOcvAFsTkvSyjoxqf3bjJUwQhgl4s8XmewInv3UbFdWBnSYxlQ3G7U5wclchj/EO
	ZvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CAhYaD2pZ7CyJzIqL4j4sgwIGQMmsyebDERFRHMIhSQ=;
	b=GYfjEIms9iRz5Gxcae8j1IbT2pjPz7GBNE+7Ti9zWVCOB0/6HVBjZz3tfJTpX2w1K2
	jE5FjIn/ot3xXxXLh39XGdvmc84cWGXt9jXTaEYKAEXqhoyJrd/O2pIV5Ikw5sXD/suu
	p3FmDNJk6xGEqYMQzg4aU26u+Hrp+9t7QTmm2fjA8yHg05MkPunLMsN105Mmplq73c40
	Cf/j2N9E6m8LjFswOpCHOoF1QBdnqoqD3j2OX+kaNIIZirFAt1K6K4iaFgXv4iQs4NsG
	Rgj7m+80157rhIaJ/Z149IUjp9eAjCQlt81V923kd1j6hwxZu3INKXBHg9fCrHALB0fn
	OcBg==
X-Gm-Message-State: APjAAAVa3SsuXcCvK74skX/PJiTt8k9QeZ0Ow9CsbppDfalni4EE0wpm
	p6zAl4XvFz9oosys8t7YibVzyoKmrB1Py4i9u9E=
X-Google-Smtp-Source: APXvYqzPCy9ocgFbTUlUS7PB/M1dyB/0/Wjm6KOPNNwgVuCYPOMx/c+RYQLKvKbbY0dQHVTvizyRXQpJJPSc/fpLdOI=
X-Received: by 2002:a37:de05:: with SMTP id h5mr85145349qkj.474.1578329306696; 
	Mon, 06 Jan 2020 08:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20191229184415.19514-1-raj.khem@gmail.com>
	<20191229184415.19514-2-raj.khem@gmail.com>
	<5d240df6-2d13-ed5e-ae9b-fbf2c45d5e66@intel.com>
In-Reply-To: <5d240df6-2d13-ed5e-ae9b-fbf2c45d5e66@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jan 2020 08:48:00 -0800
Message-ID: <CAMKF1sqRTirm2PMZKsFKcij0S2k8mY7UDvgFEyMCqMjhFWo2Lw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/19] systemd: Fix time_t size assumptions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2020 16:48:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 6, 2020 at 3:25 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 29/12/2019 18:43, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   ...ead-of-TIME_T_MAX-for-timerfd_settim.patch | 31 +++++++++++++++++++
> >   meta/recipes-core/systemd/systemd_243.2.bb    |  1 +
> >   2 files changed, 32 insertions(+)
> >   create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
> > new file mode 100644
> > index 0000000000..76a1c7364d
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
> > @@ -0,0 +1,31 @@
> > +From 6bcf562bd1e541c7aa46923d9a14201c7f785261 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 16 Dec 2019 12:49:07 -0800
> > +Subject: [PATCH] Use INT_MAX instead of TIME_T_MAX for timerfd_settime timeout
> > +
> > +kernel prior to 64bit time_t support might not entertain such large
> > +timeout therefore reduce it to INT_MAX which would set timer expiration
> > +event after 68 years of uptime, should be good for all practical
> > +purposes
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Missing Upstream-Status.  Have you send or discussed this upstream?
>

I had it on list of things to open pulls for haven't done yet. Thanks
for reminding me.

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


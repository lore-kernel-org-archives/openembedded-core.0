Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5467DC5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:14:02 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id v141so1034020vsc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FXCXetdTSZFZgVw4teQheTCfe2KuICdONA6l2TnME9w=;
	b=fKS5nz4KGdf3KxsiDtd0XARK2Lq5MgtMFOo48nG+OG1KsMfNH9mprxzVAFpl6V0At8
	qhyWgE2zvUPFmLa8ZYIvv4svYJyVz37pF7ifFC5au6a/oJyithjHvVelkO9T84EcLNWI
	H5D0i7s2zx/MB4DkVY+n7wezqBM06bGxBDwWB9RC6BN3J0nZOkLHaf3JP+C6aWJfGapH
	JIXbP1o0F9FkNTGGmpu8+yPmrho0KJ9xR5amle7/47ygDYmariZ8bepCU/cXUPnbdqIH
	DGZ4bTB7h4Lv/5CGt6xEXSrUoI3CIdP0DBHqjBnfzXew4GAtnIroy3Y9ofs2/jwHnTMx
	u4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FXCXetdTSZFZgVw4teQheTCfe2KuICdONA6l2TnME9w=;
	b=D0wxwXyjL1C3EvMkKdZWM3oV2CY7KW9Sj3NluT7V5HkgDKM9pHD5eCuXWZX/kES/o7
	YvcEQ0Y3PymwvSqmRvZGNJMViWMCILnXTuWtKt2ZNPRdkdEtFabJf3KUmx+CfG60xmMp
	SgcojtWxs3FmfnTqRuzw+92kyETXuSFqG/oDFbDlWA0/s3DBwRU7ILDBgTAz2cufyDsZ
	ecEHeM0fiGGDGtOozErR+YqMrtM3Rj5fTW/B/gnaENKqOyCOnv93ZLIa+dQSs2EFulL3
	oEM+lYruMQ+0U8wQg9i/fI/Ii0+RTMX8C4996U9cCL6XyTeeWiCq/TbyrYe8SOjIMSLH
	YBXQ==
X-Gm-Message-State: APjAAAVNVbsAiVcbIxZZ76Pb5blpVDc0isO5hu7h2auVliwCkaG44FRx
	WYWwyavj3EGvaHe0qp8GpzRpvymEjZd6wWWovjqQIw==
X-Google-Smtp-Source: APXvYqyhswAnXiQ/MibN6uIye0Kcmtldd3lKGlt2EyAQ2t9pndf6tgtfbVlaieq7Q+ZdQCy4yFrFtTrXqMQVC/fKMsU=
X-Received: by 2002:a67:8755:: with SMTP id j82mr7219319vsd.197.1556626443182; 
	Tue, 30 Apr 2019 05:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
	<057307c5-9cd5-49d4-b73e-6bf9be16f710@www.fastmail.com>
In-Reply-To: <057307c5-9cd5-49d4-b73e-6bf9be16f710@www.fastmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 30 Apr 2019 13:13:51 +0100
Message-ID: <CAO5Uq5RTE1J6YVQLZ0zhsBHLi=m2fCxgq49mvdUkJJ3iorCQkA@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] Fix systemd service enables/move towards "stateless" configuration
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
X-List-Received-Date: Tue, 30 Apr 2019 12:14:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 1:08 PM Paul Barker <paul@betafive.co.uk> wrote:
>
> On Mon, 29 Apr 2019, at 15:44, Alex Kiernan wrote:
> > As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> > ("meson: stop creating enablement symlinks in /etc during
> > installation"), services such as systemd-networkd are no longer enabled
> > in images.
> >
>
> As an aside - is this systemd upgrade why on raspberrypi3 with master branches I recently have no console on tty1 and `/etc/systemd/system/getty.target.wants/getty@tty1.service` is missing?
>

I suspect so - certainly getty@ is one of the things that's was
touched in the upstream commit.

-- 
Alex Kiernan


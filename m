Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7B192608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 09:52:26 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id xa12so1923621pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=IOSiUrY2FhmwhaItE1QYp2qmYqLmfM78j/oTu3BFRHM=;
	b=efIh7DD4suf8E0YZX74CLDAveivx3PpEAJSk1b2OLXllZQCpBQL+jcRkRDIskBWMsk
	jUvqILq9pqs1dNXDiPpAifrptzAS4ujHaZ2tGaXeBiQPxaT3M/G0l0BCu0CImM3ZC/8Y
	pNFIxsg7aq8yBVRzBv6aoNSoPdhyv+zTPy+45Uqn4gxVejywRobA7rAhRhHq/EhZHsk5
	QmNylgyVukeXdU2tIPzYacvA9vbwtCvKsK3/fN5n/qzBOCWPaT97/qbUZCJaVjE5RVDP
	fBzOraIyBRB1/gqSFRzFCDz8+YpuyWpxv9d5JvnY8iJ3hJvEYuB+M5nIQLb8IcY97OQ0
	iOLQ==
X-Received: by 10.68.139.33 with SMTP id qv1mr12060118pbb.93.1369993947304;
	Fri, 31 May 2013 02:52:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 02:52:07 -0700 (PDT)
In-Reply-To: <CAJTo0LbQBvz81gxO1tKTG_TaNnA3jcpMDbB1tRqnhPF04otLfg@mail.gmail.com>
References: <cover.1369922325.git.ross.burton@intel.com>
	<373E49FF-E99D-446B-A4A5-F852FDCAEFCF@dominion.thruhere.net>
	<CAJTo0LbQBvz81gxO1tKTG_TaNnA3jcpMDbB1tRqnhPF04otLfg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 10:52:07 +0100
Message-ID: <CAJTo0LZjJhHrSEXmA==qGDgWbSRDdXQh0_ocwVsFb=wsyVPeTQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnGPxgm4K0hv+MhmMQBqvyqetM3BjUOyR71VGPWvMraYuRbHjiegEVCoyA6fAAilu9XNiEV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Mesa and Wayland updates
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
X-List-Received-Date: Fri, 31 May 2013 09:52:27 -0000
Content-Type: text/plain; charset=UTF-8

On 31 May 2013 10:30, Burton, Ross <ross.burton@intel.com> wrote:
>> At the time of writing that weston didn't support runtime detection or config files entries for selecting the backend, only commandline arguments. So whatever is getting picked at build time, you're stuck with that. Does 1.1.x address that situation?
>
> Sadly, not as far as I'm aware.  I have 1.1 in another branch but it
> totally broke GTK+ 3 applications (which didn't repaint after the
> initial creation), which is pretty sad.  Relevant developers harassed.

In a massive shock, the weston man page is actually useful.  Sadly
it's clear that the backend choice is either x11 if DISPLAY is set,
wayland-over-wayland if WAYLAND_DISPLAY is set, otherwise the command
line argument finally falling back to the "default" (drm out of the
box).

So if we want a single binary that supports both DRM and fbdev, then
we need to use command-line options.   I guess our startup script
should handle this and we can add another optional machine-specific
config file.

Ross


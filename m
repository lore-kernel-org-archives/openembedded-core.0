Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8YRH-0007vx-Sv
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 16:52:10 +0100
Received: by mail-vc0-f170.google.com with SMTP id p16so5878277vcq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 07:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=w3mUxDSRCi7Lf2vDOBLabm7VwROyEJg0sm00AkWtL+Q=;
	b=ImpyUgt4MhH81Bhx2NC29zsOBYYpxEPNNP4VgzKZMFdNkSdhZ7YX2FhsmRigPB7bIH
	+qX6qedLMTd4m+80RnmLuZjaB+RuR61V3qhtC4kcsOisy0czXy/99Tp/BLawTZ+TjhZl
	gGkFlR2yzUaBLPZWE+0jynF90cZG8pbp8oBrS81PY6pdmmLwvLjWwHtci9L83hrSwYam
	XZAICXgasaSWtbRY3aEqqzAiTm6aT0pj4xDl4nkrHKhIXYwIWlEBuE4CSgQn0Y4BJl/T
	oQKJdhEAr6spRcCyQ8VN7nKaqJOg+ci30ZqzdZ8OlXSBsFzUadp/L0R/Bno6l/RXLD1k
	YlJw==
X-Received: by 10.52.96.134 with SMTP id ds6mr27298816vdb.107.1361460950923;
	Thu, 21 Feb 2013 07:35:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Thu, 21 Feb 2013 07:35:30 -0800 (PST)
In-Reply-To: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Feb 2013 15:35:30 +0000
Message-ID: <CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkXmegY8l/LR0jDzWQSg6n9Qv1Yq4XOdq1Gh8VUOfta+NFgxLfvNkF51v89t5tn7yQOC2Ho
Subject: Re: RFE: make the init manager an image feature (again)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 15:52:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

This thread started sprawling, so I'll do my best to cover all the
points.  This is also mainly an attempt to get more information as to
how people are using init managers, as it's still not very clear what
people want beyond "choice".

"With recent systemd packaging change, the rescue image size grow up
from 5.9 MiB to 27 MiB because systemd dependencies are hardcoded in
mandatory packages."

This certainly can happen.  core-image-minimal-initramfs went from 19M
up to 35M if you turn on systemd with the (unmerged) busybox enabling
turned on.  Investigating this shows that the cause was busybox
recommending busybox-syslog which depends on systemd, which isn't
useful in the initramfs.  My branch adds busybox-syslog to
BAD_RECOMMENDS and it's back down to 19M.  This works as this image
has a custom /sbin/init so it doesn't use an init manager at all.

When people are building images with and without systemd, how are the
non-systemd images booting?  If sysvinit, what's the rationale for
this?  Will you consider switching to systemd for everything if the
disk increase was only a new MB, on the grounds of consistent booting
behaviour?  I can imagine many rescue or initramfs images are using a
custom /init, but as these don't/shouldn't actually have any daemons
installed this is practically a solved problem.

systemd as integrated is currently too big for very constrained
environments, and I'm not denying that.  Using this
core-image-minimal-initramfs as a test whilst pulling in systemd I've
been cleaning up spurious dependencies and have managed to trim around
4MB from the footprint, but there's massive low-hanging fruit like a
4MB /lib/udev/hwdb.d.  Rescue images likely don't need this, so we can
split it out and not always install it (now down to a 5MB footprint
compared to no init system).

One massive problem with making init system an image time choice with
packages is what happens when you have a feed with both pn-sysv and
pn-systemd packages in.  If after the initial construction you want to
install a daemon, you'll have to know to manually install the right
init package too.

Supporting multiple init systems in the same packaging would be
achievable, but would people who want this be happy with pulling the
systemd libraries into sysvinit images?  The alternative is that if
sysvinit and systemd are enabled we can't do any real systemd
enabling.   The good thing is that we could certainly make
systemd.bbclass inject a recommends instead of dependency on systemd
and add guards around the systemd calls, ditto for update-rcd.bbclass.

Regards,
Ross



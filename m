Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 904EF7DDA8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 08:38:00 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id r195so1205408vke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=R0iZJD/nSQmHUV7zv3GA7ceYHeW1G5Pbv5pPgFz1IhM=;
	b=iGkFQCCg1zNdeZqf+nv+XKN1Hj8A62ARz49rpVirjDL+vd301Ls0DfXxm7gA0SGWz9
	cQpY1NSuKTDdXHf7frZSwaTNLJ5JpMn348zw03gxsc+5HVedWzU3qkHeiEUbHYh4trey
	tX4eJpeiAliCA3/DSMQks1FFYa7in1mG/ePVHPm4Z8jl+pSzV1oDlawzd0zLfAFe8aqz
	hv3abI9cHGs8IwWSd+HqLRWL5jVdcxpLCRAz2/qKAyKhlVrKZn0j6kiOaNkAfhtaMpLW
	/YlwWs+jQq7ySjaSIK3Rf1+8hYuR+P9CTTp2Iaq2wOn+dNBqysasPAQgsWNPlmDcb04q
	Pxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=R0iZJD/nSQmHUV7zv3GA7ceYHeW1G5Pbv5pPgFz1IhM=;
	b=PecnqwRDCCCgSF8tUghSDna18FgHvSqvu6dLbHhvDBb9s8amMnzCOjI0bQ4DU38nVV
	UVwdNlBXyOVCKB+HeZyQgn5cF2IPRTgfX2+BNTaTMMiZyB8jN6jCoGZQNnScXqudwigz
	6+qpIEOU58yUKZ090h6ifCV5Q8bqhfz4mIxOAjGrJgCs+5FESqoNf0g6d1GTS9v2M9so
	rmsorTrBEblb9591DAXc7Cuocbduy1QWfSl+vDAWp5f+ohTnUTp/AMEj7Zk6wARCIVcv
	FXSykOCirxDcbBCpUL1GYTsXf9oc74TE0XmyZsOvTjE6jgRO6uFtTobDft3wGnA+Tvli
	tFyA==
X-Gm-Message-State: APjAAAWk62KS5aqRTpDx+AUs8XTlx1D0wRKb+RlLdQoghbTPgNbL9N5e
	nuNYfk4swu1jbTHwcaf7wyWDb7MzzcsddxcKti1po/yo
X-Google-Smtp-Source: APXvYqz+zSUOWWfZ0k1Pi8etDQQ6Nw3nA47sslcwFzmPbNf1I2PDM4x3PTNQSzWRvoeBz4xu+l3o++KsgP27gFRlNHg=
X-Received: by 2002:a1f:8708:: with SMTP id j8mr4579847vkd.64.1556872681175;
	Fri, 03 May 2019 01:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
In-Reply-To: <20190502210944.62696-1-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 3 May 2019 09:37:50 +0100
Message-ID: <CAO5Uq5RVB77ZMRvAwneGQ5KYSyPL_m-vhSf3YuQz4oN0VYqW3w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 0/6] systemd stateless configuration
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
X-List-Received-Date: Fri, 03 May 2019 08:38:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 2, 2019 at 10:10 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
>
> This patch set is largely Jonas Bonn's to move towards a "stateless"
> configuration:
>
>   These patches make some modifications to systemd with the long-term goal
>   of being able to run OE in systemd's "stateless" configuration.
>   "Stateless" boils down to building an image with empty /etc and /var
>   directories so that volatile (tmpfs) filesystems can be mounted there;
>   this requires that the system subsequently be able to populate these
>   directories dynamically, which systemd mostly takes care of if things are
>   done right.
>
>   In these patches:
>   i)   Don't include machine-id in writable images so that systemd can run
>        its first-boot machinery
>   ii)  Move systemd configuration files out of /etc
>   iii) Allow systemd to dynamically enable services and populate
>        /etc/systemd/system via the presets mechanism
>
>   There's a long way to go to get to a working "stateless" configuration.
>   Getting to a "volatile" system (just empty /var) should be easier and I'll
>   post patches moving things in that direction shortly.
>
> However as a result of the systemd 242 upgrade, which includes 01d2041e41f4
> ("meson: stop creating enablement symlinks in /etc during installation"),
> services such as systemd-networkd are no longer enabled in images.
>
> This patch set fixes this problem in addition to satisfying the goal of
> moving towards "stateless" configurations.
>
> The issue with respect to image testing during CI was caused by
> systemd-time-wait-sync.service being enabled due to the lack of a default
> preset policy:
>
> https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
>
> Changes in v6:
> - switch configuration to simple overrides in /usr/lib/systemd/*.conf.d
> - make systemd RRECOMMENDS rather than RDEPENDS on systemd-conf
> - don't exit in postinst as when that executes we're actually a
>   concatenation of all fragments
> - validate SYSTEMD_AUTO_ENABLE is `enable` or `disable`
> - rewrite systemctl-native in Python
> - moved systemctl preset-all to IMAGE_PREPROCESS so it runs after ROOTFS,
>   run for all images, not just read-only
>
> Changes in v5:
> - rebased for systemd 242
> - install default preset distribution policy of "enable nothing"
>
> Alex Kiernan (3):
>   systemd-conf: simplify creation of machine-specific configuration
>   systemctl-native: Rewrite in Python supporting preset-all and mask
>   image: call systemctl preset-all for images
>
> Jonas Bonn (3):
>   systemd: don't build firstboot by default
>   systemd: do not create machine-id
>   systemd: create preset files instead of installing in image
>
>  meta/classes/image.bbclass                    |   9 +-
>  meta/classes/rootfs-postcommands.bbclass      |   6 +
>  meta/classes/systemd.bbclass                  |  41 +-
>  .../systemd/systemd-conf/journald.conf        |   3 +
>  .../systemd/systemd-conf/logind.conf          |   2 +
>  .../systemd/systemd-conf/system.conf          |   2 +
>  .../systemd/systemd-conf/system.conf-qemuall  |   3 +
>  meta/recipes-core/systemd/systemd-conf_242.bb |  61 +--
>  .../systemd/systemd-systemctl/systemctl       | 476 ++++++++++--------
>  .../systemd/systemd/99-default.preset         |   1 +
>  meta/recipes-core/systemd/systemd_242.bb      |  26 +-
>  11 files changed, 360 insertions(+), 270 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd-conf/journald.conf
>  create mode 100644 meta/recipes-core/systemd/systemd-conf/logind.conf
>  create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf
>  create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf-qemuall
>  create mode 100644 meta/recipes-core/systemd/systemd/99-default.preset
>

Sigh...

this still has issues - if you boot with `ro` on the kernel command
line and without an initramfs, then / is read-only when systemd starts
and it basically refuses to do anything:

[    7.222134] systemd[1]: No hostname configured.
[    7.227266] systemd[1]: Set hostname to <localhost>.
[    7.232622] systemd[1]: System cannot boot: Missing /etc/machine-id
and /etc is mounted read-only.
[    7.241750] systemd[1]: Booting up is supported only when:
[    7.247362] systemd[1]: 1) /etc/machine-id exists and is populated.
[    7.253752] systemd[1]: 2) /etc/machine-id exists and is empty.
[    7.259757] systemd[1]: 3) /etc/machine-id is missing and /etc is writable.

Note this has nothing to do with read-only-rootfs, this is just a
regular boot... that said a bunch of things that were broken now work,
so it's progress!

I'm leaning towards having systemctl-native touch /etc/machine-id when
it runs, unless you explicitly ask for stateless in DISTRO_FEATURES...
patches to follow.

--
Alex Kiernan


Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPaHY-0007H6-CF
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:16:27 +0200
Received: by mail-vb0-f43.google.com with SMTP id q12so4753043vbe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=BbGfGtZrd6uLaS9CckmJqC+nHIWZYm3DjDgQus0h2lQ=;
	b=IgBfAoHJ4TVw1umR8mni2NNHfKuKrLd/ZW8U1FRRP/prDOM6D5zdf9e2KwCW6KJ3i0
	GFg3zQ0LlGS2/nr7hXQnQc/5wGt8+fP9+PQyCvfU4SZk0SMcBbcKnsL3TbeJ5s8Nh8pE
	cVb98CmM3+sAFSKwf5G6FW4Ot0xoEhB24pMlVONrnmjLYmEjN8GtfLu7ZT8yV3c6qu/U
	1FoM1XInrY2+N4y1s07vK+94lYtzVoWqTg8oyYSZk3pqhM0p2GeDBjyrkL+h9u/4EVdC
	wwgk2NqYx2i2bWXNMgMYTJzkxF/VsBXKyalzfLPZ8PXbEHxIsaPV2+OfvnR9ZQdQ4Xds
	5Uaw==
X-Received: by 10.220.140.18 with SMTP id g18mr19673042vcu.54.1365519543629;
	Tue, 09 Apr 2013 07:59:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 07:58:43 -0700 (PDT)
In-Reply-To: <1365516144-5157-3-git-send-email-radu.moisan@intel.com>
References: <1365516144-5157-1-git-send-email-radu.moisan@intel.com>
	<1365516144-5157-3-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 15:58:43 +0100
Message-ID: <CAJTo0Lb_21hReZ_=g1FGrjnXUp4KZ9J+dXo5XyAO2RP5ksQZNA@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQl6cghY5D13ZyQk4Xo0MYPm+bzrfN0h57eB7Cka9YPmMEuRGuKzUNV9I3aNY5v9tPKbOj/+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Tue, 09 Apr 2013 15:16:27 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 15:02, Radu Moisan <radu.moisan@intel.com> wrote:
> This fixes a service dependency issue;
> When graphical.target is the default mode, systemd
> will try to start display-manager.service which is not
> available on some targets.
>
> For xserver-nodm-init we would then have something like:
> inherit update-alternatives
> ALTERNATIVE_${PN} = "systemd-def-target"
> ALTERNATIVE_TARGET[systemd-def-target] =
> "${systemd_unitdir}/system/graphical.target"
> ALTERNATIVE_LINK_NAME[systemd-def-target] =
> "${systemd_unitdir}/system/default.target"
> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"

If we're going to make this change we also need to fix
xserver-nodm-init at the same time otherwise we break graphical boots
in oe-core.

Ross



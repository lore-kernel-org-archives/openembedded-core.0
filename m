Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tyl4o-0002ie-DQ
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 16:20:24 +0100
Received: from mail-qa0-f72.google.com ([209.85.216.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 07:04:46 -0800
Received: by mail-qa0-f72.google.com with SMTP id dx4so606549qab.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 07:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=AKJwHh7FQZnyJCYWuk9h1ff788S7ODtzhzrCKkfe6Q4=;
	b=AeECQ+bcvq9Y8cfJcTUB2aSR/fc2QFFLN9+A4UXrT36flVu+FmzsH6QD6llshz5geZ
	5suEASsdO3C51NMCWFm0ni90z8hPH8OlV1X3BbIpJ1MNGFOrXaTEikEXeG7T0wybvT8m
	W0Thr67WqoIH0y4wD7WHrkAPTFZexDfBw94G0X7MR0LGUQd3WAvSSA9s8u4o6MFMePVv
	Y6tP3pg3OYD2a5yKAdZ9brqi9K7hCjRJxyKzCUHXsrjd9KXsaeIsLw9lUiIuLNqeydek
	fVPHyqBp7rG/lG3wUNgIeyWHkaoCxQbVOaJ8lLwf/3dNs6z6qLNCT2F/2OuLUR3Wop96
	CYZg==
X-Received: by 10.52.177.195 with SMTP id cs3mr5319434vdc.115.1359126285758;
	Fri, 25 Jan 2013 07:04:45 -0800 (PST)
X-Received: by 10.52.177.195 with SMTP id cs3mr5319424vdc.115.1359126285648;
	Fri, 25 Jan 2013 07:04:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 07:04:25 -0800 (PST)
In-Reply-To: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 15:04:25 +0000
Message-ID: <CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQndCHbXH/qgNN1hpj5YojExUE15/Qt3ILe7CCrTDmsDVvs2a57j2MBVECW8YqnpIZ+iozP3Je5OOYly11Tbm0HOcJ4QuMWadEnMdmmd9YGAAWCgvvgSZrTbn694wtfh5vkEWmdkiq4ydnX42GgDGVOjzUfmtfcp10NkAkncaViHPo+Wrs65eTbTN0BJxp/X2DXX0KCe
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 15:20:24 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 14:59, Radu Moisan <radu.moisan@intel.com> wrote:
> +# "multi-user" vs "graphical"
> +SYSTEMD_DEFAULT_TARGET ?= "multi-user"

Default to "graphical", so we're not regressing and just introducing a
warning if someone doesn't set this and doesn't have X.

> @@ -95,6 +95,11 @@ do_install() {
>         install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
>
>         install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
> +
> +
> +       if [ -n ${SYSTEMD_DEFAULT_TARGET} ]; then
> +               ln -s ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET}.target ${D}${sysconfdir}/systemd/system/default.target
> +       fi

This will have to happen at image construction time and not package
generation time, as different images may have different targets but
share the same systemd package.

A rootfs-time postinstall script would work, but isn't very nice.  I
wonder if there's a better solution, hooking into the image creation
should work.

(thinks)

Ross



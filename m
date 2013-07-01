Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 98B1F6007B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 15:01:39 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id ox1so3799510veb.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 08:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=FkDVp4LVCLnWP3nRreDG9z3/D1nyHmqx+nJHdKK9nVU=;
	b=bs6qGsCkXBrg7nTQOWA318qW4z5M6NiFIWSOsq8gvoJoejECSu7aOS6Vmr3riSm13W
	Hi391gUgsU1k2G1Q8CgqTRebfpn4qRD95hzzCkaa2sxEoL/Mi7sfB/OpPpNR0+YP4/Rz
	akH+Eq0O7od+zEPcyf56JFUUmYmjH0Pgc98e4gxdrIDy3JyRfEUPYj6yko9bFlVmBajZ
	1IgaAmyGdACeK/3BUnj4skbHvIJ1FFqp7O4DYdgIqA9fsNeV94PsNedLVH19bhdUOq0N
	UItUQbTZdPLE0s95gjiDbZs/CZTbR3CmconmFtfIFM5hHNmfSOJG0niroa7jwPwH6Sbg
	34dg==
X-Received: by 10.220.42.147 with SMTP id s19mr9688238vce.46.1372690900461;
	Mon, 01 Jul 2013 08:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 08:01:20 -0700 (PDT)
In-Reply-To: <1372686325-12412-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1372686325-12412-1-git-send-email-muhammad_shakeel@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 16:01:20 +0100
Message-ID: <CAJTo0LY+cR+FEhYmnahvbjDR6sp5RRFdKE=76H6ZJq43q=r0Ew@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
X-Gm-Message-State: ALoCoQn4x2m4Q0eD2HDqct+edllrIMR2L3dSg5v9UTfwFliCRNJEth0aEtyL1k2svxP7IUXxgkGF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: Enabling with systemd
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
X-List-Received-Date: Mon, 01 Jul 2013 15:01:40 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 14:45, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
> @@ -0,0 +1,11 @@
> +[Unit]
> +Conflicts=sshd.service

What's this conflicts for?

> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
> new file mode 100644
> index 0000000..d118490
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=OpenSSH Per-Connection Daemon
> +After=sshdgenkeys.service
> +
> +[Service]
> +ExecStart=-/usr/sbin/sshd -i

Please run this through sed to respect $sbindir.

> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
> new file mode 100644
> index 0000000..c717214
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=SSH Key Generation
> +
> +[Service]
> +ExecStart=/usr/bin/ssh-keygen -A

Ditto.

> -PR = "r0"
> +PR = "r1"

No need to bump PR in oe-core.

Ross


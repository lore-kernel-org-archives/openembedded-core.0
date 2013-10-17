Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id AA02D6CF1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:14:12 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w62so1995858wes.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 03:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=qKsXIgJfv67cgBQ3HHlltgnlYVAI/n7f7d0d5ijCrMY=;
	b=TFuWL3N7SnMTDVx8FrUfhnnDjfrOvMqo3n9i4/w1xZhLLIKUMgVgLf2oDQpFfNt2Gj
	ms/f07zvqB5zbEco31+48p4Zx4dmKBb3SHCBs0yMZc8youEnbIOmNte7mM7BqTyXa+sD
	2XcvwEhQZ/2iKGi1FHPrDr6Wf0bKaLPeRlgIU8K1C+0h8SYw68z5vgc2BO2y5jmZuXOe
	tXUiuUKp/D42+oEKjNnu0HLkQkDabdRFIrYBeMl8S0yTu+K/NLQtZlI/GMNv4bfdG6AV
	AR/QD1eM1zDT8RB9q/mn1g/4xXVl0yuqK810ec00U6D8d8BcY+lvk2DS3EgiH6WryOiE
	qg/Q==
X-Gm-Message-State: ALoCoQlZyaXM/abLBxRuQLZ9Xs5M5JO/hpa6DrfEHFDEzGfTsdWnbVymSQL0lFFW/Ute/qMNA0eL
X-Received: by 10.194.23.73 with SMTP id k9mr6895907wjf.24.1382004853548;
	Thu, 17 Oct 2013 03:14:13 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	iz19sm14656761wic.9.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 03:14:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381997565-10172-1-git-send-email-rongqing.li@windriver.com>
Date: Thu, 17 Oct 2013 12:14:13 +0200
Message-Id: <82793883-9C60-484E-93D0-A96170B68A22@dominion.thruhere.net>
References: <1381997565-10172-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Thu, 17 Oct 2013 10:14:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 okt. 2013, om 10:12 heeft rongqing.li@windriver.com het volgende =
geschreven:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Create connmand-nfs.service, which will run a script to ignore the
> networking device when root is nfs.
> Connmand-nfs.service will be run only when root is not nfs

You when it *is* on nfs, since the it tests for root=3D/dev/nfs being =
present

> diff --git =
a/meta/recipes-connectivity/connman/connman/nfs-connman.service =
b/meta/recipes-connectivity/connman/connman/nfs-connman.service
> new file mode 100644
> index 0000000..1cb82b8
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/nfs-connman.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=3DConnection service when root is /dev/nfs
> +ConditionKernelCommandLine=3Droot=3D/dev/nfs
> +After=3Dsyslog.target
> +
> +[Service]
> +Type=3Ddbus
> +BusName=3Dnet.connman
> +Restart=3Don-failure
> +ExecStartPre=3D-/usr/lib64/connman/wired-setup
> +ExecStart=3D/bin/sh /usr/sbin/connmand-nfs

And as I said before, these hardcoded paths are not going to work.=


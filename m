Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2791A60DF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 15:04:19 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x13so6322053qcv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 07:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WO/pcmJ7GKEDUBI8HZ/ZsztLlzzfBFOqoQKGZ2lZs1Y=;
	b=HhnzZwYTwMCI/LsRYcP37A4elPhluehGJgO3jvEjv3ydP1fULXx9pJxD0JSVvF+VfT
	nQ/nEhRYQxMtlM7u7uEJ+9v72T65CwDqusVPmAOsn5l/fhJSNGxfyYe86IRWQyfniR1i
	1h0xl04763E920NTlp7UQyNU0kwMAaj4eevINt+SQqVrbNb0FxG3uY46a4StlTvXcZD1
	dvrb8gILB7l8WS2fjjocvNAukx4cWSdU2ZQRrqdjERG4mZgigiYcWoDQ5gXB2EbJ/O3N
	OoplnIGoO3hNQCc+0iCjJMyG50JB7xNtoVlB/Io2iFXOu3iCYCZpNF6B5MWyOk5VoV6N
	Avqg==
X-Gm-Message-State: ALoCoQnGwIkB4SyKhNJcYGJPdrBfX2jkwg04B1Ilfph1jQ/SvhhO/vL6VkJmF2xHqBYkFUeIGbFV
X-Received: by 10.224.114.144 with SMTP id e16mr53618420qaq.30.1387379060001; 
	Wed, 18 Dec 2013 07:04:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Wed, 18 Dec 2013 07:03:58 -0800 (PST)
In-Reply-To: <A4C74CC9-C110-42B7-B61D-5010176F3595@dominion.thruhere.net>
References: <1386842653-1089-1-git-send-email-ross.burton@intel.com>
	<A4C74CC9-C110-42B7-B61D-5010176F3595@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Dec 2013 15:03:58 +0000
Message-ID: <CAJTo0LYLDfXcxQT5gQPu9dwCvtjx=-23iHw+Xth+E0w78QWjnQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-compat-units: drop machineid.service
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
X-List-Received-Date: Wed, 18 Dec 2013 15:04:19 -0000
Content-Type: text/plain; charset=UTF-8

On 12 December 2013 11:33, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 12 dec. 2013, om 11:04 heeft Ross Burton <ross.burton@intel.com> het volgende geschreven:
>
>> systemd will create the machine ID automatically if it isn't set,
>
> That's not the whole story, it will generate a new one every boot

It will generate a new one on boot *if* /etc/machine-id doesn't
contain a valid ID.  If /etc is read-write then this happens once on
first boot.

>> so this unit doesn't serve any purpose.
>
> That's correct, you need to generate it offline, since /etc/machine-id is a bind mount after booting :(

Why is that bad?  In the read-only-rootfs case you can either pre-seed
the machine ID at image creation time (if a single machine ID across
all instances is reasonable) or let systemd create a fresh one on
every boot in /run/machine-id and bind-mount /etc/machine-id to it.

Ross


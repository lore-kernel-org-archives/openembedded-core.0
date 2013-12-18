Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7B66560D8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 15:42:27 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so3118421eaj.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 07:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=TuZMGhrIpoWyjf5FRgvqnkmenomDPZmj5FdJcx4xwpw=;
	b=YqPvAS5asn5QxmqA5MRLK8mAj3blVtakBotXAkU/FUHITXMPFpU+YGU+bJaLiG7mEf
	emFKeRCR5sdthgxfeTHOdeTbZnbf5wptjECfrcbTtNvBTtVbLxi9S1AR607j+QXulXwb
	VLzAxQW48i+fDTp5YUWoPikn8h60HzjdV17NfOXJ3dOURCYGZvM2cvIjR0dquQs3lvEZ
	F12E2aJ5AFdJ2p4cu7NDjO65YU5KY64YCBPanuvEJyNKb7ruVEkdItlRdPR+CsuC7uWa
	LABv1u1aXVxdUc17x6hejZ1o3BJ9yT8ptBtS6d/wa6x9ufc5ev+vOlZIkLnDS+NCbBdV
	AalQ==
X-Gm-Message-State: ALoCoQkfMFXqLqTJJgBZIKep+A/dhCbKU+OtwLrBx/iljr+rdUgxjCSD2BBEScDRHXaJuVLh9wvC
X-Received: by 10.14.246.202 with SMTP id q50mr29741696eer.58.1387381348196;
	Wed, 18 Dec 2013 07:42:28 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id v7sm1092014eel.2.2013.12.18.07.42.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 07:42:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYLDfXcxQT5gQPu9dwCvtjx=-23iHw+Xth+E0w78QWjnQ@mail.gmail.com>
Date: Wed, 18 Dec 2013 16:42:30 +0100
Message-Id: <0D6B3970-7154-4445-A7D7-A470E4ED44E4@dominion.thruhere.net>
References: <1386842653-1089-1-git-send-email-ross.burton@intel.com>
	<A4C74CC9-C110-42B7-B61D-5010176F3595@dominion.thruhere.net>
	<CAJTo0LYLDfXcxQT5gQPu9dwCvtjx=-23iHw+Xth+E0w78QWjnQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1822)
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
X-List-Received-Date: Wed, 18 Dec 2013 15:42:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 dec. 2013, om 16:03 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> On 12 December 2013 11:33, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> Op 12 dec. 2013, om 11:04 heeft Ross Burton <ross.burton@intel.com> =
het volgende geschreven:
>>=20
>>> systemd will create the machine ID automatically if it isn't set,
>>=20
>> That's not the whole story, it will generate a new one every boot
>=20
> It will generate a new one on boot *if* /etc/machine-id doesn't
> contain a valid ID.  If /etc is read-write then this happens once on
> first boot.

Right, booting with 'ro' in the kernel cmdline will prevent that from =
happening, which means...

>=20
>>> so this unit doesn't serve any purpose.
>>=20
>> That's correct, you need to generate it offline, since =
/etc/machine-id is a bind mount after booting :(
>=20
> Why is that bad?  In the read-only-rootfs case you can either pre-seed
> the machine ID at image creation time (if a single machine ID across
> all instances is reasonable) or let systemd create a fresh one on
> every boot in /run/machine-id and bind-mount /etc/machine-id to it.

... every boot you get a new machine ID and hence a new journal ID, =
which sucks. We can debate if that sucks more or less than having =
duplicate machine IDs across the boards on your desk :)

regards,

Koen=


Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id E52EC73577
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 10:34:17 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id hn18so28978323igb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 02:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=qtc147TVwmNXkWRlzfYgehb2KwlzcLEMwmbslqdhntM=;
	b=eYoznnuh84hIc+PcrMFktV2V6Ymn1Yxk/Q16DSqbys9PQdneOwDTbnlyr1moXZcOJR
	J/vBtO8HX0QUXJf2zCXTaXmwS3oOnw8FZKxTLKDYyZFAjDkbgR5o65JtGQvKE6AKdAAc
	HzvqHN2+AZDQBbywwn0etukY9GDm6clfQB+AkEbnR8LjrFopP0S38LPd99vzlmjRY3N9
	GM+C6lr3hP3GCywoT13hyzXftRRBJ/xCvdpjxtz3DqwC2AFMF6F5buyCw2oXPYMg+Rj7
	hTCS8iNZOdXn9bIGGpSrNOkXndinJ2b6b2S/ekfWenMt5XXdfdmZf8qbBEp+mtZyKWjP
	qLcw==
X-Gm-Message-State: ALoCoQns0untqNkntIWgugBbb3Yrm8sTFMXzVaS/lXxSWvSfLSHG2ccIwNoLMRk/k8j/5fdOclB2
X-Received: by 10.50.36.104 with SMTP id p8mr27357512igj.16.1424169258616;
	Tue, 17 Feb 2015 02:34:18 -0800 (PST)
Received: from pohly-mobl1 (p57A56D2C.dip0.t-ipconnect.de. [87.165.109.44])
	by mx.google.com with ESMTPSA id m5sm9908932ige.5.2015.02.17.02.34.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 02:34:17 -0800 (PST)
Message-ID: <1424169254.549.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Adrian Freihofer <adrian.freihofer@neratec.com>
Date: Tue, 17 Feb 2015 11:34:14 +0100
In-Reply-To: <4426580.xeKXhTzLUy@chl500346>
References: <1415088547.4530.142.camel@intel.com>
	<9989828.c0GAiu1EUm@chl500346>
	<loom.20141107T110211-131@post.gmane.org>
	<4426580.xeKXhTzLUy@chl500346>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: runqemu + dhcp server
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
X-List-Received-Date: Tue, 17 Feb 2015 10:34:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-11-10 at 22:57 +0100, Adrian Freihofer wrote:
> > I haven't tried NFS rootfs. My hope is that it would still work because the
> > ip parameter and the DHCP server assign the same IP address and thus nothing
> > changes inside the guest when switching from one to the other.
> > 
> 
> I see, the patch you are working on will provide just another option
> to get eth0 configured. This would definitely be an improvement.

I had to put this aside for a while, but I'm still interested in getting
this merged.

> Did you ever run the automated image tests? If I remember correctly
> the image tests are somehow related to the current implementation of
> the network configuration. At least the tests require a hostname
> starting with "qemu" and probably they run from NFS rootfs.

Where do I find more information about these tests, in particular how to
run them?

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#testing-packages-with-ptest describes how to add tests to an image, but leaves it open how one invokes ptest-runner. What you describe sounds like a mechanism built on top of that which automatically boots up a machine and captures the output of ptest-runner.

> Would be nice, if you get the DHCP based network configuration
> fulfilling these requirements. An alternative approach is implemented
> in systemd networkd. I guess it does not touch interfaces which are
> already configured e.g. by kernel boot parameters. This could be done
> in connman as well. It would allow you to run the productive image in
> qemu.

There might be also other improvements. For example, I just booted a
core-image-minimal with systemd as init with runqemu. eth0 is
configured, but /etc/resolv.conf is missing, so ptests like the one for
wget fail because www.google.com cannot be resolved.

This was without the DHCP server patches. My expectation is that
bringing up eth0 with DHCP-supplied information about DNS servers would
have created (or could be made to create) resolv.conf.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





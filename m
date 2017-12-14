Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id AD19771D79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:21:16 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 962265C188A;
	Thu, 14 Dec 2017 18:15:14 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 14 Dec 2017 18:16:21 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <2ddf3fe7-20f3-87e0-969d-a0ed83cf9256@linux.intel.com>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
	<d31c5759f38e450334b7762afb5e7496@agner.ch>
	<2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
	<37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
	<dbdaea03-62b9-3437-5da4-897b633f813d@linux.intel.com>
	<d74719f7fc9f92cfdc443720915252e5@agner.ch>
	<eb8c0e61-9433-2d83-ab23-eed945b476df@linux.intel.com>
	<c7efc74858b05a59105bd21fb6669e48@agner.ch>
	<2ddf3fe7-20f3-87e0-969d-a0ed83cf9256@linux.intel.com>
Message-ID: <4a6b7a11117ca59fa8b5ffd60c889387@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513271714; bh=TrJY8shNUCBlBQR0YqZ7blCwmsV1KsMhE5YTbE4Cubg=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=UvZ+Kgszj/TQAt3mMGLY1EZAhdjshK/jS+thDuw4OycF9eJT6/geQcFKtvmnQSpA1HoA0OUGY+4WwxCZoXij/+xScI1iah0tm0dTzB+hEEckGb7BxHuANz19P0YG9E1X1aV9sfpO5Bg9inh+aw++/dWrgRfyUQzzv6G5/dfzeBw=
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Thu, 14 Dec 2017 17:21:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-14 17:59, Alexander Kanavin wrote:
> On 12/14/2017 06:46 PM, Stefan Agner wrote:
> 
>> Suggestion:
>> - Still remove systemd opkg service as proposed, since run-postinsts
>> gets run with systemd and should/will handle package manager just fine
> 
> Yes.
> 
>> - Change run-postinsts to behave sane: Detect package management by
>> checking /var/lib/dpkg/status and /var/lib/opkg/status only (remove the
>> if [ ! -d $pi_dir ]; then continue; fi...)
> 
> Maybe; you need to explain this carefully in the commit message.
> 
>> - Stop deploying /etc/*-postinsts when package management is installed
> 
> Probably not; rpm does not have a facility for 'delayed postinst
> execution' the way dpkg/opkg do, and this would create more confusion
> and special-casing than achieve any real improvement imo.

Are you sure that rpm has no such facility? Maybe there is some other
mechanism around...

If rpm really does not handle it, would mean that delayed postinst would
have been broken back when we did not ship /etc/*-postinsts:
http://git.openembedded.org/openembedded-core/commit/meta/lib/oe/rootfs.py?id=5aae19959a443c6ac4b0feef10715c8acf3c6376

If there is special case handling needed it is not particularly nice due
to the additional condition.

But IMHO still better, it can easily be explained in rootfs.py with a
comment like:

    # deb/ipk package management is able to handle postinsts on first
boot.
    if ... 

I will do some tests with rpm and send a patchset.

> 
> Jussi left Intel several months ago.

I see.

--
Stefan


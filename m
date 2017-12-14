Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6D35F60102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 14:04:36 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id BCE3D5C38D3;
	Thu, 14 Dec 2017 14:58:34 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 14 Dec 2017 14:59:41 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
Message-ID: <d31c5759f38e450334b7762afb5e7496@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513259914; bh=yMBJ7lo9hKNCEfBTYzXyXVASabb/lIRsT6xELNneM/U=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=GsxsUS4V9CnfdNBLLvdEUVIE74kXWh/3WNj3pyDU0A6s10UL+Oerydx77ztjrvE3MtnrI08cX37SDxh/Nn/Vg6xih/r6kushEROl7e5baTOkCxCDEUxwUmt7nAWrsSuHKMRJUXT7j1t7UEhDSJlKvuam/zVNTjwG8ZVBaWBIcFU=
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>,
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
X-List-Received-Date: Thu, 14 Dec 2017 14:04:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-14 14:52, Alexander Kanavin wrote:
> On 12/14/2017 03:11 PM, Stefan Agner wrote:
>>
>>> I don't think this is correct. Some postinsts are intentionally
>>> deferred to first boot, and they need to be run regardless of whether
>>> the image supports runtime package management or not.
>>
>> Yes I know, the mentioned opkg-keyrings is such a case.
>>
>> If there is no package management, then scripts get deployed via
>> /etc/*-postinsts, if package management is available then it will take
>> care of it.
> 
> From reading the code, that only happens when using rpm. In other
> cases you need to execute _save_postinsts(), regardless of whether
> package management is available on image or not.

That at least contradicts my testing with opkg/ipk.

If /etc/ipk-postinsts is not there and /var/lib/opkg/status is there
(package management installed), then run-postinst runs "opkg configure",
which takes care of postinsts just fine.

Reading the code at least let me to believe that this is true for deb as
well.

Not sure how it works with rpm though. How do you came to the conclusion
that this only happens when using rpm?

> 
> Whatever changes you try, do run oe-selftest's
> 'test_postinst_rootfs_and_boot' test against them and make sure it
> doesn't regress.

Yeah will do when I have a solution which I am happy with.

Before that, I rather prefer understanding the whole issue and try to
come up with a solution that works on first regression test (rather than
try and error)...

--
Stefan


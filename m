Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id CF11F7814B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 14:46:50 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 6A5055C188A;
	Thu, 14 Dec 2017 15:40:48 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 14 Dec 2017 15:41:54 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
	<d31c5759f38e450334b7762afb5e7496@agner.ch>
	<2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
Message-ID: <37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513262448; bh=pCwM2b32jLKdVPN/+6U3m+HNsnBqXKJhSiWb45MDbI8=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=C/S0buOaMZb3/67aaupotWL2MBYJie6/M9CCSLpz0Td/7vynbntGQQLZsT6WIMPhMhomHAowPKNLdGAuS4/CERaTXnE3AxIEN3K+1WqIqxVOLwSdsTGfcopZRLct2tZSNV1HH1lgtjPw0zPwPgCYvFrtTKoVzGXxMWTuMCk533s=
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
X-List-Received-Date: Thu, 14 Dec 2017 14:46:51 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-14 15:24, Alexander Kanavin wrote:
> On 12/14/2017 03:59 PM, Stefan Agner wrote:
> 
>> That at least contradicts my testing with opkg/ipk.
>>
>> If /etc/ipk-postinsts is not there and /var/lib/opkg/status is there
>> (package management installed), then run-postinst runs "opkg configure",
>> which takes care of postinsts just fine.
>>
>> Reading the code at least let me to believe that this is true for deb as
>> well.
>>
>> Not sure how it works with rpm though. How do you came to the conclusion
>> that this only happens when using rpm?
> 
> I think there was confusion between what happens at image creation
> time vs what happens at first boot :)
> 
> So what's the issue again that your RFC patch doesn't resolve? I read
> your followup and I still don't get it.

I think removing the Opkg first boot systemd service (as the initial
patch does) is the correct first step.

However, it currently still leads to a second copy of the postinst
scripts in /etc if package management is enabled.

I am pretty sure that adding if delayed_postinsts and not
runtime_pkgmanage: should resolve the problem for ipk/deb fully: With
that run-postinsts will run "opkg configure"/"dpkg --configure -a"
respectively when package management is installed, and those command
will run all postinst correctly.

So for me the only question is what will happen with rpm... Will package
managment do something on first boot? And if yes, what mechanism?

If rpm needs /etc/*-postinsts even with package management, then maybe
we need to add:

if delayed_postinsts and (not runtime_pkgmanage or rpm):
    self._save_postinsts()

--
Stefan


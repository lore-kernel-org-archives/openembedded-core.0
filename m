Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 7C29671B69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 15:02:41 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9129D5C188A;
	Thu, 14 Dec 2017 15:56:40 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 14 Dec 2017 15:57:47 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <dbdaea03-62b9-3437-5da4-897b633f813d@linux.intel.com>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
	<d31c5759f38e450334b7762afb5e7496@agner.ch>
	<2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
	<37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
	<dbdaea03-62b9-3437-5da4-897b633f813d@linux.intel.com>
Message-ID: <d74719f7fc9f92cfdc443720915252e5@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513263400; bh=x9p16sckh8yPzVURNMrh91QTFDwGP9g9H4n517jAN+U=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=sOjJWU9TwoQ1kGgxLdqfaTRxMfXxiRjoM6u9xXCAuziJfmuq9hyCS5PBCLZhYM7uhptrFDLm/yA99vuh9esqQEFtMQYHZvq1Cdy+yoGsvL6yGR801obJt0v99ynFEDOpPm0IfPXUAlvUlfZ5KVrIYTe0LGF9wDXz/LH+9GpCKd0=
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
X-List-Received-Date: Thu, 14 Dec 2017 15:02:42 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-14 15:55, Alexander Kanavin wrote:
> On 12/14/2017 04:41 PM, Stefan Agner wrote:
> 
>> I think removing the Opkg first boot systemd service (as the initial
>> patch does) is the correct first step.
>>
>> However, it currently still leads to a second copy of the postinst
>> scripts in /etc if package management is enabled.
>> I am pretty sure that adding if delayed_postinsts and not
>> runtime_pkgmanage: should resolve the problem for ipk/deb fully: With
>> that run-postinsts will run "opkg configure"/"dpkg --configure -a"
>> respectively when package management is installed, and those command
>> will run all postinst correctly.
> 
> Why is the second copy a problem? Can you elaborate? Don't describe
> the fix, describe the issue.
> 
> From what I can see, run-postinsts will execute opkg configure if opkg
> is available, or run the scripts directly if opkg is not available -
> which is fine. Why do you need to avoid saving the scripts in /etc if
> opkg is installed?

No, it will call the scripts in /etc/*-postinsts (it bails out of the
for loop if the post inst dir is there...)

Then opkg status file still shows the packages as just "unpacked". When
running the package manager (e.g. to install an unrelated package) opkg
starts to handle the postinst again...

Rather than updating the package managers database etc I rather feel we
should just not do the OE specific postinst if package management can
handle it.

--
Stefan


Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5597B71C3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:45:20 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 15CAB5C3A3C;
	Thu, 14 Dec 2017 18:39:19 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 14 Dec 2017 18:40:25 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <84080427-d60b-6527-b0f4-938fae379559@linux.intel.com>
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
	<4a6b7a11117ca59fa8b5ffd60c889387@agner.ch>
	<84080427-d60b-6527-b0f4-938fae379559@linux.intel.com>
Message-ID: <b0d062d27983acc3d7ec40061b661699@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513273159; bh=/uCimoZ8juUhdBnWqqhon9e6E/ngeoEtSceOvahx8V0=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=wZ7uGMSBM/7SlGa3fF6ZCxNRwGLXCRnYH9h2yFUM//LK+bL9EsUr2rjIgesKjcMCnt0mTIGxjCodV4BcM6RnynK4euyuFwBduQ1JolNlJ6eSnCZRKlywlhKfA8JquZd/KY4/a8Xvlnt9BWWFKvaSvmdl6o7VbcSehJ1tSH11GFw=
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
X-List-Received-Date: Thu, 14 Dec 2017 17:45:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-14 18:28, Alexander Kanavin wrote:
> On 12/14/2017 07:16 PM, Stefan Agner wrote:
> 
>> Are you sure that rpm has no such facility? Maybe there is some other
>> mechanism around...
> 
> You are welcome to find it. rpm does not distinguish between unpacking
> and configuring steps, and just does everything in a single
> installation step.
> 
>> If rpm really does not handle it, would mean that delayed postinst would
>> have been broken back when we did not ship /etc/*-postinsts:
>> http://git.openembedded.org/openembedded-core/commit/meta/lib/oe/rootfs.py?id=5aae19959a443c6ac4b0feef10715c8acf3c6376
> 
> Rpm had a special way to save postinstall scripts (due to the same
> problem I described just above), and still does, which means
> _save_postinsts() did (and does) nothing in rpm case.
> 

Oh, I see, well that simplifies it, doesn't it? E.g.

    # If package managers support postinsts and the package manager is
present on the
    # rootfs, then it will handle postinsts just fine, no need to deploy
scripts again.
    if delayed_postinsts and not runtime_pkgmanage:
        self._save_postinsts()

And with that it will be as it used to be before the above commit, and
the way it should be.

--
Stefan

>> If there is special case handling needed it is not particularly nice due
>> to the additional condition.
>>
>> But IMHO still better, it can easily be explained in rootfs.py with a
>> comment like:
>>
>>      # deb/ipk package management is able to handle postinsts on first
>> boot.
> 
> Please no; the class in question is the generic Rootfs(), and I do not
> want to add packagemanager-specific clauses there.
> 
> Alex


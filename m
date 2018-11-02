Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E7A627458D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 08:16:08 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 17D7B5C0A16;
	Fri,  2 Nov 2018 09:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1541146567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=328ibco24AEH2RWxDxYAS/8zI2Xwzz0LZ3NsNdw+nL4=;
	b=g/aETklLl9Au+B9tNj/xZ6UXpd5Sltdkb9kAPeR+wCfANZesrzGK1dECkrqM7nk7Mi/UWF
	SRgbK0tNdsMXMX9xrgSOMjoUqsf6PT4mHJODE+e8gDjTnzNqYqdaSg8MJPsMGvCY8skN1V
	i89AI9h+QIhEFjBiSpOtnpwYb/W5VNE=
MIME-Version: 1.0
Date: Fri, 02 Nov 2018 09:16:07 +0100
From: Stefan Agner <stefan@agner.ch>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <e9cebc10a1d7b45d6cddfa83cbb5419f@agner.ch>
References: <77e2fb99554339ea31caf60700a1595f@agner.ch>
	<CAMKF1sqsFd=96ARdFX-KdgrOH9iAP5Ndb7aWXTEwGVkAyXFzzg@mail.gmail.com>
	<e9cebc10a1d7b45d6cddfa83cbb5419f@agner.ch>
Message-ID: <7025584cb992c6cbbe238164adf8e614@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: luka.pivk@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Lock external repository in custom FSTYPE
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
X-List-Received-Date: Fri, 02 Nov 2018 08:16:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 01.11.2018 23:27, Stefan Agner wrote:
> On 29.10.2018 14:01, Khem Raj wrote:
>> On Mon, Oct 29, 2018 at 5:31 AM Stefan Agner <stefan@agner.ch> wrote:
>>>
>>> Hi,
>>>
>>> We use meta-updater, which has a custom FSTYPE to build a OSTree
>>> repository. We share that repository across multiple bitbake executions.
>>> The underlying OSTree tools lock the OSTree repository before trying to
>>> interact, and if it fails ("error: Locking repo exclusive failed:
>>> Resource temporarily unavailable") then the complete build fails (see
>>> also https://github.com/advancedtelematic/meta-updater/issues/412).
>>>
>>> Now I'd rather prefer that two bitbake tasks would serialize the access
>>> to the OSTree repository. Is there a mechanism in bitbake to lock (and
>>> wait) for the repository to be not in use?
>>>
>>> We tried using bb.utils.lockfile, but the task is written in shell. Also
>>> inline Python would not work since locking/unlocking need to be done
>>> within one Python script as far as I understand.
>>>
>>
>> perhaps you could use lockfiles something like
>>
>> do_foo[lockfiles] = ...
> 
> Wasn't aware of the lockfiles varflag, also seems not to appear in any
> documentation. Reading lib/bb/build.py suggests that it really is

I take that back:

https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-manual.html#variable-flags

--
Stefan

> locking the complete task, exactly what we need.
> 
> Added the lockfiles varflag to the do_image_ostree task in
> image_types_ostree.bbclass:
> do_image_ostree[lockfiles] += "${OSTREE_REPO}/ostree.lock"
> 
> And run two builds, the OSTree lock issues seem to be gone. Thanks Khem!
> 
> --
> Stefan
> 
>>
>>> --
>>> Stefan
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


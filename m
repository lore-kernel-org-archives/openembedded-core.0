Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tyqlx-0005Sl-7B
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 22:25:17 +0100
Received: by mail-vb0-f53.google.com with SMTP id b23so598763vbz.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 13:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=+Dbm/eEPGDDQGO2W5aD/WmaO+dSm+Cy/ghzDUcm8a5M=;
	b=sZFRHIjSeibcnhNbYHVf+4n4u8iX5lG/WB7xW1/PrmC0ckZGakNXaY0H4hSNPnvz5U
	rLpOa8om9RQmWUCWcZHQGrlIIVf8moVanH81Qw2iaat26NLXlVvL2P1zgRndOS4+GI7o
	qrU1L+C399IFWGpGqbrODOdfgtxNHK3kNBTrH1Htf0Dx2usDKH6+k6WIlzhqQHA730DU
	3BMjXl4BdxOhEQd/5yoqmgJ7V/VYpNYYdGZxDrBYcBPJR6YpsjTGT/j1JAOZKgzF0apF
	XyTb3zCQ+0BXf0yn9UJmabMpVD7xmmpMriGQCX2yFmzA44RRW79YX6C5Pwd3i4REEaau
	K20g==
MIME-Version: 1.0
X-Received: by 10.52.88.175 with SMTP id bh15mr6561113vdb.34.1359148182189;
	Fri, 25 Jan 2013 13:09:42 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Fri, 25 Jan 2013 13:09:42 -0800 (PST)
In-Reply-To: <20130125202657.GF16904@jama.palm1.palmone.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
Date: Fri, 25 Jan 2013 22:09:42 +0100
Message-ID: <CALbNGRRKxi-DBkBxc2jhdiAEvcZk0YsTs=bk-0mSuKER87P3Bw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 21:25:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 25, 2013 at 9:26 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jan 25, 2013 at 08:21:05PM +0000, Ross Burton wrote:
>> On Friday, 25 January 2013 at 19:34, Martin Jansa wrote:
>> > Something like:
>> >
>> > systemd:
>> > inherit update-alternatives
>> > ALTERNATIVE_${PN} = "systemd-def-target"
>> > ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/multi-user.target"
>> > ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/systemd/system/default.target"
>> > ALTERNATIVE_PRIORITY[systemd-def-target] ?= "1"
>> >
>> > xserver-nodm-init and DMs:
>> > inherit update-alternatives
>> > ALTERNATIVE_${PN} = "systemd-def-target"
>> > ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/graphical.target"
>> > ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/systemd/system/default.target"
>> > ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
>>
>> Can you make those conditional on the systemd feature so that we don't get complaints from people using something else?
>
> xserver-nodm-init:
> ALTERNATIVE_${PN}-systemd = "systemd-def-target"
>
> And only people which install xserver-nodm-init-system in image will see
> that.
>
>> You could use different names and map them to ALTERNATIVE_* inside systemd.bbclass, assuming/enforcing that everyone who wants to set the default target inherits that class I guess.
>
> I don't understand what you mean.
>
Please let's remember how it started: avoiding a single warning for
missing display-manager.service on console images...

Andreas



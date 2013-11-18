Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 77B266D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 09:22:09 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hv10so447488vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 01:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=W+36qeCWoIhKw78TjNjKIsng4+RBB62GA3TaY5WsH6A=;
	b=gaTkQ8ajgPpsJqddsMzdkDTexs8NjyRbi69HMZAbW7b1gqOf8fNT4aqgvJrKJ8J/td
	2vmkAqfY30BS4P5InAhcvnHrpJB1twrwxp/0yEeBffbBwP9vTD81Sc6zRfYvqIYL7+hN
	KN8sJ5MO7b97J1v8IwekhPHFIOEEKPtcKRMUvkUXPZCJ+3he0be1rtuYqVoQphsUTYjH
	ta54RNwPbvDcMUUvxzikduZSfmCFeRWfAkF3xhzt7ntpxSIK+RYE1gW02vBa2G14opI9
	3UZAW2Sf13H3BjcpEc/kxTXDxcL3Of86IN/A1pedNr8KpMNppjEu1F6e7Y8dJ/EHD9I2
	6LoA==
X-Received: by 10.220.64.69 with SMTP id d5mr14874703vci.11.1384766530783;
	Mon, 18 Nov 2013 01:22:10 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.49.71 with HTTP; Mon, 18 Nov 2013 01:21:30 -0800 (PST)
In-Reply-To: <52898177.5000303@windriver.com>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 18 Nov 2013 09:21:30 +0000
X-Google-Sender-Auth: 0JVXcpVWksHdI23sV640Fdk1TVQ
Message-ID: <CANyK_8ei7vpwQzQRfTsjnowMSDMOdwMwk1WeryjDi0+mnxL_fA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Mon, 18 Nov 2013 09:22:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 November 2013 02:54, ChenQi <Qi.Chen@windriver.com> wrote:
> On 11/18/2013 02:57 AM, Paul Barker wrote:
>>
>> Hi all,
>>
>> I've been trying to add PACKAGECONFIG options to opkg and have ran
>> into a dependency loop whilst building with certain options. Enabling
>> curl support within opkg requires a dependency on curl. curl in turn
>> depends on ncurses (via a few intermediate dependencies) and ncurses
>> uses update-alternatives causing a dependency on
>> virtual/update-alternatives.
>> PREFERRED_PROVIDER_virtual/update-alternatives is set to "opkg" in
>> meta/conf/distro/include/default-providers.inc and so we have a
>> dependency loop if curl is enabled via the new PACKAGECONFIG options
>> for opkg.
>>
>> I can cause the same dependency loop by setting
>> PREFERRED_PROVIDER_virtual/update-alternatives to "dpkg" as dpkg
>> directly depends on ncurses (which uses update-alternatives). So if
>> someone wanted to use the more powerful update-alternatives from dpkg
>> on a target system it doesn't look like that is currently possible.
>>
>> This places quite a constraint on whichever recipe PROVIDES
>> update-alternatives. Going forward I'm hoping to use libarchive within
>> opkg and libarchive depends on bzip2 by default which uses
>> update-alternatives, which would cause the same problem.
>>
>> Does anyone have any clever solutions to this? Perhaps we could split
>> update-alternatives off into its own recipe which should be dependent
>> on very little, allowing opkg a little more freedom in its
>> dependencies.
>>
>> Thanks,
>>
>
> I opened a bug some time ago for this update-alternative problem.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4836
>
> It would be really helpful if you could add some input in the comments of
> that bug.
>
> Thanks,
> Chen Qi

I've added the info from my email to the bug and opened an opkg bug
for the problems with changing the link name during a package upgrade:
https://code.google.com/p/opkg/issues/detail?id=113

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


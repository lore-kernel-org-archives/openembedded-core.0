Return-Path: <max.oss.09@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7A19B60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 15:54:32 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n4so7258254qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 07:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fDD67TY5ii3lUOhVXWXflaBSgl4PMaHSWYfUSC+uTeQ=;
	b=SHeLhcSBbcIY8fNGmw4HNxtAJ5eyMZi4nFBxUS8K8F1uLRIFw0hCcs22RS7uduo9YU
	472hSbqQFs+wBFULuOQ/GcVtFO0Aj323K13HVG0xV2TswFu1KuoQ2ZduMKG5UmALLkTU
	/VzqWSJK0uf/7LazvYRXp7ueraQ19ChiF2pG+S2BCsMJVG5ZuKNvQJppz3kBpBGaKkcF
	XKkKDdlQ3jWXldPGy+o2PSlEgj+xCHA9Jl4lVly2FHyYct1xxVxZVzhci6y9HSCnZ2W9
	t1MOK611kuMpjnuH7QS5wDs8K1wrkH2lbGEoGyT7itBjfIAowh92n29vrMpzkI/8g4w3
	LEdw==
MIME-Version: 1.0
X-Received: by 10.229.114.137 with SMTP id e9mr42749626qcq.0.1422287672408;
	Mon, 26 Jan 2015 07:54:32 -0800 (PST)
Received: by 10.140.30.229 with HTTP; Mon, 26 Jan 2015 07:54:32 -0800 (PST)
In-Reply-To: <54C64431.6050409@mentor.com>
References: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
	<54C64431.6050409@mentor.com>
Date: Mon, 26 Jan 2015 16:54:32 +0100
Message-ID: <CAEHkU3X1XYvfKAG39DXWNhPM-yWcKyaYFf85X3A8yrEf4XHcJQ@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Nathan Lynch <Nathan_Lynch@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch 0/2] udev: fix ptest to not influence qemu
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
X-List-Received-Date: Mon, 26 Jan 2015 15:54:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2015-01-26 14:42 GMT+01:00 Nathan Lynch <Nathan_Lynch@mentor.com>:
> On 01/25/2015 09:33 AM, Max Krummenacher wrote:
>> From: Max Krummenacher <max.oss.09@gmail.com<>
>>
>> Hi
>>
>> On a OE setup configured to build ptest packages udev's ptest test files are
>> staged to the sysroot.
>> A run of qemu chockes on this test files and never returns.
>>
>> A ptest run on the target before any changes failed.
>> Patch 1/2 first fixes ptest.
>> Patch 2/2 keeps the test files in its tar-ball. run-ptest unpacks it before
>> a test and cleans up afterwards.
>>
>> This fixes the issues with qemu while the ptests can still be run witout
>> failure.
>
> This looks relevant to
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6734
> do_rootfs: The postinstall intercept hook 'update_pixbuf_cache' failed
>
>
I did not specifically look for the update_pixbuf_cache postinstalls.
Nontheless from the bug description I think the patch likely fixes
id=6734.
A cheap test on an affected build is to:
 rm -rf ..../sysroots/<machine>/usr/lib/udev/ptest
If that fixes the issue the patch will help.

Max


Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1027016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 21:40:06 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id s207so4818149oie.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JIK9dpxS51RPZDItHSpwruFHAz+Qwoqp1b6ELZTULuA=;
	b=IIYusg5FQucMrolbcN7QB2ADVp5QdVlWLeOqQ5dQJUuJCH/bL3KJycS8/osa9Py78P
	EbbX9EPt1cVukPC/iSejWHzVsnGI8JPvl7hE7TNHTncaqiZ5R4UliMhguByNqY6gnWwg
	Va/BZNyavy1uEyLzsSyjVhcpzGCRZAeYnZHFXd06RyIEwvwFtF6hi2+2sfLmANfp76pF
	09vQUE1CysuQCzJQiwlpx7S65/wBeQagVuSvWXPrHP2+XxBSY8O0JYxX8LU9JEDbmxrV
	ejnybfq9SOEcihRK9//BC8kVQ/bF0n5EGnr5qeRuBRri/buLTj8i5rCcNJOAJFQDIL8E
	GI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JIK9dpxS51RPZDItHSpwruFHAz+Qwoqp1b6ELZTULuA=;
	b=ldDs0EGkJs9ourEn1Lke08mQNgvl0mJvJb3ts1BNvLDeUWAi0utUBNMsAus3yBltMR
	LgVqUKdp8b3iycjRvq2ZKIto/mfrzApL0nwbLvx7BuInLsqRK6f8WmiVlIUI2IDkzIVt
	Q71a5v2SGOCSNyjkOqvZS1kpWvrGaMgbunK0SecBN+dw7NBu2yaqQDlL+SEJRoIBkEPK
	VKm9NQZ5rhNtlhIV3dcufkhgWjuYptIZvCpxeO/VG9fQMpGAf2tS2PDKa03yWjPSL6rS
	Qa7j+pieskxVEVw/5C0dryj9Qcpt83nFC6UbtP3CKh94LGd10X/azIvpnsohQ4S7vrGs
	+1pg==
X-Gm-Message-State: AEkooutAPp5//j1hLq26VR+n/jTgeIgqMD3GUtbF8FBcnCsslgN2d1OF5rfl/fmDTjd7c2FSSolJW/6ZL/MqCw==
X-Received: by 10.157.47.217 with SMTP id b25mr2862082otd.148.1471556406866;
	Thu, 18 Aug 2016 14:40:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.229 with HTTP; Thu, 18 Aug 2016 14:39:36 -0700 (PDT)
In-Reply-To: <CAKmqyKNdnFbHRVsxYNhqQH05XwSv54ES71X-SeveKwCykq2BXw@mail.gmail.com>
References: <cover.1471500427.git.liezhi.yang@windriver.com>
	<CAKmqyKNdnFbHRVsxYNhqQH05XwSv54ES71X-SeveKwCykq2BXw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Aug 2016 14:39:36 -0700
Message-ID: <CAKmqyKPn=KzvZp6JU8k_5ON4FDgGpr1vfUfq9+BoZgeZkaqDKg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Thu, 18 Aug 2016 21:40:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 18, 2016 at 2:36 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Wed, Aug 17, 2016 at 11:15 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Previously, runqemu had hard coded machine knowledge, which limited its
>> usage, for example, qemu can boot genericx86, but runqemu can't, we need
>> edit runqemu/runqemu-internal a lot if we want to boot genericx86.
>>
>> Now bsp conf files can set vars to make it can be boot by runqemu, and
>> qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
>> Please see qemuboot.bbclass' comments on how to set the vars.
>>
>> * Re-write it in python3, which can reduce lines from 1239 to about 750
>>   lines
>> * All the machine knowledges are gone
>> * Most of the TUN_ARCH knowledge are gone except aarch64 and powerpc,
>>   it's not easy to remove the two, so leave them there atm
>> * All the previous options are preserved, and there is a new way to run
>>   runqemu: (it doesn't need run "bitake -e" in such a case)
>>   $ runqemu tmp/deploy/images/qemux86
>>   or:
>>   $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
>>   or:
>>   $ runqemu tmp/deploy/images/qemuarm/qemuboot.py
>> * Fixed audio support, not limited on x86 or x86_64
>> * The kvm support is not limited on x86 or x86_64
>> * Fix SLIRP mode
>> * Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
>>   DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it after
>>   stop.
>> * More bsps can be boot, such as genericx86 and genericx86-64.
>> * The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to
>>   meta-xilinx' mailing list.
>> * I can't find any qemush4 bsp or how to build it, so it is not
>>   considered atm.
>>
>> * Tested the following machines, all of them work well:
>>   genericx86 genericx86-64
>>   qemuarm qemuarm64
>>   qemumips qemumips64 qemuppc
>>   qemux86 qemux86-64
>>   qemuzynq qemuzynqmp
>>
>> And also test "bitbake core-image-sato -ctestimage" which uses runqemu, it
>> also works.
>>
>> // Robert
>>
>> The following changes since commit c86bf80abd87acb0da5860806822c64ec9dee089:
>>
>>   oeqa.buildperf: use oe.path.remove() (2016-08-17 10:35:27 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>>
>> Robert Yang (8):
>>   qemu.inc: inherit qemu-boot.bbclass
>>   arm: set vars for runqemu
>>   qemuarm64.conf: set vars for runqemu
>>   arch-x86.inc: set vars for runqemu
>>   arch-mips.inc: set vars for runqemu
>>   qemuppc.conf: set vars for runqemu
>>   qemuboot.bbclass: add it for runqemu
>>  runqemu: refactor it and remove machine knowledge
>
> Your patches are a different order in the git tree you have above.
> Which one is the correct ordering?

My mistake, just saw that you sent a V2.

Thanks,

Alistair

>
> The idea of this patch set looks great!
>
> Thanks,
>
> Alistair


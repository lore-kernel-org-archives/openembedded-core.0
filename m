Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA777716F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:15:19 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id i199so6812752ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PeFDweYUFKmDg1/u8q9lz/3wA5GtUheQNZYEV3w/rzM=;
	b=kLzg+mTXhlVKcgJYWS0Z4yTdnCrNtnbM9siP7W/UzxCANKrKgFj3AAuUzNTTrduptl
	6epUNU21CievHhMsr2KdjEZ/AIsmMFzbItPL4N8BKOfnsvtmnAEX8vTw8qPJ2WO+8PLV
	Cg72jo5rpZ8KnNl78fFUNzW1hdchJThkOPSzE68k4BtzNxCyWWTQDJZNMT8XZUmj3tlE
	k0VKTIsHSEcImYktdm8j6RaCx15HI10xqFJ7spE6wFqqxcIbgcIesu8SKzmBfVRHpsme
	R/ChClgT4S1gCpdIhPjjhKkKrXN07/xR8CwQFU++JCsZu3nPUcT9ifrp0tArQgYvRRGV
	4cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PeFDweYUFKmDg1/u8q9lz/3wA5GtUheQNZYEV3w/rzM=;
	b=eKOY7JImqNNZgWJzM4HFjn0S14wMFYbsKFuvpnEJPQUf9baU2hhQuotvHBlCcH1Tmr
	Z/ox+GBoXg4K2mjKip8DfPnkW2kXSuqkLMSG6IbJx8K5fWveS1zA4f4oASr1xOpocvbT
	KFhODLgoW9iMPUJ+A3TjejEjGdJWTxfzRzUQJPd40bVkP+xzcZmkh3xcnndT9YbNLc0I
	kKBcsFCaB+oxAnPANVHQBli0+F2Bc+h2vF+GRAC0rVJgYvfZabraEbYABBy/lwFem5f0
	HwLrwR7XiXanIbe6eSAtFBVWcSKIugTv+f6ZcSc49zzFZ81XmgAGgUU6kofJbIEQLL4B
	0GPQ==
X-Gm-Message-State: AEkoousvvyH1NLINaapI93QsDGmM3KM/8qarq9uLXEA+WInIMd1sUtz+eFwMqFlVP1fiRmo2bwlWNmn3sv5qSg==
X-Received: by 10.107.25.14 with SMTP id 14mr91351389ioz.168.1470672920378;
	Mon, 08 Aug 2016 09:15:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.88.4 with HTTP; Mon, 8 Aug 2016 09:15:19 -0700 (PDT)
In-Reply-To: <20160805212511.GO8521@denix.org>
References: <cover.1468862824.git.george.mccollister@gmail.com>
	<1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
	<20160805212511.GO8521@denix.org>
From: George McCollister <george.mccollister@gmail.com>
Date: Mon, 8 Aug 2016 11:15:19 -0500
Message-ID: <CAFSKS=NNMiS+TRRwbpuh2iWChn6DzbE5ZxMgPTEAtoATt5WKsQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] kernel-fitimage: add initramfs support
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
X-List-Received-Date: Mon, 08 Aug 2016 16:15:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 5, 2016 at 4:25 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Jul 18, 2016 at 12:57:55PM -0500, George McCollister wrote:
>> If INITRAMFS_IMAGE is set, build an additional fitImage containing the
>> initramfs. Copy the additional fitImage and the source (*.its) file, used
>> to create it to DEPLOYDIR. The fitImage containing the initramfs must be
>> built before do_deploy and after do_install to avoid circular dependencies.
>>
>> UBOOT_RD_LOADADDRESS - Specifies the load address used by u-boot for the
>>                        initramfs.
>> UBOOT_RD_ENTRYPOINT  - Specifies the entry point used by u-boot for the
>>                        initramfs.
>>
>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>> ---
>>  meta/classes/kernel-fitimage.bbclass | 282 +++++++++++++++++++++++------------
>>  1 file changed, 187 insertions(+), 95 deletions(-)
>>
>> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
>> index 9a3caf5..ede69e7 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -16,7 +16,7 @@ python __anonymous () {
>>
>
> <snip>
>
>
>> +     #
>> +     # Step 3: Prepare a ramdisk section.
>> +     #
>> +     if [ "x${ramdiskcount}" = "x1" ] ; then
>> +             copy_initramfs
>> +             fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>
> May I suggest dropping ${B} here to get the ramdisk path shorter and easier to
> read? It's relative to ${B} anyway - same as all the DTBs...
>
> + fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio

Change made, will be included in the new pull request.
Thanks

>
>> +     fi
>>
>
> <snip>
>
> --
> Denys


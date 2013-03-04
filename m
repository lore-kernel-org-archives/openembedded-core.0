Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UCWL5-00023D-8X
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 15:26:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r24E9XXJ002307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2013 06:09:33 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Mar 2013 06:09:33 -0800
Message-ID: <5134AB1B.8010600@windriver.com>
Date: Mon, 4 Mar 2013 22:09:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1362217827.git.liezhi.yang@windriver.com>
	<1362224344.11004.14.camel@ted> <5133852E.2010504@linux.intel.com>
	<513394C2.6030004@linux.intel.com> <5134A4BD.9030201@windriver.com>
In-Reply-To: <5134A4BD.9030201@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Fully support ext3/ext4 rootfs generation
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
X-List-Received-Date: Mon, 04 Mar 2013 14:26:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/04/2013 09:42 PM, Robert Yang wrote:
>
>
> On 03/04/2013 02:21 AM, Darren Hart wrote:
>>
>>
>> On 03/03/2013 09:15 AM, Darren Hart wrote:
>>>
>>>
>>> On 03/02/2013 03:39 AM, Richard Purdie wrote:
>>>> On Sat, 2013-03-02 at 18:46 +0800, Robert Yang wrote:
>>>>> Replace genext2fs with populate-extfs.sh in image_types.bbclass to fully
>>>>> support ext3/ext4 rootfs.
>>>>>
>>>>> Comments from Darren:
>>>>> We used genext2fs to create ext3/ext4 rootfs in the past, basically,
>>>>> genext2fs doesn't support creating ext4 filesystems. It creates, as I
>>>>> understand it, an ext2 filesystem, then adds a journal, and sets some
>>>>> bits. It can't support the newer features like extents. So what we end
>>>>> up with is a bit of a hack for a filesystem.
>>>>>
>>>>> The ext tools (e2fsprogs) unfortunately don't provide an integrated
>>>>> solution for generating prepopulated filesystem images as many other
>>>>> mkfs* tools do. One thing missing was symlink support in libext2fs. I
>>>>> added that support and demonstrated a script which uses the e2fsprogs
>>>>> debugfs tool that can populate the newly formatted filesystem from a
>>>>> directory and without root privileges.
>>>>>
>>>>> This patches integrate this stage of development into OE-Core. We can
>>>>> go about this in two ways. One is to just prototype this in a branch and
>>>>> use it to validate the functionality and not make any changes to oe-core
>>>>> image generation until mke2fs has initial directory support. The other
>>>>> is to merge this and get broader testing of the concept and later move
>>>>> to the full mke2fs implementation once it becomes available. I
>>>>> understand the resistance to the latter, but long term I think it will
>>>>> result in a more robust solution as we will have caught more of the
>>>>> corner cases and have been able to do a better job integrating into
>>>>> mke2fs the first time.
>>>>>
>>>>>
>>>>> * Impact:
>>>>>    + Rootfs generation time:
>>>>>      - For a core-image-minimal image, about more 3 seconds are needed
>>>>>      - For a core-image-sato image, about more 15 seconds are needed
>>>>>
>>>>>    + Disk space usage:
>>>>>      - Nearly no changes:
>>>>>      $ ls -lh BEFORE.rootfs.ext3 AFTER.rootfs.ext3 | awk '{print $5"\t"$NF}'
>>>>>      357M BEFORE.rootfs.ext3
>>>>>      357M AFTER.rootfs.ext3
>>>>>
>>>>>      $ du -sh BEFORE.rootfs.ext3 AFTER.rootfs.ext3
>>>>>      238M    BEFORE.rootfs.ext3
>>>>>      357M    AFTER.rootfs.ext3
>>>>>      # This is different because BEFORE.rootfs.ext3 has sparse files,
>>>>>      # they are very similar (less than 1M gap) after mount them and run
>>>>>      # "du -sh".
>>>>
>>>> I can live with the performance issues however as I understand this
>>>> code, its breaking both sparse files and also likely hardlinked files.
>>>> I'm not sure we have many sparse ones but we do have packages with heavy
>>>> hardlinking (the sdk image toolchain packages for example).
>>>>
>>>> Adding the script to e2fsprogs isn't a problem but I am tempted to wait
>>>> until this work is completed before we start using it instead of
>>>> genext2fs.
>>>
>>>
>>> Agreed, I thought we were within 1MB on size from my reading of the
>>> previous discussion. Robert, do you have any thoughts on what is needed
>>> to address the hardlinks? That seems like something we should be able to
>
> Yes, we do have hard links in the rootfs, e.g: core-image-sato and
> core-image-sato-sdk:
>
> # The sato
> $ find core-image-sato/1.0-r0/rootfs/ -type f -printf "%p %i %n\n" | grep -v '1$'
> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt200 26977609 2
> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt220 26977609 2
> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld.bfd 26978690 2
> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld 26978690 2
>
> # The sato-sdk:
> $ find core-image-sato-sdk/1.0-r0/rootfs/ -type f -printf "%p %i %n\n" | grep -v
> '1$'
> core-image-sato-sdk/1.0-r0/rootfs/etc/terminfo/v/vt200 26903519 2
> core-image-sato-sdk/1.0-r0/rootfs/etc/terminfo/v/vt220 26903519 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/include/et/com_err.h 28058656 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/include/com_err.h 28058656 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld.bfd 26900939 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/perlbug 26899680 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/gawk-4.0.1 26900368 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/psed 26899667 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/s2p 26899667 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/c2ph 26899695 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/perlthanks 26899680 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/pstruct 26899695 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld 26900939 2
> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/gawk 26900368 2
>
> We can make hard links according to these information, and the find command is
> very fast, so it would not cost much time.
>
>
>>> address quickly.
>>>
>>> Same question for the sparse files, although I could see that taking
>>> some additional effort.
>>
>
> I don't find any obvious sparse files by the following command:
>

Sorry, we do have several sparse files, the command was wrong, it should be:

# sato:

$ find core-image-sato/1.0-r0/rootfs/ -size +8 -printf "%p #%S\n" | grep -v '#1'
core-image-sato/1.0-r0/rootfs/var/lib/rpm/Sha1header #0.916667
core-image-sato/1.0-r0/rootfs/var/lib/rpm/log/log.0000000001 #0.837109
core-image-sato/1.0-r0/rootfs/var/lib/rpm/Filedigests #0.857143

3 files

# sato-sdk:
$ find core-image-sato-sdk/1.0-r0/rootfs/ -size +8 -printf "%p #%S\n" | grep -v '#1'
core-image-sato-sdk/1.0-r0/rootfs/var/lib/rpm/Sigmd5 #0.904762
core-image-sato-sdk/1.0-r0/rootfs/var/lib/rpm/Sha1header #0.857143
core-image-sato-sdk/1.0-r0/rootfs/var/lib/rpm/log/log.0000000007 #0.150781
core-image-sato-sdk/1.0-r0/rootfs/var/lib/rpm/Filedigests #0.847619

4 files

I don't have any good ideas on how to fix the sparse files currently, it seems
that we should modify the debugfs' "write" command to let it can create the
sparse files, just like cp's --sparse=WHEN.

// Robert

> # sato:
> $ find core-image-sato/1.0-r0/rootfs/ -size +8 -printf "%p #%S\n" | grep -v
> '#0\|#1' | wc -l
> 0
>
> # sato-sdk:
> $ find core-image-sato-sdk/1.0-r0/rootfs/ -size +8 -printf "%p #%S\n" | grep -v
> '#0\|#1' | wc -l
> 0
>
> I will send an official patch for review with the hard links solution if you
> are fine with it.
>
> // Robert
>
>
>> By the way, this is exactly the kind of thing we were hoping to catch by
>> using the debugfs as an intermediate step. If anything needs to be added
>> to libext2fs, we want to know before we jump into the mke2fs solution.
>> So this is working as planned - just maybe sooner than expected, which
>> is great.
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



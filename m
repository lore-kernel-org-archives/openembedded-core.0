Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4C986011C;
	Tue, 24 Nov 2015 13:47:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAODle6Q021808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Nov 2015 05:47:40 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 Nov 2015 05:47:39 -0800
To: Roman Khimov <roman@khimov.ru>, <openembedded-devel@lists.openembedded.org>
References: <56538808.5050606@linux.intel.com> <14934048.INuFbpGn5J@bancha.hex>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <56546A7A.6010207@windriver.com>
Date: Tue, 24 Nov 2015 07:47:38 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <14934048.INuFbpGn5J@bancha.hex>
Cc: yocto@yoctoproject.org, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 13:47:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 11/24/15 4:39 AM, Roman Khimov wrote:
> В письме от 23 ноября 2015 15:41:28 пользователь Mariano Lopez написал:
>> 1. Use a separate partition for the configuration.
>>    a. The pro of this method is the partition is not touched during the
>> update.
>>    b. The con of this method is the configuration is not directly in
>> rootfs (example: /etc).
> 
> That's the right solution, although to do it really right (at least IMO) you 
> need to implement the /usr merge [1] (and that's orthogonal to using or not 
> using systemd), which can also help you make your /usr read-only (because 
> that's just code and static data) with read-write / for user data of various 
> sorts.

Why does merging /usr have anything to do with this?  I've read the case for
merging /usr and / and still don't understand why it "helps".  The key is that
if you have separate partitions for /usr and /, then you need to update both of
them in sequence.  Merging these two just seems like a lazy solution to people
not wanting to deal with early boot being self-contained.

Also having a separate / from /usr can help with '/' be your maintenance
partition in some cases.

>> 3. Have an OverlayFS for the rootfs or the partition that have the
>> configuration.
>>    a. The pro is the configuration is  "directly" in rootfs.
>>    b. The con is there is need to provide a custom init to guarantee the
>> Overlay is mounted before the boot process.
> 
> And this is the approach I would recommend not doing. I've used UnionFS for 
> thing like that (overlaying whole root file system) some 6 years ago, it 
> sounded nice and it kinda worked, but it wasn't difficult to make it fail 
> (just a little playing with power), we've even seen failures on production 
> devices, like when you have whiteout file for directory already written, but 
> don't have new files in it yet and that can completely ruin the system.
> 
> Also, it usually works better when you don't have any changes in the lower 
> layer, but we're talking about updating it here, you can easily end up in a 
> situation where you have updated something in the rootfs but that was 
> overriden by upper layer and thus your user doesn't see any change.

When using overlayfs, I'd strongly recommend not doing it over the entire
rootfs.  This is generally a bad idea for the reasons stated above.

However, overlaying a part of the rootfs often makes sense.  /etc is a good
example.  This way applications that want their configurations in /etc can still
have it that way -- and there is always a (hopefully) reasonable default
configuration, should the configuration 'partition' get corrupted.  So worst
case the user can start over on configurations only.

For applications and user data, these can and should be stored outside of the
main rootfs.  The FHS/LSB recomment '/opt', but while it doesn't matter if it's
-actually- /opt, the concept itself is good.


So going back to image upgrade.  The key here is that you need a way to update
arbitrary images with arbitrary contents and a mechanisms that is smart enough
to generate the update (vs a full image flash) to conserve bandwidth.

I still contend it's up to the device to be able to configure the system on how
to get the update and where to apply the update.  The tooling (host and target)
should simply assist with this.

Delta updates need version information in order to know they're doing the right
sequence of updating.

Full updates don't, but should be sent in a format that limits "empty space",
effectively send them as sparse files.

On many devices you will need to flash as part of the download due to space
limitations.

And you need the ability to flash multiple partitions.

maintenance
/
/usr
data

etc..  whatever it takes to either upgrade or restore the device.

--Mark

>> With the above information I'm proposing to use a separate partition for
>> the configuration; this is because is more reliable and doesn't require
>> big changes in the current architecture.
>>
>> So, the idea is to have 4 partitions in the media:
>> 1. boot. This is the usual boot partition
>> 2. data. This will hold the configuration files. Not modified by updates.
>> 3. maintenance. This partition will be used to update rootfs.
>> 4. rootfs. Partition used for normal operation.
> 
> You probably don't need to separate 1 and 3, all the code for system update 
> should easily fit into initramfs and just making /boot a bit larger would 
> allow you to store some backup rootfs.
> 
> Also, you can swap 4 and 2 which will be useful if you're installing on 
> different sized storage devices, usually you know good enough the size of your 
> rootfs, but you probably want to leave more space for user data if there is an 
> opportunity to do so, that's just easier to do with data partition at the end.
> 
> [1] http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
> 



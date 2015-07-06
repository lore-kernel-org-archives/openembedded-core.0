Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A555A65C78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 21:16:28 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 17600F811E2; Mon,  6 Jul 2015 15:16:27 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 85D7DF811E2;
	Mon,  6 Jul 2015 15:16:27 -0600 (MDT)
Message-ID: <559AF033.6090904@mlbassoc.com>
Date: Mon, 06 Jul 2015 15:16:35 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1436177709.git.alejandro.hernandez@linux.intel.com>	<41e68bf09d809269524babaae2911a7c41e38351.1436177709.git.alejandro.hernandez@linux.intel.com>	<20150706201018.GD2436@jama>
	<559AEEAC.8080005@linux.intel.com>
In-Reply-To: <559AEEAC.8080005@linux.intel.com>
Subject: Re: [PATCH 1/1] opkg-build: Ignore tar error due to hardlinks issue when creating ipk files
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
X-List-Received-Date: Mon, 06 Jul 2015 21:16:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-06 15:10, Alejandro Hernandez wrote:
> On 06/07/15 15:10, Martin Jansa wrote:
>> On Mon, Jul 06, 2015 at 10:17:19AM +0000, Alejandro Hernandez wrote:
>>
>> +
>> +This a similar behavior to the one on dpkg:
>> +http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
>> +
>> +Upsteam-Status: Inappropriate
>> Typo and why is it inappropriate? Looks like bugfix to me, even for
>> issue which usually happens in OE way of using opkg-build.
>
> It seemed inappropriate to me, since this behavior is not expected (number of hardlinks changing), we can't say for sure that this error will be caused by this reason on when using
> opkg on another environment
>> -SRC_URI = "git://git.yoctoproject.org/opkg-utils"
>> +SRC_URI = "git://git.yoctoproject.org/opkg-utils "
>> +
>> +SRC_URI_append_class-native = "file://tar_ignore_error.patch"
>> Add leading space in append not in original SRC_URI variable.
>>
>> Why is it applied only for native anyway?
>
> Same argument as before, modifying the number of hardlinks while the tar is created happens when building using bitbake, which should not happen on target, if files changed when
> creating an ipk for any other reason it shouldn't be ignored; space was a typo

Why is it happening when using bitbake?  This seems like an
error to me - one should not be generating the tarball (i.e.
packing up the final results) if the set of files being packaged
is changing in any way.

Note: I'm pretty sure that error can also happen if the inode
changes in many different ways, not just the number of links
changing.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


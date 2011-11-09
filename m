Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wolfram.stering@hale.at>) id 1RO6vf-0002Ce-0x
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:06:55 +0100
Received: from [62.99.145.17] (port=32505 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <wolfram.stering@hale.at>) id 1RO6pb-000733-2Z
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:00:39 +0100
Received: from [83.64.51.210] (port=13299 helo=gateway1.hale)
	by smartmx-15.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <wolfram.stering@hale.at>)
	id 1RO6pY-0002Cw-GY for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:00:36 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pA9C0cPw029140
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 13:00:38 +0100
Received: from entw42.hale ([192.168.100.73]) by hale.at with MailEnable ESMTP;
	Wed, 9 Nov 2011 13:00:30 +0100
Message-ID: <4EBA6B5D.6050005@hale.at>
Date: Wed, 09 Nov 2011 13:00:29 +0100
From: Wolfram Stering <wolfram.stering@hale.at>
Organization: HALE electronic GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>	<4EB90155.3070705@hale.at>
	<1320761558.10843.39.camel@ted>	<4EB9507C.8060507@hale.at>
	<CAPhnLPACHNsFC6rx1uNOcLKgn68D6qeTYcN=VGns+eRAEqKstw@mail.gmail.com>
In-Reply-To: <CAPhnLPACHNsFC6rx1uNOcLKgn68D6qeTYcN=VGns+eRAEqKstw@mail.gmail.com>
X-Enigmail-Version: 1.1.2
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pA9C0cPw029140
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: wolfram.stering@hale.at
MailScanner-NULL-Check: 1321444838.38494@NMJPNjjqdZ+wTS41yDIquA
X-Spam-Status: No
Subject: Re: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on non physical disks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2011 12:06:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 11/08/2011 04:57 PM, Flanagan, Elizabeth wrote:
> On Tue, Nov 8, 2011 at 7:53 AM, Wolfram Stering <wolfram.stering@hale.at> wrote:
>> On 11/08/2011 03:12 PM, Richard Purdie wrote:
>>> On Tue, 2011-11-08 at 11:15 +0100, Wolfram Stering wrote:
>>>> On 11/02/2011 07:41 AM, Beth Flanagan wrote:
>>>>> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>>>>>
>>>>> tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies
>>>>> buildstats to not collect diskio statistics when we encounter a case where
>>>>> the os.major/os.minor is not represented with an entry in /proc/diskstats.
>>>> A similar issue exists for building on a btrfs partition.
>>>> I posted a message on Oct 28 concerning buildstats on btrfs volumes.
>>>> The problem there is, that btrfs's stat() reports fake device ids that
>>>> cannot be found in /proc/diskstats.
>>> Did this patch help address that problem for you too?
>> I'll be able to check that tomorrow and report back.
> It should as the patch will just disable diskio collection if it
> cannot find a valid device id in /proc/diskstats. Let me know if it
> doesn't and I'll rework it and resubmit.
>
> -b

Your patch fixes the buildstats issue for building on a btrfs volume as
well.
bitbake no longer hits the exception and diskstats are omitted.

Theoretically, this information would be available for btrfs, but it is
not discoverable
in the way buildstats currently collects the disk statistics. However,
this is a seaprate
issue, I think.

Thanks a lot for fixing this,

-wolfi

-- 
Wolfram Stering
 (Entwicklung)
HALE electronic GmbH
Eugen-Müller-Straße 18, 5020 Salzburg, Austria
 Tel: +43 (662) 439011 550
 Fax: +43 (662) 439011 9
http://www.hale.at/
Firmenbuchnummer: FN 66801m HG Salzburg



--
Scanned by MailScanner.




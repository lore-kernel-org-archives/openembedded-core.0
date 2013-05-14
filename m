Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Uc69l-0008EG-1s
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 05:44:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4E3PjLh005534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 20:25:45 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 13 May 2013 20:25:46 -0700
Message-ID: <5191AEC3.2050503@windriver.com>
Date: Tue, 14 May 2013 11:25:55 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1368054238-21389-1-git-send-email-jslater@windriver.com>
	<CAJTo0LZW4aw9eKoXg5zZhV9-ncSWpWD=AfgW45HQrQadqZatAw@mail.gmail.com>
	<518D6DF1.6080903@linux.intel.com>
	<007BD92917A2324FA403BCF9A464CF8436FC4D2B@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8436FC4D2B@ALA-MBA.corp.ad.wrs.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 1/1] sysvinit: modify bootlog location
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
X-List-Received-Date: Tue, 14 May 2013 03:44:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2013 06:36 AM, Slater, Joseph wrote:
>
>> -----Original Message-----
>> From: Saul Wold [mailto:sgw@linux.intel.com]
>> Sent: Friday, May 10, 2013 3:00 PM
>> To: Burton, Ross; Slater, Joseph
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/1] sysvinit: modify bootlog location
>>
>> On 05/10/2013 02:42 AM, Burton, Ross wrote:
>>> On 9 May 2013 00:03, Joe Slater <jslater@windriver.com> wrote:
>>>> The default location for bootlog is volatile,
>>>> so we change it to something that is not.
>>> If this is a problem, why not make /var/log not volatile?  I never
>>> understood why the log directory was volatile to be honest.
>>>
>> How would we handle the Read-Only FS situation?
> Maybe we could change around the creation of bootlogd.log such that,
> if /var/local were not writeable, we'd stick it in /var/log.
>
> Joe
>
Hi all,

I once wanted to make /var/log not volatile, but then I realised that 
not preserving logs between reboots doesn't seem to bother any user, so 
I dropped the patches and marked the bug NOTABUG.
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3397)

So the key problem here is, are we going to preserve logs between reboots?

If so, we can make /var/log not volatile, in the same way Laurentiu did 
with /var/cache, and add the following lines to the 
read-only-rootfs-hook.sh script to make things work in case of a 
read-only filesystem.

mkdir -p /var/volatile/log
mount --bind /var/volatile/log /var/log

Best Regards,
Chen Qi


>> Sau!
>>
>>> Ross
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>




Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Te0bg-0001ue-6b
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 10:40:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAT9QF7T001098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Nov 2012 01:26:16 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 29 Nov 2012 01:26:14 -0800
Message-ID: <50B72A4E.4010107@windriver.com>
Date: Thu, 29 Nov 2012 17:26:38 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
References: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
	<50B5763B.1040107@windriver.com>
	<CAP9ODKpyi3Hs1B8C9OovatGG2VxukWU9pdip2HMTMFjJn9FSJQ@mail.gmail.com>
	<A8A2F4C5E3D3D0468DDA3544476725F85BC7EE51@EU-MBX-04.mgc.mentorg.com>
In-Reply-To: <A8A2F4C5E3D3D0468DDA3544476725F85BC7EE51@EU-MBX-04.mgc.mentorg.com>
X-Originating-IP: [128.224.163.154]
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
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
X-List-Received-Date: Thu, 29 Nov 2012 09:40:39 -0000
X-List-Received-Date: Thu, 29 Nov 2012 09:40:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

So the question would be:
Is it reasonable to always intall udev under /lib?

udev's user manual seems to imply this behavior.

Thanks,
Chen Qi

On 11/28/2012 07:09 PM, Shakeel, Muhammad wrote:
> If we ensure that udev will always be found in /lib/udev/udevd then this patch will not be required.
>
> Actually I needed this patch to start udev on a mips64 target where ${base_libdir} is '/lib64' and original udev init script was failing to start udev.
> (I am not using initramfs).
>
> --Shakeel
>
> -----Original Message-----
> From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio Salvador
> Sent: Wednesday, November 28, 2012 3:52 PM
> To: ChenQi
> Cc: Shakeel, Muhammad; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
>
> On Wed, Nov 28, 2012 at 12:26 AM, ChenQi<Qi.Chen@windriver.com>  wrote:
>> On 11/27/2012 10:15 PM, Otavio Salvador wrote:
>>> On Tue, Nov 27, 2012 at 10:57 AM, Shakeel, Muhammad
>>> <muhammad_shakeel@mentor.com>   wrote:
>>>> From: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>>>
>>>>    From udev 174 changelog:
>>>> "The udev daemon moved to /lib/udev/udevd. Non-systemd init systems
>>>> and non-dracut initramfs image generators need to change the init
>>>> scripts. Alternatively the udev build needs to move udevd back to
>>>> /sbin or create a symlink in /sbin, which is not done by default."
>>>>
>>>> Also for 64 bit architectures there exists /lib64/udev instead of
>>>> /lib/udev and current init script fails to start udev.
>>>>
>>>> Signed-off-by: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>> As far as I know, all code in master now handles it properly (the
>>> missing bits I sent a patch today) so why to include this symlink?
>>>
>> I'm not sure about this.
>>
>> Two things:
>>
>> 1) Have we ever tested udev on a target where its ${base_libdir} is
>> '/lib64'?
>> Apparently, if udevd is intalled under '/lib64', its init script
>> cannot start udev correctly.
>>
>> 2) Bug#2804 is related to to udev and ${base_libdir}.
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2804
>> (Some packages hardcode their udev rules directory to be
>> '/lib/udev/rules.d/'. So can udev find them if the ${base_libdir} is
>> '/lib64'? )
> It seems the right fix for it is to ensure udev is always installed in /lib/udev/udevd (for all targets) as you propose to do for the rules.d directory.
>




Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SSakJ-0002ZO-U2
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:18:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4AL84p0019554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:08:04 -0700 (PDT)
Received: from msp-dhcp22.wrs.com (172.25.34.22) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 10 May 2012 14:08:04 -0700
Message-ID: <4FAC2E33.7020204@windriver.com>
Date: Thu, 10 May 2012 16:08:03 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
	<CAMKF1spfSiBy0F-cP7Q2NYT2dg2CFqvfXxuxR_=-F2o8gdBwGw@mail.gmail.com>
	<4FAC27A1.70902@windriver.com>
	<CAMKF1sp3RJsrUC5befeKBn+sDQNw2wpUvO2Co+O9eSAhJ5BiLA@mail.gmail.com>
In-Reply-To: <CAMKF1sp3RJsrUC5befeKBn+sDQNw2wpUvO2Co+O9eSAhJ5BiLA@mail.gmail.com>
Subject: Re: [PATCH] e2fsprogs: fix packaging error for libext2fs
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
X-List-Received-Date: Thu, 10 May 2012 21:18:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/12 3:48 PM, Khem Raj wrote:
> On Thu, May 10, 2012 at 1:40 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 5/10/12 3:30 PM, Khem Raj wrote:
>>>
>>> On Thu, May 10, 2012 at 1:03 PM, Andreas Oberritter
>>> <obi@opendreambox.org>    wrote:
>>>>
>>>>
>>>> -FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
>>>> +FILES_libext2fs = "${libdir}/e2initrd_helper
>>>> ${base_libdir}/libext2fs.so.*"
>>>
>>>
>>> its probably not a good idea to mix files from libdir and base_libdir
>>> in a single
>>> package. Since lately we have been accommodating /usr to be mounted
>>> independently.
>>
>>
>> I am assuming the e2initrd_helper is an libexec component...  Will
>
> but its being installed into ${libdir}/e2initrd_helper I dont think
> libdir will exist initially.

package install/image creation expects the full filesystem to be mounted.  It's 
only during boot that partial mounts may exist.

I don't know what the e2initrd_helper does.. if it's required for booting, then 
it's needed in /... (or if libext2fs can't run w/o it.)

--Mark

>> libext2fs.so.* still work (during initial boot) w/o the libexec component?
>>   (I am assuming it will...)
>>
>> So this looks correct to me.  The split packages can have mixed base and
>> prefixed components... it's the filesystem that we hope will work without
>> the /usr being mounted.  But if the library requires an item in /usr, then
>> we may have to move that item to /lib as well....
>>
>> --Mark
>>
>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




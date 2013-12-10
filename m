Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E4D26E26F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 02:25:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBA2PReM025355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Dec 2013 18:25:27 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 9 Dec 2013 18:25:28 -0800
Message-ID: <52A67BC9.4040902@windriver.com>
Date: Tue, 10 Dec 2013 10:26:17 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>
References: <cover.1386558973.git.Qi.Chen@windriver.com>
	<c20f79f4a812a4e007413751e3cabf63a4f5e6ec.1386558973.git.Qi.Chen@windriver.com>
	<CAP9ODKpv76jtiMqmg3eCJ1TYzvrhBESQMfQF5rVeT2XgJHR0tw@mail.gmail.com>
	<CAAQYJAs9j=VJ+L=sLsLG1H1hs3brarksgqtijE8v2Wr35HCSQQ@mail.gmail.com>
In-Reply-To: <CAAQYJAs9j=VJ+L=sLsLG1H1hs3brarksgqtijE8v2Wr35HCSQQ@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: default USE_DEVFS to '1'
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
X-List-Received-Date: Tue, 10 Dec 2013 02:25:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2013 09:52 PM, Andrea Adami wrote:
> On Mon, Dec 9, 2013 at 12:52 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> Hello,
>>
>> I agree with the commit but ...
>>
>> On Mon, Dec 9, 2013 at 1:17 AM,  <Qi.Chen@windriver.com> wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Default USE_DEVFS to "1" so that the `makedevs' command is not run
>>> at rootfs time by default. There are mainly two reasons to do so.
>>> 1. This will fix a build failure with initramfs-kexecboot-klibc-image.
>> Can you elaborate this error? is it something we can/should fix?
>>
>>> 2. Most of our images use a filesystem over /dev. Most of the time, it's
>>>     just devtmpfs. So we actually are using a filesystem over /dev.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/classes/image.bbclass |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>> index cc65e35..b8bd462 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -77,7 +77,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
>>>   # Images are generally built explicitly, do not need to be part of world.
>>>   EXCLUDE_FROM_WORLD = "1"
>>>
>>> -USE_DEVFS ?= "0"
>>> +USE_DEVFS ?= "1"
>>>
>>>   PID = "${@os.getpid()}"
>>>
>>> --
>>> 1.7.9.5
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> The underlying issue here is the extra pass of makedevs  " makedevs:
> No entry for root in search list "
>
> At first I could not understand why that was *not* happening on my
> builds then I realized we set
> IMAGE_DEVICE_TABLES = "" in our machine.conf because we use devtmpfs
> for all images.
>
> qemux86 does instead inherit the default setting of image.bbclass so
> it uses "files/device_table-minimal.txt"
>
>
> Cheers
>
> Andrea
>
>

Thanks for you extra information.

Best Regards,
Chen Qi



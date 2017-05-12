Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 2041 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 May 2017 15:14:51 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 26EEB65D35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 15:14:51 +0000 (UTC)
To: Denys Dmytriyenko <denis@denix.org>,
	Belisko Marek <marek.belisko@gmail.com>
References: <1494524580-21718-1-git-send-email-marek.belisko@open-nandra.com>
	<20170511181928.GB28053@denix.org>
	<CAAfyv35qUs=f3SPk=jNzwJOA+czWhT=3VQ0GKbjG7c2+z0Kv0A@mail.gmail.com>
	<20170511222838.GE28053@denix.org>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <0294f116-1611-c414-d5f8-fab410b35a9d@embed.me.uk>
Date: Fri, 12 May 2017 15:40:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170511222838.GE28053@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-support: Add recipe for libgpiod
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
X-List-Received-Date: Fri, 12 May 2017 15:14:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 11/05/17 23:28, Denys Dmytriyenko wrote:
> On Thu, May 11, 2017 at 08:50:09PM +0200, Belisko Marek wrote:
>> On Thu, May 11, 2017 at 8:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>> Not to derail your enthusiasm, but since this is being proposed for OE-Core,
>>> how is it better than libsoc by Jack Mitchell?
>> libsoc is fine but libgpiod will implement correctly gpio handling in
>> userspace as gpio sysfs is deprecated.
>> What is the problem to have libgpiod available for other potential
>> users? Thanks.
> As far as I know, libsoc is still being actively supported and if there's an 
> API change, it should be fixed in no time. That's why I'm copying Jack here, 
> who is an active OE developer here.
>
> As of having an alternative for other potential users - there's nothing wrong 
> with it. But, acceptance criteria into OE-Core is quite high, especially when 
> there are alternative solutions already available. That's why I'm asking if 
> it's any better than the other solution. In other words, why libgpiod should 
> be accepted to OE-Core, but not libsoc? Maybe it should be submitted to 
> meta-openembedded layer instead?

I would agree that this should go in meta-oe.

I haven't implemented the new ioctl interface yet in libsoc and there is
no reason why there can't be two libraries with similar functionallity.

Cheers,
Jack.

>
>
>> More here: https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1392949.html
>>>
>>> On Thu, May 11, 2017 at 07:43:00PM +0200, Marek Belisko wrote:
>>>> libgpiod - C library and tools for interacting with the linux GPIO
>>>> character device
>>>>
>>>> Since linux 4.8 the GPIO sysfs interface is deprecated.
>>>> User space should use the character device instead.
>>>> This library encapsulates the ioctl calls and data structures behind a
>>>> straightforward API.
>>>>
>>>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>>>> ---
>>>>  meta/recipes-support/libgpiod/libgpiod_0.2.bb | 25 +++++++++++++++++++++++++
>>>>  1 file changed, 25 insertions(+)
>>>>  create mode 100644 meta/recipes-support/libgpiod/libgpiod_0.2.bb
>>>>
>>>> diff --git a/meta/recipes-support/libgpiod/libgpiod_0.2.bb b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
>>>> new file mode 100644
>>>> index 0000000..fe2cd80
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
>>>> @@ -0,0 +1,25 @@
>>>> +SUMMARY = "C library and tools for interacting with the linux GPIO character device"
>>>> +HOMEPAGE = "https://github.com/brgl/libgpiod"
>>>> +
>>>> +LICENSE = "LGPLv2.1+"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
>>>> +
>>>> +UPSTREAM_CHECK_URI = "https://github.com/brgl/libgpiod/releases"
>>>> +
>>>> +SRC_URI = "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"
>>>> +
>>>> +SRC_URI[md5sum] = "e3430f35b6efa842693d659c0bfb7ad5"
>>>> +SRC_URI[sha256sum] = "de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92"
>>>> +
>>>> +inherit autotools pkgconfig
>>>> +
>>>> +# enable tools
>>>> +PACKAGECONFIG ?= "tools"
>>>> +
>>>> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
>>>> +PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
>>>> +
>>>> +PACKAGES += " ${PN}-tools"
>>>> +
>>>> +FILES_${PN} = "${libdir}/*"
>>>> +FILES_${PN}-tools = "${bindir}/*"
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> BR,
>>
>> marek
>>
>> -- 
>> as simple and primitive as possible
>> -------------------------------------------------
>> Marek Belisko - OPEN-NANDRA
>> Freelance Developer
>>
>> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> Tel: +421 915 052 184
>> skype: marekwhite
>> twitter: #opennandra
>> web: http://open-nandra.com
>>



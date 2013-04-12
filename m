Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UQkaP-00056Z-CS
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 22:28:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3CKBDai014447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Apr 2013 13:11:14 -0700 (PDT)
Received: from msp-dhcp59.wrs.com (172.25.34.59) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 12 Apr 2013 13:11:14 -0700
Message-ID: <51686A5F.5010202@windriver.com>
Date: Fri, 12 Apr 2013 15:11:11 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1365795733-25014-1-git-send-email-mark.hatle@windriver.com>
	<CADkTA4Nxoa2=q8++zuJyoa-eHCYa+Q1bf-r1Eu8z4h4Li7xzOw@mail.gmail.com>
In-Reply-To: <CADkTA4Nxoa2=q8++zuJyoa-eHCYa+Q1bf-r1Eu8z4h4Li7xzOw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hello-mod: Ensure the produced package name begins with kernel-module-
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
X-List-Received-Date: Fri, 12 Apr 2013 20:28:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/13 3:06 PM, Bruce Ashfield wrote:
> On Fri, Apr 12, 2013 at 3:42 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> The special key kernel-module- is necessary for the system to avoid a package
>> rename when installing a multilib image.  For example:
>>
>> local.conf: IMAGE_INSTALL_append = " hello-mod"
>>
>> bitbake lib32-core-image-minimal
>>
>> The system will translate names and prepend 'lib32-', unless the package
>> begins with kernel-module-.
>
> Mark and I were talking about this, and since this is something that is required
> in a multlib system, and an external module has gone to the trouble of
> inheriting
> module.bbclass, and we have the kernel-module-split.bbclass, that this
> is something
> we should be able to programatically do and generate the package names that
> meet the expectations of the system.
>
> I suggested a bugzilla and we can tackle this at the front end of the upcoming
> dev cycle.

YP bugzilla # 4286

> I think that's reasonable, if anyone knows of a reason why this absolutely can't
> be done automatically .. or I'm out to lunch, I'm happy to have my
> redirect, NAK'd :)
>
> Cheers,
>
> Bruce
>
>
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
>> index 64a6dda..621f700 100644
>> --- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
>> +++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
>> @@ -13,3 +13,11 @@ SRC_URI = "file://Makefile \
>>             "
>>
>>   S = "${WORKDIR}"
>> +
>> +# Kernel module packages MUST begin with 'kernel-module-', otherwise
>> +# multilib image generation can fail.
>> +#
>> +# The following line is only necessary if the recipe name does not begin
>> +# with kernel-module-.
>> +#
>> +PKG_${PN} = "kernel-module-${PN}"
>> --
>> 1.8.1.2.545.g2f19ada
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>




Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 3D10077D12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:07:26 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id E1D2368A01C; Wed, 21 Jun 2017 07:07:26 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 020E368A019;
	Wed, 21 Jun 2017 07:07:25 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 2C2C7674031A;
	Wed, 21 Jun 2017 08:07:25 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
	<20170620205349.GA19584@zardoz.amer.corp.natinst.com>
	<89778545-bbd2-56d0-a636-b0c182079b05@denx.de>
	<20170621023324.GA20875@zardoz.amer.corp.natinst.com>
	<20170621052258.GP28053@denix.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <86aea3bf-3f8e-b4bd-abb1-ffd500d4bb0d@mlbassoc.com>
Date: Wed, 21 Jun 2017 08:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170621052258.GP28053@denix.org>
Subject: Re: [RFC] u-boot-fw-utils: Allow target-specific fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 06:07:29 -0000
X-Groupsio-MsgNum: 99156
Content-Type: multipart/mixed; boundary="------------16D1CEAFA9BB7F9ADDFDEF97"
Content-Language: en-US

--------------16D1CEAFA9BB7F9ADDFDEF97
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-06-21 07:22, Denys Dmytriyenko wrote:
> On Tue, Jun 20, 2017 at 09:33:24PM -0500, Brad Mouring wrote:
>> On Tue, Jun 20, 2017 at 10:59:55PM +0200, Marek Vasut wrote:
>>> On 06/20/2017 10:53 PM, Brad Mouring wrote:
>>>> On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
>>>>> On 06/20/2017 10:40 PM, Brad Mouring wrote:
>>>>>> As implemented currently, the fw-utils recipe does not allow for
>>>>>> ...
>>>>>> +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
>>>>>> +# By default, use the default included in the U-Boot source
>>>>>> +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
>>>>>> +
>>>>>>   inherit uboot-config
>>>>>>   
>>>>>>   do_compile () {
>>>>>> @@ -19,7 +24,7 @@ do_install () {
>>>>>>   	install -d ${D}${sysconfdir}
>>>>>>   	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>>>>>>   	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
>>>>>> -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
>>>>>> +	install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
>>>>>
>>>>> Do we really need yet another variable ? Wouldn't it make more sense to
>>>>> add do_install_append_yourmachine() {} in your meta-whatever to
>>>>> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?
>>>>
>>>> This is (kinda) what we were doing, there was some discussion as to
>>>> whether or not this made sense upstream.
>>>
>>> Link?
>>
>> I know it's not a great answer, but we've not pushed the version of the
>> branch where these changes are going in. Eventually, they'll end up in
>> this repo:
>>
>> https://github.com/ni/meta-nilrt
>>
>>>> I was unsure of the
>>>> acceptability of a do_install_append.*() clobbering a file of the
>>>> original do_install().
>>>
>>> That's probably what really needs to be discussed.
>>>
>>> We can probably add some task which by default installs the
>>> fw_env.config example and can be overridden in meta-whatever . Maybe the
>>> others can jump into here and explain how to handle overriding the
>>> default config file best.
>>
>> That sounds like a solution that would certainly work for this
>> use-case, if no one pipes up with objections or a currently-unseen
>> silver bullet solution, I'll try to whip something together tomorrow
>> and post. Thanks for the idea.
>>
>> Denys, I know you keep pushing the "shove it in a do_install_append()",
>> but to me and my under-informed sensibilities, this seems weird and
>> unclean to clobber a file in a _append(), would it cause some QA failure?
> 
> Hmm, I mentioned it only once... To a patch that does already mention
> appending stuff...
> 

We do this all the time for this recipe.  It just takes a simple .bbappend
like this one.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------16D1CEAFA9BB7F9ADDFDEF97
Content-Type: text/plain; charset=UTF-8;
 name="u-boot-fw-utils_2017.05.bbappend"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="u-boot-fw-utils_2017.05.bbappend"

RklMRVNFWFRSQVBBVEhTX3ByZXBlbmQgOj0gIiR7VEhJU0RJUn0vJHtQTn06IgoKU1JDX1VSSSAr
PSAiZmlsZTovL2Z3X2Vudi5jb25maWcgXAoiCgpkb19pbnN0YWxsX2FwcGVuZCgpIHsKICAgaW5z
dGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfQogICBpbnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9m
d19lbnYuY29uZmlnICR7RH0ke3N5c2NvbmZkaXJ9L2Z3X2Vudi5jb25maWcgICAKfQoKUEFDS0FH
RV9BUkNIID0gIiR7TUFDSElORV9BUkNIfSIKQ09NUEFUSUJMRV9NQUNISU5FID0gIiR7TUFDSElO
RX0iCgo=

--------------16D1CEAFA9BB7F9ADDFDEF97--

Return-Path: <Rongqing.Li@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5F7608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 08:53:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r788rnTJ014216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 04:53:49 -0400 (EDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 01:53:48 -0700
Message-ID: <52035C9D.2050904@windriver.com>
Date: Thu, 8 Aug 2013 16:53:49 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<5201F783.4020601@windriver.com>
	<1318833D-CF46-4453-8ECA-ED9C92AD59C8@gmail.com>
In-Reply-To: <1318833D-CF46-4453-8ECA-ED9C92AD59C8@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Thu, 08 Aug 2013 08:53:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/08/2013 02:26 AM, Khem Raj wrote:
>
> On Aug 7, 2013, at 12:30 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
>
>> ping
>>
>> On 07/24/2013 01:24 PM, rongqing.li@windriver.com wrote:
>>> From: "Roy.Li" <rongqing.li@windriver.com>
>>>
>>> qemu prints errors sometime, but it works well,
>
>
> how do you know ?
>

echo $? and output of "udevadm hwdb --update --root $D" shows
it works well.

-Roy


>>> the error information
>>> can be captured by rpm, and lead to rpm failure. like:
>>>
>>> 	$export D=/tmp/rootfs;.../usr/bin/qemu-i386 -L $D \
>>> 		-E LD_LIBRARY_PATH=$D/usr/lib:$D/lib $D/bin/udevadm hwdb --update --root $D
>>> 	qemu: Unsupported syscall: 240
>>> 	$echo $?
>>> 	$ 0
>>>
>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_204.bb |    4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
>>> index b8b1290..10bde33 100644
>>> --- a/meta/recipes-core/systemd/systemd_204.bb
>>> +++ b/meta/recipes-core/systemd/systemd_204.bb
>>> @@ -277,7 +277,9 @@ ALTERNATIVE_PRIORITY[poweroff] ?= "300"
>>>   pkg_postinst_udev-hwdb () {
>>>   	if test -n "$D"; then
>>>   		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
>>> -			--root $D
>>> +			--root $D 2>/dev/null
>>> +
>>> +		[ $? -ne 0 ] && exit 1
>>>   	else
>>>   		udevadm hwdb --update
>>>   	fi
>>>
>>
>> --
>> Best Reagrds,
>> Roy | RongQing Li
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li


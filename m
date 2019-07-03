Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B66F7E9FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 01:37:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x631aKIP029257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 18:36:31 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 2 Jul 2019 18:36:10 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1561954425.git.Qi.Chen@windriver.com>
	<8253aa4004e6a23f783cd930c222138f86d9fa3c.1561954425.git.Qi.Chen@windriver.com>
	<9b4441e390c842ef8d12442f872ada93@xbox06.axis.com>
	<58de5f15-e6e5-9fba-82fd-4b31626289fb@windriver.com>
	<99c9b16228b5482e9af8c69f43484e54@xbox06.axis.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <5d0ac4c6-4303-47d5-7c36-d4e034b0eefe@windriver.com>
Date: Wed, 3 Jul 2019 09:48:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <99c9b16228b5482e9af8c69f43484e54@xbox06.axis.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH V2 1/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Wed, 03 Jul 2019 01:37:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2019 05:04 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of ChenQi
>> Sent: den 2 juli 2019 03:39
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH V2 1/1] image.bbclass: fix
>> systemd_preset_all
>>
>> On 07/02/2019 07:34 AM, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>> <openembedded-
>>>> core-bounces@lists.openembedded.org> On Behalf Of Chen Qi
>>>> Sent: den 1 juli 2019 06:16
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] [PATCH V2 1/1] image.bbclass: fix
>> systemd_preset_all
>>>> Check the existence of systemd before using systemctl to preset
>> units.
>>>> This is because even if 'systemd' is in DISTRO_FEATURES, it's
>> possible
>>>> that systemd is not even installed. e.g. container-test-image in
>>>> meta-selftest layer.
>>>>
>>>> As systemd DEPENDS on systemd-systemctl-native, the existence of
>> systemd
>>>> also ensures the existence of systemd-systemctl-native.
>>>>
>>>> This would fix the following test case when using systemd as the
>> init
>>>> manager.
>>>>
>>>>     containerimage.ContainerImageTests.test_expected_files
>>>>
>>>> Also remove the IMAGE_EXTRADEPENDS setting, as nothing references
>> this
>>>> variable.
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>    meta/classes/image.bbclass | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>>> index d2b2fb9..7daa97e 100644
>>>> --- a/meta/classes/image.bbclass
>>>> +++ b/meta/classes/image.bbclass
>>>> @@ -666,10 +666,11 @@ reproducible_final_image_task () {
>>>>    }
>>>>
>>>>    systemd_preset_all () {
>>>> -    systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only
>> preset-all
>>>> +    if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ];
>> then
>>>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> That should be ${systemd_system_unitdir}, which will also use the
>> correct path
>>> (it is /lib/systemd/system, not /lib/systemd/systemd).
>> I'm checking the systemd binary under ${root_prefix}/lib/systemd, not
>> the directory holding units.
> Right, my bad. Still, then the path above should be
> "${IMAGE_ROOTFS}${systemd_unitdir}/systemd".

In current OE, ${systemd_unitdir} = ${root_prefix}/lib/systemd.
And in systemd recipe, we have:
[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
It does not write as `ln -s ${systemd_unitdir}/systemd/systemd'.
I don't want to use a directory whose name indicates 'unit' when 
checking a binary.

Regards,
Chen Qi

>> Regards,
>> Chen Qi
>>
>>>> +	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only
>> preset-all
>>>> +    fi
>>>>    }
>>>>
>>>> -IMAGE_EXTRADEPENDS += "${@ 'systemd-systemctl-native' if
>> bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not
>> bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d)
>> else ''}"
>>>>    IMAGE_PREPROCESS_COMMAND_append = " ${@ 'systemd_preset_all;' if
>> bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not
>> bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d)
>> else ''} reproducible_final_image_task; "
>>>>    CVE_PRODUCT = ""
>>>> --
>>>> 1.9.1
>>> //Peter
> //Peter
>
>



Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F62B7E166
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:04:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4L54TeA026530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 May 2019 22:04:29 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 20 May 2019 22:04:28 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
	<975c9628-c743-3445-7bfa-d1ced1e9bae2@gmail.com>
	<a9d8f31c-f101-8f9f-e5a0-9015574218f1@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <44a9f409-54bc-56f0-44da-5f387cb14d3c@windriver.com>
Date: Tue, 21 May 2019 13:03:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a9d8f31c-f101-8f9f-e5a0-9015574218f1@windriver.com>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Tue, 21 May 2019 05:04:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/21 上午10:54, Kang Kai wrote:
> On 2019/5/21 上午2:05, Khem Raj wrote:
>>
>>
>> On 5/20/19 2:46 AM, kai.kang@windriver.com wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Add a configure file for systemd.networkd to configure wired network
>>> interfaces with dhcp. It works with common network interfaces such eth0
>>> and eno1.
>>>
>>> [YOCTO #13057]
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd-conf/dhcp.network | 5 +++++
>>>   meta/recipes-core/systemd/systemd-conf_242.bb       | 3 +++
>>>   2 files changed, 8 insertions(+)
>>>   create mode 100644 
>>> meta/recipes-core/systemd/systemd-conf/dhcp.network
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd-conf/dhcp.network 
>>> b/meta/recipes-core/systemd/systemd-conf/dhcp.network
>>> new file mode 100644
>>> index 0000000000..81f36ebaa5
>>> --- /dev/null
>>> +++ b/meta/recipes-core/systemd/systemd-conf/dhcp.network
>>> @@ -0,0 +1,5 @@
>>> +[Match]
>>> +Name=en* eth*
>>> +
>>> +[Network]
>>> +DHCP=yes
>>> diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb 
>>> b/meta/recipes-core/systemd/systemd-conf_242.bb
>>> index 96beea53a7..094f03e195 100644
>>> --- a/meta/recipes-core/systemd/systemd-conf_242.bb
>>> +++ b/meta/recipes-core/systemd/systemd-conf_242.bb
>>> @@ -10,12 +10,14 @@ SRC_URI = "\
>>>       file://logind.conf \
>>>       file://system.conf \
>>>       file://system.conf-qemuall \
>>> +    file://dhcp.network \
>>>   "
>>>     do_install() {
>>>       install -D -m0644 ${WORKDIR}/journald.conf 
>>> ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
>>>       install -D -m0644 ${WORKDIR}/logind.conf 
>>> ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
>>>       install -D -m0644 ${WORKDIR}/system.conf 
>>> ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
>>> +    install -D -m0644 ${WORKDIR}/dhcp.network 
>>> ${D}${systemd_unitdir}/network/80-dhcp.network
>>>   }
>>>     # Based on change from YP bug 8141, OE commit 
>>> 5196d7bacaef1076c361adaa2867be31759c1b52
>>> @@ -29,4 +31,5 @@ FILES_${PN} = "\
>>>       ${systemd_unitdir}/journald.conf.d/ \
>>>       ${systemd_unitdir}/logind.conf.d/ \
>>>       ${systemd_unitdir}/system.conf.d/ \
>>> +    ${systemd_unitdir}/network/ \
>>>   "
>>>
>>
>> Please look into
>>
>> https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd
>>
>> this also means we need to enable networkd and resolved for this to work
>>
>
> I checked the repo you post,
>
> 1) package config 'networkd' and 'resolved' have been involved in 
> default package config in systemd_242.bb
>
> 2) I suspect wireless.network is not necessary. Unlike wired network, 
> we can't predict the ap name and connect it automatically.
>
> 3) the configure file doesn't work with qemu tap mode. I'll update 
> with it.



>
> 4) Do the configure of section [DHCP] in wired.network necessary?
>
> [DHCP]
> RouteMetric=10
> ClientIdentifier=mac
>
Ignore 4). I have checked the commit message and know why.

Regards,
Kai


>
> Thanks.
>
>

-- 
Kai Kang



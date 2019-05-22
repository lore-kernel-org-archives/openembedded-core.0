Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89E457E1A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 02:13:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4M2CfYn025390
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 May 2019 19:12:51 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 21 May 2019 19:12:30 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190521092249.175461-1-kai.kang@windriver.com>
	<20190521092249.175461-2-kai.kang@windriver.com>
	<CAMKF1srDq6skmDUZqYSE2rYnFQC4DCrdP3Oc4xifOHsSiWbW3A@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <84928623-f1bb-38b1-7942-a4409a0ec1f2@windriver.com>
Date: Wed, 22 May 2019 10:11:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srDq6skmDUZqYSE2rYnFQC4DCrdP3Oc4xifOHsSiWbW3A@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Wed, 22 May 2019 02:13:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/22 上午1:37, Khem Raj wrote:
> just copy paste from meta-yoe, that has been long working.
>
> On Tue, May 21, 2019 at 2:23 AM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add a configure file for systemd.networkd to configure wired network
>> interfaces with dhcp. It works with common network interfaces such eth0
>> and eno1.
>>
>> Refer to
>> https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd
>>
>> [YOCTO #13057]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd-conf/dhcp.network | 9 +++++++++
>>   meta/recipes-core/systemd/systemd-conf_242.bb       | 5 +++++
>>   2 files changed, 14 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd-conf/dhcp.network
>>
>> diff --git a/meta/recipes-core/systemd/systemd-conf/dhcp.network b/meta/recipes-core/systemd/systemd-conf/dhcp.network
>> new file mode 100644
>> index 0000000000..253aee9382
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd-conf/dhcp.network
>> @@ -0,0 +1,9 @@
>> +[Match]
>> +Name=en* eth*
> I think this is better put
> Name=en*
> Name=eth*

Accodring to systemd.network(5),

        Name=
            A whitespace-separated list of shell-style globs matching 
the device name, as exposed by the udev property "INTERFACE".

It also says:

        A network file is said to match a device if each of the entries 
in the "[Match]" section matches, or if the section is empty.

So I perfer to use put them in one line "Name=en* eth*".

Also check systemd source code,

neil@pek-kkang-d1:/mnt/sda4/git/systemd
$ find . -name *.network -exec grep -H -c ^Name= {} \; | grep -v 1$
neil@pek-kkang-d1:/mnt/sda4/git/systemd
$ find . -name *.network -exec grep -H 'Name=\S\+\s\S' {} \;
./test/test-network/conf/25-tunnel-remote-any.network:Name=*tun97 ip6tnl97
./test/test-network/conf/bond-slave.network:Name=dummy98 test1
./test/test-network/conf/25-tunnel.network:Name=*tun99 *tap99 ip6tnl99 
erspan99
./test/test-network/conf/25-tunnel-local-any.network:Name=*tun98 *tap98 
ip6tnl98 erspan98


>> +
>> +[Network]
>> +DHCP=yes
>> +
>> +[DHCP]
>> +RouteMetric=10
>> +ClientIdentifier=mac
>> diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
>> index 96beea53a7..105ee3ceed 100644
>> --- a/meta/recipes-core/systemd/systemd-conf_242.bb
>> +++ b/meta/recipes-core/systemd/systemd-conf_242.bb
>> @@ -10,12 +10,16 @@ SRC_URI = "\
>>       file://logind.conf \
>>       file://system.conf \
>>       file://system.conf-qemuall \
>> +    file://dhcp.network \
> better to call it wired or something

OK. Will install as 80-wired.network.

Regards,
Kai


>
>>   "
>>
>>   do_install() {
>>          install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
>>          install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
>>          install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
>> +       if ${@bb.utils.contains('OVERRIDES', 'qemuall', 'false', 'true', d)}; then
>> +               install -D -m0644 ${WORKDIR}/dhcp.network ${D}${systemd_unitdir}/network/80-dhcp.network
>> +       fi
>>   }
>>
>>   # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
>> @@ -29,4 +33,5 @@ FILES_${PN} = "\
>>       ${systemd_unitdir}/journald.conf.d/ \
>>       ${systemd_unitdir}/logind.conf.d/ \
>>       ${systemd_unitdir}/system.conf.d/ \
>> +    ${systemd_unitdir}/network/ \
>>   "
>> --
>> 2.20.0
>>

-- 
Kai Kang



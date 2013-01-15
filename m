Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TvDIv-0000V2-Vb
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:40:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jan 2013 12:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="272434462"
Received: from unknown (HELO [10.255.14.213]) ([10.255.14.213])
	by orsmga002.jf.intel.com with ESMTP; 15 Jan 2013 12:24:55 -0800
Message-ID: <50F5BB17.4040709@linux.intel.com>
Date: Tue, 15 Jan 2013 12:24:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
	<1358280527-14078-3-git-send-email-cristian.iorga@intel.com>
	<20130115202116.GB3002@jama>
In-Reply-To: <20130115202116.GB3002@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 2/3] connman-conf: configures connman in qemu machines
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
X-List-Received-Date: Tue, 15 Jan 2013 20:40:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2013 12:21 PM, Martin Jansa wrote:
> On Tue, Jan 15, 2013 at 10:08:46PM +0200, Cristian Iorga wrote:
>> For qemu machines, connman should not configure
>> virtual wired interfaces. Wired interfaces (eth0)
>> are assigned static IP addresses by the virtual machine
>> manager (qemu). This packages places the eth0 interface in
>> a list of blacklisted interfaces, forbiding connman
>> administering wired interfaces for qemu machines.
>
> Again wrong order,
>
> 3/3 should be 1st
> 2/3 2nd
> 1/3 3rd
>
I have re-ordered this in my consolidated pull MUT staging area, saw 
that right away!

Sau!

> Cheers,
>
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>>   meta/conf/layer.conf                                 |    1 +
>>   meta/recipes-connectivity/connman/connman-conf.bb    |   18 ++++++++++++++++++
>>   .../connman/connman-conf/qemuall/main.conf           |    3 +++
>>   3 files changed, 22 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
>>   create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
>>
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 78ceae9..3259e5c 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>     shadow-securetty \
>>     opkg-config-base \
>>     netbase \
>> +  connman-conf \
>>     formfactor \
>>     xserver-xf86-config \
>>     pointercal \
>> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
>> new file mode 100644
>> index 0000000..7c7ef26
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
>> @@ -0,0 +1,18 @@
>> +#connman config to ignore wired interfaces on qemu machines
>> +
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>> +
>> +SRC_URI_append_qemuall = " file://main.conf"
>> +
>> +PR = "r0"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +do_install() {
>> +    #Blacklist ethn network interface in case of qemu* machines
>> +    if test -e ${WORKDIR}/main.conf; then
>> +        install -d ${D}${sysconfdir}/connman
>> +        install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman
>> +    fi
>> +}
>> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
>> new file mode 100644
>> index 0000000..01973e7
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
>> @@ -0,0 +1,3 @@
>> +[General]
>> +
>> +NetworkInterfaceBlacklist = eth
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



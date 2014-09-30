Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B47D771498
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:14:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 30 Sep 2014 14:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,629,1406617200"; d="scan'208";a="598994413"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2014 14:14:47 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.106]) by
	ORSMSX109.amr.corp.intel.com ([169.254.2.27]) with mapi id
	14.03.0195.001; Tue, 30 Sep 2014 14:14:47 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Ashfield, Bruce (Wind River)" <bruce.ashfield@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Wold, Saul" <saul.wold@intel.com>, "Burton,
	Ross" <ross.burton@intel.com>, 
	"dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] kernel.bbclass: enable a link for external module
	building
Thread-Index: AQHP3PEjhqgioppAukiVPIkoJnRmN5wanqQA//+OogA=
Date: Tue, 30 Sep 2014 21:14:47 +0000
Message-ID: <D0506A39.6455%nitin.a.kamble@intel.com>
References: <cover.1412108536.git.nitin.a.kamble@intel.com>
	<09a0bf7dab7a1152fe19faa74436eb4856ce631a.1412108536.git.nitin.a.kamble@intel.com>
	<542B19F8.4030805@windriver.com>
In-Reply-To: <542B19F8.4030805@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.4.140807
x-originating-ip: [10.255.88.205]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kernel.bbclass: enable a link for external module building
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
X-List-Received-Date: Tue, 30 Sep 2014 21:14:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <669EE9CD46176C4AA1FE8395A3796776@intel.com>
Content-Transfer-Encoding: quoted-printable



On 9/30/14, 2:00 PM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:

>On 2014-09-30, 4:57 PM, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>
>> To build external modules, the link /lib/modules/<kernel-version>/build
>> must exist, and point to the proper kernel source area.
>>
>> The kernel-dev package already provides the needed source files. Now
>> putting a link in place to unblock the external module building.
>
>This description is not entirely accurate, at least from my point of
>view.
>
>You can build external modules on the target without this link .. it is
>that many scripts and utilities look in this location for the kernel
>source.
>
>We are fixing that case, not the general case of building an external
>module.

I see. Thanks for pointing it out. I guess, the bug entry missed this
information. I will fix the commit log and resend it.

Nitin


>
>Cheers,
>
>Bruce
>
>>
>> Fixes Bug:
>> [YOCTO #2968]
>>
>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> ---
>>   meta/classes/kernel.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 78b33ce..5ac4ff4 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -213,6 +213,7 @@ kernel_do_install() {
>>   	#
>>   	kerneldir=3D${D}${KERNEL_SRC_PATH}
>>   	install -d $kerneldir
>> +	ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
>>
>>   	#
>>   	# Store the kernel version in sysroots for module-base.bbclass
>> @@ -346,7 +347,7 @@ PACKAGES =3D "kernel kernel-base kernel-vmlinux
>>kernel-image kernel-dev kernel-mod
>>   FILES_${PN} =3D ""
>>   FILES_kernel-base =3D "/lib/modules/${KERNEL_VERSION}/modules.order
>>/lib/modules/${KERNEL_VERSION}/modules.builtin"
>>   FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers*
>>/boot/config* ${KERNEL_SRC_PATH}"
>> +FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers*
>>/boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>>   FILES_kernel-vmlinux =3D "/boot/vmlinux*"
>>   FILES_kernel-modules =3D ""
>>   RDEPENDS_kernel =3D "kernel-base"
>>
>



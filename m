Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1SGDf7-00042v-LS
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 20:13:30 +0200
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 8C4D45E9E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2012 11:03:41 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 755245E99
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2012 11:03:41 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Fri, 6 Apr 2012 11:03:50 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0355.002;
	Fri, 6 Apr 2012 11:03:50 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Do we have a package that installs the kernel headers and
	config into the target?
Thread-Index: Ac0UH5sGOAh+Gfe+Qcyv4+eadXmpHw==
Date: Fri, 6 Apr 2012 18:03:50 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F042758F7@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 18:13:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Darren Hart wrote on 2012-04-06:
>> On 04/05/2012 09:41 PM, Cui, Dexuan wrote:
>>> Darren Hart wrote on 2012-04-06:
>>>> On 04/05/2012 08:20 PM, Cui, Dexuan wrote:
>>>>> In a typical Linux distribution, there is a build link(or directory)
>>>>> that specifies the directory where the kernel headers and kernel conf=
ig
>>>>> are put.
>>>>>
>>>>> E.g. in my Ubuntu 11.04, a package linux-headers-2.6.38-8-generic
>>>> installs .config, include/ and Kconfig into
>>>> /usr/src/linux-headers-2.6.38-8-generic/ and makes a link
>>>> /lib/modules/2.6.38-8-generic/build to point to the directory.
>>>>>
>>>>> However, looks in Yocto, we don't have such a package? Do we have a
>>>>> plan to add it?
>>>>>
>>>>> I'm asking the question because in the ESDC contest, the students fou=
nd
>in
>>>> Yocto they couldn't build the wifi driver's source code that was
>>>> downloaded from realtek.com:
>>>>
>>>>
>http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=3D1&PFi
>d=3D4
>>>>
>>
>8&Level=3D5&Conn=3D4&ProdID=3D226&DownTypeID=3D3&GetDown=3Dfalse&Downloa
>ds
>> =3Dtrue
>>>>> In Ubuntu, they can build the driver fine.
>>>>
>>>> There is an open bug:
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1614
>>>
>>> Glad to know this is a know bug.
>>> I personally think it would be pretty nice if we can fix this bug soon
>>> since the students are being frustrated by this...
>>>
>>> And, in the Build Appliance (self-hosted-image) work, we want to
>>> enable the vmware guest's VMware Tools. This also requires the ability
>>> to build kernel module in the target.
>>>
>>
>> While I understand there are valid use cases, I think this is generally
>> contrary to workflow of the project. We build the OS, it runs on the
>> target. This is building a general purpose OS, and then having it build
>> itself out more. It doesn't feel like an embedded workflow.
>I totally agree with you.
>
>Unluckily we'll have to face an imperfect world:
>E.g., in the ESDC contest, after the students boot the board with
>Yocto Linux, they attach a Realtek wifi device and try to build and
>install the driver.
>
>What's bad is: the driver's source code is not integrated into the
>upstream linux. The students can only run a makefile of the driver
>tarball to build the driver.  To the students' surprise, there is no
>kernel headers in the running Yocto linux! :-(
>
>Surely, the "standard" way is: we should write a recipe to
>cross-compile and install the driver. But this is difficult to the
>students:
>1) They're not familiar with Poky at all, and actually the downloaded
>wifi driver's code here seems indeed complex.
>
>2) The students only have limited time so they intend to spend
>most of the time on things that could make them win a prize or
>money. :-)
>So this actually makes Yocto less appealing to them though the
>goal of Yocto is making developing on embedded easy...
>
>> That said, there are valid use cases, but I don't consider this a
>> particularly high priority at the moment. I'm happy to hear other
>> thoughts on why this should be bumped in prio though.
>Currently I have suggested them that they should manually copy
>The kernel headers and .config into the target.
>Hope this can work around the issue for them.
>
>Thanks,
>-- Dexuan
>

Any chance the students could cross compile the wifi module using an extern=
al toolchain?



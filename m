Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DCB8860722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 06:23:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6F6NAdj020370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jul 2016 23:23:10 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jul 2016 23:23:10 -0700
To: Zhenhua Luo <zhenhua.luo@nxp.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
References: <1467699658-4985-1-git-send-email-zhenhua.luo@nxp.com>
	<CAMKF1soJ0_8FcopQ4ipqLv+Bgi9qFyvTOUKVshdxvcEphRi6sw@mail.gmail.com>
	<DB3PR04MB068453822CFC44651DA07C02EE3A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
	<DB6PR0401MB2630E1F43FAC79B508546405EE330@DB6PR0401MB2630.eurprd04.prod.outlook.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5788814C.9010504@windriver.com>
Date: Fri, 15 Jul 2016 14:23:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0401MB2630E1F43FAC79B508546405EE330@DB6PR0401MB2630.eurprd04.prod.outlook.com>
Subject: Re: [PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Fri, 15 Jul 2016 06:23:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


FYI, I had sent one before:

http://lists.openembedded.org/pipermail/openembedded-core/2016-June/123006.html

And pending for reviewing.

// Robert

On 07/15/2016 02:13 PM, Zhenhua Luo wrote:
> Ping.
>
> Is there any other comment to be addressed for the patch?
>
>
> Best Regards,
>
> Zhenhua
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Zhenhua Luo
>> Sent: Wednesday, July 06, 2016 12:09 PM
>> To: Khem Raj <raj.khem@gmail.com>
>> Cc: Patches and discussions about the oe-core layer <openembedded-
>> core@lists.openembedded.org>
>> Subject: Re: [OE-core] [oe-core][PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
>>
>>> -----Original Message-----
>>> From: Khem Raj [mailto:raj.khem@gmail.com]
>>> Sent: Tuesday, July 05, 2016 11:16 PM
>>> To: Zhenhua Luo <zhenhua.luo@nxp.com>
>>> Cc: Patches and discussions about the oe-core layer <openembedded-
>>> core@lists.openembedded.org>
>>> Subject: Re: [OE-core] [oe-core][PATCH] tcl: fix INCLUDE_SPEC and
>>> LIB_SPEC
>>>
>>> On Mon, Jul 4, 2016 at 11:20 PM, Zhenhua Luo <zhenhua.luo@nxp.com>
>> wrote:
>>>> TCL_INCLUDE_SPEC -I+<includedir> and TCL_LIB_SPEC -L+${libdir} break
>>>> the cross-compile of packages which require tcl headers and libraries.
>>>>
>>>> One example is that postgresql configure failed at the following error:
>>>> | checking for tcl.h... no
>>>> | configure: error: header file <tcl.h> is required for Tcl
>>>>
>>>> Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
>>>> ---
>>>>   meta/recipes-devtools/tcltk/tcl_8.6.5.bb | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>>>> b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>>>> index 46fc8a7..d75232b 100644
>>>> --- a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>>>> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>>>> @@ -56,8 +56,6 @@ do_install() {
>>>>          ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
>>>>          sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
>>>>          sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
>>>> -       sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
>>>> -       sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
>>>
>>> does this now include some of your host headers in build then ?
>> [Luo Zhenhua-B19537] The patch does the following changes for tclConfig.sh.
>> Without the change, tcl.h can't be found when cross building packages(e.g.
>> postgresql) which depend on tcl. I have cross-compiled several
>> packages(postgresql, expect, ruby, tk) that have tcl dependency and see no
>> issue.
>> 	1. tmp/sysroots/qemuarm64/usr/bin/crossscripts/tclConfig.sh
>> 	# String to pass to linker to pick up the Tcl library from its
>> 	 # installed directory.
>> 	-TCL_LIB_SPEC='-L=/home/bjsimics/workspace/poky-
>> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltcl8.6'
>> 	+TCL_LIB_SPEC='-L/home/bjsimics/workspace/poky-
>> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltcl8.6'
>>
>> 	 # String to pass to the compiler so that an extension can
>> 	 # find installed Tcl headers.
>> 	-TCL_INCLUDE_SPEC='-I=/home/bjsimics/workspace/poky-
>> os/qemuppc/tmp/sysroots/qemuarm64/usr/include/tcl8.6'
>> 	+TCL_INCLUDE_SPEC='-I/home/bjsimics/workspace/poky-
>> os/qemuppc/tmp/sysroots/qemuarm64/usr/include/tcl8.6'
>>
>> 	# String to pass to linker to pick up the Tcl stub library from its
>> 	 # installed directory.
>> 	-TCL_STUB_LIB_SPEC='-L=/home/bjsimics/workspace/poky-
>> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltclstub8.6'
>> 	+TCL_STUB_LIB_SPEC='-L/home/bjsimics/workspace/poky-
>> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltclstub8.6'
>>
>> 	2. tmp/sysroots/qemuarm64/usr/lib/tclConfig.sh
>> 	# String to pass to linker to pick up the Tcl library from its
>> 	 # installed directory.
>> 	-TCL_LIB_SPEC='-L=/usr/lib -ltcl8.6'
>> 	+TCL_LIB_SPEC='-L/usr/lib -ltcl8.6'
>>
>> 	 # String to pass to the compiler so that an extension can
>> 	 # find installed Tcl headers.
>> 	-TCL_INCLUDE_SPEC='-I=/usr/include/tcl8.6'
>> 	+TCL_INCLUDE_SPEC='-I/usr/include/tcl8.6'
>>
>> 	# String to pass to linker to pick up the Tcl stub library from its
>> 	 # installed directory.
>> 	-TCL_STUB_LIB_SPEC='-L=/usr/lib -ltclstub8.6'
>> 	+TCL_STUB_LIB_SPEC='-L/usr/lib -ltclstub8.6'
>>
>>
>> Best Regards,
>>
>> Zhenhua
>>
>>>>          install -d ${D}${bindir_crossscripts}
>>>>          install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>>>>          install -m 0755 tclConfig.sh ${D}${libdir}
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


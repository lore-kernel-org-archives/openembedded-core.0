Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QUvz4-0002WA-8D
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 09:18:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5A5mKmX029426
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jun 2011 22:48:20 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 9 Jun 2011 22:48:20 -0700
Message-ID: <4DF1B022.2010506@windriver.com>
Date: Fri, 10 Jun 2011 13:48:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: "Purdie, Richard" <richard.purdie@intel.com>
References: <4DF18EF7.8000207@windriver.com>
In-Reply-To: <4DF18EF7.8000207@windriver.com>
Cc: "Wold, Saul" <saul.wold@intel.com>, wenzong fan <wenzong.fan@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: The design document for ccache-native
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
X-List-Received-Date: Fri, 10 Jun 2011 07:18:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/10/2011 11:26 AM, wenzong fan wrote:
>
>
> -------- Original Message --------
>
> On Thu, 2011-06-09 at 15:40 -0700, Saul Wold wrote:
>> On 06/02/2011 08:11 PM, wenzong fan wrote:
>> > Hi Folks,
>> >
>> > Please help me to review the design document for ccache-native, and
>> > I also have two questions about it, any answers or suggestions are
>> > appreciated.
>> >
>> > * Feature name: ccache-native
>> > Priority: P3; M2
>> > Owner: Wenzong Fan
>> > Summary: Integrate ccache-native to yocto
>> >
>> > * Description:
>> > Bitbake supports the 'CCACHE Mechanism', but 'ccache' hasn't been
>> > included by poky/yocto, just add it as a native tool.
>> >
>> > * Usage:
>> > Build ccache as a native tool by default and enable it for speeding
>> > target packages build.
>> >
>> > * Implementation:
>> > 1) Copy bb file from OE upstream to:
>> > meta/recipes-devtools/ccache/
>> >
>> > 2) Update bb file to get the latest ccache_3.1.5 and split the single
>> > bb file to:
>> > 'ccache_3.1.5.bb', 'ccache.inc'
>> >
>> > 3) Enable ccache in the native tools building.
>> >
>> You will need to have it be a dependency pretty early on in the build.
>> Additionally, this is a bit a new part to this task, we want to have the
>> default CCACHE_DIR for the build default to a directory in TMPDIR
>> instead of the user's home directory. This will mean setting an
>> environment variable somewhere early also.
>
> There is a little more detail on:
>
> https://wiki.yoctoproject.org/wiki/Yocto_1.1_Schedule
>
> Specifically, "c) Set CCACHE on a per recipe basis. need to figure out
> whether ccache data can be shared and under what circumstances."
>
> so something like adding:
>
> export CCACHE_DIR = "${TMPDIR}/ccache/${TARGET_SYS}/${PN}"
>

I think that set CCACHE_DIR on per recipe basis would degrade hit efficiency,
the following ccache data can be shared if they they use the same CCACHE_DIR,
but if we set CACHE_DIR on a per recipe basis, then they can't be shared:

1) Most pkg's configure will run "gcc foo.c" for checking the C  compiler,
    these compiling are the same between different pkgs at most time.

2) Some recipes' compiling are similar, for example: gcc-cross,
    gcc-corss-initial and gcc-cross-intermediate.

I think that:

export CCACHE_DIR = "${TMPDIR}/ccache/${TARGET_SYS}/"

would be better.

// Robert

> to bitbake.conf with a bit more thought into working out the right
> components to add to the variable.
>
> Cheers,
>
> Richard
>
>
>
>



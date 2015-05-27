Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8A1573223
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:27:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 May 2015 14:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,507,1427785200"; d="scan'208";a="736361325"
Received: from bitbang.jf.intel.com (HELO [10.7.201.51]) ([10.7.201.51])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2015 14:26:41 -0700
Message-ID: <55663691.30806@linux.intel.com>
Date: Wed, 27 May 2015 14:26:41 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>, Chen Qi <Qi.Chen@windriver.com>
References: <cover.1432706896.git.Qi.Chen@windriver.com>	<061547e2e995fd41cd68e5f3d00f94389dd92bd1.1432706896.git.Qi.Chen@windriver.com>
	<CABcZANnA4C2Y4VG4qrgEzJrU2L4e=KVt_KS0PK6DnNh+gkEkvQ@mail.gmail.com>
In-Reply-To: <CABcZANnA4C2Y4VG4qrgEzJrU2L4e=KVt_KS0PK6DnNh+gkEkvQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 27 May 2015 21:27:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2015 11:54 AM, Christopher Larson wrote:
> On Tue, May 26, 2015 at 11:09 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>
>> If we do `bitbake buildtools-tarball' and then after one day do `bitbake
>> core-image-minimal -c populate_sdk_ext', we would meet errors like below.
>>
>> | install: cannot stat
>> '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
>>
>> poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalone
>> -1.8+snapshot-20150429.sh': No such file or directory
>>
>> The problem is that the output name for buildtools-tarball has ${DATE} in
>> it.
>> So if populate_sdk_ext task is executed but buildtools-tarball is not
>> rebuilt,
>> the above error appears.
>>
>> Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in the
>> install_tools() function, we should find the latest buildtools-tarball
>> based
>> on the modification time and install it.
>>
>> [YOCTO #7674]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>
>
> Hmm, if buildtools-tarball is required, why not just pull it in via
> dependencies and build a current one, rather than assuming/forcing the user
> to have done so themselves?

It is a dependency and will be built if it hasn't been built. But since

TOOLCHAIN_OUTPUTNAME ?= 
"${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"

in buildtools-tarball.bb the filename will be different each time we try to copy 
it, unless we force buildtools-tarball to be rebuilt each time the sdk is 
constructed.

${DATE} being used in DISTRO_VERSION is misleading in my opinion because 
different dates don't necessarily mean different contents. So we could change 
DISTRO_VERSION to not use date, or buildtools-tarball.bb to not use DISTRO_VERSION.

>
>



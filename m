Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C15576A93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:07:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K77p4F025799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Aug 2015 00:07:52 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 00:07:51 -0700
Message-ID: <55D57CE4.7010607@windriver.com>
Date: Thu, 20 Aug 2015 15:08:20 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Randy Witt
	<randy.e.witt@intel.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
	<61284f2a7056896fb87e51be2ade7dd72528f442.1438667914.git.Qi.Chen@windriver.com>
	<1839307.RBueBEjXet@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1839307.RBueBEjXet@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [128.224.162.211]
Subject: Re: [PATCH 1/8] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Thu, 20 Aug 2015 07:07:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2015 09:51 PM, Paul Eggleton wrote:
> On Monday 10 August 2015 11:17:59 Chen Qi wrote:
>> If we do `bitbake buildtools-tarball' and then after one day do `bitbake
>> core-image-minimal -c populate_sdk_ext', we would meet errors like below.
>>
>> | install: cannot stat
>> | '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
>>
>> poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalon
>> e -1.8+snapshot-20150429.sh': No such file or directory
>>
>> The problem is that the output name for buildtools-tarball has ${DATE} in
>> it. So if populate_sdk_ext task is executed but buildtools-tarball is not
>> rebuilt, the above error appears.
>>
>> Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in the
>> install_tools() function, we should find the latest buildtools-tarball based
>> on the modification time and install it.
>>
>> [YOCTO #7674]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/populate_sdk_ext.bbclass | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_ext.bbclass
>> b/meta/classes/populate_sdk_ext.bbclass index a36bf16..b6725e0 100644
>> --- a/meta/classes/populate_sdk_ext.bbclass
>> +++ b/meta/classes/populate_sdk_ext.bbclass
>> @@ -169,7 +169,9 @@ install_tools() {
>>   	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool
>> ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool touch
>> ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
>>
>> -	install
>> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKG
>> ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh
>> ${SDK_OUTPUT}/${SDKPATH} +	# find latest buildtools-tarball and install it
>> +	buildtools_path=`ls -t1
>> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKG
>> ARCH}-buildtools-nativesdk-standalone-*.sh | head -n1` +	install
>> $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
>>
>>   	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2
>> ${SDK_OUTPUT}/${SDKPATH} }
> Hmm, it turns out there's another problem here - this assumes SDK_NAME is set
> as it is in poky. Perhaps we correct that in a follow-up patch though, but
> it'll be a little bit tricky as it'll need to be done by getting the actual
> value of SDK_NAME as it would have been when IMAGE_BASENAME is "buildtools-
> tarball".
>
> The more I think about this though the more I wonder why we're bothering with
> buildtools instead of just bundling its contents inside the native part of the
> extensible SDK itself. Randy can you remind me why we did it that way?
>
> Cheers,
> Paul
>
Hi Paul,

I've dropped this patch from the patchset and sent out V2.
I think we can fix this buildtool problem in other patches.

Best Regards,
Chen Qi


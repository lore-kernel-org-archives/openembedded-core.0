Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21B62755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 03:10:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8S3AOWt003032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Sep 2015 20:10:24 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 27 Sep 2015 20:10:23 -0700
Message-ID: <5608AF9D.90904@windriver.com>
Date: Mon, 28 Sep 2015 11:10:21 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1443092669-215894-1-git-send-email-wenzong.fan@windriver.com>
	<1443303932.19044.221.camel@linuxfoundation.org>
In-Reply-To: <1443303932.19044.221.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: cleanup buildpaths from curl-config
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
X-List-Received-Date: Mon, 28 Sep 2015 03:10:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2015 05:45 AM, Richard Purdie wrote:
> On Thu, 2015-09-24 at 07:04 -0400, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> * curl-config:
>>    -L/path/to/tmp/sysroots/qemux86-64/usr/lib64 -> -L/usr/lib64
>>    --sysroot=/path/to/tmp/sysroots/qemux86-64'  -> --sysroot=
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   meta/recipes-support/curl/curl_7.44.0.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
>> index b293303..b0cf700 100644
>> --- a/meta/recipes-support/curl/curl_7.44.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.44.0.bb
>> @@ -43,6 +43,9 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_siz
>>
>>   do_install_append() {
>>   	oe_multilib_header curl/curlbuild.h
>> +
>> +	# cleanup buildpaths from curl-config
>> +	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${bindir}/curl-config
>>   }
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/162
>
> Seems curl-native doesn't build since STAGING_DIR_HOST == "".

Oh, sorry. It should be limited to do_install_append_class-target().

Please ignore this patch, I'll send out V2 for the fix.

Thanks
Wenzong

>
> Cheers,
>
> Richard
>
>
>
>
>
>
>


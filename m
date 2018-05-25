Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E912E74CA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 05:43:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P5hBEW030125
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 May 2018 22:43:27 -0700
Received: from [128.224.27.58] (128.224.27.58) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 May 2018 22:42:55 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<f4bfb14098d86375865642c0ae4eb338ea759b1a.1527216285.git.liezhi.yang@windriver.com>
	<CAJ86T=V-LQ_MxSfB=NXcz_eMPkPJyJRUJ-3FaHQ-i-N20=JGXw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <fc12b4f6-0b19-82dc-bee2-fd3f5cb0cca0@windriver.com>
Date: Fri, 25 May 2018 13:42:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V-LQ_MxSfB=NXcz_eMPkPJyJRUJ-3FaHQ-i-N20=JGXw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] dropbear: add default config file to disable root login
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
X-List-Received-Date: Fri, 25 May 2018 05:43:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05/25/2018 11:34 AM, Andre McCurdy wrote:
> On Thu, May 24, 2018 at 7:48 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> root login is disabled by default for openssh and we can
>> enable it through IMAGE_FEATURES 'debug-tweaks' or
>> 'allow-empty-password', so change to the same default
>> behavior for dropbear.
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   meta/recipes-core/dropbear/dropbear.inc              | 3 +++
>>   meta/recipes-core/dropbear/dropbear/dropbear.default | 2 ++
>>   2 files changed, 5 insertions(+)
>>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default
>>
>> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
>> index 16ac644..3c79be9 100644
>> --- a/meta/recipes-core/dropbear/dropbear.inc
>> +++ b/meta/recipes-core/dropbear/dropbear.inc
>> @@ -20,6 +20,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>>              file://dropbearkey.service \
>>              file://dropbear@.service \
>>              file://dropbear.socket \
>> +           file://dropbear.default \
>>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
>>
>>   PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
>> @@ -63,6 +64,8 @@ do_install() {
>>                  ${D}${sbindir} \
>>                  ${D}${localstatedir}
>>
>> +       install -m 0755 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
> 
> Files in /etc/default don't need to be executable.

Thanks, I updated it to 0644 in the repo:

install -m 0644 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear

// Robert

> 
>> +
>>          install -m 0755 dropbearmulti ${D}${sbindir}/
>>          ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
>>
>> diff --git a/meta/recipes-core/dropbear/dropbear/dropbear.default b/meta/recipes-core/dropbear/dropbear/dropbear.default
>> new file mode 100644
>> index 0000000..522453a
>> --- /dev/null
>> +++ b/meta/recipes-core/dropbear/dropbear/dropbear.default
>> @@ -0,0 +1,2 @@
>> +# Disallow root logins by default
>> +DROPBEAR_EXTRA_ARGS="-w"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


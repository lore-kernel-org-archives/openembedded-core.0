Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8573C7BFB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 01:25:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5P1PYlx018355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jun 2019 18:25:34 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 24 Jun 2019 18:25:33 -0700
To: "Burton, Ross" <ross.burton@intel.com>, <derek@asterius.io>
References: <1561368577-265361-1-git-send-email-changqing.li@windriver.com>
	<CAJTo0LZJUL7Qk8EUV0jSneyH3BAZCrTz_YqS8dwNrPBsxF6NAA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <0a3609e6-1570-4d6e-f50a-c1f49143b00d@windriver.com>
Date: Tue, 25 Jun 2019 09:25:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZJUL7Qk8EUV0jSneyH3BAZCrTz_YqS8dwNrPBsxF6NAA@mail.gmail.com>
X-Originating-IP: [128.224.162.186]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scons: fix conflict during do_rootfs
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
X-List-Received-Date: Tue, 25 Jun 2019 01:25:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 6/24/19 5:43 PM, Burton, Ross wrote:
> Is this actually needed?  Can we just delete python-scons?
>
> Ross

I checked under meta-openembeded and oe-core, no one depend on 
python-scons.

If no one has objections,  since python2 will  retire in 2020, I  will 
delete python-scons and python-scons-native.

Also add the maintainer into the to list.

> .
>
> On Mon, 24 Jun 2019 at 10:33, <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below error:
>> file /usr/bin/scons conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>> file /usr/bin/scons-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>> file /usr/bin/scons-configure-cache conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>> file /usr/bin/scons-configure-cache-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>> file /usr/bin/scons-time conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>> file /usr/bin/scons-time-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>> file /usr/bin/sconsign conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>> file /usr/bin/sconsign-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/python/python-scons_3.0.5.bb  | 14 +++++++++++++-
>>   meta/recipes-devtools/python/python3-scons_3.0.5.bb | 14 +++++++++++++-
>>   2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python-scons_3.0.5.bb b/meta/recipes-devtools/python/python-scons_3.0.5.bb
>> index 939c15b..94c2d07 100644
>> --- a/meta/recipes-devtools/python/python-scons_3.0.5.bb
>> +++ b/meta/recipes-devtools/python/python-scons_3.0.5.bb
>> @@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
>>   UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
>>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>>
>> -inherit setuptools
>> +inherit setuptools update-alternatives
>>
>>   RDEPENDS_${PN} = "\
>>     python-fcntl \
>> @@ -22,3 +22,15 @@ RDEPENDS_${PN} = "\
>>     python-shell \
>>     python-pprint \
>>     "
>> +
>> +ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsign-3.0.5"
>> +ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
>> +ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
>> +ALTERNATIVE_TARGET[scons-configure-cache] = "${bindir}/scons-configure-cache"
>> +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] = "${bindir}/scons-configure-cache-3.0.5"
>> +ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
>> +ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
>> +ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
>> +ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
>> +
>> +ALTERNATIVE_PRIORITY = "20"
>> diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
>> index 7fb75a6..6e240d8 100644
>> --- a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
>> +++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
>> @@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
>>   UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
>>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>>
>> -inherit setuptools3
>> +inherit setuptools3 update-alternatives
>>
>>   do_install_prepend() {
>>       sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/script/*
>> @@ -27,3 +27,15 @@ RDEPENDS_${PN} = "\
>>     python3-pickle \
>>     python3-pprint \
>>     "
>> +
>> +ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsign-3.0.5"
>> +ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
>> +ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
>> +ALTERNATIVE_TARGET[scons-configure-cache] = "${bindir}/scons-configure-cache"
>> +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] = "${bindir}/scons-configure-cache-3.0.5"
>> +ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
>> +ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
>> +ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
>> +ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
>> +
>> +ALTERNATIVE_PRIORITY = "30"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
BRs

Sandy(Li Changqing)



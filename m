Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEC1278A8F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:26:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6JEQb1A021702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jul 2018 07:26:38 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 19 Jul 2018 07:26:36 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1531875240.git.hongxu.jia@windriver.com>
	<e73aaa685b5af27bd88016b19bb45917502440ea.1531875240.git.hongxu.jia@windriver.com>
	<CAJTo0LbGHtKCYX8-ETzhMtgUs3y209KtBtSDkm_OSRG_Fu_7hA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <8121f84a-41cd-6226-5cc3-8f4ebae3e10a@windriver.com>
Date: Thu, 19 Jul 2018 22:26:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbGHtKCYX8-ETzhMtgUs3y209KtBtSDkm_OSRG_Fu_7hA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] distutils/setuptools, distutils3/setuptools3: improve reproducibility
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
X-List-Received-Date: Thu, 19 Jul 2018 14:26:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年07月19日 21:05, Burton, Ross wrote:
> Hi Hongxu,
>
> Can you rebase this to current master?

No problem, V2 incoming

//Hongxu

> Cheers,
> Ross
>
> On 18 July 2018 at 01:57, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> - Unify var-DISTUTILS_INSTALL_ARGS in distutils and setuptools
>>
>> - Supply "--root" directory to the "install" command, and use
>>    it as a prefix to strip off the purported filename encoded
>>    in bytecode files. (It strips build path prefix from .pyc files)
>>
>> [YOCTO #8446]
>> [YOCTO #12084]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/distutils.bbclass   | 8 +++++---
>>   meta/classes/distutils3.bbclass  | 8 +++++---
>>   meta/classes/setuptools.bbclass  | 5 -----
>>   meta/classes/setuptools3.bbclass | 4 ----
>>   4 files changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
>> index 1930c35..db28767 100644
>> --- a/meta/classes/distutils.bbclass
>> +++ b/meta/classes/distutils.bbclass
>> @@ -4,8 +4,10 @@ DISTUTILS_BUILD_ARGS ?= ""
>>   DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
>>   DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
>>       --install-data=${STAGING_DATADIR}"
>> -DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>> -    --install-data=${D}/${datadir}"
>> +DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
>> +    --prefix=${prefix} \
>> +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
>> +    --install-data=${datadir}"
>>
>>   distutils_do_compile() {
>>            STAGING_INCDIR=${STAGING_INCDIR} \
>> @@ -34,7 +36,7 @@ distutils_do_install() {
>>           STAGING_INCDIR=${STAGING_INCDIR} \
>>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>>           PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
>> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
>> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
>>           bbfatal_log "${PYTHON_PN} setup.py install execution failed."
>>
>>           # support filenames with *spaces*
>> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
>> index d4b92a3..9637486 100644
>> --- a/meta/classes/distutils3.bbclass
>> +++ b/meta/classes/distutils3.bbclass
>> @@ -5,8 +5,10 @@ DISTUTILS_BUILD_EXT_ARGS ?= ""
>>   DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
>>   DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
>>       --install-data=${STAGING_DATADIR}"
>> -DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>> -    --install-data=${D}/${datadir}"
>> +DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
>> +    --prefix=${prefix} \
>> +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
>> +    --install-data=${datadir}"
>>
>>   distutils3_do_configure() {
>>          if [ "${CLEANBROKEN}" != "1" ] ; then
>> @@ -45,7 +47,7 @@ distutils3_do_install() {
>>           STAGING_INCDIR=${STAGING_INCDIR} \
>>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>>           PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
>> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
>> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
>>           bbfatal_log "${PYTHON_PN} setup.py install execution failed."
>>
>>           # support filenames with *spaces*
>> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
>> index 157ef63..a923ea3 100644
>> --- a/meta/classes/setuptools.bbclass
>> +++ b/meta/classes/setuptools.bbclass
>> @@ -1,8 +1,3 @@
>>   inherit distutils
>>
>>   DEPENDS += "python-setuptools-native"
>> -
>> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
>> -    --prefix=${prefix} \
>> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
>> -    --install-data=${datadir}"
>> diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
>> index de6dd94..8ca66ee 100644
>> --- a/meta/classes/setuptools3.bbclass
>> +++ b/meta/classes/setuptools3.bbclass
>> @@ -2,7 +2,3 @@ inherit distutils3
>>
>>   DEPENDS += "python3-setuptools-native"
>>
>> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
>> -    --prefix=${prefix} \
>> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
>> -    --install-data=${datadir}"
>> --
>> 2.7.4
>>



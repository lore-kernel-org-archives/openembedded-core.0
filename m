Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36E6A60291
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 07:02:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6872Iew007491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2019 00:02:18 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 8 Jul 2019 00:02:17 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1562290204.git.Qi.Chen@windriver.com>
	<c9d93056cbc6067892aa042e5f2c71f3cc264656.1562290204.git.Qi.Chen@windriver.com>
	<CAJTo0LZjFA7t_nqnF9m-=Mm4pcNkJmNf8Puwo6RgeZQnNZkUog@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <10aba9fe-8ec5-05bf-af3d-bb0ae8bfd4a8@windriver.com>
Date: Mon, 8 Jul 2019 15:14:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZjFA7t_nqnF9m-=Mm4pcNkJmNf8Puwo6RgeZQnNZkUog@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xmlcatalog.bbclass: execute xmlcatalog only if it's available
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
X-List-Received-Date: Mon, 08 Jul 2019 07:02:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2019 12:38 AM, Burton, Ross wrote:
> We could just always install libxml2 into the SDK...

Good idea. I'll send out a new patch.

> On Fri, 5 Jul 2019 at 02:18, Chen Qi <Qi.Chen@windriver.com> wrote:
>> For build-sysroots.bb, the xmlcatalog would not be in its
>> staging directory. Causing the following error for eSDK.
>>
>> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.
>> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function failed: do_build_native_sysroot
>>
>> The problem could be reproduced by the following steps.
>> 1. Add in local.conf:
>>     IMAGE_INSTALL_append = " btrfs-tools"
>>     DISTRO_FEATURES_append = " api-documentation"
>>     INHERIT += "testsdk"
>> 2. bitbake core-image-minimal -c populate_sdk_ext
>> 3. bitbake core-image-minimal -c testsdkext
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/xmlcatalog.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
>> index 075aef8..e805e7b 100644
>> --- a/meta/classes/xmlcatalog.bbclass
>> +++ b/meta/classes/xmlcatalog.bbclass
>> @@ -5,6 +5,8 @@ XMLCATALOGS ?= ""
>>   SYSROOT_PREPROCESS_FUNCS_append = " xmlcatalog_sstate_postinst"
>>
>>   xmlcatalog_complete() {
>> +       # In case of eSDK, build-sysroot does not have xmlcatalog in its staging directory.
>> +       [ "`which xmlcatalog`" = "" ] && exit 0
>>          ROOTCATALOG="${STAGING_ETCDIR_NATIVE}/xml/catalog"
>>          if [ ! -f $ROOTCATALOG ]; then
>>                  mkdir --parents $(dirname $ROOTCATALOG)
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core




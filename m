Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id CF20C60886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 09:41:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,825,1367942400"; 
   d="scan'208";a="8132617"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 06 Aug 2013 17:38:01 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r769f0GJ004257;
	Tue, 6 Aug 2013 17:41:00 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013080617393864-450418 ;
	Tue, 6 Aug 2013 17:39:38 +0800 
Message-ID: <5200C4AA.20504@cn.fujitsu.com>
Date: Tue, 06 Aug 2013 17:40:58 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <51FF72B7.9070706@cn.fujitsu.com>
	<51FFE366.7010603@linux.intel.com>
In-Reply-To: <51FFE366.7010603@linux.intel.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/06 17:39:38,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/06 17:39:41,
	Serialize complete at 2013/08/06 17:39:41
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: fix configure error
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
X-List-Received-Date: Tue, 06 Aug 2013 09:41:06 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8


said the following on 2013-8-6 1:39:, Saul Wold wrote:
> On 08/05/2013 02:39 AM, Bian Naimeng wrote:
>> If we don't create ${STAGING_ICU_DIR_NATIVE} before doing
>> do_configure for cross target, the following will be caught.
>>
>>   |configure: error: No such directory ${cross_buildroot} supplied as
>>   | the argument to --with-cross-build. Use an absolute path.
>>   |Configure failed. The contents of all config.log files follows to
>>   | aid debugging
>>   |ERROR: oe_runconf failed
>>
> Is this really needed?  Which ICU is failing, the target or -native version?  The target version depends on the -native version which should have created this directory first.
> 

We don't need it almost.
As you said, the native version will create this directory first.

> What are the steps to reproduce this?

It occurs in my strange case.
My icu-native is different version from icu.

In my opinion, it's better to remove this dependence.

Thanks
 Bian

> 
> Sau!
> 
>> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>>
>> ---
>>   meta/recipes-support/icu/icu.inc |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
>> index e3944cd..3987e42 100644
>> --- a/meta/recipes-support/icu/icu.inc
>> +++ b/meta/recipes-support/icu/icu.inc
>> @@ -27,6 +27,7 @@ EXTRA_OECONF_class-native = ""
>>   # http://bugs.icu-project.org/trac/ticket/9790
>>   do_configure_prepend() {
>>       [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4 ${S}/acinclude.m4
>> +    [ -d ${STAGING_ICU_DIR_NATIVE} ] || mkdir -p ${STAGING_ICU_DIR_NATIVE}
>>   }
>>
>>   do_install_append_class-native() {



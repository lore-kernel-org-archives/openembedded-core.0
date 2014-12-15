Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ABB0D7254B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 21:59:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2014 13:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,581,1413270000"; d="scan'208";a="637980505"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2014 13:59:31 -0800
Message-ID: <548F59C3.6010500@linux.intel.com>
Date: Mon, 15 Dec 2014 13:59:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1418671309-23451-1-git-send-email-sgw@linux.intel.com>
	<548F4684.9000401@gmail.com>
In-Reply-To: <548F4684.9000401@gmail.com>
Subject: Re: [PATCH] openssh: move setting LD to allow for correct override
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
X-List-Received-Date: Mon, 15 Dec 2014 21:59:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2014 12:37 PM, akuster808 wrote:
> Saul,
>
> is this needed for dizzy too?
>
Yes and daisy, which I will do when this gets merged, I was going to 
wait until it was in head before asking for the backport.

Sau!

> - Armin
>
> On 12/15/2014 11:21 AM, Saul Wold wrote:
>> Using the export LD in the recipe does not allow for secodnary toolchain
>> overriding LD later, by setting it in the do_configure_append the export
>> is used by autotools setting LD based on the env, but would allow for
>> override later.
>>
>> [YOCTO #6997]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/recipes-connectivity/openssh/openssh_6.6p1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
>> b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
>> index dbcf414..abc302b 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
>> @@ -49,7 +49,6 @@ inherit autotools-brokensep ptest
>>
>>   # LFS support:
>>   CFLAGS += "-D__FILE_OFFSET_BITS=64"
>> -export LD = "${CC}"
>>
>>   # login path is hardcoded in sshd
>>   EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
>> @@ -74,6 +73,7 @@ CACHED_CONFIGUREVARS +=
>> "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
>>   EXTRA_OECONF_append_libc-uclibc=" --without-pam"
>>
>>   do_configure_prepend () {
>> +    export LD="${CC}"
>>       install -m 0644 ${WORKDIR}/sshd_config ${B}/
>>       install -m 0644 ${WORKDIR}/ssh_config ${B}/
>>       if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
>>
>
>


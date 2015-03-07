Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 93DFE60144
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2015 04:13:38 +0000 (UTC)
Received: by padfa1 with SMTP id fa1so56559771pad.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 20:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=HG+ZH8RJOxHAqRe7Zhad7wC94Uk6UJdwSrnZXA7DlHU=;
	b=wGg6onn0LsBc9WJlWHXhY0t5lo9mF3tWdHA4phH/QnSYRukcJcgaZhz6phcX1y0pAl
	Qc0AT/iR3Fk3dk+0Mi4C5y3BB77PbUwZG+LPkCH63s+7gjVSVPKG5oSQ5VY2C4/cziiO
	kr4hXSbGWWv9ywn/U7S0CS3hvOZL/6JggzDQ2O9NhKnL/jKVCbXOPH+RWC/IXFhPDWrt
	epaqfJGyGswo1udOMHV691h79fhiPG6D/Rc/lByp1RO4UD7i37540+79n0S+OWgThc4I
	CNxmqK831jWrWwsWjAj1ciny5cK+FRmd3CB9V2MKOgWZOoaxW+rpyTaK9K8ltx45JqPQ
	SLRg==
X-Received: by 10.66.119.37 with SMTP id kr5mr31397904pab.136.1425701619379;
	Fri, 06 Mar 2015 20:13:39 -0800 (PST)
Received: from ?IPv6:2601:c:a700:3ba7:e952:cb43:4c13:6355?
	([2601:c:a700:3ba7:e952:cb43:4c13:6355])
	by mx.google.com with ESMTPSA id z4sm10918005pdn.46.2015.03.06.20.13.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Mar 2015 20:13:38 -0800 (PST)
Message-ID: <54FA7AF0.1030703@gmail.com>
Date: Fri, 06 Mar 2015 20:13:36 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1425596608-24197-1-git-send-email-Martin.Jansa@gmail.com>
	<20150305230712.GC2337@jama>
In-Reply-To: <20150305230712.GC2337@jama>
Subject: Re: [dizzy][PATCH] serf: fix 'ccache' builds
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
X-List-Received-Date: Sat, 07 Mar 2015 04:13:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

working on dizzy merged this weekend.

- armin

On 03/05/2015 03:07 PM, Martin Jansa wrote:
> On Fri, Mar 06, 2015 at 12:03:28AM +0100, Martin Jansa wrote:
>> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>
>> 'scons' cleans the environment which breaks ccache builds because
>> CCACHEDIR can point to an unexpected location:
>>
>> | ccache arm-linux-gnueabi-gcc ... context.c
>> | ccache: failed to create .../serf/1.3.8-r0/.home/.ccache (No such file or directory)
>
> This also fixes the build with external toolchain which doesn't exist in
> STAGING_BINDIR_TOOLCHAIN, so please consider to merge this in dizzy.
>
>> Issue is described in
>>
>>    http://www.scons.org/wiki/ImportingEnvironmentSettings
>>
>> and because 'bitbake' cleans environment we can pass it completely
>> instead of trying to enumerate needed env.
>>
>> With the 'env.patch' the FULLCC variable is not needed anymore (which
>> would break when CC is 'ccache arm-...-gcc' and host ccache is used)
>> because the correct $PATH is available during scons build:
>>
>> | sh: .../sysroots/x86_64-oe-linux/usr/bin/arm-linux-gnueabi/ccache: No such file or directory
>> | scons: *** [context.o] Error 127
>>
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>   meta/recipes-support/serf/serf/env.patch | 28 ++++++++++++++++++++++++++++
>>   meta/recipes-support/serf/serf_1.3.7.bb  |  8 +++-----
>>   2 files changed, 31 insertions(+), 5 deletions(-)
>>   create mode 100644 meta/recipes-support/serf/serf/env.patch
>>
>> diff --git a/meta/recipes-support/serf/serf/env.patch b/meta/recipes-support/serf/serf/env.patch
>> new file mode 100644
>> index 0000000..9d073e9
>> --- /dev/null
>> +++ b/meta/recipes-support/serf/serf/env.patch
>> @@ -0,0 +1,28 @@
>> +'scons' cleans the environment which breaks ccache builds because
>> +CCACHEDIR can point to an unexpected location:
>> +
>> +| ccache arm-linux-gnueabi-gcc ... context.c
>> +| ccache: failed to create .../serf/1.3.6-r0/.home/.ccache (No such file or directory)
>> +
>> +Issue is described in
>> +
>> +  http://www.scons.org/wiki/ImportingEnvironmentSettings
>> +
>> +and because 'bitbake' cleans environment we can pass it completely
>> +instead of trying to enumerate needed env.
>> +
>> +Upstream-Status: Inappropriate
>> +
>> +
>> +Index: serf-1.3.6/SConstruct
>> +===================================================================
>> +--- serf-1.3.6.orig/SConstruct
>> ++++ serf-1.3.6/SConstruct
>> +@@ -149,6 +149,7 @@ if sys.platform == 'win32':
>> + env = Environment(variables=opts,
>> +                   tools=('default', 'textfile',),
>> +                   CPPPATH=['.', ],
>> ++                  ENV = os.environ,
>> +                   )
>> +
>> + env.Append(BUILDERS = {
>> diff --git a/meta/recipes-support/serf/serf_1.3.7.bb b/meta/recipes-support/serf/serf_1.3.7.bb
>> index 5230ef7..b87a04a 100644
>> --- a/meta/recipes-support/serf/serf_1.3.7.bb
>> +++ b/meta/recipes-support/serf/serf_1.3.7.bb
>> @@ -1,6 +1,7 @@
>>
>>   SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.7.tar.bz2 \
>> -           file://norpath.patch"
>> +           file://norpath.patch \
>> +           file://env.patch"
>>   SRC_URI[md5sum] = "0a6fa745df4517dd8f79c75c538919bc"
>>   SRC_URI[sha256sum] = "ecccb74e665e6ea7539271e126a21d0f7eeddfeaa8ce090adb3aec6682f9f0ae"
>>
>> @@ -9,12 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>>
>>   DEPENDS = "python-scons-native openssl apr apr-util util-linux expat"
>>
>> -FULLCC = "${STAGING_BINDIR_TOOLCHAIN}/${CC}"
>> -FULLCC_class-native = "${CC}"
>> -
>>   do_compile() {
>>   	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} \
>> -		CC="${FULLCC}" \
>> +		CC="${CC}" \
>>   		APR=`which apr-1-config` APU=`which apu-1-config` \
>>   		CFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" \
>>   		OPENSSL="${STAGING_EXECPREFIXDIR}"
>> --
>> 2.3.1
>>
>
>
>


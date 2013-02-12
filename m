Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U5OCL-0006Mc-Hl
	for Openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 23:20:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1CM3Woc005840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Feb 2013 14:03:32 -0800 (PST)
Received: from [172.25.32.35] (172.25.32.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 14:03:31 -0800
Message-ID: <511ABC32.4000803@windriver.com>
Date: Tue, 12 Feb 2013 16:03:30 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1360697804-39039-1-git-send-email-jason.wessel@windriver.com>
	<1360705147.30425.70.camel@ted>
In-Reply-To: <1360705147.30425.70.camel@ted>
X-Enigmail-Version: 1.5
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool-native_2.4.2.bb: Always use /bin/sed for SED
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 22:20:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 02/12/2013 03:39 PM, Richard Purdie wrote:
> On Tue, 2013-02-12 at 13:36 -0600, Jason Wessel wrote:
>> If you never use sstate and always build everything from scratch you
>> will never see this problem.  However, if you use sstate and build
>> directories that last a long time eventually you can end up with the
>> scenario where libtool gets a hard coded path in it for sed, and sed
>> may not exist.  The reason you don't see this problem to often if you
>> generally build from scratch is that libtool builds before sed and
>> will pickup the host's /bin/sed.
>>
>> The way to reproduce the issue is:
>>
>> bitbake some_image
>> bitbake -c cleansstate libtool-native
>> bitbake sed-native
>> bitbake libtool-native
>> bitbake -c clean sed-native
>> bitbake ANY_PACKAGE_THAT_USES_LIBTOOL_NATIVE
>>
>> In my case I used modphp, which doesn't exist in the oe-core. You will
>> end up with a strange looking error like:
>>
>> | make[1]: *** [buckets/apr_buckets_alloc.lo] Error 1
>> | /opt/build/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool: line 981: /opt/build/bitbake_build/tmp/sysroots/x86_64-linux//bin/sed: No such file or directory
>>
>> The solution is to always use /bin/sed for libtool-native.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  .../libtool/libtool-native_2.4.2.bb                |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
>> index f12e6a1..18188ef 100644
>> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
>> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
>> @@ -2,12 +2,13 @@ require libtool-${PV}.inc
>>  
>>  DEPENDS = ""
>>  
>> -PR = "${INC_PR}.0"
>> +PR = "${INC_PR}.1"
>>  SRC_URI += "file://prefix.patch"
>>  
>>  inherit native
>>  
>>  EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
>> +CACHED_CONFIGUREVARS += "ac_cv_path_SED=/bin/sed"
> Do we have to set a path for it? Can't we rely on PATH being sane? I'm
> wondering if we should actually set this in the core site files.
> Hardcoding a path to utilities never usually ends well and this is just
> the tip of an iceberg.
>
> If we have to use a path, "${bindir}/env sed"?
>

The libtool seems to be in a class of its own with respect to internally hard coding things, so I am inclined to say this is a one off because A) it is libtool and B) it is part of the boot strap. For any other packages I have not observed any kind of problem with the sysroot sed vs host provided sed.

Unfortunately doing ${bindir}/env sed can lead to a fairly rare race where sed can be there an get removed later because it will prefer the sed in the sysroot area because it is in the path first.  I never hit any of these problems until recently while continuing to just randomly build things with the usual stream of updates from the git repository.

If we want libtool-native to use something other than /bin/sed on the host, the bootstrap needs some kind of overhaul to make libtool depend correctly on sed.  Currently we end up with a circular dependency if you try to make libtool-native depend on sed-native.

Jason.



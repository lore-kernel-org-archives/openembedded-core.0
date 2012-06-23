Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SiGad-0004nX-LL
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 05:00:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5N2ntE3011166
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Jun 2012 19:49:55 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 22 Jun 2012 19:49:55 -0700
Message-ID: <4FE52ED1.8090908@windriver.com>
Date: Sat, 23 Jun 2012 10:49:53 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340272953.git.liezhi.yang@windriver.com>
	<43117c408ee5a090f94b1a9638f9056d87be9077.1340272953.git.liezhi.yang@windriver.com>
	<1340275793.1640.88.camel@ted>
In-Reply-To: <1340275793.1640.88.camel@ted>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] autogen-native 5.12: fix ccache issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jun 2012 03:00:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/21/2012 06:49 PM, Richard Purdie wrote:
> On Thu, 2012-06-21 at 18:04 +0800, Robert Yang wrote:
>> The autogen-native built error on FC17:
>>
>> ccache: failed to create /dev/null/.ccache
>>
>> This is because the gcc of FC17 is a symlink to ccache, so the ccache
>> will always be used regardless to the user's setting, ccache uses
>> $HOME/.ccache as the CCACHE_DIR if it has not been set, and autogen set
>> HOME=/dev/null.
>>
>> Assign CCACHE_DIR the default value to preven it uses $HOME/.ccache
>> would fix the error.
>>
>> [YOCTO #2554]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   .../autogen/autogen-native_5.12.bb                 |   20 ++++++++++++++++++++
>>   1 files changed, 20 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/autogen/autogen-native_5.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
>> index eb3721d..e80d555 100644
>> --- a/meta/recipes-devtools/autogen/autogen-native_5.12.bb
>> +++ b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
>> @@ -28,6 +28,26 @@ inherit autotools native
>>   export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
>>   export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache"
>>
>> +#
>> +# The do_compile_prepend is used for fixing a build error on FC17, the
>> +# gcc of FC17 is a symlink to ccache, if we don't set the CCACHE_DIR,
>> +# there would be an error:
>> +#
>> +# ccache: failed to create /dev/null/.ccache
>> +#
>> +# This is because ccache uses $HOME/.ccache as the CCACHE_DIR if it has
>> +# not been set, and autogen set HOME=/dev/null.
>> +#
>> +# Assign CCACHE_DIR the default value so that it would not use
>> +# $HOME/.ccache would fix the error.
>> +#
>> +do_compile_prepend() {
>> +	if [ "${CCACHE_DIR}" = "" ]; then
>> +		export CCACHE_DISABLE=true
>> +		export CCACHE_DIR=$HOME
>> +	fi
>> +}
>> +
>>   do_install_append () {
>>   	create_wrapper ${D}/${bindir}/autogen \
>>   		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
>
> Could we just set CCACHE_DISABLE ?
>

I'm afraid not, it still has the same error if we just set CCACHE_DISABLE,
this is a bug of ccache 3.1.7, it may be fixed in ccache 3.2.

> In fact could we just set that globally?
>
> I'm afraid I don't like fixing this on a per recipe basis...
>

I think that this is only needed by the recipe which set HOME=/dev/null,
the autogen-native is the only one as far as I know, yes, fix it globally
would be better (disable it explicitly if it is not enabled), I will send a V2.

// Robert

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7UK4-00053K-BA
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:43:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2012 09:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,348,1344236400"; d="scan'208";a="216786035"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2012 09:31:38 -0700
Message-ID: <5040E6EA.4010806@linux.intel.com>
Date: Fri, 31 Aug 2012 09:31:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
	<CAMKF1sr=pHa21ihb5y6m9tkLYV4zG2__hWkBBZML=S9eRZhZfw@mail.gmail.com>
In-Reply-To: <CAMKF1sr=pHa21ihb5y6m9tkLYV4zG2__hWkBBZML=S9eRZhZfw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] poky-tiny: Enable x86-64 to build eglibc correctly
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
X-List-Received-Date: Fri, 31 Aug 2012 16:43:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2012 02:49 PM, Khem Raj wrote:
> On Thu, Aug 30, 2012 at 12:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> The libc-libm-big option allows eglibc to correctly configure
>> itself to include the correct math functions for 64bit operations
>>
>> [YOCTO #2943]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta-yocto/conf/distro/poky-tiny.conf |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
>> index 8ae1d85..bfb4432 100644
>> --- a/meta-yocto/conf/distro/poky-tiny.conf
>> +++ b/meta-yocto/conf/distro/poky-tiny.conf
>> @@ -63,6 +63,7 @@ ASSUME_PROVIDED += "pkgconfig$"
>>   # Reconfigure eglibc for a smaller installation
>>   # Comment out any of the lines below to disable them in the build
>>   DISTRO_FEATURES_LIBC_TINY = "libc-libm libc-crypt"
>> +DISTRO_FEATURES_LIBC_TINY_append_x86-64 = " libc-libm-big"
>>
>>   # Required for "who"
>>   DISTRO_FEATURES_LIBC_MINIMAL = "libc-utmp libc-getlogin"
>
>
> there is a bug in eglibc if it cant build without libc-libm-big
> it should have not caused any undefined symbol failures because
> all it should have done is not use double precision so your computations
> will be less accurate.
>

Khem,

You are correct the problem is that if the libm-big option is not 
specificed it grabs the dbl-wrap files for some sysdep function, but 
still uses the dbl-64 functions for others.

Should I file an eglibc bug?

Sau!

>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



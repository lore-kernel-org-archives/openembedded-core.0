Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E67B16A549
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 21:21:02 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Jun 2013 14:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,868,1363158000"; d="scan'208";a="255203283"
Received: from unknown (HELO [10.255.12.161]) ([10.255.12.161])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jun 2013 14:21:02 -0700
Message-ID: <51BB893E.6020103@linux.intel.com>
Date: Fri, 14 Jun 2013 14:21:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1371242900-7066-1-git-send-email-sgw@linux.intel.com>
	<1371244100.20823.92.camel@ted>
In-Reply-To: <1371244100.20823.92.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-buildenv-internal: Preserve/Unset and Restore TERM
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
X-List-Received-Date: Fri, 14 Jun 2013 21:21:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2013 02:08 PM, Richard Purdie wrote:
> On Fri, 2013-06-14 at 13:48 -0700, Saul Wold wrote:
>> Having a value in TERM that is not recognized by the nativesdk can cause
>> potential escape sequences appearing in the output stream, the can be seen
>> on Ubuntu with TERM=xterm-256color. Unsetting TERM allows for consistent
>> results in the python output.
>>
>> Also, don't exit, use return, otherwise the shell exits and get no error information.
>>
>> [YOCTO #4732]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   scripts/oe-buildenv-internal | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
>> index 40d95b7..9be034b 100755
>> --- a/scripts/oe-buildenv-internal
>> +++ b/scripts/oe-buildenv-internal
>> @@ -29,6 +29,8 @@ if [ ! -z "$OECORE_SDK_VERSION" ]; then
>>       return 1
>>   fi
>>
>> +TERM_save=$TERM
>> +unset TERM
>>   # Make sure we're not using python v3.x. This check can't go into
>>   # sanity.bbclass because bitbake's source code doesn't even pass
>>   # parsing stage when used with python v3, so we catch it here so we
>> @@ -37,7 +39,7 @@ py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
>>   if [ "$py_v3_check" != "" ]; then
>>   	echo "Bitbake is not compatible with python v3"
>>   	echo "Please set up python v2 as your default python interpreter"
>> -	exit 1
>> +	return 1
>>   fi
>>
>>   # Similarly, we now have code that doesn't parse correctly with older
>> @@ -46,7 +48,7 @@ fi
>>   py_v26_check=`python -c 'import sys; print sys.version_info >= (2,7,3)'`
>>   if [ "$py_v26_check" != "True" ]; then
>>   	echo "BitBake requires Python 2.7.3 or later"
>> -	exit 1
>> +	return 1
>>   fi
>>
>>   if [ "x$BDIR" = "x" ]; then
>> @@ -107,3 +109,5 @@ HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
>>   all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
>>   SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
>>   SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
>> +
>> +export TERM=$TERM_save
>
> No. This is just wrong in so many ways. I commented on the bug.
>
> This also means any command you run after sourcing the script gets a
> broken TERM value.
>
It's not a broken TERM value from the Distro's standpoint, only from our 
nativesdk python's standpoint, the value is correct for the distro,
devshell and visual tools all work correctly.

We need to at least fix the exit vs return.

Sau!

> Cheers,
>
> Richard
>
>
>


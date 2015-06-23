Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4B360097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 17:17:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2015 10:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,666,1427785200"; d="scan'208";a="513046852"
Received: from dvhart-mac02.jf.intel.com (HELO [10.24.0.250]) ([10.24.0.250])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2015 10:17:22 -0700
User-Agent: Microsoft-MacOutlook/14.5.1.150515
Date: Tue, 23 Jun 2015 10:17:19 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <sgw@linux.intel.com>
Message-ID: <D1AEE18F.D4FA6%dvhart@linux.intel.com>
Thread-Topic: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000
	CPU
References: <1435072967-10333-1-git-send-email-sgw@linux.intel.com>
	<1435075347.11489.87.camel@linuxfoundation.org>
In-Reply-To: <1435075347.11489.87.camel@linuxfoundation.org>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000 CPU
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
X-List-Received-Date: Tue, 23 Jun 2015 17:17:24 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 6/23/15, 9:02 AM, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Tue, 2015-06-23 at 08:22 -0700, Saul Wold wrote:
>> This tune file is needed to enable a GAS option specific to this cpu
>>family
>> in order to disable the usage of lock prefix instructions.
>> 
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>  meta/conf/machine/include/tune-i586-nlp.inc | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 meta/conf/machine/include/tune-i586-nlp.inc
>> 
>> diff --git a/meta/conf/machine/include/tune-i586-nlp.inc
>>b/meta/conf/machine/include/tune-i586-nlp.inc
>> new file mode 100644
>> index 0000000..6815a16
>> --- /dev/null
>> +++ b/meta/conf/machine/include/tune-i586-nlp.inc
>> @@ -0,0 +1,20 @@
>> +#
>> +# Settings for the GAS(1) cpu-type quark/x1000 which has issues
>> +# with lock-prefix so use that option to omit them.
>> +#
>> +
>> +DEFAULTTUNE ?= "i586-nlp"
>> +
>> +# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
>> +require conf/machine/include/tune-i586.inc
>> +
>> +# x86 with no lock prefix
>> +TUNEVALID[nlp] = "IA32 with Lock Prefix omitted"
>> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "nlp", "
>>-Wa,-momit-lock-prefix=yes", "", d)}"
>> +
>> +# Quark tune feature
>> +AVAILTUNES = "i586-nlp"
>> +TUNE_FEATURES_tune-i586-nlp = "${TUNE_FEATURES_tune-i586} nlp"
>> +TUNE_PKGARCH_tune-i586-nlp = "i586-nlp"
>> +PACKAGE_EXTRA_ARCHS_tune-i586-nlp = "${PACKAGE_EXTRA_ARCHS_tune-i586}
>>i586-nlp"
>
>Since i586 doesn't work with this hardware, should this inherit the i586
>tune?

Hrm... The thing we need to avoid is quark machines accepting an i586
package in lieu of a i586-nlp package. I don't think that's a problem here
is it? The PACKAGE_EXTRA_ARCHS makes it so the i586-nlp package can be
used on machines that require i586, but not vice versa - correct?

I don't see a conflict here, but maybe I'm missing something.

-- 
Darren Hart
Intel Open Source Technology Center





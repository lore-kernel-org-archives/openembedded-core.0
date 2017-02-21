Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E838772F7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:20:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 10:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="936524307"
Received: from unknown (HELO [10.219.25.91]) ([10.219.25.91])
	by orsmga003.jf.intel.com with ESMTP; 21 Feb 2017 10:20:03 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1486757577.git.mariano.lopez@linux.intel.com>
	<c5b75215539cdca65e5d5d90fa7b0068fb142473.1486757577.git.mariano.lopez@linux.intel.com>
	<1487217741.4999.1.camel@linuxfoundation.org>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <c7c355dd-fd96-9af5-28a7-d7b7d31469af@linux.intel.com>
Date: Tue, 21 Feb 2017 12:21:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487217741.4999.1.camel@linuxfoundation.org>
Subject: Re: [PATCHv2 1/1] insane.bbclass: Add missing dependencies
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
X-List-Received-Date: Tue, 21 Feb 2017 18:20:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 15/02/17 22:02, Richard Purdie wrote:
> On Fri, 2017-02-10 at 14:19 -0600, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> package_qa task requires some tools installed in sysroot; with
>> the introduction of recipe specific sysroot this task won't
>> have such tools installed if it's forced to run.
>>
>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>> ---
>>  meta/classes/insane.bbclass | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/insane.bbclass
>> b/meta/classes/insane.bbclass
>> index 3cf86c1..0167b14 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -1223,9 +1223,12 @@ python do_package_qa () {
>>      bb.note("DONE with PACKAGE QA")
>>  }
>>  
>> +# binutils is used for most checks, so need to set as dependency
>> +# POPULATESYSROOTDEPS is defined in staging class.
>> +do_package_qa[depends] += "${POPULATESYSROOTDEPS}"
>>  do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
>>  do_package_qa[rdeptask] = "do_packagedata"
>> -addtask do_package_qa after do_packagedata do_package before
>> do_build
>> +addtask do_package_qa after do_prepare_recipe_sysroot do_packagedata
>> do_package before do_build
> This is close but I don't think you need this last addtask change, I
> think it should work just fine with the added [depends]?

Indeed, it works just with [depends]. Just sent v3 of this patch.

Mariano

>
> Cheers,
>
> Richard



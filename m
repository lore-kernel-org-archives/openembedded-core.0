Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TED8X-0005qL-SV
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 07:47:50 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 22:35:07 -0700
Received: by pbcwy7 with SMTP id wy7so1556547pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Q94Ms9HgkZpuw947vsJCn+H6G6K2k/h+sO4IWXhHPoA=;
	b=VszpbJtyNTwrgMqZFW7kCr0XffFT3SEwmniiZf7gnYVaUARXRB7v7e3rgpPDD52nS1
	xsL7kxe5RChMFPlZr7ivJy3Bw7c4uCo0h3NI6GRk6HToX/QkamvxI+jf0/miPhK7/opn
	r76iExKIjU799kl/sWNmBac3szf479tUxDXCJP+KU7eJWZw8EYKo6PUle1tahf8LZx8f
	xb6QYezcgsKDWnLkPjXKrg1b2WNwoudadcFocvjtVAr1OJmyvzgW+iA0S2KvOAFb7LbA
	Y37tXkxAi+udduJ4mO+zPf8yctmNnsyNafqJpvoMy+q8uEdjY8CXBCQ/kp1vGOw2RVuh
	ENyQ==
Received: by 10.68.233.198 with SMTP id ty6mr4452000pbc.107.1348032907484;
	Tue, 18 Sep 2012 22:35:07 -0700 (PDT)
Received: from [192.168.1.104] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id vd4sm1220298pbc.41.2012.09.18.22.35.05
	(version=SSLv3 cipher=OTHER); Tue, 18 Sep 2012 22:35:05 -0700 (PDT)
Message-ID: <50595988.5080901@intel.com>
Date: Tue, 18 Sep 2012 22:35:04 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1347664421.git.scott.a.garman@intel.com>
	<674d84a9020d9fc0abfe8a45e6476ef63987d3a6.1347664421.git.scott.a.garman@intel.com>
	<5053BBD6.6000202@windriver.com>
In-Reply-To: <5053BBD6.6000202@windriver.com>
X-Gm-Message-State: ALoCoQlyUPngltvcWnfBPPxLfu7nZct5NIHE6jJn3KLPp1lROKf2DxcrmlwBshso1Zl1Ae63GZIk
Subject: Re: [PATCH 1/1] runqemu: show bitbake errors to user
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
X-List-Received-Date: Wed, 19 Sep 2012 05:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2012 04:20 PM, Mark Hatle wrote:
> On 9/14/12 6:15 PM, Scott Garman wrote:
>> In certain edge cases, bitbake may fail to run and cause setup_tmpdir()
>> within runqemu to fail, and not give the user a helpful error message.
>> Catch this case and show the user the output of bitbake -e.
>>
>> This fixes [YOCTO #3112]
>>
>> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> ---
>>   scripts/runqemu |   12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index e843946..8bb77ff 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -283,8 +283,16 @@ setup_tmpdir() {
>>           # We have bitbake in PATH, get OE_TMPDIR from bitbake
>>           OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | grep ^TMPDIR=\" |
>> cut -d '=' -f2 | cut -d '"' -f2`
>>           if [ -z "$OE_TMPDIR" ]; then
>> -            echo "Error: this script needs to be run from your build
>> directory,"
>> -            echo "or you need to explicitly set OE_TMPDIR in your
>> environment"
>> +            # Check for errors from bitbake that the user needs to
>> know about
>> +            BITBAKE_OUTPUT=`bitbake -e`
>
> I'm not sure that is a good idea.  If there is a failure (anything on
> stderr) it will just be dumped to the screen...

I'm afraid this is not the case with the error case I was testing this 
against. That case being when there is an LCONF_VERSION mismatch in 
bblayers.conf. Those user instructions are written to STDOUT.

> If it does succeed, it could attempt to load that variable with many MB
> of data, which also likely isn't what is desired.

This is a valid point. I could change it to bitbake -e | wc -l, and 
check the number of lines of output. I'm basically just checking to see 
that this is greater than 0.

> It might be better to dump the items to a tmp file (securely created of
> course)  ;)  and then keep processing the same file for error messages,
> warnings, etc...

This code path should only be run on very unusual edge cases, so I'm not 
inclined to add additional tmpfile handling complexity and have to deal 
with cleaning up the files, etc.

I will re-spin this patch with the wc -l modification.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



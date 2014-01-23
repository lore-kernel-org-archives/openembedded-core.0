Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9B79F6B05F
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 16:52:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NGqx5P005744
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jan 2014 08:52:59 -0800 (PST)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 08:52:59 -0800
Message-ID: <52E148E8.2030407@windriver.com>
Date: Thu, 23 Jan 2014 10:52:56 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>	
	<1390487566-13569-2-git-send-email-jason.wessel@windriver.com>
	<1390489278.24755.16.camel@e130.pbcl.net>
In-Reply-To: <1390489278.24755.16.camel@e130.pbcl.net>
X-Enigmail-Version: 1.6
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] unfs3: Add a NFSv3 user mode server for use with runqemu
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
X-List-Received-Date: Thu, 23 Jan 2014 16:52:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 01/23/2014 09:01 AM, Phil Blundell wrote:
> On Thu, 2014-01-23 at 08:32 -0600, Jason Wessel wrote:
>> +++ b/meta/files/common-licenses/unfs3
>> @@ -0,0 +1,24 @@
>> +UNFS3 user-space NFSv3 server
>> +(C) 2003, Pascal Schmidt <unfs3-server@ewetel.net>
>> +
>> +Redistribution and use in source and binary forms, with or without
>> +modification, are permitted provided that the following conditions are met:
>> +
>> +1. Redistributions of source code must retain the above copyright notice,
>> +   this list of conditions and the following disclaimer.
>> +2. Redistributions in binary form must reproduce the above copyright notice,
>> +   this list of conditions and the following disclaimer in the documentation
>> +   and/or other materials provided with the distribution.
>> +3. The name of the author may not be used to endorse or promote products
>> +   derived from this software without specific prior written permission.
> Isn't this just the 3-clause BSD licence?

Because it did not diff between the two (the words are different) I included the license.

It appears Pascal modified it ever so slightly.  Perhaps legally they mean the same thing, but given I am not a lawyer I opted to include it.

-- The one from above
3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

--- vs BSD listed in YP
3. Neither the name of the University nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.



There were other subtle changes too.


>
>> --- /dev/null
>> +++ b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
>> @@ -0,0 +1,158 @@
>> +Add ability to specify rcp port numbers
>> +
>> +In order to run more than one unfs server on a host system, you must
>> +be able to specify alternate rpc port numbers.
>> +
>> +Jason Wessel <jason.wessel@windriver.com>
>> +
>> +Upstream-Status: Pending
> I think you said in the cover letter that the patches had been sent
> upstream.  If that's the case then it should be Upstream-Status:
> Submitted.




Thanks,  I'll make a v3, these are all submitted and pending upstream review.

>> +RDEPENDS_${PN} = "pseudo"
>> +RDEPENDS_${PN}_class-native = "pseudo-native"
>> +RDEPENDS_${PN}_class-nativesdk = "pseudo-nativesdk"
> That looks a bit odd.  Are the latter two lines doing anything very
> useful?


The usnfs3 is useless without pseudo.   The 2nd of the two might not be needed, but it had been there since the YP 1.3 days.   For building the nativesdk and having a working unfs3 the 3rd one was required.   I'll leave this in there for the v3.


>
>> +# This recipe is intended for -native and -nativesdk builds only,
>> +# not target installs:
> Why?  If this is really the case, shouldn't it be named unfs3-native in
> the first place?

Now that the autoconf pieces are fixed in the v2, I can remove this restriction in v3.   It does work on the target system now.

Jason.


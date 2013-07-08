Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF0BA6A5A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 16:55:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r68Gt6dg000950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2013 09:55:07 -0700 (PDT)
Received: from msp-dhcp27.wrs.com (172.25.34.27) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 09:55:06 -0700
Message-ID: <51DAEEE9.6000203@windriver.com>
Date: Mon, 8 Jul 2013 11:55:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CALmOhgk+NG_aqEwbtKXm0KTWGEim9z5bCpCE8sHiovsaDiTPew@mail.gmail.com>
	<51D0569A.7050705@balister.org>
In-Reply-To: <51D0569A.7050705@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Mon, 08 Jul 2013 16:55:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/13 11:02 AM, Philip Balister wrote:
> On 06/30/2013 11:56 AM, Trevor Woerner wrote:
>> On 27 June 2013 10:08, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>>>
>>> A number of vendors are providing a modified version, so checking
>>> for just the version string is not enough.  We also need to check
>>> if the patch for the issue has been applied.  We use a modified
>>> version of the reproduced to check for the issue.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>> +
>>> +        if status != 0:
>>> +            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
>>
>>
>> Instead of returning an error and asking the user to manually update
>> their own 'make', wouldn't it be better if bitbake simply built its
>> own known-to-be-working -native version instead? In this way a good,
>> working version of 'make' could be installed in a potential SDK's
>> sysroot as well?
>
> Is the broken version good enough to build a working version?

(Catching up on email after my vacation...)

That is the primary issue, can we even trust the host system to work well enough 
to build a working version.

Second, there was recently a change to oe-core that got rid of all of the 
"bootstrap" builds, in favor of the 'buildtools'.  For anyone with an old or 
broken system, they will need to download (or build) the buildtools.. install it 
and have it in their path prior to running oe-core.

This will provide the basic set of python, tar, git, and make that is needed for 
the build system.

On a "working" host, you can use bitbake buildtools-tarball to generate it.

--Mark

> Philip
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>



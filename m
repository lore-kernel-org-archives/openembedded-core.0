Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA16D60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 22:45:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5MMjvsX028460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:45:57 -0700
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 22 Jun 2016 15:45:56 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1466632764-22540-1-git-send-email-jslater@windriver.com>
	<CAMKF1soa5wBYFyFV0sqxsN_0bpjTjpQ==Aow0Ui7ZAAhh-Mp=g@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <6ea53ae7-5516-a991-f9f6-111db319e5dc@windriver.com>
Date: Wed, 22 Jun 2016 17:45:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soa5wBYFyFV0sqxsN_0bpjTjpQ==Aow0Ui7ZAAhh-Mp=g@mail.gmail.com>
Subject: Re: [PATCH 0/1] blacklist: add BPNBLACKLIST support
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
X-List-Received-Date: Wed, 22 Jun 2016 22:45:58 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/22/16 5:35 PM, Khem Raj wrote:
> 
> On Jun 22, 2016 2:59 PM, "Joe Slater" <jslater@windriver.com
> <mailto:jslater@windriver.com>> wrote:
>>
>> We have encountered some issues with the use of PNBLACKLIST in recipes.
>> In particular, PNBLACKLIST[pkg] will not suppress building of lib32-pkg
>> or lib64-pkg so world builds can fail unexpectedly.
>>
>> One solution could be to implement BPNBLACKLIST[] which checks BPN instead
>> of PN when a recipe is being parsed.  I have included a patch to do this.
>>
>> If this were adopted, there are many recipes under meta-openembedded that
>> should probably changed to use BPNBLACKLIST instead of PNBLACKLIST.
> 
> Bpn will also mean native and nativesdk among others. I think its better to list
> multilibs explicitly.

This is intentional.

The problem with saying we have to list multilibs explicitly.  multilib naming
is arbitrary.  I can say that it probably fits the pattern of lib64, lib32,
libn32 and libx32.... but it doesn't have to.

But then I'd also need to blacklist native and nativesdk versions as well.. so
for a simple recipe that for some reason I want blacklisted, it's easier to hack
the recipe to just blacklist itself -- then enter 7 or more blacklists.

Using the BPNBLACKLIST I can blacklist a single recipe with one command and not
worry about multilibs, class extensions, etc.

(The patch leave PNBLACKLIST, specifically so that in the case where you want
only partial usage blacklisted you can.)

--Mark

>>
>> Joe Slater (1):
>>   blacklist: add BPNBLACKLIST support
>>
>>  meta/classes/blacklist.bbclass |   24 ++++++++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 



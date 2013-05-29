Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 461C06A619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:23:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TFNmmb020475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2013 08:23:48 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 29 May 2013 08:23:47 -0700
Message-ID: <51A61D83.30700@windriver.com>
Date: Wed, 29 May 2013 10:23:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
	<1430982.Rlu8fDEFUU@helios>
In-Reply-To: <1430982.Rlu8fDEFUU@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Wed, 29 May 2013 15:23:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/13 10:11 AM, Paul Eggleton wrote:
> On Wednesday 29 May 2013 10:09:44 Mark Hatle wrote:
>> Add S(ource) and B(uild) directory information to the recipe pkgdata files.
>> This allows external tools to find the appropriate information, and be able
>> to easily access the corresponding sources and build directories.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/package.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 02a1460..19b2b4c 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1124,6 +1124,8 @@ python emit_pkgdata() {
>>
>>       data_file = pkgdatadir + d.expand("/${PN}" )
>>       f = open(data_file, 'w')
>> +    f.write("S: %s\n" % d.expand("${S}"))
>> +    f.write("B: %s\n" % d.expand("${B}"))
>>       f.write("PACKAGES: %s\n" % packages)
>>       f.close()
>
> I'm not sure I'm totally comfortable with this idea. External tools shouldn't
> necessarily expect to be able to poke into the source after packaging occurs -
> rm_work (if enabled) will remove the work directory, and separately sstate may
> restore the pkgdata and not the workdir. In both situations these values will
> be invalid.
>
> If tools need to be able to find out the values of S and B then I think they
> ought to be querying them via bitbake.

When discussing this in the past, via IRC, it was mentioned that the pkgdata has 
all of the necessary data to figure out what has been built and much of the data 
that external (think eclipse based UI tools) need to figure out.

This particular case allows our tooling to not only list what was built, but 
allows the tools to go into the directory (B or S) and explore the sources, 
logs, etc.

If this is rejected, I'm fine, we'll just carry it forward on our own.. but I 
think it does have some generic value.

(Actually querying bitbake is what we started with, but when you query it 1000 
times.. it's pretty obvious this doesn't work, the time alone to query it for 
the 'B' and 'S' of each recipe is significant to the point of being unusable for 
external tools.)

--Mark

> Cheers,
> Paul
>



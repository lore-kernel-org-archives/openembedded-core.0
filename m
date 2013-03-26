Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UKT85-0005wE-Ve
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 13:37:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2QCKQ1E003906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 05:20:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 05:20:26 -0700
Message-ID: <51519287.7010404@windriver.com>
Date: Tue, 26 Mar 2013 07:20:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
	<1364231993-31670-2-git-send-email-mark.hatle@windriver.com>
	<1364230955.25692.138.camel@phil-desktop.brightsign>
	<51508505.5080706@windriver.com>
	<1364233524.25692.139.camel@phil-desktop.brightsign>
	<5150A649.8090409@windriver.com> <5150C603.2010207@windriver.com>
	<1364294307.25692.146.camel@phil-desktop.brightsign>
In-Reply-To: <1364294307.25692.146.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 RFC] rpm: Add workaround for debugedit-segv
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
X-List-Received-Date: Tue, 26 Mar 2013 12:37:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/13 5:38 AM, Phil Blundell wrote:
> On Mon, 2013-03-25 at 16:47 -0500, Mark Hatle wrote:
>> I've looked at the code some more.  It does checksum the header itself and then
>> if it's got contents, it also adds the contents to the checksum.. That is where
>> the failure appears to be happening:
>>
>>             if (u.shdr.sh_type != SHT_NOBITS)
>>               {
>>                 Elf_Data *d = elf_rawdata (dso->scn[i], NULL);
>>                 if (d == NULL)
>>                   goto bad;
>>                 process (d->d_buf, d->d_size);
>>               }
>>
>> So it's specifically checking for SHT_NOBITS, but it's matching so it falls
>> through and d->d_buf == 0, causing the failure.  I'll keep investigating, but
>> somehow that value (u.shdr.sh_type) is wrong [or at least unexpected!].
>
> Ah.  If a NOBITS section is getting reported as something else then it
> seems that this must clearly be a bug in libelf and ought to be fixed
> there rather than working around it in rpm.  What do you actually get as
> u.shdr.sh_type?

I posted an updated patch last night.  debugedit was re-translating (byte 
swapping) the header elements during the buildid calculations.  This was causing 
the value of sh_type to be in the ELF binaries native endian during the check. 
So big endian binaries failed to match the SHT_NOBITS, thus the problem being 
discovered on PPC and MIPS.

(Fix was to not translate the original values, but instead only translate a 
copy.  I verified the produced buildid was expected, as I now have a better 
understanding of how the buildid is generated.)

--Mark

> p.
>




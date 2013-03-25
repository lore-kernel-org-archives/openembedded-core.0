Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UKBBE-0007MO-Dy
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 18:27:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2PHAPeL001153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Mar 2013 10:10:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Mar 2013 10:10:32 -0700
Message-ID: <51508505.5080706@windriver.com>
Date: Mon, 25 Mar 2013 12:10:29 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
	<1364231993-31670-2-git-send-email-mark.hatle@windriver.com>
	<1364230955.25692.138.camel@phil-desktop.brightsign>
In-Reply-To: <1364230955.25692.138.camel@phil-desktop.brightsign>
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
X-List-Received-Date: Mon, 25 Mar 2013 17:27:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/13 12:02 PM, Phil Blundell wrote:
> On Mon, 2013-03-25 at 12:19 -0500, Mark Hatle wrote:
>> +Sections 23 and 24 (.plt and .bss) which are NOBITS have a loaded data address
>> +of 0, but a size != 0.
>
> That doesn't seem like totally unreasonable behaviour for a NOBITS
> section.  What were you expecting libelf to do in that case?
>
> ++      if (data != NULL && size != 0)
> ++        hashFunctionContextUpdateMC (&ctx, &chunk);
>
> I suppose one could argue that allocating a chunk of zero-filled memory
> of the right size and then hashing that would be a slightly better fix.
> Whether it matters in practice or not would depend on what exactly is
> going into this hash and what it's being used for.

It appears in the past it either didn't load the section at all, or the size was 
set to 0.

It's a combination of the data pointer set to NULL and the size != 0 that is 
causing the segfault.  This doesn't appear to happen outside of PPC and MIPS.

I'm going to look into identifying if the section is a NOBITS and skipping the 
whole operation if it is.

--Mark




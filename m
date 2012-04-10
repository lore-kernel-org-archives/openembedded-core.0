Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHOy7-0006Dz-Lg
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 02:30:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3A0KduJ004186
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Apr 2012 17:20:39 -0700 (PDT)
Received: from msp-dhcp17.wrs.com (172.25.34.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Apr 2012 17:20:39 -0700
Message-ID: <4F837CD6.2070800@windriver.com>
Date: Mon, 9 Apr 2012 19:20:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>
References: <cover.1334014014.git.mark.hatle@windriver.com>
	<4F837B70.2020307@opendreambox.org>
In-Reply-To: <4F837B70.2020307@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] MIPS/MIPS32 tune -> MIPS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 00:30:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/12 7:14 PM, Andreas Oberritter wrote:
> On 10.04.2012 01:31, Mark Hatle wrote:
>> The following is in reference to the recent discussion about the mips32
>> -package- arch changing from mips to mips32.  One of the potential options
>> was to get rid of the previous "mips" and replace it with the mips32
>> definition standard.  This patch does just that.
>>
>> Working with Khem, we have moved the default "mips" (32-bit) tune to be
>> -march=mips32 based, and produce package with the package arch of "mips".
>>
>> The side effect of this work is that the prior 'mips' tune was actually
>> "mips1".  I don't believe that was really desired by anyone, but it is a
>> change.  Also there is no longer a "mips32" tune, just an include file
>> that automatically inherits and chooses the "mips" tune.
>
> There's no backwards compatibility, but I'm fine with the new options.
> The "mips" tune already gets selected by default in arch-mips.inc, so
> you can remove it from tune-mips32.inc. Actually I'd prefer removing
> tune-mips32.inc completely, so people will notice the
> backwards-incompatible change.

This is backwards compatible if someone was previously including the mips32 
tune.  It only "breaks" if someone was setting the default tune to "mips32" or 
"mips32el" manually.

If that is a concern, then adding a:

TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips}"
MIPSPKGSFX_VARIANT_tune-mips32 = "${MIPSPKGSFX_VARIANT_tune-mips}"
PACKAGE_EXTRA_ARCHS_tune-mips32 = "${PACKAGE_EXTRA_ARCHS_tune-mips}"

(and the same for mips32el).  That would ensure that they remain the same, and 
that the package arch of "mips" can't deviate.

--Mark

> Regards,
> Andreas




Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40D856FA3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 16:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2LGjB0X005515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 09:45:11 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 21 Mar 2014 09:45:10 -0700
Message-ID: <532C6C96.7020901@windriver.com>
Date: Fri, 21 Mar 2014 11:45:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A4C94@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3A4C94@post.tritech.se>
Subject: Re: libm accuracy, eglibc compared to glibc -- solved
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
X-List-Received-Date: Fri, 21 Mar 2014 16:45:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 3/21/14, 7:10 AM, Mats Kärrman wrote:
> Hi,
>
> On: Thursday, March 13, 2014 11:36 AM, Mats Kärrman wrote:
>> My "home made" hard float tune for PowerPC looks like this:
>>
>> ------------------------------------------------------------------
>> # Tune for the e300c3 core
>> require conf/machine/include/tune-ppce300c3.inc
>>
>> # Use hardware floating point
>> AVAILTUNES += "ppce300c3hf"
>> TUNE_FEATURES_tune-ppce300c3hf = "m32 fpu-hard ppce300c3"
>> TUNE_PKGARCH_tune-ppce300c3hf = "ppce300c3hf"
>> PACKAGE_EXTRA_ARCHS_tune-ppce300c3hf = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3hf"
>> DEFAULTTUNE = "ppce300c3hf"
>> ------------------------------------------------------------------
>>
>
> I found the reason for the error (deviance) in the sqrt function. glibc has
> special code for PowerPC 603e core (e300 is an optimized variant of 603e).
> By adding the following line to the tuning I now get the same result as
> for all other environments that I've tried:
>
> GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "-with-cpu=603e", "", d)}"
>
> Does anyone know about the reason for having soft-float as the default and
> only available alternative for e300c2/3 tunings?

My guess is because e300 e300c2 were both soft-float designs.  And e300c3 is the 
first hard float design.

The e300c3 should inherit and use the 603e directly.  This includes definiting 
the TUNE_FEATURES that the 603e does.  If it doesn't do that, I'd suggest it's a 
mistake.

The default 603e tune should include:

GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", 
"-with-cpu=603e", "", d)}"

or similar already -- and should already be hard float enabled.  (ppc603e 
soft-float should be the alternative -- as it is significantly rarer and the 
deviation.)

> Would it be worthwhile to send a patch to add the hf tuning to OE-core?

As the e300c3 should be hard float, we shouldn't have the 'hf' designation. 
Otherwise, we should ensure the e300c3 tune is correctly configured.

> In that case what tests should be performed before that and what (related)
> tests are performed by the OE auto-builder?
>
> BR // Mats
>



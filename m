Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qntti-0004cU-Pu
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:55:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p71EosKx026144
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 07:50:54 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 1 Aug 2011 07:50:53 -0700
Message-ID: <4E36BD4C.4030909@windriver.com>
Date: Mon, 1 Aug 2011 09:50:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<3e502d7441be9c7c25598237f79c527bdf3ce38e.1312182844.git.sgw@linux.intel.com>
	<1312203799.2344.430.camel@rex>
	<00381DE4-B22F-4F08-BE72-8D314B8CEF15@kernel.crashing.org>
In-Reply-To: <00381DE4-B22F-4F08-BE72-8D314B8CEF15@kernel.crashing.org>
Subject: Re: [PATCH 10/22] tune/arch-powerpc: Use fpu-soft to set PPCPKGSFX_FPU
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
X-List-Received-Date: Mon, 01 Aug 2011 14:55:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/1/11 9:13 AM, Kumar Gala wrote:
> 
> On Aug 1, 2011, at 8:03 AM, Richard Purdie wrote:
> 
>> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
>>> From: Kumar Gala <galak@kernel.crashing.org>
>>>
>>> Its more likely that we explicitly set soft-floating point support for a
>>> given target than hard.  So use 'fpu-soft' in TUNE_FEATURES rather than
>>> 'fpu-hard' to determine setting 'nf' (no-float) in PPCPKGSFX_FPU.
>>>
>>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>>> ---
>>> meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 +-
>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> index 8cc76ab..013755d 100644
>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> @@ -18,7 +18,7 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>>>
>>> ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
>>>
>>> -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
>>> +PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
>>>
>>> TUNE_PKGARCH ?= "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>>
>> Whilst the change itself may or may not be ok, it would need to change
>> the various boards that are already setting or not setting fpu-hard as a
>> feature so as it stands this change is incomplete.
> 
> Which boards are you speaking of?  I'm not aware of any that set soft float at this point for PPC.

It shouldn't be the board setting it to soft-fp, but instead the tune.
Something like qemuppc can use the nf 603e tune.

--Mark

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




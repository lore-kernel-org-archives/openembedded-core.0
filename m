Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrFIE-00075Y-Ka
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 22:22:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7AKHphv022883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:17:51 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 10 Aug 2011 13:17:50 -0700
Message-ID: <4E42E76E.9090106@windriver.com>
Date: Wed, 10 Aug 2011 15:17:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312996425-4319-1-git-send-email-galak@kernel.crashing.org>
	<4E42D9B5.3000906@windriver.com>
	<F53D689F-80FE-4FD4-BC98-19B64632E89D@kernel.crashing.org>
In-Reply-To: <F53D689F-80FE-4FD4-BC98-19B64632E89D@kernel.crashing.org>
Subject: Re: [PATCH v2] tune-ppc: Update to pass glibc configure option to get cpu specific support
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
X-List-Received-Date: Wed, 10 Aug 2011 20:22:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/10/11 3:06 PM, Kumar Gala wrote:
> Why?
> 
> - k
> 
> On Aug 10, 2011, at 2:19 PM, Mark Hatle wrote:
> 
>> I don't think the patch is correct.  If these tune files are included, the
>> GLIBC_EXTRA_OECONF is set unconditionally.  It is possible to include the tune
>> files, but not actually use the tunings.  (There are cases where you might want
>> to inherit specific tunings, etc.)

It's general convention.  While it might not make sense in this one case, I do
expect that tuning will inherit other tunings regularly.

Lets say someone out there invents a variant of the 603e that has altivec.  They
could create a new tune file..  Then in the tune file they would include the
ppc603e-tune.inc file, and add a new tune feature for this new processor that
would enable -maltivec or something like that.

Many cores are derived from other cores and simply have different capabilities
added to them by compiler or assembler flags....  (This is especially true in
the ARM and MIPS world, but we should be aware of it and use the same
conventions on all tune files so things are more consistent.)

--Mark

>> Instead, I'd suggest you do:
>>
>> GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e",
>> "--with-cpu=603e", "", d)}"
>>
>> (and a similar line for the e500mc)
>>
>> --Mark
>>
>> On 8/10/11 12:13 PM, Kumar Gala wrote:
>>> We need --with-cpu based to glibc to get proper support on 603e & e500mc
>>> to pickup proper math libs to deal with sqrt.  These core do not
>>> implement the fsqrt[s] instructions that the normal PPC math libs
>>> utilize.
>>>
>>> This causes use to not set AVAILTUNES specifically to the sub-arch only
>>> as we arent generically compatiable.
>>>
>>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>>> ---
>>> meta/conf/machine/include/tune-ppc603e.inc   |    5 ++++-
>>> meta/conf/machine/include/tune-ppce500mc.inc |    5 ++++-
>>> 2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
>>> index 9abb694..c673470 100644
>>> --- a/meta/conf/machine/include/tune-ppc603e.inc
>>> +++ b/meta/conf/machine/include/tune-ppc603e.inc
>>> @@ -6,6 +6,9 @@ TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
>>> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
>>> TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${PPCPKGARCH}', d)}"
>>>
>>> -AVAILTUNES += "ppc603e"
>>> +AVAILTUNES = "ppc603e"
>>> TUNE_FEATURES_tune-ppc603e = "m32 ppc603e"
>>> PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
>>> +
>>> +# glibc configure options to get 603e specific library (for sqrt)
>>> +GLIBC_EXTRA_OECONF += "--with-cpu=603e"
>>> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
>>> index b5031f4..cdd87dc 100644
>>> --- a/meta/conf/machine/include/tune-ppce500mc.inc
>>> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
>>> @@ -6,6 +6,9 @@ TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
>>> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
>>> TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "${PPCPKGARCH}", d)}"
>>>
>>> -AVAILTUNES += "ppce500mc"
>>> +AVAILTUNES = "ppce500mc"
>>> TUNE_FEATURES_tune-ppce500mc = "m32 ppce500mc"
>>> PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
>>> +
>>> +# glibc configure options to get e500mc specific library (for sqrt)
>>> +GLIBC_EXTRA_OECONF += "--with-cpu=e500mc"
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHLIa-0007SI-PC
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 22:34:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q39KPYMT008715
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 13:25:34 -0700 (PDT)
Received: from msp-dhcp17.wrs.com (172.25.34.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Apr 2012 13:25:33 -0700
Message-ID: <4F8345BD.6090500@windriver.com>
Date: Mon, 9 Apr 2012 15:25:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com>
	<4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com>
	<4F83413F.7010608@opendreambox.org>
In-Reply-To: <4F83413F.7010608@opendreambox.org>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 20:34:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/12 3:06 PM, Andreas Oberritter wrote:
> On 09.04.2012 17:17, Mark Hatle wrote:
>> On 4/8/12 4:34 PM, Andreas Oberritter wrote:
>>> On 07.04.2012 02:10, Mark Hatle wrote:
>>>> Just ran a local build with the qemumips machine, this is a standard
>>>> mips32 target.
>>>>

...

>>>> So the canonical arch is correct, the mips32 is only the packaging
>>>> arch.  It was always intended that the packaging arch be used in full on
>>>> MIPS.  (This will allow us to specify mips32r2, mipsiii, mipsiv, etc as
>>>> necessary if we expand the mips tunings.)
>>>
>>> I don't think such a change should be done only few days before a
>>> release. Until this patch was applied, the packaging arch has always
>>> been mipsel, not mips32el. Please, revert or fix this!
>>
>> This is easy to change to the previous behavior...  however it was a bug
>> in the original implementation.
>>
>> But again, I stress nothing changed except for the packaging arch... the
>> way the packages are configured, compiled, installed remain the same,
>> only the package arch has changed.  The only place that may be affected
>> by this is the package feed mechanism.
>
> I think breaking package feeds in such a way is one of the worst things
> to do in OE.
>
>> To revert to the previous behavior, in the
>> meta/conf/machine/include/tune-mips.inc:
>>

...

>>   TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
>> -MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
>> +MIPSPKGSFX_VARIANT_tune-mips32el = "mipsel"
>>   PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
>                                                 ^^^^^^^^
> I don't think this is correct, in all four cases, because no packages
> will have that arch.
>

...

>> Before I submit this patch though, I would like others to weigh in on
>> the issue.  This was a mistake in the earlier version of the code.  The
>> "variant" wasn't be set as it should have been.
>>
>> The problem is that if you set the tune to "mips", you get the default
>> compiler behavior.
>
> According to the gcc docs, there is no "mips" ISA name. Valid names are:
> `mips1', `mips2', `mips3', `mips4', `mips32', `mips32r2', `mips64' and
> `mips64r2'. Therefore I don't understand why "mips" should default to
> anything else, if it was an alias for mips32 before.
>

We have two sets of available tunings:

"mips" and "mips32" tunings.. (add el and -nf variants)

These are -different- tunings and today the only way to notice the difference is 
based on the package arch.  The package arch is NOT the target ISA.  It's an 
arbitrary string "we" have come up with to let people know the architecture, ABI 
and optimizations used in producing specific software.  "mips" indicates that 
it's using the default mips compiler options, whatever those may be.  While 
mips32 says it is specifically tuned to the mips32 architecture settings.

I honestly have no idea what the default compiler settings for mips are, but the 
point is the tunings are different.  If you want the "MIPS" tune, you may not be 
able to run the items compiled with the -march=mips32 option.  We have to have a 
way to reconcile this.

>>   However, if you set the tune to mips32, you get
>> "-march=mips32" added to your CCARGS.  This will produce slightly
>> different binaries, thus "mips" and mips32" are not equal.
>
> Btw, meta/recipes-core/eglibc/eglibc-ld.inc doesn't know about mips32 or
> mips32el, so this probably broke, too.
> meta/recipes-devtools/gdb/gdb-common.inc likewise. Do overrides still
> work, e.g. EXTRA_OECONF_mipsel etc.? How about
> meta/recipes-qt/qt4/qt4_arch.inc?

Overrides are on the GNU canonical arch (TUNE_ARCH) correct?  If that is the 
case then "mips" or "mipsel" is the canonical arch.  Again, we do NOT use the 
package arch for these settings!

Below are the overrides and related elements from the bitbake.conf file:

OVERRIDES = 
"${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
MACHINEOVERRIDES ?= "${MACHINE}"

# Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"

TARGET_ARCH = "${TUNE_ARCH}"

So my reading of this is that, unless overriden somewhere outside of 
bitbake.conf, the override does include the TUNE_ARCH, via the TARGET_ARCH, via 
the TRANSLATED_TARGET_ARCH.

>
> Whatever the answers are, the most important point is that it's the
> worst point in time to do such a change. We should rather discuss it
> after the release, if at all.

In order to resolve this consider the following:

We have two tunes, "mips" and "mips32", the difference being the -march=mips32 
in the later case.

In order to support both tunes, we need to have a way to differentiate between 
them on a package arch basis or we end up in a situation where we have two 
packages with different contents and no way to tell them apart.

In order to reconcile the above, the three primary options are see are:

*) Define only mips or mips32 tune, but not both -- producing "mips" as the 
package arch.  (But then what do we do in the future about mips1, mips2, mips3, 
mips4, mips32r2?)

*) Revert the behavior and have two tunes that produce the identical filename 
package with different contents and deal with this in the future.

*) Keep it as it is now and produce mips and mips32 packages based on the 
specific tunings defined by the user

We have a bug, I believe we need to fix it.. first or third options "fix" the 
bug.. the second option retains the bug to be fixed in the future.

If you have an alternative to the above, I'm interested -- I just really don't 
like the "leave the bug" option.

And just to be extra clear, I consider it a defect if we can produce a package 
with the same name for two different tune settings.. (the exception being the 
hell that is ARM and thumb namings.)

--Mark

> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




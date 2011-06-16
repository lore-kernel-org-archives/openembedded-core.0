Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QX0YF-0003Vo-Gk
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 02:35:15 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QX0Ut-0005go-Rr from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 17:31:47 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 15 Jun 2011 17:27:02 -0700
Received: from [172.30.80.132] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 15 Jun 2011 17:31:47 -0700
Message-ID: <4DF94EE5.70307@mentor.com>
Date: Wed, 15 Jun 2011 17:31:33 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4DF8D848.9000605@linux.intel.com> <4DF8DA15.8060500@gmail.com>
In-Reply-To: <4DF8DA15.8060500@gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 16 Jun 2011 00:27:02.0516 (UTC)
	FILETIME=[1CDF8B40:01CC2BBC]
Subject: Re: [RFC] DISTRO_MIRRORS / DISTRO_PREMIRRORS
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
X-List-Received-Date: Thu, 16 Jun 2011 00:35:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/15/2011 09:13 AM, Khem Raj wrote:
> On 06/15/2011 09:05 AM, Saul Wold wrote:
>>
>> Folks,
>>
>> Recently we have seen a number of fetch failures, due to upstream sites
>> being down or deprecated (tinylogin, pscmic and others).
>>
>> The issue is that oe-core as a non-distro does not have a default set of
>> mirrors, which causes the fetcher to fail as there is no fall-back
>> mirror to distrubte the source code.
>>
>> As has been pointed out, different projects and distributions (Yocto
>> Project and Angstrom) both have upstream source mirrors which could be
>> used. Currently the Yocto Project defines it's MIRRORS and PREMIRRORS in
>> meta-yocto/conf/distro/poky.conf.
>>
>> I propose that we add a list of DISTO_MIRRORS and DISTRO_PREMIRRORS with
>> default settings pointing to the current autobuilder.yoctoproject.org
>> source site. These would be added to the mirrors.bbclass, so that
>> oe-core will have a default set of mirrors that can be overridden by a
>> distro or layer.
>>
>> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
>> index 2146087..a52c6d5 100644
>> --- a/meta/classes/mirrors.bbclass
>> +++ b/meta/classes/mirrors.bbclass
>> @@ -1,4 +1,22 @@
>> +DISTRO_PREMIRRORS ?= "\
>> +bzr://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +cvs://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +git://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +hg://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +osc://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +p4://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +svk://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +svn://.*/.* http://autobuilder.yoctoproject.org/sources/ \n"
>> +
>> +PREMIRRORS += "${DISTRO_PREMIRRORS}"
>> +
>> +DISTRO_MIRRORS ?= "\
>> +ftp://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +http://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>> +https://.*/.* http://autobuilder.yoctoproject.org/sources/ \n"
>> +
>> MIRRORS += "\
>> +${DISTRO_MIRRORS} \
>> ${DEBIAN_MIRROR}/main http://snapshot.debian.net/archive/pool \n \
>> ${DEBIAN_MIRROR} ftp://ftp.de.debian.org/debian/pool \n \
>> ${DEBIAN_MIRROR} ftp://ftp.au.debian.org/debian/pool \n \
>>
>> Thoughts, ACKs, NAKs??
>>
> 
> FWIW http://mirrors.openembedded.org/ also exists.

To be clear, mirrors.openembedded.org is a "last resort" type of mirror
(eg the tinylogin case) whereas autobuilder.yoctoproject.org and the
angstrom mirrors are complete (modulo fetch2 git issues, on the angstrom
side) mirrors.

Both have their uses and I think for oe-core we want just the former (so
that when tzcode/tzdata get their weekly upgrade, we know) while poky,
angstrom, etc, etc, will continue to want what they have now.

-- 
Tom Rini
Mentor Graphics Corporation



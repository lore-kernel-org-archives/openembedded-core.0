Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWt2D-00087V-R3
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:33:42 +0200
Received: by iye7 with SMTP id 7so451120iye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7U6/a2dDBxY1nXkWEu/JNX33ZPdeTqjwMbR7hu8s8og=;
	b=gpRWwnfv4qcg2SS05KuftbMkK/90bGYs/O3FF1bhvNiQGNRciRb0KqcXf/bPY8+/sm
	abmEBS5EAQ2s2STH2qJpBXf/OkiDra5q+kGY5uYsKPAHu8QG2WLorAjRzvShy44fe7HO
	Wl0oscX+IS3g8dmYbpfR2maGHceiZKHfSjE1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=yBLdQgOK1ky1841mcdm6xDrAwg7oty4uXWNPPCcuos19ItVQ/lrF+blyHfN9PCowGA
	9DKif3bZoPgKx8sZGSvJsoDPSgLpBa97oBZRjbDBXAALXKh2wk5mfGWF78+rZ9ts+J9K
	ViE0+ozbv//i2X7qlHJ0FpDHu5ZhcoBoCHJis=
Received: by 10.231.193.202 with SMTP id dv10mr592634ibb.136.1308155414571;
	Wed, 15 Jun 2011 09:30:14 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p15sm307349ibh.29.2011.06.15.09.30.12
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 09:30:13 -0700 (PDT)
Message-ID: <4DF8DE13.9000105@gmail.com>
Date: Wed, 15 Jun 2011 09:30:11 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4DF8D848.9000605@linux.intel.com> <4DF8DA15.8060500@gmail.com>
	<4DF8DD33.1020006@linux.intel.com>
In-Reply-To: <4DF8DD33.1020006@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 15 Jun 2011 16:33:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 09:26 AM, Saul Wold wrote:
> On 06/15/2011 09:13 AM, Khem Raj wrote:
>> On 06/15/2011 09:05 AM, Saul Wold wrote:
>>>
>>> Folks,
>>>
>>> Recently we have seen a number of fetch failures, due to upstream sites
>>> being down or deprecated (tinylogin, pscmic and others).
>>>
>>> The issue is that oe-core as a non-distro does not have a default set of
>>> mirrors, which causes the fetcher to fail as there is no fall-back
>>> mirror to distrubte the source code.
>>>
>>> As has been pointed out, different projects and distributions (Yocto
>>> Project and Angstrom) both have upstream source mirrors which could be
>>> used. Currently the Yocto Project defines it's MIRRORS and PREMIRRORS in
>>> meta-yocto/conf/distro/poky.conf.
>>>
>>> I propose that we add a list of DISTO_MIRRORS and DISTRO_PREMIRRORS with
>>> default settings pointing to the current autobuilder.yoctoproject.org
>>> source site. These would be added to the mirrors.bbclass, so that
>>> oe-core will have a default set of mirrors that can be overridden by a
>>> distro or layer.
>>>
>>> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
>>> index 2146087..a52c6d5 100644
>>> --- a/meta/classes/mirrors.bbclass
>>> +++ b/meta/classes/mirrors.bbclass
>>> @@ -1,4 +1,22 @@
>>> +DISTRO_PREMIRRORS ?= "\
>>> +bzr://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +cvs://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +git://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +hg://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +osc://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +p4://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +svk://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +svn://.*/.* http://autobuilder.yoctoproject.org/sources/ \n"
>>> +
>>> +PREMIRRORS += "${DISTRO_PREMIRRORS}"
>>> +
>>> +DISTRO_MIRRORS ?= "\
>>> +ftp://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +http://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>>> +https://.*/.* http://autobuilder.yoctoproject.org/sources/ \n"
>>> +
>>> MIRRORS += "\
>>> +${DISTRO_MIRRORS} \
>>> ${DEBIAN_MIRROR}/main http://snapshot.debian.net/archive/pool \n \
>>> ${DEBIAN_MIRROR} ftp://ftp.de.debian.org/debian/pool \n \
>>> ${DEBIAN_MIRROR} ftp://ftp.au.debian.org/debian/pool \n \
>>>
>>> Thoughts, ACKs, NAKs??
>>>
>>
>> FWIW http://mirrors.openembedded.org/ also exists.
>>>
> How up to date is it and how is it maintained? Is it possible for this
> mirror site to fall behind oe-core?
>

oe.dev falls back to it by default and whenever there is a report of non 
existing tars they are put up there.

> Sau!
>
>>> --
>>> Sau!
>>>
>>> Saul Wold
>>> Yocto Component Wrangler @ Intel
>>> Yocto Project / Poky Build System
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>




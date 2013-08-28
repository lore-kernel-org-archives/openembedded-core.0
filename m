Return-Path: <Mikhail_Durnev@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E25456BC83
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:54:20 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VEdOH-0007NT-Le from Mikhail_Durnev@mentor.com ;
	Wed, 28 Aug 2013 03:54:21 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 28 Aug 2013 03:54:21 -0700
Received: from [172.30.176.99] (147.34.91.1) by SVR-ORW-FEM-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server (TLS) id 14.2.247.3;
	Wed, 28 Aug 2013 03:54:20 -0700
Message-ID: <521DD6D8.20606@mentor.com>
Date: Wed, 28 Aug 2013 21:54:16 +1100
From: Mikhail Durnev <Mikhail_Durnev@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <521C48D3.3010901@mentor.com> <3236564.Bbn6H3DI5P@helios>
In-Reply-To: <3236564.Bbn6H3DI5P@helios>
X-OriginalArrivalTime: 28 Aug 2013 10:54:21.0238 (UTC)
	FILETIME=[F36BBD60:01CEA3DC]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: classes/insane: add check for PN in OVERRIDES
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
X-List-Received-Date: Wed, 28 Aug 2013 10:54:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

28.08.2013 19:41, Paul Eggleton wrote:
> Hi Mikhail,
>
> On Tuesday 27 August 2013 17:36:03 Mikhail Durnev wrote:
>> I have a question about your commit c331f0a:
>>
>> -------------------------------------------
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 4d2392e..fb18022 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -907,6 +907,11 @@ python () {
>>        if d.getVar('do_stage', True) is not None:
>>            bb.fatal("Legacy staging found for %s as it has a do_stage
>> function. This will need conversion to a do_install or often simply
>> removal to work with OE-core" % d.getVar("FILE", True))
>>
>> +    overrides = d.getVar('OVERRIDES', True).split(':')
>> +    pn = d.getVar('PN', True)
>> +    if pn in overrides:
>> +        bb.warn('Recipe %s has PN of "%s" which is in OVERRIDES, this
>> can result in unexpected behaviour.' % (d.getVar("FILE", True), pn))
>> +
>>        issues = []
>>        if (d.getVar('PACKAGES', True) or "").split():
>>            for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS',
>> 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst',
>> 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
>> ----------------------------------------------
>>
>> A recipe (lets say linux_git.bb) has its PN in OVERRIDES with prefix
>> 'pn-' (pn-linux). So, if we have 'linux' in OVERRIDES then it cannot
>> interfere.
> Unfortunately that is not the case. If PN is "linux" and TARGET_OS is "linux"
> (note, for ARM machines only TARGET_OS may be "linux-gnueabi" rather than
> "linux") then statements such as this:
>
> FILES_${PN} = "/path/to/file"
>
> will immediately become:
>
> FILES = "/path/to/file"
>
> Which itself will trigger a warning about FILES not being package specific.
> Without an explicit check on PN being in OVERRIDES it's not immediately
> obvious what has happened.
>
> Additionally consider the following case in local.conf:
>
> PREFERRED_VERSION_linux = "3.8.10"
>
> This will turn into PREFERRED_VERSION = "3.8.10" and then you'll get a bunch
> of spewed notices about version "3.8.10" being unavailable for every recipe in
> the system that you're building.
>
> PN in OVERRIDES is bad news, which is why we added this warning. You really do
> need to name your recipes so that they don't clash with items in OVERRIDES.
>
> Cheers,
> Paul
>
Thank you for clarification. I build x86. My TARGET_OS, kernel recipe 
name and kernel PN is "linux". Fortunately, kernel.bbclass uses PN only 
once in:

FILES_${PN} = ""

For "linux" the problem is masked by usage of "virtual/kernel" in 
conditions. So I see only your warning about PN in OVERRIDES and no 
other warnings or problems. But I definitely should consider about 
changing PN.

Thanks,
Mikhail


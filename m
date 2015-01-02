Return-Path: <mike.looijmans@topic.nl>
Received: from smtp07.online.nl (smtp07.online.nl [194.134.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9A58D7278D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jan 2015 09:28:25 +0000 (UTC)
Received: from smtp07.online.nl (localhost [127.0.0.1])
	by smtp07.online.nl (Postfix) with ESMTP id 51B11984C5;
	Fri,  2 Jan 2015 10:28:23 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp07.online.nl (Postfix) with ESMTP;
	Fri,  2 Jan 2015 10:28:23 +0100 (CET)
Message-ID: <54A664B7.4000909@topic.nl>
Date: Fri, 02 Jan 2015 10:28:23 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <54A2C3B2.9010006@topic.nl>		<20141230175915.GB18678@crash.betafive.co.uk>	<54A44ADC.3010000@topic.nl>	
	<54A65B5E.4030504@topic.nl>	<1420190187.25779.15.camel@linuxfoundation.org>
	<54A663BE.30502@topic.nl>
In-Reply-To: <54A663BE.30502@topic.nl>
X-Online-Scanned: by Cloudmark authority (on smtp07.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How do I change the "Architecture" of a package?
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
X-List-Received-Date: Fri, 02 Jan 2015 09:28:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2015 10:24 AM, Mike Looijmans wrote:
> On 01/02/2015 10:16 AM, Richard Purdie wrote:
>> On Fri, 2015-01-02 at 09:48 +0100, Mike Looijmans wrote:
>>> On 12/31/2014 08:13 PM, Mike Looijmans wrote:
>>>> On 30-12-2014 18:59, Paul Barker wrote:
>>>>> On Tue, Dec 30, 2014 at 04:24:34PM +0100, Mike Looijmans wrote:
>>>>>> What if the architecture of a package was accidentally left at its
>>>>>> default, but it should have been "all" for example?
>>>>>>
>>>>>> Just putting "inherit allarch" or simply PACKAGE_ARCH="all" into the
>>>>>> recipe is not enough. You get stuck with a "more specific" older
>>>>>> version, so that no device wants to upgrade to the newer version
>>>>>> that's "all" architecture compatible.
>>>>>>
>>>>>
>>>>> What package manager are you using on the device? If you're using opkg
>>>>> it should
>>>>> prioritise by version not arch unless the command line option
>>>>> '--prefer-arch-to-version' is passed. If you're using opkg and it's
>>>>> not doing
>>>>> that, let me know and I'll look into it when I get chance to.
>>>>
>>>> It's opkg.
>>>>
>>>> But on closer inspection I noticed that the "git" version is also
>>>> mysteriously reset to 0, so that the package also gets a lower version
>>>> number instead of a higher one. Seems to be the PR server borking
>>>> things
>>>> again or so, I'll have to investigate that next year...
>>>
>>> Weird, something in OE killed "gitpkgv".
>>>
>>> in the recipe, I have this:
>>>
>>> inherit gitpkgv
>>> PV = "2.0+git${SRCPV}"
>>> PKGV = "2.0+git${GITPKGV}"
>>>
>>>
>>> $ bitbake enigma2-plugin-extensions-autobackup -e | grep PKGV
>>>
>>> delivers correct information:
>>>
>>> PKGV="2.0+git68+2e7a1db"
>>> GITPKGVTAG="0.0-68-g2e7a1db"
>>> GITPKGV="68+2e7a1db"
>>>
>>>
>>> But after building and deploying the package, the version number will
>>> eventually end up being this one:
>>>
>>> 2.0+git5+2e7a1db509-r0.2
>>>
>>>
>>> What in OE is replacing a perfectly good PKGV tag with something
>>> completely different bearing no relation whatsoever? Even the number of
>>> digits in the git tag differs from the one I put in the recipe!
>>>
>>> Even if I put some random text into PKGV, it gets replaced.
>>
>> Did something come from sstate?
>
> Nope, I do a "bitbake -c cleansstate [package]" first.
>
> i've been experimenting for a while now. It appears that whatever I put
> into PKGV gets ignored and replaced with what was in PV.
>
> Here's a recipe where I stubbed the actual building and install phases
> to demonstrate the issue:
>
> (cut here)
>
> DESCRIPTION = "Version numbers are borked"
>
> inherit gitpkgv
> PV = "z-pv+${SRCPV}"
> PKGV = "z-pkgv+${GITPKGV}"
>
> # Completely random public GIT repo
> SRCREV = "${AUTOREV}"
> MODULE = "AutoBackup"
> SRC_URI = "git://github.com/E2OpenPlugins/e2openplugin-${MODULE}.git"
>
> LICENSE = "GPLv2"
> LIC_FILES_CHKSUM =
> "file://../LICENSE.GPLv2;md5=eb723b61539feef013de476e68b5c50a"
> SRC_URI_append = " file://LICENSE.GPLv2"
>
> S="${WORKDIR}/git"
>
> do_compile() {
>      touch ${B}/helloworld
> }
>
> do_install() {
>      install -d ${D}${sysconfdir}
>      install -m 644 ${B}/helloworld ${D}${sysconfdir}/
> }
>
> (EOF)
>
> If I build this package, it ends up getting version
> "z-pv+0+2e7a1db509-r0.1" instead of "z-pkgv+68+2e7a1db509-r0.1" which
> I'd expect.
>
>

Just to be complete, I'm a bit behind on OE, using tag 
"2cc1bd9dd060f5002c2fde7aacba86fe230c12af" currently. Don't think it'd 
make a difference though.


-- 
Mike Looijmans


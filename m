Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 311F07275B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 15:21:00 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 12D6B6615B;
	Sun,  4 Jan 2015 16:20:59 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP;
	Sun,  4 Jan 2015 16:20:58 +0100 (CET)
Message-ID: <54A95A5A.70809@topic.nl>
Date: Sun, 04 Jan 2015 16:20:58 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <54A2C3B2.9010006@topic.nl>		<20141230175915.GB18678@crash.betafive.co.uk>
	<54A44ADC.3010000@topic.nl>	 <54A65B5E.4030504@topic.nl>
	<1420190187.25779.15.camel@linuxfoundation.org>
In-Reply-To: <1420190187.25779.15.camel@linuxfoundation.org>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Bug: PR server changes the PKGV variable too
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
X-List-Received-Date: Sun, 04 Jan 2015 15:21:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2015 10:16 AM, Richard Purdie wrote:
> On Fri, 2015-01-02 at 09:48 +0100, Mike Looijmans wrote:
>> On 12/31/2014 08:13 PM, Mike Looijmans wrote:
>>> On 30-12-2014 18:59, Paul Barker wrote:
>>>> On Tue, Dec 30, 2014 at 04:24:34PM +0100, Mike Looijmans wrote:
>>>>> What if the architecture of a package was accidentally left at its
>>>>> default, but it should have been "all" for example?
>>>>>
>>>>> Just putting "inherit allarch" or simply PACKAGE_ARCH="all" into the
>>>>> recipe is not enough. You get stuck with a "more specific" older
>>>>> version, so that no device wants to upgrade to the newer version
>>>>> that's "all" architecture compatible.
>>>>>
>>>>
>>>> What package manager are you using on the device? If you're using opkg
>>>> it should
>>>> prioritise by version not arch unless the command line option
>>>> '--prefer-arch-to-version' is passed. If you're using opkg and it's
>>>> not doing
>>>> that, let me know and I'll look into it when I get chance to.
>>>
>>> It's opkg.
>>>
>>> But on closer inspection I noticed that the "git" version is also
>>> mysteriously reset to 0, so that the package also gets a lower version
>>> number instead of a higher one. Seems to be the PR server borking things
>>> again or so, I'll have to investigate that next year...
>>
>> Weird, something in OE killed "gitpkgv".
>>
>> in the recipe, I have this:
>>
>> inherit gitpkgv
>> PV = "2.0+git${SRCPV}"
>> PKGV = "2.0+git${GITPKGV}"
>>
>>
>> $ bitbake enigma2-plugin-extensions-autobackup -e | grep PKGV
>>
>> delivers correct information:
>>
>> PKGV="2.0+git68+2e7a1db"
>> GITPKGVTAG="0.0-68-g2e7a1db"
>> GITPKGV="68+2e7a1db"
>>
>>
>> But after building and deploying the package, the version number will
>> eventually end up being this one:
>>
>> 2.0+git5+2e7a1db509-r0.2
>>
>>
>> What in OE is replacing a perfectly good PKGV tag with something
>> completely different bearing no relation whatsoever? Even the number of
>> digits in the git tag differs from the one I put in the recipe!
>>
>> Even if I put some random text into PKGV, it gets replaced.
>
> Did something come from sstate?

I got todays master from openembedded-core and meta-openembedded, and 
the recipe above (with a fix for the license). I leave everything as the 
script "oe-init-build-env" does, I only add meta-openembedded/meta-oe to 
the bblayers.conf list to get access to the gitpkgv class.

I named the recipe above "weirdversion.bb", and when I build it "as is", 
I get the correct version number "z-pkgv+68+2e7a1db-r0" (with "pkgv" and 
"68" in it).

However, when I add the following line to local.conf to activate the 
PR-SERVER, things go wrong:

PRSERV_HOST = "localhost:0"

After this change, the package suddenly gets "z-pv+0+2e7a1db509-r0.0" as 
version string, so apparently the PR server kills the PKGV variable and 
replaces it with something derived from PV alone.

Since this is a completely clean situation with nothing but core code, 
it must be a bug in the PR server (it seems to act as PV server instead...).


-- 
Mike Looijmans


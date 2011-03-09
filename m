Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PxRKN-00087I-5k
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 22:54:00 +0100
Received: by fxm8 with SMTP id 8so965638fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2011 13:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=UZmK35HF0yQxumSwWpNvelWNmEoFRmNuNQb1FmoR32A=;
	b=bALLYg8fwhOm/1TwZ/qnRC73rKFc8067Vh9+YwaN6mb18UGgN3Lmup6SU2apJKQkpX
	xs4Fdc86WRmrv15ImM1N1sD9BvPG73eBUZjr1xxUxUrs5NYCQs26xwhN2ZFKCzqRG2GK
	JOW3P03com6dDMhzeUcLZBtjj4yBAhzPjJtEQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=fcG2gThRmxCxLNdSk1hv+yhz9hGMkqR2z+3XtifjixRHoEdhRq7w7bOCp0Gn8YEFMw
	ejvf5ZsjztNsDKdU47xXbiIUJn94bzmgtLpA+dIopjVOaZ4LdlaNHYlkq6bnMShs3WUj
	M5F/XMocCjsQq1nFEXWWyGQ0eeSfomI8LqGJU=
Received: by 10.223.5.3 with SMTP id 3mr6276615fat.0.1299707536463; Wed, 09
	Mar 2011 13:52:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 9 Mar 2011 13:51:46 -0800 (PST)
In-Reply-To: <3FBA67DC-6150-4EFE-A5C4-57D895BA697D@dominion.thruhere.net>
References: <4D6675E0.2040703@mlbassoc.com> <4D6B3BA3.9050303@intel.com>
	<4D6F9018.1000605@mlbassoc.com> <4D704768.2090100@intel.com>
	<4D70CE46.7040104@mlbassoc.com> <1299634187.602.546.camel@rex>
	<4D77C9F9.4040309@mlbassoc.com> <1299697497.602.866.camel@rex>
	<3FBA67DC-6150-4EFE-A5C4-57D895BA697D@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2011 13:51:46 -0800
Message-ID: <AANLkTin6pW+Om2qF1Ey5=ftWfkNh3FtzRB01fqCmo+EP@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Poky <poky@lists.pokylinux.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Is sstate broken
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
X-List-Received-Date: Wed, 09 Mar 2011 21:54:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 9, 2011 at 11:30 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 9 mrt 2011, om 20:04 heeft Richard Purdie het volgende geschreven:
>
>> On Wed, 2011-03-09 at 11:42 -0700, Gary Thomas wrote:
>>> I updated to master (fab742bd4693ed3092690a20dd32d53fe27c3d4c) and trie=
d again.
>>> I don't see any difference - the run using the sstate cache as a mirror
>>> seems to do all the same work as without. =C2=A0Here's how I tested it.
>>>
>>> * Build original tree
>>> =C2=A0 % POKYCONF=3Dmeta-cobra3530p60/conf . /tmp/poky-amltd/poky-init-=
build-env /local/p60_step1
>>> =C2=A0 ... adjust conf/local.conf
>>> =C2=A0 % bitbake amltd-console-image
>>>
>>> * Rebuild, using previous result for SSTATE_MIRRORS
>>> =C2=A0 % POKYCONF=3Dmeta-cobra3530p60/conf . /tmp/poky-amltd/poky-init-=
build-env /local/p60_step2
>>> =C2=A0 ... adjust conf/local.conf
>>> =C2=A0 % bitbake amltd-console-image
>>>
>>> The only difference between the two runs is enabling SSTATE_MIRRORS in =
local.conf
>>> =C2=A0 % =C2=A0diff -u /local/p60_step?/conf/local.conf
>>> =C2=A0 =C2=A0--- /local/p60_step1/conf/local.conf =C2=A0 =C2=A02011-03-=
09 08:28:18.266933061 -0700
>>> =C2=A0 =C2=A0+++ /local/p60_step2/conf/local.conf =C2=A0 =C2=A02011-03-=
09 09:57:51.365932951 -0700
>>> =C2=A0 =C2=A0@@ -53,4 +53,7 @@
>>> =C2=A0 =C2=A0 IMAGE_LINGUAS ?=3D "en-us"
>>>
>>> =C2=A0 =C2=A0 # Minimize feature set
>>> =C2=A0 =C2=A0 DISTRO_FEATURES ?=3D "alsa"
>>> =C2=A0 =C2=A0+SSTATE_MIRRORS ?=3D "\
>>> =C2=A0 =C2=A0+file://.* file:///local/p60_step1/sstate-cache/"
>>>
>>> The results seem to have gone through all the same steps (or nearly so)=
. =C2=A0The output
>>> from the runs is at
>>> =C2=A0 http://www.mlbassoc.com/poky/build.step1
>>> =C2=A0 http://www.mlbassoc.com/poky/build.step2
>>>
>>> Comparing the two build trees:
>>> =C2=A0 % ls /local/p60_step1/tmp/work/*/*/temp/log.do_compile | wc
>>> =C2=A0 =C2=A0 144 =C2=A0 =C2=A0 144 =C2=A0 12521
>>> =C2=A0 % ls /local/p60_step2/tmp/work/*/*/temp/log.do_compile | wc
>>> =C2=A0 =C2=A0 143 =C2=A0 =C2=A0 143 =C2=A0 12427
>>> =C2=A0 % du -s /local/p60_step?
>>> =C2=A0 15229296 =C2=A0 =C2=A0 =C2=A0 =C2=A0/local/p60_step1
>>> =C2=A0 15162760 =C2=A0 =C2=A0 =C2=A0 =C2=A0/local/p60_step2
>>>
>>> I know this procedure used to work (or at least close). =C2=A0Am I doin=
g
>>> something wrong?
>>
>> You're not doing anything wrong and this is the same scenario I've been
>> testing with. After I'd fixed the origin problem it created a problem
>> with file urls containing globing. I managed to break the original patch
>> with the globing fix. The good news is the problem is simple and I've
>> pushed a fix.
>
> Is that fix in oe-core as well?

I guess its hardening in yocto and eventually will make into oe-core
which is good.



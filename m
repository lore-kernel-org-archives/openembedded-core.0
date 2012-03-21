Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1SAJQY-0000q6-54
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 12:10:02 +0100
Received: from [192.168.222.12] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id B6987130011
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 10:51:31 +0000 (GMT)
Message-ID: <4F69B2B5.1010607@slimlogic.co.uk>
Date: Wed, 21 Mar 2012 10:51:33 +0000
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1203210615100.21394@oneiric>
	<alpine.DEB.2.02.1203210625530.16813@oneiric>
	<101A2F63-917B-40EA-809F-E42FF0C1DE14@dominion.thruhere.net>
In-Reply-To: <101A2F63-917B-40EA-809F-E42FF0C1DE14@dominion.thruhere.net>
Subject: Re: what is meaning of "SRC_URI_append_whatever +=" ??
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
X-List-Received-Date: Wed, 21 Mar 2012 11:10:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21/03/2012 10:46, Koen Kooi wrote:
> Op 21 mrt. 2012, om 11:28 heeft Robert P. J. Day het volgende geschreven:
>
>> On Wed, 21 Mar 2012, Robert P. J. Day wrote:
>>
>>>  still perusing the very basics of oe-core and grepping madly, came
>>> across the following oddity:
>>>
>>> $ grep -r SRC_URI_append *
>>> ... snip ...
>>> bitbake/doc/manual/usermanual.xml:SRC_URI_append_1.0.7+ = "file://some_patch_which_the_new_versions_need.patch;patch=1"</screen></para>
>>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
>>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append = " file://croco.patch;apply=yes "
>>> ... snip ...
>>>
>>>  AIUI, there are two (common) variations for extending SRC_URI.  the
>>> straightforward unconditional way:
>>>
>>>  SRC_URI += ... blah blah ...
>>>
>>> or if you need to make it conditional, then there's
>>>
>>>  SRC_URI_append_thingy = "whatever"
>>>
>>> so what's with the latter two entries above?
>>>
>>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
>>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append = " file://croco.patch;apply=yes "
>>>
>>>  is there some subtlety i'm missing here?  why would one ever use
>>> either of:
>>>
>>>  SRC_URI_append += "..."               (looks redundant)
>>>  SRC_URI_append = "..."                (why not just SRC_URI +=?)
>>>
>>> can i just assume those are typoes?
>>  following up on my own post, i decided to scan the entire oe-core
>> tree:
>>
>> $ grep -r "_append +=" *
>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
>> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
>> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
>> meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
>> $
>>
>>  and i thought i'd look for another pattern as well:
>>
>> $ grep -r "_append_.*+=" *
>> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemumips += " file://32bitBE-support.patch"
>> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemuppc += " file://32bitBE-support.patch"
>> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
>> $
>>
>>  of course, if all of the above is perfectly valid, i'm going to be
>> embarrassed.
>
> AFAICT '_append +=' is completely bogus.
>

I beleive its valid to do

BLAH_append = "spanner"
BLAH_append += "toolbox"

then final result is BLAH_append variable is "spanner toolbox" then the
overrides happen.

Graeme




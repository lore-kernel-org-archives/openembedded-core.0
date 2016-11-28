Return-Path: <pab@pabigot.com>
X-Greylist: delayed 441 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Nov 2016 10:43:44 UTC
Received: from p3plsmtpa11-10.prod.phx3.secureserver.net
	(p3plsmtpa11-10.prod.phx3.secureserver.net [68.178.252.111])
	by mail.openembedded.org (Postfix) with ESMTP id 61B9460110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:43:44 +0000 (UTC)
Received: from [192.168.65.22] ([75.72.225.8]) by :SMTPAUTH: with SMTP
	id BJHtcpw7g6sH8BJHtc7xha; Mon, 28 Nov 2016 03:35:53 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <b3516f43-75eb-2fa5-31c6-ad5e3a57d032@pabigot.com>
	<5308703.KLEPbEOQKq@peggleto-mobl.ger.corp.intel.com>
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
Message-ID: <f1da4624-99b2-46ec-a49d-892e2a491a8f@pabigot.com>
Date: Mon, 28 Nov 2016 04:35:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5308703.KLEPbEOQKq@peggleto-mobl.ger.corp.intel.com>
X-CMAE-Envelope: MS4wfHaLaDwvQZqX8D822P3Rk5+ZKky2yyfbqGqAaX1zqb9ssGzpwnM0MS/dVJXoLhSnbu0niWjwbaaUTInIIbmAtJe4XDaassJ210Kd9tlTOffMSgHp8KWP
	dc2uyoEuzXJQPD0lJjjpFB6T1LiSWd7GvXH+GlmHbINOjLbCwYBRZjCaXOF+em68mm+jD5V0TKAr+0sAex4ml4yUmAMDLhZYqVvHNgCcLUwPrZNftYX/qSIw
	27sDxxyqeuzpqHfwRXkH/dlOiqqS/O2Jgey2cEjwjlSk1pRYlOclHV2rXTfLWc+zXHDpjzCuyRK9K+D8t9ol5Q==
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm.bbclass support for deep native modules?
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
X-List-Received-Date: Mon, 28 Nov 2016 10:43:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/2016 04:11 AM, Paul Eggleton wrote:
> Hi Peter,
>
> On Sat, 26 Nov 2016 18:17:48 Peter A. Bigot wrote:
>> I'm using the current head of morty and trying to get a handle on the
>> new nodejs support in OE.
>>
>> I'm failing to build a recipe for statsd.  Starting with this:
>>
>>       devtool add 'npm://registry.npmjs.org;name=statsd;version=0.8.0'
>>       bitbake statsd
>>
>> produces an error related to the modern-syslog dependency:
>>
>>    DEBUG: Executing shell function do_compile
>>
>> | npm ERR! Linux 4.4.0-47-generic
>> | npm ERR! argv
>>
>> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/sysroots/x86_64-linux/usr/bin/
>> node"
>> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/sysroots/x86_64-linux/usr/bin
>> /npm" "--arch=arm" "--target_arch=arm" "--production" "--no-registry"
>> "install"
>> | npm ERR! node v4.6.1
>> | npm ERR! npm  v2.15.9
>>
>> | npm ERR! Registry not defined and registry files not found:
>> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/work/cortexa8hf-neon-poky-linu
>> x-gnueabi/statsd/0.8.0-r0/npm_cache/noregistry/modern-syslog/.cache.json",
>> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/work/cortexa8hf-neon-poky-lin
>> ux-gnueabi/statsd/0.8.0-r0/npm_cache/modern-syslog/.cache.json".
>>
>> modern-syslog 1.1.2 needs node-gyp to build a native component and
>> https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM notes that devtool
>> can't detect such things.  Doing this works fine to build that package:
>>
>>       devtool add 'npm://registry.npmjs.org;name=modern-syslog;version=1.1.2'
>> bitbake modern-syslog
>>
>> but I'm having no luck getting "bitbake statsd" to find the result.
>> I've added:
>>
>>       DEPENDS = "modern-syslog"
>>
>> to statsd_0.8.0.bb but that isn't helping.  It looks like I need some
>> way to have the recipe install the prepared modern-syslog into the cache
>> (or globally?) before baking statsd, but since the cache gets cleared in
>> npm_do_compile() it's not clear how to make that happen.
>>
>> I'm very rusty with OE (two years away), so am I missing something or is
>> this just beyond what the bitbake infrastructure can currently handle?
>> If so, can somebody suggest a way to hand-patch the recipe, or outline
>> how npm.bbclass might be extended to support this?
> Disclaimer - I'm the one who has been doing most of the recent work with npm
> support (aside from the node.js recipe and the original npm fetcher plugin,
> which were the work of others) however my knowledge of node.js is pretty
> limited - most of it has been picked up along the way. So unfortunately I
> can't immediately see why this isn't working. The thing that puzzles me in
> particular about the error you're seeing though is that we're explicitly
> telling npm not to look for a registry, so why is it complaining about the
> lack of a registry?

Sorry, that wasn't clear.  statsd depends on modern-syslog but the 
lockdown and shrinkwrap files generated by devtool don't include it.  
 From the Wiki:

"Devtool cannot detect native libraries in module dependencies, you 
you'll need to manually add packages to recipe"

The Wiki doesn't go into detail of how that's supposed to be done. Is 
the existing infrastructure supposed to be able to find 
globally-installed modules?

I'm wondering whether https://yarnpkg.com/ or one of the other nodejs 
dependency managers might be an alternative, as I believe npm's approach 
to dependencies is not suited to level of lockdown needed by Yocto and 
many other production systems.

Peter


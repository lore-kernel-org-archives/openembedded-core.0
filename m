Return-Path: <pab@pabigot.com>
X-Greylist: delayed 441 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 27 Nov 2016 00:25:39 UTC
Received: from p3plsmtpa07-06.prod.phx3.secureserver.net
	(p3plsmtpa07-06.prod.phx3.secureserver.net [173.201.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 5C81171A79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2016 00:25:39 +0000 (UTC)
Received: from [192.168.65.22] ([75.72.225.8]) by :SMTPAUTH: with SMTP
	id AnACcK1Q4Ycl2AnACcdmZA; Sat, 26 Nov 2016 17:17:49 -0700
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
Message-ID: <b3516f43-75eb-2fa5-31c6-ad5e3a57d032@pabigot.com>
Date: Sat, 26 Nov 2016 18:17:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfI2BIh51NLIKLbQ8ru72+Mn73yGwo+LPHShslGJv1OclV7jslEy/ePA2Ggw4xxUUv/sd1gGpuwCEqRWSNdAJjdNA6lcJ8sd0iHEep3ATrLoq2FsJgNbY
	V1PAlTnC000JHssFt+U6WILJCgdJ3fjsP8XcEPbjDsYuPHO/G0l9HyI1jcngVfUDaDXt1G5s4Sdj8g==
Subject: npm.bbclass support for deep native modules?
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
X-List-Received-Date: Sun, 27 Nov 2016 00:25:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm using the current head of morty and trying to get a handle on the
new nodejs support in OE.

I'm failing to build a recipe for statsd.  Starting with this:

     devtool add 'npm://registry.npmjs.org;name=statsd;version=0.8.0'
     bitbake statsd

produces an error related to the modern-syslog dependency:

  DEBUG: Executing shell function do_compile
| npm ERR! Linux 4.4.0-47-generic
| npm ERR! argv 
"/mnt/devel/oe/omap/build-bb-morty-master/tmp/sysroots/x86_64-linux/usr/bin/node" 
"/mnt/devel/oe/omap/build-bb-morty-master/tmp/sysroots/x86_64-linux/usr/bin/npm" 
"--arch=arm" "--target_arch=arm" "--production" "--no-registry" "install"
| npm ERR! node v4.6.1
| npm ERR! npm  v2.15.9
|
| npm ERR! Registry not defined and registry files not found: 
"/mnt/devel/oe/omap/build-bb-morty-master/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/statsd/0.8.0-r0/npm_cache/noregistry/modern-syslog/.cache.json", 
"/mnt/devel/oe/omap/build-bb-morty-master/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/statsd/0.8.0-r0/npm_cache/modern-syslog/.cache.json".

modern-syslog 1.1.2 needs node-gyp to build a native component and
https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM notes that devtool
can't detect such things.  Doing this works fine to build that package:

     devtool add 'npm://registry.npmjs.org;name=modern-syslog;version=1.1.2'
     bitbake modern-syslog

but I'm having no luck getting "bitbake statsd" to find the result.
I've added:

     DEPENDS = "modern-syslog"

to statsd_0.8.0.bb but that isn't helping.  It looks like I need some
way to have the recipe install the prepared modern-syslog into the cache
(or globally?) before baking statsd, but since the cache gets cleared in
npm_do_compile() it's not clear how to make that happen.

I'm very rusty with OE (two years away), so am I missing something or is
this just beyond what the bitbake infrastructure can currently handle?
If so, can somebody suggest a way to hand-patch the recipe, or outline
how npm.bbclass might be extended to support this?

Thanks.

Peter



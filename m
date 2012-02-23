Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0ZJ3-0001HV-2u
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:06:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6605631593FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:57:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id fXDeo9heQuh6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:57:33 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed8a0.pool.mediaWays.net
	[89.14.216.160])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 7024631593F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:57:33 +0100 (CET)
Message-ID: <4F4645CC.4050403@opendreambox.org>
Date: Thu, 23 Feb 2012 14:57:32 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: bug in recipe version priorities across layers?
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
X-List-Received-Date: Thu, 23 Feb 2012 14:06:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I have a problem with bitbake choosing the wrong version of a 
recipe. The facts are:

- I have multiple layers, including a machine layer, meta-opendreambox,
meta-openembedded and openembedded-core.
- meta-opendreambox contains wpa-supplicant_0.5.10.bb and 
wpa-supplicant_0.7.3.bbappend.
- openembedded-core contains wpa-supplicant_0.7.3.bb.
- There's no PREFERRED_VERSION statement for wpa-supplicant in any of 
the active layers. There is such a statement in another machine's 
layer, which shares the same TMPDIR, but even has a different PACKAGE_ARCH.
- There's no DEFAULT_PREFERENCE statement in any of the recipes.
- The machine I'm building for shall use the latest available version.
- The older wpa-supplicant is provided for a different machine.
- Both bitbake and openembedded-core are from today's master branches.

The problem: The machine I'm building for also picks up version 0.5.10, 
unless I eiher copy 0.7.3 from openembedded-core to my layer or delete 
version 0.5.10 from my layer. Deleting wpa-supplicant_0.7.3.bbappend 
doesn't change the behaviour.

How can copying the recipe make a difference? The BBFILE_PRIORITY 
for meta-opendreambox is higher than for openembedded-core, but I 
wouldn't expect this to have an effect on recipes with different 
versions. Is this expected behaviour?

Here's a log of all lines matching wpa-supplicant of "bitbake 
-ccleansstate wpa-supplicant" with debug enabled:

DEBUG: Cache: /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb is not cached
DEBUG: Cache: /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb is not cached
DEBUG: BB /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb: handle(data)
DEBUG: LOAD /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: BB /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb: handle(data)
DEBUG: LOAD /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
DEBUG: CONF /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb:1: including wpa-supplicant-0.7.inc
DEBUG: BB /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc: handle(data, include)
DEBUG: LOAD /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
DEBUG: Appending .bbappend file /a/meta-openembedded/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend to /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
DEBUG: BB /a/meta-openembedded/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend: handle(data, include)
DEBUG: LOAD /a/meta-openembedded/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend
DEBUG: providers for wpa-supplicant are: ['wpa-supplicant']
DEBUG: sorted providers for wpa-supplicant are: ['/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
DEBUG: adding /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb to satisfy wpa-supplicant
DEBUG: Added dependency virtual/mipsel-oe-linux-gcc for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: Added dependency virtual/mipsel-oe-linux-compilerlibs for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: Added dependency virtual/libc for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: Added dependency openssl for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: Added runtime dependency wpa-supplicant for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: Added runtime dependency wpa-supplicant-dev for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: Added runtime recommendation wpa-supplicant for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: Added runtime recommendation wpa-supplicant-passphrase for /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
DEBUG: providers for wpa-supplicant are: ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10-r0 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3-r7 (value None) against ['wpa-supplicant']
DEBUG: sorted providers for wpa-supplicant are: ['/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
DEBUG: adding '/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb' to satisfy runtime 'wpa-supplicant'
DEBUG: providers for wpa-supplicant-dev are: ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10-r0 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3-r7 (value None) against ['wpa-supplicant']
DEBUG: sorted providers for wpa-supplicant-dev are: ['/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
DEBUG: adding '/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb' to satisfy runtime 'wpa-supplicant-dev'
DEBUG: providers for wpa-supplicant-passphrase are: ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10-r0 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3 (value None) against ['wpa-supplicant']
DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3-r7 (value None) against ['wpa-supplicant']
DEBUG: sorted providers for wpa-supplicant-passphrase are: ['/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
DEBUG: adding '/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb' to satisfy runtime 'wpa-supplicant-passphrase'
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_unpack
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_patch
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_install
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_populate_sysroot
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_populate_sysroot_setscene
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_listtasks
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_clean
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_checkuri
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_checkuriall
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_fetch
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_fetchall
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_build
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_buildall
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_configure
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_compile
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_package_write
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_package
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_cleansstate
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_cleanall
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_rm_work
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_rm_work_all
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_recipe_sanity
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_recipe_sanity_all
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_populate_lic
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_package_setscene
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_package_write_ipk
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_package_write_ipk_setscene
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_devshell
DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb:do_populate_lic_setscene
DEBUG: Considering 0 (/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb, do_clean): set([1])
DEBUG: Considering 1 (/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb, do_cleansstate): set([])
DEBUG: Stampfile /a/tmp/stamps/mipsel-oe-linux/wpa-supplicant-0.5.10-r0.do_clean not available
NOTE: Running task 1 of 2 (ID: 0, /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb, do_clean)
NOTE: package wpa-supplicant-0.5.10-r0: task do_clean: Started
NOTE: package wpa-supplicant-0.5.10-r0: task do_clean: Succeeded
DEBUG: Marking task 1 (/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb, do_cleansstate) as buildable
DEBUG: Stampfile /a/tmp/stamps/mipsel-oe-linux/wpa-supplicant-0.5.10-r0.do_cleansstate not available
NOTE: Running task 2 of 2 (ID: 1, /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb, do_cleansstate)
NOTE: package wpa-supplicant-0.5.10-r0: task do_cleansstate: Started
NOTE: package wpa-supplicant-0.5.10-r0: task do_cleansstate: Succeeded

Regards,
Andreas



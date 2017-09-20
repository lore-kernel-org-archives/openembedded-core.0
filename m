Return-Path: <l.majewski@majess.pl>
X-Greylist: delayed 59772 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Sep 2017 08:22:35 UTC
Received: from 8.mo179.mail-out.ovh.net (8.mo179.mail-out.ovh.net
	[46.105.75.26])
	by mail.openembedded.org (Postfix) with ESMTP id C67A76612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 08:22:35 +0000 (UTC)
Received: from player755.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 2EA94621AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 10:22:36 +0200 (CEST)
Received: from [192.168.2.222] (89-64-27-66.dynamic.chello.pl [89.64.27.66])
	(Authenticated sender: l.majewski@majess.pl)
	by player755.ha.ovh.net (Postfix) with ESMTPSA id 870CD26009E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 10:22:35 +0200 (CEST)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: =?UTF-8?Q?=c5=81ukasz_Majewski?= <l.majewski@majess.pl>
Message-ID: <6b1eb432-f338-78f7-769e-c85f0a8e6915@majess.pl>
Date: Wed, 20 Sep 2017 10:22:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2687523078140838593
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheelgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecu
Subject: [eSDK] Question regarding excluding packages from eSDK
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
X-List-Received-Date: Wed, 20 Sep 2017 08:22:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Dear All,

I would like to "exclude" from eSDK package build with its own 
meta-layer (swupdate).

Unfortunately, some parts of it are necessary to create core-image-XXX 
image (I do reuse its initramfs) binaries.


Since the swupdate is not part of core-image-XXX, I would like to know 
if it is possible to not include it to extended SDK?

When included it causes errors in the *.sh installation script 
(including its dependencies):


ERROR: Task json-c.do_populate_sysroot attempted to execute unexpectedly 
and should have been setscened
ERROR: Task libconfig.do_populate_sysroot attempted to execute 
unexpectedly and should have been setscened
ERROR: Task swupdate.do_patch attempted to execute unexpectedly
ERROR: Task lua.do_populate_sysroot attempted to execute unexpectedly 
and should have been setscened
ERROR: Task swupdate.do_prepare_recipe_sysroot attempted to execute 
unexpectedly
ERROR: Task swupdate.do_configure attempted to execute unexpectedly
ERROR: Task swupdate.do_compile attempted to execute unexpectedly
ERROR: Task swupdate.do_install attempted to execute unexpectedly
ERROR: Task swupdate.do_package attempted to execute unexpectedly and 
should have been setscened
ERROR: Task swupdate.do_packagedata attempted to execute unexpectedly 
and should have been setscened
ERROR: Task json-c.do_package_write_rpm attempted to execute 
unexpectedly and should have been setscened





I've been trying to use:
SDK_INHERIT_BLACKLIST_append = " swupdate"

(but according to doc [1] it is meant to work with classes, not recipes)


Also SDK_LOCAL_CONF_BLACKLIST seems to be only meant to unset/modify 
some variables.



One possible solution would be to create separate recipe for bundling 
factory images (some custom SD card layout). This recipe would not be 
part of core-image-XXX and hence dependency on swupdate would not affect it.

Is this the recommended approach ?



Note:
-----
[1] 
http://www.yoctoproject.org/docs/2.3/sdk-manual/sdk-manual.html#sdk-extensible

-- 
Best regards.

Łukasz Majewski


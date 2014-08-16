Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-06.prod.phx3.secureserver.net
	(p3plsmtpa09-06.prod.phx3.secureserver.net [173.201.193.235])
	by mail.openembedded.org (Postfix) with ESMTP id 8973C601A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 14:09:57 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-06.prod.phx3.secureserver.net with 
	id fS9w1o00N1mTNtu01S9xA0; Sat, 16 Aug 2014 07:09:58 -0700
Message-ID: <53EF6634.10202@pabigot.com>
Date: Sat, 16 Aug 2014 09:09:56 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: implicit renaming of packages containing libraries
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
X-List-Received-Date: Sat, 16 Aug 2014 14:09:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Many recipes split out the pieces they build into separate packages; I'm 
looking at meta-oe/recipes-support/lmsensors/lmsensors_3.3.5.bb as an 
example. Generally that's done with directives like:

# libsensors files
FILES_${PN}-libsensors = "${libdir}/libsensors.so.* 
${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d"
FILES_${PN}-libsensors-dbg = "${libdir}/.debug ${prefix}/src/debug"
FILES_${PN}-libsensors-dev = "${libdir}/libsensors.so ${includedir}"
FILES_${PN}-libsensors-staticdev = "${libdir}/libsensors.a"
FILES_${PN}-libsensors-doc = "${mandir}/man3"

Although the initial package split follows the names specified in the 
recipe, something (probably INHERIT_DISTRO="debian") is inserting a call 
to debian_package_name_hook so what actually gets written is:

libsensors-dbg-3.3.5-r0.0.cortexa8hf_vfp_neon.rpm
libsensors-dev-3.3.5-r0.0.cortexa8hf_vfp_neon.rpm
libsensors-doc-3.3.5-r0.0.cortexa8hf_vfp_neon.rpm
libsensors-staticdev-3.3.5-r0.0.cortexa8hf_vfp_neon.rpm
libsensors4-3.3.5-r0.0.cortexa8hf_vfp_neon.rpm
lmsensors-dbg-3.3.5-r0.0.cortexa8hf_vfp_neon.rpm
lmsensors-dev-3.3.5-r0.0.cortexa8hf_vfp_neon.rpm
...

I expected the packages to be what the recipe specified.  An undesirable 
effect of the rename is that when I use "smart search lmsensors" the 
libraries in lmsensors that I was looking for don't show up because the 
lmsensors- prefix was removed from the RPM.

Is this intentional?  Is it documented somewhere?  I wouldn't be 
terribly upset if lmsensors-libsensors got renamed to 
lmsensors-libsensors4 because Debian policy expects the SO number to be 
part of the name, but it's weird to have the owning package stripped off 
like this.

Peter


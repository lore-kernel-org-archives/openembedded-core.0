Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7877C610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 12:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7ICkUF7024826 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 13:46:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UnKJGSLNX8_I
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 13:46:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7ICknBM024838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 13:46:50 +0100
Message-ID: <1408366010.1669.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 13:46:50 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [RFC] Allarch and packagegroup improvement proposal
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
X-List-Received-Date: Mon, 18 Aug 2014 12:46:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As some people are already painfully aware, the current way packagegroup
and allarch interact with the sstate signatures is painful.

Some example problem cases:

* An allarch package of scripts with an interpretor dependency (e.g perl)

* A packagegroup with dependencies on something which is debian renamed 
  e.g. build-essentials on libgmp 


Currently, packagegroups default to allarch and have their sstate
dependencies truncated. This means that when something like gmp
rebuilds, it can change package name thanks to debian renaming but the
packagegroup referencing the old name remains, causing image creation
failures.

So the "obvious" fix is to stop truncating the dependencies? Well, that
means that the allarch package is written out every time machine changes
to a different arch.

So we need to make packagegroups PACKAGE_ARCH specific? Well, this still
doesn't solve the problem of allarch packages having ever greater
problems with things like dependencies on perl.

An alternative solution I'm wondering about to address both issues is:

* the sstatesig packagegroup code for dependencies handling should only
trigger for allarch 
* we add a sanity test that checks if renaming has happened for
packagegroup dependencies and warn if it has.

The trouble is the sstatesig code doesn't have the full data store, only
a limited cross section so it can't check if PACKAGE_ARCH == all, only
if the class is inherited. We therefore probably need to change
packagegroup to do conditional class inclusion (which is possible with
the modern code base at least). The use of the class can be tested from
the sstatesig code and hence indicate allarch.


For the second part, we could add something like:

+    if bb.data.inherits_class('packagegroup', d) and bb.data.inherits_class('allarch', d):    
+        if set(deps) != set(new_depends):
+            bb.warn("allarch packagegroup %s has renamed dependency %s" % (pkg, str(set(deps) ^ set(new_depends)))) 

to runtime_mapping_rename in package.bbclass which tells us which
packagegroups need to move to be PACKAGE_ARCH. Unfortunately, a quick
run of OE-Core shows:

WARNING: allarch packagegroup packagegroup-core-sdk has renamed dependency set(['libgomp', 'libgomp1'])
WARNING: allarch packagegroup packagegroup-core-x11-base has renamed dependency set(['dbus-1', 'dbus'])
WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target has renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-dev', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-dev', 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dbg has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', 'libgcc-dbg'])
WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dev has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', 'eglibc-dev'])
WARNING: allarch packagegroup packagegroup-core-x11-sato-base has renamed dependency set(['libsdl-1.2-0', 'libsdl'])
WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dbg has renamed dependency set(['libsdl-dbg', 'libsdl-1.2-dbg'])
WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dev has renamed dependency set(['libsdl-dev', 'libsdl-1.2-dev'])
WARNING: allarch packagegroup packagegroup-core-sdk has renamed dependency set(['libgomp', 'libgomp1'])
WARNING: allarch packagegroup packagegroup-core-x11-base has renamed dependency set(['dbus-1', 'dbus'])
WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target has renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-dev', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-dev', 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
WARNING: allarch packagegroup packagegroup-core-x11-sato-base has renamed dependency set(['libsdl-1.2-0', 'libsdl'])
WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dbg has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', 'libgcc-dbg'])
WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dev has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', 'eglibc-dev'])
WARNING: allarch packagegroup packagegroup-core-buildessential has renamed dependency set(['libstdc++', 'libstdc++6'])
WARNING: allarch packagegroup packagegroup-core-buildessential has renamed dependency set(['libstdc++', 'libstdc++6'])

so we do have the problem in a number of places.

Does anyone have any thoughts?

Cheers,

Richard




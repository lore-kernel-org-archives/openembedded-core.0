Received: from plesk3.srihosting.com ([69.19.236.78])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tmiket@recipes4linux.com>) id 1TTHId-0002jp-LA
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 20:16:32 +0100
Received: (qmail 22517 invoked by uid 48); 30 Oct 2012 11:56:15 -0700
Received: from 69.199.146.210 ([69.199.146.210]) by
	webmail.recipes4linux.com (Horde Framework) with HTTP; Tue, 30 Oct 2012
	11:56:15 -0700
Message-ID: <20121030115615.77684awm7w5p1fqc@webmail.recipes4linux.com>
Date: Tue, 30 Oct 2012 11:56:15 -0700
From: "T.Michael Turney" <tmiket@recipes4linux.com>
To: Openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.6)
Subject: gtk+ native recipe question
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 19:16:32 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit


My first post, chose -core over -devel somewhat arbitrarily as I don't  
understand distinction of OE-classic yet.

In order to get an existing OE system (builds on Fedora) to build correctly
on 64-bit Ubuntu 12.04 I had to modify a number of recipe files.

In order to get native gtk+ to build I had to add no-demos.patch
to SRC_URI_append.  The patch file already existed in recipes tree
but wasn't being referenced in the .bb file.

Second change was adding glib-2.0-native to DEPEND_virtclass-native in  
same file.

Problem was manifested with unresolved reference to g_bytes_unref when
building gtk+ native.  Ubuntu 12.04 has more recent glib install than in
OE project I'm building and g_bytes_unref is visible in host glib but not
OE version.

With this change and a few other similar minor changes in .bb files, the
system builds.  However, the bitbake build line has to be invoked twice.

For example, let's say I'm building foo-image and foo1-image, and I run:

bitbake foo-image foo1-image

This command fails building gtk+ native.  I re-run exact same command:

bitbake foo-image foo1-image

and this time gtk+ native builds correctly and whole system builds.

Any suggestions on what I should be looking at to get the dependency info
correct so first build doesn't fail?
Cheers,
T.mike




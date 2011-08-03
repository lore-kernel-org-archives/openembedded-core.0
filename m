Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qodd4-0000cZ-Ei for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:45:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73Fei1J026913
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:40:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26238-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 16:40:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FebF6026907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:40:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E395E0C.8010308@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
	<d97dcf096a3a72a2a087b2dbbcdd74c853f7e940.1312243899.git.mark.hatle@windriver.com>
	<1312292802.4325.33.camel@phil-desktop>
	<4E380E7E.9050803@windriver.com>
	<1312374036.2344.658.camel@rex>  <4E395E0C.8010308@windriver.com>
Date: Wed, 03 Aug 2011 16:40:20 +0100
Message-ID: <1312386020.2344.683.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/5] update-alternatives: Add alternatives as a runtime provide
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
X-List-Received-Date: Wed, 03 Aug 2011 15:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 09:41 -0500, Mark Hatle wrote:
> On 8/3/11 7:20 AM, Richard Purdie wrote:
> > On Tue, 2011-08-02 at 09:49 -0500, Mark Hatle wrote:
> >> On 8/2/11 8:46 AM, Phil Blundell wrote:
> >>> On Mon, 2011-08-01 at 19:17 -0500, Mark Hatle wrote:
> >>>> The following allows RPM to generate the SDK image, however without it
> >>>> we get a failure because the system has nothing that provides /bin/sh.
> >>>>
> >>>> Unfortunately the patch causes failures with ipk and deb packages because
> >>>> they can not have filenames within their RPROVIDES.  I'm looking for some
> >>>> type of a resolution to the issue, the only thing I can think of is to
> >>>> add a way to manually add a FILERPROVIDE for the items.  This will require
> >>>> changes to the way FILERPROVIDE is currently generated... but I'm not sure
> >>>> how we can automatically generate the FILERPROVIDE values without the use of
> >>>> python...
> >>>>
> >>>> Any suggestions?
> >>>
> >>> It's never really been the intent that update-alternatives should put
> >>> the name of the link being provided into RPROVIDES.  If you want to
> >>> solve the specific problem with /bin/sh then just adding RPROVIDES_${PN}
> >>> += "virtual-bourne-shell" or something to bash and busybox is probably
> >>> the easiest way of doing that.
> >>>
> >>> I wouldn't be entirely opposed to the concept of what you're proposing
> >>> here, though.  Something like:
> >>>
> >>> RPROVIDES_${PN} += "${@' '.join(map(lambda x:
> >>> legitimize_package_name("virtual-path-" + x), filter(lambda x: x != '',
> >>> [ d.getVar('ALTERNATIVE_LINK', True) or '' ] +
> >>> (d.getVar('ALTERNATIVE_LINKS', True) or '').split())))}"
> >>>
> >>> might be what you want, perhaps.  I'm not sure that the resulting
> >>> virtual names will be very pretty though.
> >>
> >> Hmm.. Coming from the RPM world, the virtual-path- because we can't just
> >> "provide" a file in the system seems a bit wonky to me.  But it should be able
> >> to work.  For RPM at least, we'd want a reversing function to turn virtual paths
> >> back into real paths.
> >>
> >> If I have time today, I'll try to implement a proof of concept and see if I can
> >> get it to work reasonably well.
> > 
> > Just to be clear for Phil's benefit, RPM natively supports file based
> > dependencies, so a dependency of "/bin/sh" is automatically fulfilled by
> > a package which contains "/bin/sh". Some dependencies such as the
> > shebang in scripts are automatically added to packages and resolved by
> > rpm.
> > 
> > I did chase down this bug a bit and it seems that if you "bitbake
> > meta-toolchain-game" you hit an error about /bin/sh being missing but if
> > you "bitbake busybox; bitbake meta-toolchain-gmae" it will work. This is
> > due to busybox shipping a /bin/sh.
> > 
> > The question is therefore how to handle this on the deb/ipk side and
> > ensure we get consistency between the behaviours of the different
> > backends. I thought with the rpm filedeps code in do_package, we were
> > adding things like /bin/sh dependencies to the other package formats but
> > now I'm not so sure. 
> 
> Due to deb/ipk not handling file based dependencies, they are filtered out on
> the creation of the deb/ipk packages.  The original intention was to use them,
> but it wasn't possible at the time.  Simply adding a ton of file-based
> dependencies seemed like a huge mistake as well.  (We'd have to add virtual
> provides for all of the virtual requirements....)
> 
> We could certainly select a few specific requirements and scan for and use those
> to catch obvious issues, such as perl, sh, bash, env/python... but it's still
> only a partial solution to the real issue.

Short term I'm tempted to buy us some time and do this (rpm specific):

package_rpm: Ensure alternatives links are reflected in rpm package dependencies

Currently, if a file is provided as an alternative link within the package, rpm
doesn't see the dependency. This works out badly for dependencies such as /bin/sh
which scripts might require.

Since rpm detects and adds these dependencies we do need to ensure the dependency
information in the packages is correct. This patch does so for the rpm backend
ensuring internal consistency whilst the approach for addressing this problem in
the other package backends is considered.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index abedc68..c44fdcc 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -501,6 +501,10 @@ python write_specfile () {
 		splitrconflicts  = bb.data.getVar('RCONFLICTS', localdata, True) or ""
 		splitrobsoletes  = []
 
+		# For now we need to manually supplement RPROVIDES with any update-alternatives links
+		if pkg == d.getVar("PN", True):
+			splitrprovides = splitrprovides + (d.getVar('ALTERNATIVE_LINK', True) or '') + (d.getVar('ALTERNATIVE_LINKS', True) or '')
+
 		# Gather special src/first package data
 		if srcname == splitname:
 			srcrdepends    = splitrdepends




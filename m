Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TNhSy-0001kc-Ja
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 12:00:08 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TNhGA-0003SN-Rb; Mon, 15 Oct 2012 11:46:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 15 Oct 2012 10:46:49 +0100
In-Reply-To: <50785717.8000606@linux.intel.com>
References: <1348577801.31293.71.camel@phil-desktop>
	<50785717.8000606@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350294414.3259.128.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Mon, 15 Oct 2012 10:00:08 -0000
X-Groupsio-MsgNum: 30580
Content-Type: multipart/mixed; boundary="=-QEihD25SupDaQNi/T449"

--=-QEihD25SupDaQNi/T449
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-12 at 10:44 -0700, Saul Wold wrote:
> On 09/25/2012 05:56 AM, Phil Blundell wrote:
> > This removes the dependency of eglibc.bb itself on perl and bash
> > which, in turn, eliminates the need to build those two recipes if the
> > scripts which need them are not going to be installed.
> >
> 
> I think you missed dealing with an RPOVIDES someplace as I am getting 
> the following error during build:
> 
> > ERROR: Nothing RPROVIDES 'libc-mtrace' (but /intel/poky/distro/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'libc-mtrace' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['libc-mtrace']
> > ERROR: Required build target 'packagegroup-core-tools-debug' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['packagegroup-core-tools-debug', 'libc-mtrace']

Right, sorry about that.  The attached fixes this for me.

p.


--=-QEihD25SupDaQNi/T449
Content-Disposition: attachment;
	filename="0001-eglibc-mtrace-Add-libc-mtrace-to-PROVIDES.patch"
Content-Type: text/x-patch; name="0001-eglibc-mtrace-Add-libc-mtrace-to-PROVIDES.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 09acbe5c7b6c480400f7756f79cc13592416f4de Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Mon, 15 Oct 2012 10:45:11 +0100
Subject: [PATCH] eglibc-mtrace: Add libc-mtrace to PROVIDES

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/eglibc/eglibc-mtrace.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-mtrace.inc b/meta/recipes-core/eglibc/eglibc-mtrace.inc
index 321de7b..1ec93ac 100644
--- a/meta/recipes-core/eglibc/eglibc-mtrace.inc
+++ b/meta/recipes-core/eglibc/eglibc-mtrace.inc
@@ -1,8 +1,10 @@
 include eglibc-collateral.inc
 
+PR = "r1"
 SUMMARY = "mtrace utility provided by eglibc"
 DESCRIPTION = "mtrace utility provided by eglibc"
 RDEPENDS_${PN} = "perl"
+RPROVIDES_${PN} = "libc-mtrace"
 
 SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
 
-- 
1.7.10.4


--=-QEihD25SupDaQNi/T449--

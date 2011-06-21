Received: from cluster-f.mailcontrol.com ([85.115.62.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom.Parkin@pace.com>) id 1QZ22x-0004Ja-Jg
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:35:19 +0200
Received: from salexc1.pace.internal (salts-gw1.pace.co.uk [194.60.90.1])
	by rly07f.srv.mailcontrol.com (MailControl) with ESMTP id
	p5LE4KKa013521 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 15:04:20 +0100
Received: from salexc3.pace.internal ([136.170.144.42]) by
	salexc1.pace.internal with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 21 Jun 2011 15:04:19 +0100
Received: from localhost ([136.170.164.133]) by salexc3.pace.internal with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 21 Jun 2011 15:04:19 +0100
Date: Tue, 21 Jun 2011 15:04:19 +0100
From: Tom Parkin <tom.parkin@pace.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110621140419.GA8589@raven.pace.internal>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 21 Jun 2011 14:04:19.0718 (UTC)
	FILETIME=[1D638260:01CC301C]
X-Scanned-By: MailControl A-10-80-00 (www.mailcontrol.com) on 10.70.0.117
X-Mailman-Approved-At: Tue, 21 Jun 2011 16:43:26 +0200
Subject: Using TCLIBC = "uclibc" in oe-core
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
X-List-Received-Date: Tue, 21 Jun 2011 14:35:19 -0000
X-Groupsio-MsgNum: 4428
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi list,

I'm trying to set up a working openembedded-core/uClibc mipsel
environment.  I found that setting TCLIBC = "uclibc" in local.conf
yielded the following:

ERROR: Nothing PROVIDES 'glib-2.0-native'

I traced this down to code in meta/recipes-core/glib-2.0/glib-2.0.inc,
which raises a SkipPackage exception if USE_NLS = "no".

The reason that USE_NLS = "no" in this case is that
meta/conf/distro/include/tclibc-uclibc.inc sets USE_NLS ?= "no".

Looking further at tclibc-uclibc.inc, though, it appears that there is
some code attempting to work around this issue:

USE_NLS_glib-2.0 = "yes"

Sadly, this appears to get ignored.  Following this up on the #yocto
IRC channel, it seems that a more appropriate formulation of the above
would be:

USE_NLS_pn-glib-2.0-native = "yes"

The attached patch allows me to (at least) assemble the bitbake task
list when TCLIBC = "uclibc".  I'm not sure whether this is the correct
approach, though.

Any comments?

Many thanks,
Tom
-- 
Tom Parkin
Senior Software Engineer
Pace Plc

Bringing Technology Home

Victoria Road, Saltaire, West Yorkshire, BD18 3LF, United Kingdom. www.pace.com

Think before you print! Please consider the environment before printing this e-mail.


This message has been scanned for viruses by BlackSpider MailControl. - www.blackspider.com

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-Override-USE_NLS-for-glib-2.0-native-when-using-uCli.patch"

From 7cab67af78f73408d7d86f7cfce78715cd32ae6b Mon Sep 17 00:00:00 2001
From: Tom Parkin <tom.parkin@pace.com>
Date: Tue, 21 Jun 2011 14:33:22 +0100
Subject: [PATCH] Override USE_NLS for glib-2.0-native when using uClibc

We don't use NLS for uClibc, but glib-2.0-native refuses to build
if USE_NLS is not "yes" (ref. meta/recipes-core/glib-2.0/glib-2.0.inc).

As a cunning work around, override USE_NLS for glib-2.0-native.  This
allows initial bitbake tasklist parsing and assembly to complete
successfully.
---
 meta/conf/distro/include/tclibc-uclibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index c421f5e..408966b 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
 PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
 
 USE_NLS ?= "no"
-USE_NLS_glib-2.0 = "yes"
+USE_NLS_pn-glib-2.0-native = "yes"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-- 
1.7.4.4


--J/dobhs11T7y2rNN--

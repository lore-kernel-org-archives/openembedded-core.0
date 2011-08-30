Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QyKel-0005gv-Bz
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 11:30:55 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QyKa4-0004pZ-Ji
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 11:26:04 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2011 10:26:03 +0100
In-Reply-To: <C368959C-3433-4A60-8B2E-65AC7FBF341E@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314264296.19905.29.camel@phil-desktop>
	<1314284316.5939.196.camel@rex>
	<1314367938.19905.90.camel@phil-desktop>
	<EB5E7A93-679D-4108-8E6D-03D7E1865908@dominion.thruhere.net>
	<1314372632.19905.93.camel@phil-desktop>
	<C368959C-3433-4A60-8B2E-65AC7FBF341E@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314696364.19905.107.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Tue, 30 Aug 2011 09:30:55 -0000
X-Groupsio-MsgNum: 8946
Content-Type: multipart/mixed; boundary="=-PXl9JjmvASurE6+lPNYh"

--=-PXl9JjmvASurE6+lPNYh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 18:31 +0200, Koen Kooi wrote:
> That one doesn't seem to apply:

Hm, yes, it seems I somehow damaged the patch in my last mail.  Third
time lucky then.

p.


--=-PXl9JjmvASurE6+lPNYh
Content-Disposition: attachment;
	filename*0=0001-libc-package-restore-correct-mangling-behavior-for-l.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-libc-package-restore-correct-mangling-behavior-for-l.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From c3a2a50b6693e54aeb8c2fa635360aea53df2957 Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Fri, 26 Aug 2011 17:51:47 +0100
Subject: [PATCH] libc-package: restore correct mangling behavior for locale names

This reverts 19fb07bf337e1d724798e2eb4479c35fc45b1941 and restores
the behaviour of the code to the way it was prior to 561d875404ef1783f94f37314b6e756766db8411.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007407.html and subsequent messages.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/libc-package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index d3b33d6..9d32844 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -241,9 +241,9 @@ python package_do_split_gconvs () {
 		(locale, encoding, locale), d)
 
 	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
-		m = re.match("(.*)_(.*)", name)
+		m = re.match("(.*)\.(.*)", name)
 		if m:
-			libc_name = "%s-%s" % (m.group(1), m.group(2).lower().replace("-",""))
+			libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
 		else:
 			libc_name = name
 		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
-- 
1.7.4.1


--=-PXl9JjmvASurE6+lPNYh--

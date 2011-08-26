Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QwyRC-0000jV-Nv
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 17:35:18 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QwyMa-0007jO-9E
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 17:30:32 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2011 16:30:31 +0100
In-Reply-To: <EB5E7A93-679D-4108-8E6D-03D7E1865908@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314264296.19905.29.camel@phil-desktop>
	<1314284316.5939.196.camel@rex>
	<1314367938.19905.90.camel@phil-desktop>
	<EB5E7A93-679D-4108-8E6D-03D7E1865908@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314372632.19905.93.camel@phil-desktop>
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
X-List-Received-Date: Fri, 26 Aug 2011 15:35:18 -0000
X-Groupsio-MsgNum: 8838
Content-Type: multipart/mixed; boundary="=-kLGxSa6QfZ4QmRgqXYuv"

--=-kLGxSa6QfZ4QmRgqXYuv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 17:26 +0200, Koen Kooi wrote:
> And that gives me http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=9b2e08e0c4da4881ba8c83be39697a40a63b75fd
> 
> -locale_base_en_us -> eglibc_binary_localedata_en_us;
> +locale_base_en_us -> eglibc_binary_localedata_en_u_;
> 
> So something regexp is being a bit too greedy by the looks of it.

Ah whoops, the old missing backslash.  Could you try this one instead?

p.


--=-kLGxSa6QfZ4QmRgqXYuv
Content-Disposition: attachment;
	filename*0=0001-libc-package-restore-correct-mangling-behavior-for-l.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-libc-package-restore-correct-mangling-behavior-for-l.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 1cd91a91802776ddede041cfa222b603da6c8453 Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Fri, 26 Aug 2011 15:05:11 +0100
Subject: [PATCH v2] libc-package: restore correct mangling behavior for locale names

This reverts 19fb07bf337e1d724798e2eb4479c35fc45b1941 and restores
the behaviour of the code to the way it was prior to 561d875404ef1783f94f37314b6e756766db8411.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007407.html and subsequent messages.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/libc-package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index d3b33d6..f8df6a4 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -241,10 +241,9 @@ python package_do_split_gconvs () {
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


--=-kLGxSa6QfZ4QmRgqXYuv--

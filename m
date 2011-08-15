Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qt0Pq-0006zJ-P2
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:53:30 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qt0LQ-00050Z-QJ
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:48:56 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 17:48:55 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313426936.6733.192.camel@phil-desktop>
Mime-Version: 1.0
Subject: fontconfig-2.8.0/fix_pkgconfig.patch
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
X-List-Received-Date: Mon, 15 Aug 2011 16:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Does anybody know where this patch came from or what it is supposed to
be achieving?  As far as I have been able to tell with some limited git
archaeology, it seems to have originated from Poky in the
fontconfig-2.6.0 sort of timeframe but that's about all I have been able
to find out.

The actual content of the patch is:

-Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@
+Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ -L{libdir} -lfreetype @ICONV_LIBS@

... which, as far as I can tell, is just completely bogus.  The added
"-L{libdir}" is causing cmake to blow up if it tries to inspect the
private libs for fontconfig to anything that depends on it: it's
arguably a bug in cmake that it can't tolerate {} there, but it seems
fairly clear that this patch in its current form can't be producing any
useful effect.

p.





Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QoFN7-00021c-QB
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:51:01 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QoFIw-0002SC-RR
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:46:42 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 02 Aug 2011 14:46:42 +0100
In-Reply-To: <d97dcf096a3a72a2a087b2dbbcdd74c853f7e940.1312243899.git.mark.hatle@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
	<d97dcf096a3a72a2a087b2dbbcdd74c853f7e940.1312243899.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312292802.4325.33.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 02 Aug 2011 13:51:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 19:17 -0500, Mark Hatle wrote:
> The following allows RPM to generate the SDK image, however without it
> we get a failure because the system has nothing that provides /bin/sh.
> 
> Unfortunately the patch causes failures with ipk and deb packages because
> they can not have filenames within their RPROVIDES.  I'm looking for some
> type of a resolution to the issue, the only thing I can think of is to
> add a way to manually add a FILERPROVIDE for the items.  This will require
> changes to the way FILERPROVIDE is currently generated... but I'm not sure
> how we can automatically generate the FILERPROVIDE values without the use of
> python...
> 
> Any suggestions?

It's never really been the intent that update-alternatives should put
the name of the link being provided into RPROVIDES.  If you want to
solve the specific problem with /bin/sh then just adding RPROVIDES_${PN}
+= "virtual-bourne-shell" or something to bash and busybox is probably
the easiest way of doing that.

I wouldn't be entirely opposed to the concept of what you're proposing
here, though.  Something like:

RPROVIDES_${PN} += "${@' '.join(map(lambda x:
legitimize_package_name("virtual-path-" + x), filter(lambda x: x != '',
[ d.getVar('ALTERNATIVE_LINK', True) or '' ] +
(d.getVar('ALTERNATIVE_LINKS', True) or '').split())))}"

might be what you want, perhaps.  I'm not sure that the resulting
virtual names will be very pretty though.

p.





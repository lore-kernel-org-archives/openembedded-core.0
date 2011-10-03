Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RAllX-0004Qr-I6
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 18:53:19 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RAlgD-0000QB-6F
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 18:47:49 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 03 Oct 2011 17:47:48 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1317660469.13337.16.camel@phil-desktop>
Mime-Version: 1.0
Subject: sstate_clean() overzealous?
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
X-List-Received-Date: Mon, 03 Oct 2011 16:53:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The sstate_clean() function in sstate.bbclass is doing (inter alia):

    stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
    [...]
    oe.path.remove(stfile + ".*")
    oe.path.remove(stfile + "_setscene" + ".*")

which means that, for tasks which set the stamp-extra-info flag to
${MACHINE}, it ends up blowing away the stamps for all machines rather
than just the current one.  The net effect of this seems to be that
there is no way to have the setscene stamps populated for more than one
MACHINE at any time, and hence all those tasks get rerun every time you
change MACHINE even if nothing else has been altered.

Is this behaviour deliberate?  It is certainly a little bit annoying but
I don't understand the internals of sstate well enough to judge what
exactly that glob is trying to accomplish.

thanks

p.





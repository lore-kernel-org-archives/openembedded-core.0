Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/P4OLlUZ63BZPXq6VKIgoeSsZ+rMiyQn8=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmGG4-0007q7-J9
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 04:23:32 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6S2JFjQ032235
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 21:19:16 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 27 Jul 2011 21:19:15 -0500
Message-Id: <7EF5CC6C-A2D5-40CD-B6FD-F857FAA6B515@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: libzypp variable expansion problem
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
X-List-Received-Date: Thu, 28 Jul 2011 02:23:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

In meta/recipes-extended/libzypp/libzypp_git.bb we having something that =
looks like:

        while [ $# -gt 0 ]; do
		...
                if [ "${AVOID_CONSTRUCTOR}" !=3D "true" ]; then
                  ARCH=3D"_$1"
                else
                  ARCH=3D"IdString(\"$1\")"
                fi
		...
                COMPAT_WITH=3D"${ARCH},${COMPAT} $COMPAT_WITH"
        done

The problem is the COMPAT_WITH line should show up in the resulting =
script as is, however its not getting expanded because ARCH is set.  So =
we end up with:

	COMPAT_WITH=3D"powerpc,${COMPAT} $COMPAT_WITH"

instead of

	COMPAT_WITH=3D"${ARCH},${COMPAT} $COMPAT_WITH"

Not quite sure how to fix this w/regards to quoting to prevent the =
expansion.  One solution is to just rename ARCH to something like CARCH.

- k=



Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R91Yb-0006hw-28
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 23:20:45 +0200
Received: (qmail invoked by alias); 28 Sep 2011 21:15:17 -0000
Received: from p4FDF1957.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.87]
	by mail.gmx.net (mp023) with SMTP; 28 Sep 2011 23:15:17 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/rkUUoSAHrzariYDkRiRVJDCBIiAFdTUK95abDsE
	kqmmvxh2NFyumX
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 23:19:08 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201109282319.08663.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: oe-core lsb / oe-classic lsb_base
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
X-List-Received-Date: Wed, 28 Sep 2011 21:20:45 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

I am trying to get networkmanager ( included in meta-oe ) working. Since the daemon does not start automatically, I try to start it manually by /etc/init.d/Networkmanager start

That complaines about missing /lib/lsb/init-functions. OK - I add lsb to RDEPEND in networkmanager but now manual start complains for missing function log_daemon_msg ( and will surely later complain about log_end_msg ). Further investigations make me wonder: 

- *All* files found in /etc/core-lsb include the file /etc/init.d/functions which is not included on my image.
- scripts init-functions and included are sourced in oe-core. Do we want to maintain these scripts?
- isn't this a case for inherit allarch?

I checked lsb_base in oe-classic: The sources are taken from debian and 

+ /lib/lsb/init-functions contains my missing functions
- lsb_release is a python script

So how about

* reduce lsb down to lsb_release ( and rename recipe to lsb_release )
* add lsb_base from oe-classic

OR

combine both: Take oe-core lsb_release and oe-classic init-functions ( resulting version number? )

What do you think?

Andreas



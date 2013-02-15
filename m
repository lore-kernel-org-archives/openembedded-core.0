Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U6Q8Z-0003rt-8i
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 19:35:58 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1FIJlWG014623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 19:19:49 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1U6Psx-0001Un-CV
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 19:19:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 19:19:47 +0100
Message-ID: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.72
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Fri, 15 Feb 2013 18:35:59 -0000
Content-Type: text/plain

Hello,

it would be nice when the decision to make the init manager a distribution
feature will be reverted to the old oe-meta mechanism.

Being a distribution feature means, that packages are created in such a
way that it is impossible to split off unwanted and heavy weighted
functionality at image creation time.

E.g. on most of my systems, I create two kinds of images: a full
featured, systemd based one and a very minimal rescue system with
busybox and some filesystem utilities.  With recent systemd packaging
change, the rescue image size grow up from 5.9 MiB to 27 MiB because
systemd dependencies are hardcoded in mandatory packages.

Formerly, systemd dependencies could be avoided by adding the -systemd
packages to BAD_RECOMMENDATIONS (e.g. due to busybox-syslog ->
busybox-syslog-systemd rrecommend).

I am aware that initscripts were always part of the main package.  But
sysvinit was very lightweighted and the extra space either negligible or
easy to recover by removing some files in IMAGE_PREPROCESS_COMMAND.

Hence my recommendation: make the init manager an image feature again
and create -systemd and -sysv packages with the corresponding scripts.
OpenEmbedded is still for embedded devices where size matters.


Of course, systemd can be still a distribution feature to enable things
like socket activation as part of PACKAGE_CONFIG.  But dependencies on
init system packages should be RRECOMMENDS which can be overridden
easily at image creation time.



Enrico



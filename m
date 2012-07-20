Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SsAcl-0003rx-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:39:55 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6KASTlt027934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 12:28:31 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1SsARh-0001AU-Ae
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:28:29 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 12:28:29 +0200
Message-ID: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Broken parallel build of gcc*
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
X-List-Received-Date: Fri, 20 Jul 2012 10:39:55 -0000
Content-Type: text/plain

Hi,

some of the recent changes seem to break the parallel build of the gcc*
recipes which are sharing a same source directory:

| $ ./bitbake gcc-cross-initial gcc-cross-intermediate gcc-cross -c cleansstate
| $ BB_NUMBER_THREADS=3 ./bitbake gcc-cross-initial gcc-cross-intermediate gcc-cross
| ...
| NOTE: package gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Started
| NOTE: package gcc-cross-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Started
| NOTE: package gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Succeeded
| ERROR: Error executing a python function in ...recipes-devtools/gcc/gcc-cross_4.7.bb:
| OSError: [Errno 39] Directory not empty: '...tmp/work-shared/gcc-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7/git/'
| NOTE: package gcc-cross-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7: task do_unpack: Failed

It seems that the work-shared/ directory is not locked and cleaned when
starting the second unpack.



Enrico



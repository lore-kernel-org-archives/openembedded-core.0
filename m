Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1T4B6D-0000RF-CU
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 15:35:57 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q7MDNnYB023858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 15:23:51 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1T4Auq-0000KO-OM
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 15:24:12 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 15:24:12 +0200
Message-ID: <lyfw7foy9v.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.85
X-Spam-Score: -5.4
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: eglibc build fails with 'cannot find -lgcc_eh'
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
X-List-Received-Date: Wed, 22 Aug 2012 13:35:57 -0000
Content-Type: text/plain

Hi,

with recent oe-core + oe-meta, a build from scratch fails in eglibc
with:

| .../tmp/sysroots/x86_64-oe-linux/usr/bin/armv5te-linux-gnueabi/arm-linux-gnueabi-ld.bfd: cannot find -lgcc_eh
| collect2: error: ld returned 1 exit status
| make[2]: *** [.../tmp/work/armv5te-linux-gnueabi/eglibc-2.15-r13+svnr19294/build-arm-linux-gnueabi/iconv/iconv_prog] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `.../tmp/work/armv5te-linux-gnueabi/eglibc-2.15-r13+svnr19294/eglibc-2_15/libc/iconv'
| make[1]: *** [iconv/others] Error 2

-lgcc_eh seems to be required because a check for -Wl,-as-needed failed.
But this test result is bogus, because check failed due to missing -lgcc_s
and not because of the linker flag.

Any idea how to solve this?



Enrico



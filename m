Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Ti255-0007mm-8f
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 13:03:31 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qBABmvEN022297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 10 Dec 2012 12:48:59 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Ti1qz-0006sH-P3; Mon, 10 Dec 2012 12:48:57 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 12:48:57 +0100
Message-ID: <lywqwqktzq.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: binutils: regression on kernel builds
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
X-List-Received-Date: Mon, 10 Dec 2012 12:03:35 -0000
Content-Type: text/plain

Hi,

with recent binutils, kernel build fails with

| arm-linux-gnueabi-ld: error: arch/arm/boot/compressed/piggy.gzip.o: unknown CPU architecture

I am able to reproduce it with

$ > /tmp/x.s
$ arm-linux-gnueabi-as  -march=armv7-a -march=all -o x0.o /tmp/x.s
$ arm-linux-gnueabi-as  -march=armv7-a  -o x1.o /tmp/x.s
$ arm-linux-gnueabi-ld.gold x0.o x1.o
arm-linux-gnueabi-ld: error: x1.o: unknown CPU architecture
$ arm-linux-gnueabi-ld.bfd x0.o x1.o
arm-linux-gnueabi-ld.bfd: warning: cannot find entry symbol _start; defaulting to 0000000000008034


(kernel sets '-Wa,-march=all' when building piggy.gzip.o)


This works fine with binutils 2.22 and when using the BFD linker.



Enrico



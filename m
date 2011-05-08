Received: from mail.fim.uni-passau.de ([132.231.1.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leitl@fim.uni-passau.de>) id 1QJCR3-0000ix-4S
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 00:26:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.fim.uni-passau.de (Postfix) with ESMTP id 70E569223D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 00:16:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.fim.uni-passau.de
Received: from mail.fim.uni-passau.de ([127.0.0.1])
	by localhost (mail.fim.uni-passau.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id B1H9QvnqZ3JR
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 00:16:20 +0200 (CEST)
Received: from darkx.localnet (p5DC74DAD.dip.t-dialin.net [93.199.77.173])
	by mail.fim.uni-passau.de (Postfix) with ESMTPSA id 28AF0921BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 00:16:19 +0200 (CEST)
From: Franz Leitl <leitl@fim.uni-passau.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 9 May 2011 00:16:46 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38.4-23-default; KDE/4.6.1; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201105090016.46391.leitl@fim.uni-passau.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Patch for fixing build issues with external kernel modules.
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
X-List-Received-Date: Sun, 08 May 2011 22:26:45 -0000
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_OZxxN5L3HXiPMit"

--Boundary-00=_OZxxN5L3HXiPMit
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I've tried to get compcache kernel module building against 2.6.34 from shr-
core but found some issues with kernel.bbclass and module.bbclass.

The kernel.bbclass deletes the .c files from scripts directory which are later 
needed by make prepare to recreate bound.h and other files. Compcache kernel 
module, for example, depends on bounds.h.
The module.bbclass finally needs to call "make prepare" and also set 
KERNEL_PATH in do_install when calling oe_runmake to get everything installed 
correctly. I also added KERNELDIR as compcache's Makefile is using it and the 
classes from classic OE had it also set.

Can someone please review the attached patch?


Regards,
Franz

--Boundary-00=_OZxxN5L3HXiPMit--

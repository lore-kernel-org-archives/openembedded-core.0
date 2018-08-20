Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 1342 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Aug 2018 14:23:58 UTC
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEB478ED9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 14:23:57 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KE1Y2U030152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 16:01:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1534773694;
	bh=AocqE4zftBk6rVqJY5n09R5ZP6oC94TLNMFNFhePTnw=; l=2507;
	h=From:To:Subject:Date;
	b=SrVvgNvOyd6hM33FHllf/XTU4YkKLuX00gCscpY72DTzIz8+JN3iiaQl9IrDGbSpI
	Arza4rxHivwOl4Ezb5SH0qtRqFWae+rDq2vEKlhL2hhcya3qe5CHn68h4mPGB6+jLP
	M+kfXyl2nlZItoe4A2v/OIITAimAJNg9nmkQdi1s=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KE1QJS010438 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 20 Aug 2018 16:01:27 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1325022C43E;
	Mon, 20 Aug 2018 16:09:25 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KE1Oot010435
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Mon, 20 Aug 2018 16:01:25 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.91) (envelope-from <ensc@sigma-chemnitz.de>) id 1frkkG-003Izr-RD
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2018 16:01:24 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 20 Aug 2018 16:01:24 +0200
Message-ID: <lywoslrvbf.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Submission of 'emit-buildvars' class?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2018 14:23:58 -0000
Content-Type: text/plain

Hello,

we are using for some time an 'emit-buildvars' class which exports
bitbake variables into makefile fragments.  This class is used for for
developing of kernel, u-boot and other low level software and for
generic packaging.

The class supports exporting images over userspace NFS and is available
at

  https://github.com/sigma-embedded/meta-de.sigma-chemnitz/blob/sumo/classes/elito-emit-buildvars.bbclass
  https://github.com/sigma-embedded/meta-de.sigma-chemnitz/tree/sumo/scripts/buildvars
  https://github.com/sigma-embedded/meta-de.sigma-chemnitz/blob/sumo/classes/elito-nfs-export.bbclass

It is much faster than 'devshell' and can be used in a scripted
environment.  A complete SDK is far too heavy weight for our tasks
and not flexible enough.

Is there common interest in such a functionality? If so, I would split
it out from our layer and submit it for core.



A more detailed description:

The generated makefile fragment contains information about the per-package
sysroot and can be used to set e.g. $PATH.  The system requires a small
Makefile to instantiate these variables; e.g. for common cases something
like

 ---- workspace/Makefile.common ---
|  # --*- makefile -*--
| WORKSPACE_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
| DEPLOY_DIR ?= ${WORKSPACE_DIR}/../build/tmp/deploy
| MACHINE ?= imx8m-var-dart
| 
| _BUILDVAR_STYLE ?= _generic_
| include ${DEPLOY_DIR}/buildvars/${MACHINE}/$R.mk
| 
| %:
| 	${MAKE} $@

is enough.  For kernel development, the makefile contains some more
information about the image which is going to be exported over NFS.

 ---- workspace/Makefile.kernel ---
| # --*- makefile -*--
| WORKSPACE_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
| DEPLOY_DIR ?= ${WORKSPACE_DIR}/../build/tmp/deploy
| MACHINE ?= imx8m-var-dart
| 
| _BUILDVAR_STYLE := kernel
| IMAGE_RECIPE = camtest-image
| 
| HAVE_NFSROOT=1
| include ${WORKSPACE_DIR}/../sources/de.sigma-chemnitz.core/mk/nfs-opt.mk
| include ${DEPLOY_DIR}/buildvars/${MACHINE}/linux-mainline.mk


Now, generate the '.mk' fragments either manually:

| $ bitbake busybox -c emit_buildvars

or enable it within the recipe (recommended when working on it)

| BUILDVARS_EMIT = "true"

and build the package.


When you try to fix something in 'busybox', extract the sources
somewhere (e.g. in workspace/) and call

| make -f ../Makefile.common R=busybox all

to build it.


Else, see the class for more details.



Enrico


Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id D6EF272658
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 10:51:58 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBNApqBb008468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 23 Dec 2014 11:51:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1419331917;
	bh=kEvmgELQd+xECXh6oXX7dtsWDwPKXux0vH74tIaKR9Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=ItsWtHJ18H0d1/uCOH3jcUPsNUwB77hLt+M32gLXGTfRzZceWkeO8ixAPN34ah7PX
	jitXci+reiqt0VKzjXvT6KBbJWUquVP5k/SrwF6pBG6IbXGPYRIXsUTfJrM5rxPN7S
	VOyU4FB0q8y4oVAphR75fWJQ/9eN5BaKoEUvsVcA=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBNAplvA029353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 23 Dec 2014 11:51:48 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y3N47-0000Xk-3D; Tue, 23 Dec 2014 11:51:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	<lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418989891.13316.10.camel@linuxfoundation.org>
	<ly7fxnon55.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418991892.13316.12.camel@linuxfoundation.org>
	<lysig715l0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1419324878.1777.5.camel@linuxfoundation.org>
Date: Tue, 23 Dec 2014 11:51:47 +0100
In-Reply-To: <1419324878.1777.5.camel@linuxfoundation.org> (Richard Purdie's
	message of "Tue, 23 Dec 2014 08:54:38 +0000")
Message-ID: <lyd27aabb0.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Tue, 23 Dec 2014 10:52:08 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > In summary, basically, yes. The kernel source is huge and we were
>> > compressing/decompressing it in several places on the critical
>> > path.  People were struggling to develop kernels using the system
>> > due to the overhead.
>> 
>> I do not see how the new system makes it easier to "develop kernels".
>
> One of the complaints I keep hearing is how long the populate_sysroot
> and package tasks take. I also get complaints about the sstate footprint
> of those tasks.

Perhaps, it should be possible to disable sstate'ing for certain recipes?
In case of the new kernel build system, you swap the expensive sstate'ing
with an expensive unpacking.


> Imagine you're doing a "bitbake virtual/kernel -c compile -f", hacking
> on a module, you then package and install it onto the target to test.

1. Are there really people who are doing such things?  There are much
   more effective ways to do kernel development with OE (you have the
   overhead from bitbake reading its database; do_compile() does not
   deploy images on TFTP server nor the modules in the NFS sysroot).

2. This usecase is not supported by the current classes:

   1. the 'bitbake virtual/kernel -c compile -f' removes .config and
      System.map from the kernel sources (else, do_compile() will fail)

   2. trying to build the module (with 'M=...')will fail because .config
      + System.map are missing in the source


>> to polluting sources with .config and related files, KBUILD_OUTPUT/VPATH
>> builds are not possible from this tree.
>
> Agreed and I'm actually not happy about this. I think going forward
> we'll need a second directory for these so we do keep the output
> separate and can recompile against it.

'cp -al' a template kernel and .config etc. into ${WORKDIR} should be
pretty fast.


Enrico


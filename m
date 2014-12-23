Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC47726D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 02:08:20 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBN28ELh030004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 23 Dec 2014 03:08:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1419300498;
	bh=HkmzasMl0bRjPcbIDnf1hsq5Z1Ba4d01vK0szsjxHUw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=kN3nZHCPipWEt9Rh72ByFU0bi59VxVHQOu6tunzFjiMg6wn89HxYM+XMgMTV88P+F
	g9p64cws7KClXs7YfqAK27gZHF49DQH3MpRDK0d4Q0GuqPAHXMwDDxoL3pcHkdqti9
	vM/Y+CuG09Feg6hxyXEROuCrUrI/HO15So0MJGDs=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBN27uQs014265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 23 Dec 2014 03:08:00 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y3Et9-0002nf-R3; Tue, 23 Dec 2014 03:07:55 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	<lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418989891.13316.10.camel@linuxfoundation.org>
	<ly7fxnon55.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418991892.13316.12.camel@linuxfoundation.org>
Date: Tue, 23 Dec 2014 03:07:55 +0100
In-Reply-To: <1418991892.13316.12.camel@linuxfoundation.org> (Richard Purdie's
	message of "Fri, 19 Dec 2014 12:24:52 +0000")
Message-ID: <lysig715l0.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 23 Dec 2014 02:08:24 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> In summary, basically, yes. The kernel source is huge and we were
> compressing/decompressing it in several places on the critical path.
> People were struggling to develop kernels using the system due to the
> overhead.

I do not see how the new system makes it easier to "develop kernels".  Due
to polluting sources with .config and related files, KBUILD_OUTPUT/VPATH
builds are not possible from this tree.

In my experience, it is also a pain to jump between the different
directories and tools like 'cscope' are not prepared of it.

And more importantly: the new system lowers end user experience
significantly because kernel messages will show absolute buildsystem
paths now; e.g.

| /srv/.oe/bld/e6ca2c38-c20d-f57f-7eca-ffc0aaa2f0bd/sysroots/kk-trizeps6/usr/src/kernel/drivers/usb/core/hub.c

vs.

| drivers/usb/core/hub.c

VPATH builds might be interesting for QA (e.g. building from same source
with different configuration) but should not be used for final builds.


> Whilst this approach does bypass some parts of the system, I do believe
> the benefits are worth it. We're talking about making the kernel build
> time about three times faster iirc,

I can not reproduce these numbers here; I get (after a '-c cleanall' and
'ccache -c'):

  | Task                         | time (old) | time (new) |
  |------------------------------+------------+------------|
  | do_bundle_initramfs          |   0.087052 |   0.034955 |
  | do_compile                   | 128.242407 | 133.723027 |
  | do_compile_kernelmodules     |  84.415655 |  83.249409 |
  | do_compile_prepare           |   2.885401 |   1.714159 |
  | do_configure                 |   6.202691 |   4.340526 |
  | do_deploy                    |  13.991785 |   14.07096 |
  | do_fetch                     |   0.210244 |   1.425304 |
  | do_generate_initramfs_source |   0.063915 |   0.041925 |
  | do_install                   |  16.190504 |    2.91906 |
  | do_package                   | 120.823374 |  16.422429 |
  | do_package_qa                |            |   2.557622 |
  | do_package_write_ipk         |   42.50694 |   29.57585 |
  | do_packagedata               |   1.612542 |   0.462001 |
  | do_patch                     |   0.186583 |   0.011232 |
  | do_populate_lic              |   0.795013 |   0.135186 |
  | do_populate_sysroot          |  10.142978 |   0.533519 |
  | do_rm_work                   |   1.762486 |   0.447187 |
  | do_rm_work_all               |   0.049144 |   0.030964 |
  | do_sizecheck                 |   0.054441 |   0.035806 |
  | do_strip                     |   0.049917 |   0.030841 |
  | do_uboot_mkimage             |   9.032543 |   12.83624 |
  | do_unpack                    |   6.695678 |   9.322173 |

  | old | 446.00129 |
  | new | 313.92038 |

Although the 'new' system is faster, this is gained mainly by the
'do_package' task which does not seem to be comparable.  The new
method will create only a very small 'kernel-dev' subpackage:

   1,1M    tmp/deploy/ipk/kk_trizeps6/kernel-dev_3.14...

vs.

    36M    tmp/deploy/ipk/kk_trizeps6/kernel-dev_3.14...

so the old task can be improved either by removing some files, or the
new task misses files.



Enrico


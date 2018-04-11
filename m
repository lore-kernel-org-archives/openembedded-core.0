Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2E64E746AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 22:37:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3BMbSmx027305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 11 Apr 2018 23:37:29 +0100
Message-ID: <1523486248.2942.236.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Apr 2018 23:37:28 +0100
In-Reply-To: <CA+chaQcyzHnOfQ5hSGbXKFOwocKObdbm98mZgxD0YMy42_2PxA@mail.gmail.com>
References: <cover.1522936224.git.akuster808@gmail.com>
	<CAJ86T=XmqNbTF+qXWhG5xFHNBUnRCaDx5DKeTQ_Y+wfqhgbiyg@mail.gmail.com>
	<CA+chaQf17H2+HKJ6V=+tGnL7xkH_ocPRj7j_hBWSG5e2AKV31w@mail.gmail.com>
	<1523023909.2942.8.camel@linuxfoundation.org>
	<CA+chaQeM2cRQZ+pHtjDQEBZZGydA8wnThTThsq-+HZmpjTkfjA@mail.gmail.com>
	<CA+chaQcyzHnOfQ5hSGbXKFOwocKObdbm98mZgxD0YMy42_2PxA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Wed, 11 Apr 2018 22:37:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-04-11 at 17:07 +0200, Martin Jansa wrote:
> I think I've found the reason why it was failing for me.
> 
> glibc is now the only component in morty release which is using
> TMPDIR/sysroots-components (normally used only after RSS):
> oe-core$ git grep "\${STAGING_DIR}-components"
> meta/recipes-core/glibc/glibc-locale.inc:LOCALETREESRC =
> "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
> meta/recipes-core/glibc/glibc-mtrace.inc:SRC = "${STAGING_DIR}-
> components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
> meta/recipes-core/glibc/glibc-package.inc:do_stash_locale[sstate-
> outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-
> locale"
> meta/recipes-core/glibc/glibc-package.inc:do_stash_locale[sstate-
> fixmedir] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-
> locale"
> meta/recipes-core/glibc/glibc-scripts.inc:SRC = "${STAGING_DIR}-
> components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
> 
> and the workspace of my jenkins jobs is still running test-
> dependencies jobs for morty, which does only selective pruning of
> TMPDIR:
> http://git.openembedded.org/openembedded-core/tree/scripts/test-depen
> dencies.sh#n165
> 
> which left TMPDIR/sysroots-components files from
> qlibc.do_stash_locale behind and when next build started in the same
> workspace it failed, because it was trying to overwrite files already
> there.
> 
> Every time I wiped whole TMPDIR and restarted the jobs it worked for
> a while and then it got broken again during first test-dependencies
> job in each workspace.
> 
> I can obviously change test-dependencies.sh to
> delete TMPDIR/sysroots-components as well and I'll send update for it
> after a bit more testing.
> 
> Ross's oe-core/scripts/wipe-sysroot and maybe some other
> scripts/tools need similar fix as well.

This starts to make more sense now, thanks for looking into it. We
could change this in morty to use sysroots, that should be safe...

Cheers,

Richard


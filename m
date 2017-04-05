Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 026A073002
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 11:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v35BPuIJ025686; 
	Wed, 5 Apr 2017 12:25:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tmoIh12xtBCh; Wed,  5 Apr 2017 12:25:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v35BM0Ch025602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Apr 2017 12:22:02 +0100
Message-ID: <1491391320.17200.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nathan Rossi <nathan@nathanrossi.com>, Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 05 Apr 2017 12:22:00 +0100
In-Reply-To: <CA+aJhH1JjWONYpOFi8S4QsDzUdfoPSJS_0FZf=5dQTm-O_4wEQ@mail.gmail.com>
References: <cover.1490850708.git.Qi.Chen@windriver.com>
	<d6b2737e706f743644df63f21a8f061b9e2f83c7.1490850708.git.Qi.Chen@windriver.com>
	<CA+aJhH1JjWONYpOFi8S4QsDzUdfoPSJS_0FZf=5dQTm-O_4wEQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.inc/qemu.inc: preserve directories to be used by runqemu
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
X-List-Received-Date: Wed, 05 Apr 2017 11:25:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 20:06 +1000, Nathan Rossi wrote:
> On 30 March 2017 at 15:12, Chen Qi <Qi.Chen@windriver.com> wrote:
> > 
> > The 'recipe-sysroot' and 'recipe-sysroot-native' directories need
> > to
> > be preserved for runqemu to work correctly. Otherwise, when
> > 'rm_work'
> > is enabled, these directories are removed, thus causing errors when
> > using runqemu .
> > 
> > [YOCTO #11266]
> > [YOCTO #11193]
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/classes/image.bbclass         | 1 +
> >  meta/conf/machine/include/qemu.inc | 3 +++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/meta/classes/image.bbclass
> > b/meta/classes/image.bbclass
> > index 405fd73..cac3a5f 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -8,6 +8,7 @@ inherit ${SDKEXTCLASS}
> >  TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
> >  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY +=
> > "${PACKAGE_INSTALL_ATTEMPTONLY}"
> >  POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks;
> > "
> > +RM_WORK_EXCLUDE_ITEMS_append = " ${IMAGE_RM_WORK_EXCLUDE_ITEMS}"
> > 
> >  LICENSE = "MIT"
> >  PACKAGES = ""
> > diff --git a/meta/conf/machine/include/qemu.inc
> > b/meta/conf/machine/include/qemu.inc
> > index 0e4103b..8345c08 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -29,3 +29,6 @@ KERNEL_FEATURES_append_pn-linux-yocto = "
> > features/nfsd/nfsd-enable.scc"
> >  MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
> > 
> >  IMAGE_CLASSES += "qemuboot"
> > +
> > +# These two directories need to be preserved for runqemu to work
> > well
> > +IMAGE_RM_WORK_EXCLUDE_ITEMS = "recipe-sysroot recipe-sysroot-
> > native"
> Should this be setup by qemuboot.bbclass instead, so that it applies
> to any image/machine (even those that do not use qemu.inc) that is
> intended to be used by runqemu?

I'm trying to decide what the best approach here is. I'm thinking it
might be better to:

a) make qemu builds depend on qemu-helper-native
b) make that preserve its native sysroot (not the target one).
c) have runqemu look at qemu-helper-native

I think that should solve problems and work better than the above?

Cheers,

Richard


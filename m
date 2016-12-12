Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 868BF719E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 20:51:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBCKpD9h018708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Dec 2016 12:51:13 -0800 (PST)
Received: from tal.localnet (128.224.21.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Dec 2016 12:51:13 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Dec 2016 15:51:12 -0500
Message-ID: <3629007.TMJVuC0a6H@tal>
Organization: Wind River 
User-Agent: KMail/5.1.3 (Linux/4.4.0-47-generic; KDE/5.18.0; x86_64; ; )
In-Reply-To: <FE42CCA4-D2B8-4AE1-83E5-5CBE94FA160C@gmail.com>
References: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
	<FE42CCA4-D2B8-4AE1-83E5-5CBE94FA160C@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: disable 'libdir' QA check
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
X-List-Received-Date: Mon, 12 Dec 2016 20:51:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, December 12, 2016 11:59:04 AM EST Khem Raj wrote:
> > On Dec 12, 2016, at 11:36 AM, Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> > 
> > When building systemd with multilib support enabled in your build you
> > will get the following QA warnings (if the 'libdir' QA check is
> > enabled.)
> > 
> > WARNING: systemd-1_232-r0 do_package_qa: QA Issue: systemd-dbg: found \
> > library in wrong location: /lib/systemd/.debug/libsystemd-shared-232.so
> > systemd: found library in wrong location:
> > /lib/systemd/libsystemd-shared.so
> > systemd: found library in wrong location:
> > /lib/systemd/libsystemd-shared-232.so [libdir]
> Can we check if systemd can be a bit more flexible and accept it to go into
> multilib libdir ? this patch can be then applied if its not acceptable to
> systemd community.

I think the discussion I pointed to in the commit log closes the door on any 
such change. Specific the comment from Lennart --
https://github.com/systemd/systemd/issues/3810#issuecomment-235290526

They don't want the library to be found in the default search path, they want 
to maintain this as a "hidden, internal resource".

Being on the record that I am aware of this discussion/conclusion if I send a 
patch now I would look like a bit of ass for wasting their time. If someone 
else wants to push the issue, feel free. Unless there is a suitable 
recommendation that would satisfy their wishes and ours that I am missing.

Mark


> > Since systemd 231 upstream has included an 'internal' library which
> > they explicitly place in the application specific /lib/systemd
> > directory. You can see some of the discussion about this placement
> > here https://github.com/systemd/systemd/issues/3810
> > 
> > This placement is being picked up by the QA checker since when
> > multilibs are enabled it expects all libraries to be in lib32 or
> > lib64. Since the systemd and systemd-dbg packages don't contain any
> > other libraries we can respect the upstream placement and skip this QA
> > check for these packages. Unfortunately the QA mechanism doesn't allow
> > us to specify individual files so this approach is the best we can do.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > meta/recipes-core/systemd/systemd_232.bb | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_232.bb
> > b/meta/recipes-core/systemd/systemd_232.bb index baee02e..c86badb 100644
> > --- a/meta/recipes-core/systemd/systemd_232.bb
> > +++ b/meta/recipes-core/systemd/systemd_232.bb
> > @@ -485,7 +485,8 @@ RRECOMMENDS_${PN} +=
> > "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-genera> 
> >                       os-release \
> > 
> > "
> > 
> > -INSANE_SKIP_${PN} += "dev-so"
> > +INSANE_SKIP_${PN} += "dev-so libdir"
> > +INSANE_SKIP_${PN}-dbg += "libdir"
> > INSANE_SKIP_${PN}-doc += " libdir"
> > 
> > PACKAGES =+ "udev udev-hwdb"




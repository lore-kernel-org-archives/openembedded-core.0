Return-Path: <mattias.hansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC777D419
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 11:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 593F5183B6;
	Tue, 15 Oct 2019 13:45:52 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id FrdIBAWnyyPd; Tue, 15 Oct 2019 13:45:51 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 91C06183B0;
	Tue, 15 Oct 2019 13:45:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF2F1E076;
	Tue, 15 Oct 2019 13:45:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70FA01E075;
	Tue, 15 Oct 2019 13:45:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 15 Oct 2019 13:45:51 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 646E71230;
	Tue, 15 Oct 2019 13:45:51 +0200 (CEST)
Received: from lnxmattihn2.wired.se.axis.com (10.0.5.60) by XBOX04.axis.com
	(10.0.5.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 15 Oct 2019 13:45:51 +0200
Date: Tue, 15 Oct 2019 13:45:50 +0200
From: Mattias Hansson <mattias.hansson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191015114550.hj3yvjwmxviwbed2@lnxmattihn2.wired.se.axis.com>
References: <20191015080015.1574-1-mattihn@axis.com>
	<1d2a14032ca81a0e9acee21ba66c8e4cb7d5c950.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1d2a14032ca81a0e9acee21ba66c8e4cb7d5c950.camel@linuxfoundation.org>
User-Agent: NeoMutt/20180716
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX04.axis.com (10.0.5.18)
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Tue, 15 Oct 2019 11:45:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 15, 2019 at 10:27:27AM +0200, Richard Purdie wrote:
> On Tue, 2019-10-15 at 10:00 +0200, Mattias Hansson wrote:
> > do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
> > However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
> > which sometimes causes a build error when building a recipe that adds
> > groups.
> > 
> > This issue only occurs when executing do_prepare_recipe_sysroot for a
> > recipe that adds groups before finishing a task that depends on pseudo
> > for a recipe that doesn't add groups.
> > 
> > Signed-off-by: Mattias Hansson <mattihn@axis.com>
> > ---
> >  meta/classes/base.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index d3184ecf7b..1cea3a2213 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -482,6 +482,7 @@ python () {
> >      # If we're building a target package we need to use fakeroot (pseudo)
> >      # in order to capture permissions, owners, groups and special files
> >      if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> > +        d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
> >          d.setVarFlag('do_unpack', 'umask', '022')
> >          d.setVarFlag('do_configure', 'umask', '022')
> >          d.setVarFlag('do_compile', 'umask', '022')
> 
> This was posted once already and the answer is still no, we do not want
> to add pseudo as a dependency for all sysroot construction. IO under
> pseudo is much slower and this is a very IO intensive task so it would
> hurt performance and isn't necessary in most cases.
> 
> I appreciate its harder but we need to find a better more targeted way
> to solve this and some of the other related pseudo issues for inter
> dependent user/groups.
> 
> Cheers,
> 
> RIchard
> 

Sorry for the confusion, but this is a different patch. The previous
forced do_prepare_recipe_sysroot to run in a fakerooted environment.
This caused a performance degrade and was therefore rejected, if I
understood you correctly.

This patch will only declare fakeroot-native as a dependency and only
cause pseudo to be available during do_prepare_recipe_sysroot. This
should not cause the task to run in a fakerooted environment, is this a
valid assumption?

/Mattias


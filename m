Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9335ECDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:34:00 +0000 (UTC)
Received: from smarthost01c.sbp.mail.zen.net.uk (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by mx.groups.io with SMTP id smtpd.web10.26496.1697718834136690077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=J9+5Uct3;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.5, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1qtSDn-00294L-TP;
	Thu, 19 Oct 2023 12:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:CC:Content-ID:
	Content-Description; bh=LQvEmkw7JrRIUTwB3Ry79dPYAWnMvqfQdIemB6uhR7Y=; b=J9+5U
	ct3mfISQJO1QJqw3QFJogqb3aMQoC4C1LxbOrkKjyb8V+LbK4+s8fEzFpACljxWdh/0McpKFmbo5N
	+M/J2bqHIVo0AkFUKwHVJ+3yuLjrFPZeXs9X25VOESxteWEZPS+LADU2lt5ZkUMHXqMdCkcfZCHaZ
	2opXqz5lugnaxWd7ZUlKancdTky5EMQEjFDz208Gro4xuLlqpc2BP8JpCcS3DPygzPuUjrJ0gRyIO
	WIOK3VbZb+DPy/Ra+/3iV2L6zU5U+s+iosqukvmyOdoLVJzOSXD+2ohSp1L7uspMviSxIM1plUM/t
	OVRcvLMrwCrr8sPUQ5zlnyCiZt9NQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qtSDn-00AVnQ-25;
	Thu, 19 Oct 2023 13:33:51 +0100
Date: Thu, 19 Oct 2023 13:33:51 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Julien Stephan <jstephan@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Using devtool without an absolute path to the
 workspace in bblayers.conf
Message-ID: <ZTEiL700jPSsMuwA@mcrowe.com>
References: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
 <CAEHHSvYNpGQAE_jG2u__z9k3RrRLe2oeqXpb-bhZtrK-hG1srQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvYNpGQAE_jG2u__z9k3RrRLe2oeqXpb-bhZtrK-hG1srQ@mail.gmail.com>
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189452

On Wednesday 18 October 2023 at 17:47:50 +0200, Julien Stephan wrote:
> Le mer. 18 oct. 2023 � 16:29, Mike Crowe via lists.openembedded.org
> <mac=mcrowe.com@lists.openembedded.org> a �crit :
> >
> > I'm trying to work out how we can make use of devtool to make our lives
> > easier during development. In general it seems to work very well, but the
> > way that it modifies bblayers.conf to add an absolute path to the workspace
> > directory to BBLAYERS is incompatible with that file being held in a Git
> > repository and shared by multiple users in multiple trees. There's a high
> > risk that the file will accidentally be committed containing a path that's
> > only meaningful for a single user in a single source tree. All of our other
> > paths in bblayers.conf are relative to a variable that contains the path to
> > the top of the source tree.
> 
> Hi Mike,
> 
> I think it is a bad idea to version files under the build directory.

Hi Julien,

We don't version all files under the build directory, just ones that
control the configuration that we want to share. We've been using OE that
way for about twelve years now and this is the first time we've run into a
problem. That might at least partly be because we haven't taken advantage
of newer features like devtool though! We mostly avoided devtool by putting
the sources that we modify heavily in submodules and used
externalsrc.bbclass (with some local progressively-less-hacky modifications
that I should try to upstream sometime.)

> Maybe you have a specific use case that you can address in a different way?
> You need to share bblayers.conf, I can see 2 options here:
> - either you want your co-workers to fetch it only once, when setting
> up their source tree
> - or you need to frequently modify bblayer.conf because you are adding
> or removing layers and want your coworkers to be up-to date
> 
> In the first case, TEMPLATECONF is the way to go! More information
> here;
> https://docs.yoctoproject.org/ref-manual/variables.html#term-TEMPLATECONF

We do need to modify bblayers.conf from time to time to add and remove
layers.

Using templates might be possible, but it would appear that this would
force developers to manually incorporate changes (or just wipe their
bblayers.conf file) when the template changes. Just keeping bblayers.conf
under version control doesn't suffer from that problem.

> In the second scenario, if this is something you *really* need, maybe
> you can switch to some other tools such as 'kas'
> (https://kas.readthedocs.io/en/latest/)  that should be useful here.

I have looked at kas in the past (and listened to podcasts about it), but
it seemed to solve a different set of problems. I will look at it again.

Thanks for the suggestions.

Mike


Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 434 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Jun 2014 08:37:04 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8F26ABDA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 08:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4B6961812C;
	Wed,  4 Jun 2014 10:29:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id FAUCuBC0RT1Z; Wed,  4 Jun 2014 10:29:44 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 10CC118099;
	Wed,  4 Jun 2014 10:29:44 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id EE2C9C89;
	Wed,  4 Jun 2014 10:29:43 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id E30D9B30;
	Wed,  4 Jun 2014 10:29:43 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id E0BE534005;
	Wed,  4 Jun 2014 10:29:43 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Wed, 4 Jun 2014 10:29:43 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id A588A9C739; 
	Wed,  4 Jun 2014 10:29:43 +0200 (CEST)
Date: Wed, 4 Jun 2014 10:29:43 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20140604082943.GA11527@axis.com>
References: <538ED39B.2090204@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <538ED39B.2090204@dresearch-fe.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ^{} what is it good for? (bitbake problem)
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
X-List-Received-Date: Wed, 04 Jun 2014 08:37:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14-06-04 10:06 +0200, Steffen Sledz wrote:
> So what is this ^{} which comes from lib/bb/fetch2/git.py good for?
> Or is this a remnant from a typo?

From git-rev-parse(1):

  <rev>^{}, e.g. v0.99.8^{}
      A suffix ^ followed by an empty brace pair means the object could be a
      tag, and dereference the tag recursively until a non-tag object is
      found.

Without this change, (some?) tag references would end up not
being considered to be on the requested branch by bitbake (by
default, master), as the tag objects themselves are not. The tags
therefore have to be resolved to a reference to a commit.

Given the description in git-rev-parse(1), it surprises me that
it doesn't work for some cases. I think it has to do with the tag
being annotated or not.

-- 
olofjn


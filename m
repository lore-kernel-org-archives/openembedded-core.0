Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TTzJt-0004Cd-UQ
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 19:16:46 +0100
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id C681521369;
	Thu,  1 Nov 2012 11:03:07 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org,
	Mark Hatle <mark.hatle@windriver.com>
Date: Thu,  1 Nov 2012 11:02:58 -0700
Message-Id: <1351792979-6672-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Nov 2012 18:16:46 -0000

We hit a problem trying to exclude L/GPLv3 recipes where
INCOMPATIBLE_LICENSE could only match exactly one license.  The older
wildcard syntax had been broken by a more recent SPDX change
(specifying a string without a SPDXLICENSEMAP entry could crash), so
"*GPLv3" wouldn't work.

This fixes that, and extends INCOMPATIBLE_LICENSE to handle a
whitespace-separated list of license strings to exclude (e.g "GPLv3
LGPLv3").  This is compatible with existing usage because the LICENSE
parsing is already done on whitespace: a pre-existing
INCOMPATIBLE_LICENSE value with whitespace could not have matched
anything in practice.

All other behavior should be unaffected.  Note specifically that the
LGPLv2_WHITELIST_${license} variables are used as whitelists for all
licenses (i.e. identically to WHITELIST_... and
HOSTTOOLS_WHITELIST_...).  That sounds wrong, but seems to have been
the preexisting behavior.  Ideas?

Andy




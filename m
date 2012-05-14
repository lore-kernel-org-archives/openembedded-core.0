Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1STlAD-0006YW-2b
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 04:37:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4E2RX0a002138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 19:27:33 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (172.25.32.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 13 May 2012 19:27:32 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 May 2012 21:28:20 -0500
Message-ID: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/2] RFC - CCACHE_DIR to not impact sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2012 02:37:33 -0000
Content-Type: text/plain

I am not exactly sure how to fix this, so I thought I might ask in the
form of a working patch.  The problem is that I want to use an
external CCACHE_DIR on some build servers, but use the defaults on
others.  Ultimately the sstate sums should be the same in either case,
but they are not due to the way that bitbake tracks the "export"
variables for inclusion i the sum dependencies.  My example test is to
simply set CCACHE_DIR = "/tmp/ccache" in the local.conf and recompile
the quilt-native package.

I ended up adding another check to the dependency generator because
simply trying to use "unexport" had undesired effects.  If there is a
better or correct way of fixing this such that CCACHE_DIR will not
impact the sstate sum, I would really like to know how to do this. :-)

Thanks,
Jason.




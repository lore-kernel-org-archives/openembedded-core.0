Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U7xd7-0004DC-BM
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 01:34:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K0HcJA011601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 16:17:38 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 16:17:37 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 18:47:30 -0600
Message-ID: <1361321252-14982-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Remove wildcard from SRC_URI
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
X-List-Received-Date: Wed, 20 Feb 2013 00:34:16 -0000
Content-Type: text/plain

This patch set removes the wild cards from the SRC_URI of both libpam
and the man recipes.

When FILESEXTRAPATHS is used in a bbappend file to add extra search paths,
bitbake's fetch2 unpack() doesn't properly handle a wildcard when used
in the SRC_URI field of the original recipe's bb file.

We can unpack failures, I've even seen a report of a fetch failure.  We
resolve this by avoiding wild cards in SRC_URI!

I have verified that both before and after the change, the contents of the
source code and other components in these recipes are the same.

I suggest that we make wildcards in the SRC_URI field illegal, either via
a sanity check or within bitbake itself.




Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4809D6B8D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:57:09 +0000 (UTC)
Received: from sestows930 (172.16.140.39) by smtp.enea.com (172.21.1.209) with
	Microsoft SMTP Server id 14.3.158.1; Mon, 24 Mar 2014 16:57:06 +0100
Received: by sestows930 (Postfix, from userid 1000)	id 706351801D1; Mon, 24
	Mar 2014 16:57:06 +0100 (CET)
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 16:56:04 +0100
Message-ID: <1395676565-14427-1-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Cc: Josep Puigdemont <josep.puigdemont@enea.com>
Subject: [PATCH] Fix "tar: .: file changed as we read it" with cpio+tar builds enabled
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
X-List-Received-Date: Mon, 24 Mar 2014 15:57:12 -0000
Content-Type: text/plain

Hi,

This patch solves a problem we have been seeing when building both a .tar(.gz)
and .cpio(.gz) image, where the cpio job creates a file in the rootfs
directory. This event may happen while tar is running, which makes tar exit
indicating an error and thus aborting the build.

The only potential problem with the patch that I can think of is whether or not
cpio in the build host support -A and -F. I've checked the GNU cpio git repo,
and the arguments have been there since they started using git in 2004, which
means that this should not be a problem.

Regards,
/Jonas

Jonas Eriksson (1):
  cpio rootfs build: Avoid modifying rootfs dir

 meta/classes/image_types.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
1.9.0



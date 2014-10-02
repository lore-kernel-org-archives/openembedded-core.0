Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D24186FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:48:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s92EmUNI016975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 07:48:30 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 2 Oct 2014 07:48:29 -0700
Message-ID: <542D65BD.1000904@windriver.com>
Date: Thu, 2 Oct 2014 09:48:29 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Bash security vulnerabilities - Question for master
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
X-List-Received-Date: Thu, 02 Oct 2014 14:48:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

With the recent vulnerabilities, a bunch of patches are being sent up to the 
list.  The content is generally fine, but I'm wondering if for master we should 
apply all of the official bash patches to get to the latest patch version, 
instead of applying various 'security' fixes that may or may not be the official 
version.

For instance, bash_4.3:

SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
[followed by a bunch of local patches]
"

ncftp .../bash/bash-4.3-patches > ls
bash43-001        bash43-004.sig    bash43-008        bash43-011.sig 
bash43-015        bash43-018.sig    bash43-022        bash43-025.sig
bash43-001.sig    bash43-005        bash43-008.sig    bash43-012 
bash43-015.sig    bash43-019        bash43-022.sig    bash43-026
bash43-002        bash43-005.sig    bash43-009        bash43-012.sig 
bash43-016        bash43-019.sig    bash43-023        bash43-026.sig
bash43-002.sig    bash43-006        bash43-009.sig    bash43-013 
bash43-016.sig    bash43-020        bash43-023.sig    bash43-027
bash43-003        bash43-006.sig    bash43-010        bash43-013.sig 
bash43-017        bash43-020.sig    bash43-024        bash43-027.sig
bash43-003.sig    bash43-007        bash43-010.sig    bash43-014 
bash43-017.sig    bash43-021        bash43-024.sig    bash43-028
bash43-004        bash43-007.sig    bash43-011        bash43-014.sig 
bash43-018        bash43-021.sig    bash43-025        bash43-028.sig

The community has 28 patches for various bugs (and these security issues) 
posted.  Would it make sense to update to bash 4.3 (28)?

In our bash 3.2.48:

SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
 
${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 
\
 
${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002 
\
 
${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003 
\
...
"

Some of the upstream items are applied, but I'm wondering if we should extend 
that to patch level 55 (the latest) in the same way.

Both patch level 4.3 - 28 and 3.2.48 - 55 will apply all of the fixes that keep 
getting submitted plus a set of other general bugs.  It will also make it easier 
for security scanners to simply check the version and know the right fixes have 
been applied.

(Note, there will be at least one more patch coming out that fixes a few more 
defects according to the mailing lists.  I expect it today or tomorrow.)

--Mark


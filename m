Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U6uAg-0005vE-26
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 03:40:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1H2NxQw027714
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 18:23:59 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sat, 16 Feb 2013 18:23:56 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 20:23:51 -0600
Message-ID: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/3] Pseudo performance changes...
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
X-List-Received-Date: Sun, 17 Feb 2013 02:40:24 -0000
Content-Type: text/plain

Unlike most of my submissions, this isn't patches against oe-core; rather,
it's patches against pseudo, and if I can get some confirmation that they do
what I think they do, and some review, I'm planning to make this into
pseudo 1.5, and send a patch "soonish" to merge that into oe-core.

What this does: Fix a number of build performance issues. By far the
largest change is actually not so much a problem with pseudo as a problem
that pseudo can solve by brute force. Packaging systems (at least RPM and
SMART) do a lot of fsync() and fdatasync() calls. That usually implies
flushing EVERYTHING that's been written, not just one specific file. And
that, in turn, results in a severe performance hit.

So, for instance, on one of my test workstations, this moves a do_rootfs
with about 1200 RPMs from about 22 minutes to about 4.5. Yeah.

The other changes aren't as dramatic for that case, but have very significant
performance impact for at least some workloads. The first is switching to
using an in-memory database for the files database, dumping it to disk only
when the pseudo daemon is idle or shutting down. This doesn't produce huge
benefits in all cases, but for workloads with a lot of parallelism, it can
produce a very noticeable reduction in how much pseudo slows things down.

The second is a fairly major protocol change. In short, with this patch,
pseudo clients only wait for a server response when they need information
from the server in order to continue. That's OP_FSTAT, OP_STAT,
OP_MAY_UNLINK, and OP_MKNOD. Everything else just silently assumes that
it probably succeeded.

How much does this matter? Between the protocol change and the memory
DB, a trivial unpack of a tarball (lots of writes to the database, very
few reads) can be about 4x faster. Removing stuff isn't much faster, but
it might be a bit faster.

This is most noticeable, by far, when running more than one build, or
when running builds while doing other things. It has a much smaller effect
on builds with no shared state (compile time still dominates that), but
even there I'm seeing decreases from ~83 minutes to ~64 from just the
fsync and memory changes. Still waiting on my real test case (multiple
simultaneous builds which need compiles) completing.

Peter Seebach (3):
  Use in-memory database for files
  allow pseudo to force asynchronous behavior
  If you don't want the answer, don't ask the question.

 ChangeLog.txt                     |   10 ++++
 Makefile.in                       |    6 +-
 configure                         |   51 ++++++++++++++++
 enums/msg_type.in                 |    1 +
 enums/op.in                       |   46 +++++++-------
 enums/query_type.in               |   18 +++---
 guts/COPYRIGHT                    |    2 +-
 maketables                        |   41 +++++++------
 makewrappers                      |   13 +++-
 ports/darwin/guts/open.c          |    5 +-
 ports/linux/guts/openat.c         |   21 ++++++-
 ports/unix/guts/fchmod.c          |   16 ++---
 ports/unix/guts/fchmodat.c        |   31 ++++++----
 ports/unix/guts/fchown.c          |   16 ++---
 ports/unix/guts/fchownat.c        |   16 ++---
 ports/unix/guts/fdatasync.c       |   16 +++++
 ports/unix/guts/fsync.c           |   16 +++++
 ports/unix/guts/mknodat.c         |    4 +-
 ports/unix/guts/msync.c           |   16 +++++
 ports/unix/guts/sync.c            |   16 +++++
 ports/unix/guts/sync_file_range.c |   13 ++++
 ports/unix/guts/syncfs.c          |   13 ++++
 ports/unix/wrapfuncs.in           |    9 +++
 pseudo.c                          |    3 +-
 pseudo_client.c                   |   22 ++++---
 pseudo_db.c                       |  119 ++++++++++++++++++++++++++++++++++++-
 pseudo_db.h                       |    1 +
 pseudo_server.c                   |   32 ++++++----
 templates/wrapfuncs.c             |    2 +
 29 files changed, 453 insertions(+), 122 deletions(-)
 create mode 100644 ports/unix/guts/fdatasync.c
 create mode 100644 ports/unix/guts/fsync.c
 create mode 100644 ports/unix/guts/msync.c
 create mode 100644 ports/unix/guts/sync.c
 create mode 100644 ports/unix/guts/sync_file_range.c
 create mode 100644 ports/unix/guts/syncfs.c

-- 
1.7.9.5




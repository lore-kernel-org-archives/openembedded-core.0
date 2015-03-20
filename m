Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EE6AB738F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 17:08:04 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 18:08:05 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 8EAF42800CB;
	Fri, 20 Mar 2015 18:08:05 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 18:07:58 +0100
Message-ID: <1426871278-51418-4-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426871278-51418-1-git-send-email-maxin.john@enea.com>
References: <1426871278-51418-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 3/3] stress: add new package
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
X-List-Received-Date: Fri, 20 Mar 2015 17:08:05 -0000
Content-Type: text/plain

Deliberately simple workload generator for POSIX systems. It imposes
a configurable amount of CPU, memory, I/O, and disk stress on the system.

Moving the package from meta-linaro as a dependency for rt-tests ptest

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-extended/stress/files/texinfo.patch | 79 ++++++++++++++++++++++++
 meta/recipes-extended/stress/stress_1.0.4.bb     | 14 +++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/stress/files/texinfo.patch
 create mode 100644 meta/recipes-extended/stress/stress_1.0.4.bb

diff --git a/meta/recipes-extended/stress/files/texinfo.patch b/meta/recipes-extended/stress/files/texinfo.patch
new file mode 100644
index 0000000..5ac5951
--- /dev/null
+++ b/meta/recipes-extended/stress/files/texinfo.patch
@@ -0,0 +1,79 @@
+--- a/doc/stress.texi
++++ b/doc/stress.texi
+@@ -62,47 +62,47 @@
+ 
+ @table @samp
+ @item -?
+-@itemx --help
++@item --help
+ Show help information.
+ 
+-@itemx --version
++@item --version
+ Show version information.
+ 
+ @item -v
+-@itemx --verbose
++@item --verbose
+ Turn up verbosity.
+ 
+ @item -q
+-@itemx --quiet
++@item --quiet
+ Turn down verbosity.
+ 
+ @item -n
+-@itemx --dry-run
++@item --dry-run
+ Show what would have been done.
+ 
+ @item -t @var{secs}
+-@itemx --timeout @var{secs}
++@item --timeout @var{secs}
+ Time out after @var{secs} seconds.
+ 
+-@itemx --backoff @var{usecs}
++@item --backoff @var{usecs}
+ Wait for factor of @var{usecs} microseconds before starting work.
+ 
+ @item -c @var{forks}
+-@itemx --cpu @var{forks}
++@item --cpu @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{sqrt()}.
+ 
+ @item -i @var{forks}
+-@itemx --io @var{forks}
++@item --io @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{sync()}.
+ 
+ @item -m @var{forks}
+-@itemx --vm @var{forks}
++@item --vm @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{malloc()}.
+ 
+-@itemx --vm-bytes @var{bytes}
++@item --vm-bytes @var{bytes}
+ Allocate @var{bytes} number of bytes.  The default is 1.
+ 
+-@itemx --vm-hang
++@item --vm-hang
+ Instruct each vm hog process to go to sleep after allocating memory.  This
+ contrasts with their normal behavior, which is to free the memory and
+ reallocate @emph{ad infinitum}.  This is useful for simulating low memory
+@@ -114,13 +114,13 @@
+ @end example
+ 
+ @item -d @var{forks}
+-@itemx --hdd @var{forks}
++@item --hdd @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{write()}.
+ 
+-@itemx --hdd-bytes @var{bytes}
++@item --hdd-bytes @var{bytes}
+ Write @var{bytes} number of bytes.  The default is 1GB.
+ 
+-@itemx --hdd-noclean
++@item --hdd-noclean
+ Do not unlink file(s) to which random ASCII data is written.
+ 
+ @end table
diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
new file mode 100644
index 0000000..44f2fc6
--- /dev/null
+++ b/meta/recipes-extended/stress/stress_1.0.4.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
+imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
+HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/stress/stress-${PV}.tar.gz/a607afa695a511765b40993a64c6e2f4/stress-${PV}.tar.gz \
+           file://texinfo.patch \
+           "
+
+SRC_URI[md5sum] = "a607afa695a511765b40993a64c6e2f4"
+SRC_URI[sha256sum] = "369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25dace465c582163c0"
+
+inherit autotools
-- 
1.9.1



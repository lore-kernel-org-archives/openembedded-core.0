Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21CC961896
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 22:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 023Mughk013027
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Mar 2020 14:56:42 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 3 Mar 2020 14:56:41 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Mar 2020 14:56:41 -0800
Message-ID: <20200303225641.55243-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/1] blktrace: modify two scripts for python3
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
X-List-Received-Date: Tue, 03 Mar 2020 22:56:41 -0000
Content-Type: text/plain

Backport from git.kernel.dk.  Changed shebangs to use python3.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../blktrace/make-btt-scripts-python3-ready.patch  | 197 +++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch b/meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch
new file mode 100644
index 0000000..3b0c1c6
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch
@@ -0,0 +1,197 @@
+From 70d5ca2d5f3d6b97c11c641b7e0c5836983219a0 Mon Sep 17 00:00:00 2001
+From: Eric Sandeen <sandeen@redhat.com>
+Date: Wed, 28 Mar 2018 15:26:36 -0500
+Subject: [oe-core][PATCH 1/1] make btt scripts python3-ready
+
+Many distributions are moving to python3 by default.  Here's
+an attempt to make the python scripts in blktrace python3-ready.
+
+Most of this was done with automated tools.  I hand fixed some
+space-vs tab issues, and cast an array index to integer.  It
+passes rudimentary testing when run under python2.7 as well
+as python3.
+
+This doesn't do anything with the shebangs, it leaves them both
+invoking whatever "env python" coughs up on the system.
+
+Signed-off-by: Eric Sandeen <sandeen@redhat.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+
+Unchanged except to modify shebangs to use python3 since
+oe-core does not support python2 anymore.
+
+Upstream-Status: Backport [git://git.kernel.dk/blktrace.git commit 70d5ca2d5...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ btt/bno_plot.py | 28 +++++++++++++++-------------
+ btt/btt_plot.py | 22 +++++++++++++---------
+ 2 files changed, 28 insertions(+), 22 deletions(-)
+
+--- git.orig/btt/bno_plot.py
++++ git/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+@@ -38,6 +38,8 @@ automatically push the keys under the gr
+ To exit the plotter, enter 'quit' or ^D at the 'gnuplot> ' prompt.
+ """
+ 
++from __future__ import absolute_import
++from __future__ import print_function
+ import getopt, glob, os, sys, tempfile
+ 
+ verbose	= 0
+@@ -60,14 +62,14 @@ def parse_args(in_args):
+ 
+ 	try:
+ 		(opts, args) = getopt.getopt(in_args, s_opts, l_opts)
+-	except getopt.error, msg:
+-		print >>sys.stderr, msg
+-		print >>sys.stderr, __doc__
++	except getopt.error as msg:
++		print(msg, file=sys.stderr)
++		print(__doc__, file=sys.stderr)
+ 		sys.exit(1)
+ 
+ 	for (o, a) in opts:
+ 		if o in ('-h', '--help'):
+-			print __doc__
++			print(__doc__)
+ 			sys.exit(0)
+ 		elif o in ('-v', '--verbose'):
+ 			verbose += 1
+@@ -84,10 +86,10 @@ if __name__ == '__main__':
+ 	(bnos, keys_below) = parse_args(sys.argv[1:])
+ 
+ 	if verbose:
+-		print 'Using files:',
+-		for bno in bnos: print bno,
+-		if keys_below:	print '\nKeys are to be placed below graph'
+-		else:		print ''
++		print('Using files:', end=' ')
++		for bno in bnos: print(bno, end=' ')
++		if keys_below:	print('\nKeys are to be placed below graph')
++		else:		print('')
+ 
+ 	tmpdir = tempfile.mktemp()
+ 	os.mkdir(tmpdir)
+@@ -99,7 +101,7 @@ if __name__ == '__main__':
+ 		fo = open(t, 'w')
+ 		for line in open(f, 'r'):
+ 			fld = line.split(None)
+-			print >>fo, fld[0], fld[1], int(fld[2])-int(fld[1])
++			print(fld[0], fld[1], int(fld[2])-int(fld[1]), file=fo)
+ 		fo.close()
+ 
+ 		t = t[t.rfind('/')+1:]
+@@ -107,16 +109,16 @@ if __name__ == '__main__':
+ 		else:                plot_cmd = "%s,'%s'" % (plot_cmd, t)
+ 
+ 	fo = open('%s/plot.cmds' % tmpdir, 'w')
+-	print >>fo, cmds
+-	if len(bnos) > 10 or keys_below: print >>fo, 'set key below'
+-	print >>fo, plot_cmd
++	print(cmds, file=fo)
++	if len(bnos) > 10 or keys_below: print('set key below', file=fo)
++	print(plot_cmd, file=fo)
+ 	fo.close()
+ 
+ 	pid = os.fork()
+ 	if pid == 0:
+ 		cmd = 'gnuplot %s/plot.cmds -' % tmpdir
+ 
+-		if verbose: print 'Executing %s' % cmd
++		if verbose: print('Executing %s' % cmd)
+ 
+ 		os.chdir(tmpdir)
+ 		os.system(cmd)
+--- git.orig/btt/btt_plot.py
++++ git/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
+@@ -55,6 +55,10 @@ Arguments:
+   but the -o (--output) and -T (--title) options will be ignored.
+ """
+ 
++from __future__ import absolute_import
++from __future__ import print_function
++import six
++from six.moves import range
+ __author__ = 'Alan D. Brunelle <alan.brunelle@hp.com>'
+ 
+ #------------------------------------------------------------------------------
+@@ -82,7 +86,7 @@ get_base 	= lambda file: file[file.find(
+ def fatal(msg):
+ 	"""Generate fatal error message and exit"""
+ 
+-	print >>sys.stderr, 'FATAL: %s' % msg
++	print('FATAL: %s' % msg, file=sys.stderr)
+ 	sys.exit(1)
+ 
+ #------------------------------------------------------------------------------
+@@ -163,7 +167,7 @@ def get_data(files):
+ 		if not os.path.exists(file):
+ 			fatal('%s not found' % file)
+ 		elif verbose:
+-			print 'Processing %s' % file
++			print('Processing %s' % file)
+ 
+ 		xs = []
+ 		ys = []
+@@ -214,8 +218,8 @@ def parse_args(args):
+ 
+ 	try:
+ 		(opts, args) = getopt.getopt(args[1:], s_opts, l_opts)
+-	except getopt.error, msg:
+-		print >>sys.stderr, msg
++	except getopt.error as msg:
++		print(msg, file=sys.stderr)
+ 		fatal(__doc__)
+ 
+ 	for (o, a) in opts:
+@@ -293,15 +297,15 @@ def generate_output(type, db):
+ 	def color(idx, style):
+ 		"""Returns a color/symbol type based upon the index passed."""
+ 
+-                colors = [ 'b', 'g', 'r', 'c', 'm', 'y', 'k' ]
++		colors = [ 'b', 'g', 'r', 'c', 'm', 'y', 'k' ]
+ 		l_styles = [ '-', ':', '--', '-.' ]
+ 		m_styles = [ 'o', '+', '.', ',', 's', 'v', 'x', '<', '>' ]
+ 
+ 		color = colors[idx % len(colors)]
+ 		if style == 'line':
+-			style = l_styles[(idx / len(l_styles)) % len(l_styles)]
++			style = l_styles[int((idx / len(l_styles)) % len(l_styles))]
+ 		elif style == 'marker':
+-			style = m_styles[(idx / len(m_styles)) % len(m_styles)]
++			style = m_styles[int((idx / len(m_styles)) % len(m_styles))]
+ 
+ 		return '%s%s' % (color, style)
+ 
+@@ -314,7 +318,7 @@ def generate_output(type, db):
+ 		ofile = '%s.png' % type
+ 
+ 	if verbose:
+-		print 'Generating plot into %s' % ofile
++		print('Generating plot into %s' % ofile)
+ 
+ 	fig = plt.figure(figsize=plot_size)
+ 	ax = fig.add_subplot(111)
+@@ -329,7 +333,7 @@ def generate_output(type, db):
+ 		legends = None
+ 
+ 	keys = []
+-	for file in db.iterkeys():
++	for file in six.iterkeys(db):
+ 		if not file in ['min_x', 'max_x', 'min_y', 'max_y']:
+ 			keys.append(file)
+ 
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 2605ff9..6903053 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -12,6 +12,7 @@ PV = "1.2.0+git${SRCPV}"
 SRC_URI = "git://git.kernel.dk/blktrace.git \
            file://ldflags.patch \
            file://CVE-2018-10689.patch \
+           file://make-btt-scripts-python3-ready.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4



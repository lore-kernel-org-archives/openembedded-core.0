Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EB376771BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11LNP2v027127; Mon, 1 Feb 2016 21:23:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yvp9cQInyw0j; Mon,  1 Feb 2016 21:23:24 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11LNMsN027124
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Feb 2016 21:23:23 GMT
Message-ID: <1454361802.27087.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Feb 2016 21:23:22 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] ltp: Fix for glibc 2.23+
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
X-List-Received-Date: Mon, 01 Feb 2016 21:23:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

glibc 2.23 onwards drops support for the bdflush syscall, which doesn't actually
do anything on 2.6 kernels anyway, its handled by a kernel thread.

Therefore drop the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/ltp/ltp/no_bdflush.patch b/meta/recipes-extended/ltp/ltp/no_bdflush.patch
new file mode 100644
index 0000000..02bff79
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/no_bdflush.patch
@@ -0,0 +1,182 @@
+glibc 2.23 onwards drops support for the bdflush syscall, which doesn't actually
+do anything on 2.6 kernels anyway, its handled by a kernel thread.
+
+Therefore drop the test.
+
+RP
+2016/2/1
+Upstream-Status: Pending
+
+Index: git/runtest/syscalls
+===================================================================
+--- git.orig/runtest/syscalls
++++ git/runtest/syscalls
+@@ -31,8 +31,6 @@ asyncio02 asyncio02
+ bind01 bind01
+ bind02 bind02
+ 
+-bdflush01 bdflush01
+-
+ brk01 brk01
+ 
+ capget01 capget01
+Index: git/testcases/kernel/syscalls/bdflush/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/bdflush/Makefile
++++ /dev/null
+@@ -1,23 +0,0 @@
+-#
+-#  Copyright (c) International Business Machines  Corp., 2009
+-#
+-#  This program is free software;  you can redistribute it and/or modify
+-#  it under the terms of the GNU General Public License as published by
+-#  the Free Software Foundation; either version 2 of the License, or
+-#  (at your option) any later version.
+-#
+-#  This program is distributed in the hope that it will be useful,
+-#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
+-#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+-#  the GNU General Public License for more details.
+-#
+-#  You should have received a copy of the GNU General Public License
+-#  along with this program;  if not, write to the Free Software
+-#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+-#
+-
+-top_srcdir		?= ../../../..
+-
+-include $(top_srcdir)/include/mk/testcases.mk
+-
+-include $(top_srcdir)/include/mk/generic_leaf_target.mk
+Index: git/testcases/kernel/syscalls/bdflush/bdflush01.c
+===================================================================
+--- git.orig/testcases/kernel/syscalls/bdflush/bdflush01.c
++++ /dev/null
+@@ -1,127 +0,0 @@
+-/******************************************************************************/
+-/* Copyright (c) Crackerjack Project., 2007				   */
+-/*									    */
+-/* This program is free software;  you can redistribute it and/or modify      */
+-/* it under the terms of the GNU General Public License as published by       */
+-/* the Free Software Foundation; either version 2 of the License, or	  */
+-/* (at your option) any later version.					*/
+-/*									    */
+-/* This program is distributed in the hope that it will be useful,	    */
+-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of	    */
+-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See		  */
+-/* the GNU General Public License for more details.			   */
+-/*									    */
+-/* You should have received a copy of the GNU General Public License	  */
+-/* along with this program;  if not, write to the Free Software	       */
+-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
+-/*									    */
+-/******************************************************************************/
+-/******************************************************************************/
+-/*									    */
+-/* File:	bdflush01.c					    */
+-/*									    */
+-/* Description: bdflush() starts, flushes, or tunes the buffer-dirty-flush    */
+-/*		daemon. Only a privileged process (one with the CAP_SYS_ADMIN */
+-/*		capability) may call bdflush().				      */
+-/*									      */
+-/*		If func is negative or 0, and no daemon has been started,     */
+-/*		then bdflush() enters the daemon code and never returns.      */
+-/*									      */
+-/*		If func is 1, some dirty buffers are written to disk.	      */
+-/*		If func is 2 or more and is even (low bit is 0), then address */
+-/*		is the address of a long word, and the tuning parameter       */
+-/*		numbered (func-2)/2 is returned to the caller in that address.*/
+-/*									      */
+-/*		If func is 3 or more and is odd (low bit is 1), then data is  */
+-/*		a long word, and the kernel sets tuning parameter numbered    */
+-/*		(func-3)/2 to that value.				      */
+-/*		    							      */
+-/*		The set of parameters, their values, and their legal ranges   */
+-/*		are defined in the kernel source file fs/buffer.c. 	      */
+-/*									      */
+-/*		Return Value:						      */
+-/*		If func is negative or 0 and the daemon successfully starts,  */
+-/*		bdflush() never returns. Otherwise, the return value is 0 on  */
+-/*		success and -1 on failure, with errno set to indicate the     */
+-/*		error.							      */
+-/*									      */
+-/*		Errors:							      */
+-/*			EBUSY						      */
+-/*			    An attempt was made to enter the daemon code after*/
+-/*			    another process has already entered. 	      */
+-/*			EFAULT						      */
+-/*			   address points outside your accessible address     */
+-/*			   space. 					      */
+-/*			EINVAL						      */
+-/*			    An attempt was made to read or write an invalid   */
+-/*			    parameter number, or to write an invalid value to */
+-/*			    a parameter. 				      */
+-/*			EPERM						      */
+-/*			    Caller does not have the CAP_SYS_ADMIN capability.*/
+-/*									      */
+-/* Usage:  <for command-line>						 */
+-/* bdflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]		      */
+-/*      where,  -c n : Run n copies concurrently.			     */
+-/*	      -e   : Turn on errno logging.				 */
+-/*	      -i n : Execute test n times.				  */
+-/*	      -I x : Execute test for x seconds.			    */
+-/*	      -P x : Pause for x seconds between iterations.		*/
+-/*	      -t   : Turn on syscall timing.				*/
+-/*									    */
+-/* Total Tests: 1							     */
+-/*									    */
+-/* Test Name:   bdflush01					      */
+-/* History:     Porting from Crackerjack to LTP is done by		    */
+-/*	      Manas Kumar Nayak maknayak@in.ibm.com>			*/
+-/******************************************************************************/
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <sys/wait.h>
+-#include <sys/types.h>
+-#include <unistd.h>
+-#include <errno.h>
+-#include <sys/stat.h>
+-#include <sys/kdaemon.h>
+-
+-#include "test.h"
+-#include "linux_syscall_numbers.h"
+-
+-char *TCID = "bdflush01";
+-int testno;
+-int TST_TOTAL = 1;
+-
+-void cleanup(void)
+-{
+-	tst_rmdir();
+-}
+-
+-void setup(void)
+-{
+-	TEST_PAUSE;
+-	tst_tmpdir();
+-}
+-
+-int main(int ac, char **av)
+-{
+-	long data;
+-
+-	tst_parse_opts(ac, av, NULL, NULL);
+-
+-	setup();
+-
+-	/*
+-	 * TODO (garrcoop): add more functional testcases; there are a ton
+-	 * missing.
+-	 */
+-	data = 0;
+-	tst_count = 1;
+-	for (testno = 0; testno < TST_TOTAL; ++testno) {
+-		TEST(ltp_syscall(__NR_bdflush, 3, data));
+-		if (TEST_RETURN == -1)
+-			tst_brkm(TFAIL | TTERRNO, cleanup, "bdflush failed");
+-		else
+-			tst_resm(TPASS, "bdflush() = %ld", TEST_RETURN);
+-	}
+-	cleanup();
+-	tst_exit();
+-}
diff --git a/meta/recipes-extended/ltp/ltp_20150903.bb b/meta/recipes-extended/ltp/ltp_20150903.bb
index f018dae..615d0f8 100644
--- a/meta/recipes-extended/ltp/ltp_20150903.bb
+++ b/meta/recipes-extended/ltp/ltp_20150903.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://add-knob-for-tirpc.patch \
     file://0001-ltp-vma03-fix-the-alginment-of-page-size.patch \
     file://0001-Fix-compilation-for-gcc-5.x.patch \
+    file://no_bdflush.patch \
 "
 
 S = "${WORKDIR}/git"




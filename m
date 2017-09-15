Return-Path: <will.page@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id F221D78599
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 22:27:00 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v8FMQDaP005323; Fri, 15 Sep 2017 17:27:02 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2cw6r7dr1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 15 Sep 2017 17:27:02 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v8FMR1K1007711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2017 17:27:01 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 15 Sep 2017 17:27:01 -0500
Received: from canismajor (130.164.49.7) by us-aus-exhub1.ni.corp.natinst.com
	(130.164.68.41) with Microsoft SMTP Server id 15.0.1156.6 via
	Frontend Transport; Fri, 15 Sep 2017 17:27:00 -0500
Date: Fri, 15 Sep 2017 15:27:00 -0700
From: Will Page <Will.Page@ni.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20170915222700.GA15457@canismajor>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-15_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1709150330
Subject: [pseudo][PATCH] Fix to fcntl guts to ignore flags that can be ORed into cmd
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
X-List-Received-Date: Fri, 15 Sep 2017 22:27:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The fcntl guts switch on "cmd" parameter to identify the fcntl
command being issued, but isn't aware of the file creation flags that
can be ORed in.

This change masks out the flags from the command only for the switch
statement so that it can correctly determine whether it needs to pass
"lock" or "arg".  When real_fcntl() is called, the original value is
still passed on. This corrects an issue observed using pseudo on modern
linux desktops resulting in "pseudo: unknown fcntl argument 1030,
assuming long argument." diagnostics in the output.  Decimal 1030 is
0x0406, which translates to O_NOCTTY | F_SETLK, and should call
"rc = real_fcntl(fd, cmd, lock);", but instead falls through to the
default case instead calling "rc = real_fcntl(fd, cmd, arg);".

Tested the change using perftest - without this patch, the issue is
trivially reproducible on my Ubuntu Xenial system, and after patching it
emitted no "unknown fcntl argument" diagnostics.

Signed-off-by: Will Page <Will.Page@ni.com>
---
 ports/linux/guts/fcntl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
index 639fd24..d278a8c 100644
--- a/ports/linux/guts/fcntl.c
+++ b/ports/linux/guts/fcntl.c
@@ -8,6 +8,10 @@
  */
  	long arg;
 	int save_errno;
+	/* some bits can be ORed into the cmd should be explicitly ignored
+	 * see fcntl documentation on F_SETFL */
+	int o_mode_mask = (O_RDONLY | O_WRONLY | O_RDWR) |
+		(O_CREAT | O_EXCL | O_NOCTTY | O_TRUNC);
 
 	/* we don't know whether we need lock or arg; grab both, which
 	 * should be safe enough on Linuxy systems. */
@@ -15,7 +19,7 @@
 	arg = va_arg(ap, long);
 	va_end(ap);
 
-	switch (cmd) {
+	switch (cmd & ~(o_mode_mask)) {
 	case F_DUPFD:
 #ifdef F_DUPFD_CLOEXEC
 	case F_DUPFD_CLOEXEC:
-- 
2.7.4



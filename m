Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E7FC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 10:11:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.55852.1749463862110180397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 03:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8255d71752=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559AB1Gw008914;
	Mon, 9 Jun 2025 03:11:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq41g31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 03:11:01 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 9 Jun 2025 03:10:58 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/2] screen: fix CVE-2025-46802
Date: Mon, 9 Jun 2025 15:40:26 +0530
Message-ID: <20250609101027.756216-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6846b335 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=xNf9USuDAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=YE9b0svEdhvhCzDF7eUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: k56dkt9ykGoAVuZoRPMtyu0jjLMaEGu2
X-Proofpoint-ORIG-GUID: k56dkt9ykGoAVuZoRPMtyu0jjLMaEGu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA3OCBTYWx0ZWRfX8dVfSMEAWkgq 9E+ES1zj+Zg4qpRKEjeNPU5L10bwmcNHswu5FosyI4I7A8GwPl35Orm8a3Wj0q2jc6iGZJxvaUg B1zH8vzjG2l2e1h4WPOwRkHKXm9zekqJrM922k/XJyYTlo27XmihelTfrrAXQcbETX0JY2kNhJ6
 IgXBz43aNFYoVSPHlZPtNi+18OIrjE7Y5+DTZs7VyiRy0cidpY979KVZ6bmdmcw6v3YvhF8m+EA +UPI1vPo2b0AxNsn2kBfvEHBqmSuHGOC3maYWoFkCPzWrNIO20eUNHwf4BKStHcVeB+HmwqiHGC TNOmYrRYJaqHlJDy2HpzTh3fZtxIfPNHzGuqquS4l7VwnMNYtPp7qZPdOWRMcbC3UBxAm7fDFnz
 kCqa13yQZpWnODG8qaKx0XOoabWGokWoulIrJ5P/VJmpGt7OOPVvnGZj7j2ZHQf5cChIP2f7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=718
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 10:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218263

From: Divya Chellam <divya.chellam@windriver.com>

For a short time they PTY is set to mode 666, allowing any user on the
system to connect to the screen session.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-46802

Upstream-patch:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=049b26b22e197ba3be9c46e5c193032e01a4724a

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../screen/screen/CVE-2025-46802.patch        | 146 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46802.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46802.patch b/meta/recipes-extended/screen/screen/CVE-2025-46802.patch
new file mode 100644
index 0000000000..aa2cbeac21
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2025-46802.patch
@@ -0,0 +1,146 @@
+From 049b26b22e197ba3be9c46e5c193032e01a4724a Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Mon, 12 May 2025 15:15:38 +0200
+Subject: [PATCH] fix CVE-2025-46802: attacher.c - prevent temporary 0666 mode 
+ on PTYs
+
+This temporary chmod of the PTY to mode 0666 is most likely a remnant of
+past times, before the PTY file descriptor was passed to the target
+session via the UNIX domain socket.
+
+This chmod() causes a race condition during which any other user in the
+system can open the PTY for reading and writing, and thus allows PTY
+hijacking.
+
+Simply remove this logic completely.
+
+CVE: CVE-2025-46802
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=049b26b22e197ba3be9c46e5c193032e01a4724a]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ attacher.c | 27 ---------------------------
+ screen.c   | 19 -------------------
+ 2 files changed, 46 deletions(-)
+
+diff --git a/attacher.c b/attacher.c
+index 18ba43c..257bd75 100644
+--- a/attacher.c
++++ b/attacher.c
+@@ -73,7 +73,6 @@ extern int MasterPid, attach_fd;
+ #ifdef MULTIUSER
+ extern char *multi;
+ extern int multiattach, multi_uid, own_uid;
+-extern int tty_mode, tty_oldmode;
+ # ifndef USE_SETEUID
+ static int multipipe[2];
+ # endif
+@@ -160,9 +159,6 @@ int how;
+ 
+       if (pipe(multipipe))
+ 	Panic(errno, "pipe");
+-      if (chmod(attach_tty, 0666))
+-	Panic(errno, "chmod %s", attach_tty);
+-      tty_oldmode = tty_mode;
+       eff_uid = -1;	/* make UserContext fork */
+       real_uid = multi_uid;
+       if ((ret = UserContext()) <= 0)
+@@ -174,11 +170,6 @@ int how;
+ 	    Panic(errno, "UserContext");
+ 	  close(multipipe[1]);
+ 	  read(multipipe[0], &dummy, 1);
+-	  if (tty_oldmode >= 0)
+-	    {
+-	      chmod(attach_tty, tty_oldmode);
+-	      tty_oldmode = -1;
+-	    }
+ 	  ret = UserStatus();
+ #ifdef LOCK
+ 	  if (ret == SIG_LOCK)
+@@ -224,9 +215,6 @@ int how;
+       xseteuid(multi_uid);
+       xseteuid(own_uid);
+ #endif
+-      if (chmod(attach_tty, 0666))
+-	Panic(errno, "chmod %s", attach_tty);
+-      tty_oldmode = tty_mode;
+     }
+ # endif /* USE_SETEUID */
+ #endif /* MULTIUSER */
+@@ -423,13 +411,6 @@ int how;
+       ContinuePlease = 0;
+ # ifndef USE_SETEUID
+       close(multipipe[1]);
+-# else
+-      xseteuid(own_uid);
+-      if (tty_oldmode >= 0)
+-        if (chmod(attach_tty, tty_oldmode))
+-          Panic(errno, "chmod %s", attach_tty);
+-      tty_oldmode = -1;
+-      xseteuid(real_uid);
+ # endif
+     }
+ #endif
+@@ -505,14 +486,6 @@ AttacherFinit SIGDEFARG
+ 	  close(s);
+ 	}
+     }
+-#ifdef MULTIUSER
+-  if (tty_oldmode >= 0)
+-    {
+-      if (setuid(own_uid))
+-        Panic(errno, "setuid");
+-      chmod(attach_tty, tty_oldmode);
+-    }
+-#endif
+   exit(0);
+   SIGRETURN;
+ }
+diff --git a/screen.c b/screen.c
+index 8bce303..f2e8171 100644
+--- a/screen.c
++++ b/screen.c
+@@ -230,8 +230,6 @@ char *multi_home;
+ int multi_uid;
+ int own_uid;
+ int multiattach;
+-int tty_mode;
+-int tty_oldmode = -1;
+ #endif
+ 
+ char HostName[MAXSTR];
+@@ -1009,9 +1007,6 @@ int main(int ac, char** av)
+ 
+     /* ttyname implies isatty */
+     SetTtyname(true, &st);
+-#ifdef MULTIUSER
+-    tty_mode = (int)st.st_mode & 0777;
+-#endif
+ 
+     fl = fcntl(0, F_GETFL, 0);
+     if (fl != -1 && (fl & (O_RDWR|O_RDONLY|O_WRONLY)) == O_RDWR)
+@@ -2170,20 +2165,6 @@ DEFINE_VARARGS_FN(Panic)
+       if (D_userpid)
+         Kill(D_userpid, SIG_BYE);
+     }
+-#ifdef MULTIUSER
+-  if (tty_oldmode >= 0) {
+-
+-# ifdef USE_SETEUID
+-    if (setuid(own_uid))
+-      xseteuid(own_uid);	/* may be a loop. sigh. */
+-# else
+-      setuid(own_uid);
+-# endif
+-
+-    debug1("Panic: changing back modes from %s\n", attach_tty);
+-    chmod(attach_tty, tty_oldmode);
+-  }
+-#endif
+   eexit(1);
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index d137c85600..540a78e04b 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2023-24626.patch \
            file://CVE-2025-46805.patch \
+           file://CVE-2025-46802.patch \
           "
 
 SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
-- 
2.40.0



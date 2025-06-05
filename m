Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243D0C5B559
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 11:01:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4699.1749121290918226323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 04:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8251ba22d7=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5555bGKP031081
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 04:01:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9ruu45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 04:01:30 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 04:01:28 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 2/2] screen: fix CVE-2025-46804
Date: Thu, 5 Jun 2025 16:31:00 +0530
Message-ID: <20250605110100.777921-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250605110100.777921-1-divya.chellam@windriver.com>
References: <20250605110100.777921-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: UOE7DaZ6Ix_koEYKO6bFa7HY_Ex4_GHY
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=6841790a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=xNf9USuDAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=64TtGMMzse0gY1vV1D8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA5NSBTYWx0ZWRfX5DMLISp/wYKP 4F7BgrChyVb143/ItYzEvNEcqMMDzsbSh3GsKavyIlWZm9/EtMOu7GsvYG4Ztl02PzftIGBj+CJ NkuUHGsgvVsiLEGoFVSclAhNeSppNul0XfF0zgN9Prw6lwecBZ6OEDFl6n2W0lXWqNELyK9ll+n
 UPSCG+nJSxdybNNaI2p2hOj4BwQjBfLlBhg721oHi+1opunUnZDLim2MV4LPPt94mthY5XhF0ZN eDpRGZYlbDfKsPXprpoHksy/sej0SoEIDP80AhCNwS3RpTPnzqggyAh1RLS9LSthxnTRtOsnsRb UR1g22kvoWZ1RutaZyQEJmPZkhdAiczUAb7PzseI284w9hpKkEwBNIU5KQXkqXIsaBcRZ/YTlOG
 1udsgc2PSYi4yVgVG5ok5C22FgU6WyZwuuiTNJ0hpgVu/0hui1C9TS/2zMupdFTbdv4jp7OG
X-Proofpoint-ORIG-GUID: UOE7DaZ6Ix_koEYKO6bFa7HY_Ex4_GHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=874
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218006

From: Divya Chellam <divya.chellam@windriver.com>

A minor information leak when running Screen with setuid-root
privileges allosw unprivileged users to deduce information
about a path that would otherwise not be available.

Affected are older Screen versions, as well as version 5.0.0.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-46804

Upstream-patch:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=e0eef5aac453fa98a2664416a56c50ad1d00cb30

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../screen/screen/CVE-2025-46804.patch        | 131 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.1.bb  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46804.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46804.patch b/meta/recipes-extended/screen/screen/CVE-2025-46804.patch
new file mode 100644
index 0000000000..918c2c5ce9
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2025-46804.patch
@@ -0,0 +1,131 @@
+From e0eef5aac453fa98a2664416a56c50ad1d00cb30 Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Mon, 12 May 2025 15:26:11 +0200
+Subject: [PATCH] fix CVE-2025-46804: avoid file existence test information 
+ leaks
+
+In setuid-root context the current error messages give away whether
+certain paths not accessible by the real user exist and what type they
+have. To prevent this only output generic error messages in setuid-root
+context.
+
+In some situations, when an error is pertaining a directory and the
+directory is owner by the real user then we can still output more
+detailed diagnostics.
+
+This change can lead to less helpful error messages when Screen is
+install setuid-root. More complex changes would be needed to avoid this
+(e.g.  only open the `SocketPath` with raised privileges when
+multi-attach is requested).
+
+There might still be lingering some code paths that allow such
+information leaks, since `SocketPath` is a global variable that is used
+across the code base. The majority of issues should be caught with this
+fix, however.
+
+CVE: CVE-2025-46804
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=e0eef5aac453fa98a2664416a56c50ad1d00cb30]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ screen.c | 45 ++++++++++++++++++++++++++++++++++-----------
+ socket.c |  9 +++++++--
+ 2 files changed, 41 insertions(+), 13 deletions(-)
+
+diff --git a/screen.c b/screen.c
+index 1a23e1a..6eec151 100644
+--- a/screen.c
++++ b/screen.c
+@@ -1122,15 +1122,28 @@ int main(int ac, char** av)
+ #endif
+   }
+ 
+-  if (stat(SockPath, &st) == -1)
+-    Panic(errno, "Cannot access %s", SockPath);
+-  else
+-    if (!S_ISDIR(st.st_mode))
++  if (stat(SockPath, &st) == -1) {
++    if (eff_uid == real_uid) {
++      Panic(errno, "Cannot access %s", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  } else if (!S_ISDIR(st.st_mode)) {
++    if (eff_uid == real_uid || st.st_uid == real_uid) {
+       Panic(0, "%s is not a directory.", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  }
+ #ifdef MULTIUSER
+   if (multi) {
+-    if ((int)st.st_uid != multi_uid)
+-      Panic(0, "%s is not the owner of %s.", multi, SockPath);
++    if ((int)st.st_uid != multi_uid) {
++      if (eff_uid == real_uid || st.st_uid == real_uid) {
++        Panic(0, "%s is not the owner of %s.", multi, SockPath);
++      } else {
++        Panic(0, "Error accessing %s", SockPath);
++      }
++    }
+   }
+   else
+ #endif
+@@ -1144,9 +1157,13 @@ int main(int ac, char** av)
+       Panic(0, "You are not the owner of %s.", SockPath);
+ #endif
+   }
+-
+-  if ((st.st_mode & 0777) != 0700)
+-    Panic(0, "Directory %s must have mode 700.", SockPath);
++  if ((st.st_mode & 0777) != 0700) {
++    if (eff_uid == real_uid || st.st_uid == real_uid) {
++      Panic(0, "Directory %s must have mode 700.", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  }
+   if (SockMatch && index(SockMatch, '/'))
+     Panic(0, "Bad session name '%s'", SockMatch);
+   SockName = SockPath + strlen(SockPath) + 1;
+@@ -1184,8 +1201,14 @@ int main(int ac, char** av)
+       else
+         exit(9 + (fo || oth ? 1 : 0) + fo);
+     }
+-    if (fo == 0)
+-      Panic(0, "No Sockets found in %s.\n", SockPath);
++    if (fo == 0) {
++      if (eff_uid == real_uid || st.st_uid == real_uid) {
++        Panic(0, "No Sockets found in %s.\n", SockPath);
++      } else {
++        Panic(0, "Error accessing %s", SockPath);
++      }
++    }
++
+     Msg(0, "%d Socket%s in %s.", fo, fo > 1 ? "s" : "", SockPath);
+     eexit(0);
+   }
+diff --git a/socket.c b/socket.c
+index 54d8cb8..6c3502f 100644
+--- a/socket.c
++++ b/socket.c
+@@ -169,8 +169,13 @@ bool *is_sock;
+   xsetegid(real_gid);
+ #endif
+ 
+-  if ((dirp = opendir(SockPath)) == 0)
+-    Panic(errno, "Cannot opendir %s", SockPath);
++  if ((dirp = opendir(SockPath)) == 0) {
++    if (eff_uid == real_uid) {
++      Panic(errno, "Cannot opendir %s", SockPath);
++    } else {
++      Panic(0, "Error accessing %s", SockPath);
++    }
++  }
+ 
+   slist = 0;
+   slisttail = &slist;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-extended/screen/screen_4.9.1.bb
index 7d43420193..35aa637383 100644
--- a/meta/recipes-extended/screen/screen_4.9.1.bb
+++ b/meta/recipes-extended/screen/screen_4.9.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2025-46802.patch \
+           file://CVE-2025-46804.patch \
            "
 
 SRC_URI[sha256sum] = "26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69"
-- 
2.40.0



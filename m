Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61F04766E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 04:37:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8P4bG0r012515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:37:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 21:37:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Sep 2015 12:30:39 +0800
Message-ID: <fb260f934bc4985d691e257ca73af52eb380f157.1443155360.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
In-Reply-To: <cover.1443155360.git.kai.kang@windriver.com>
References: <cover.1443155360.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: replace 'inline' with 'static inline' for gcc 5.x
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
X-List-Received-Date: Fri, 25 Sep 2015 04:37:18 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

gcc 5.x defaults to -std=gnu11 instead of -std=gnu89 which causes
semantics for inline functions changes.

The standalone 'inline' causes error with gcc 5 such as:

git/testcases/kernel/syscalls/kill/kill10.c:355: undefined reference to
`k_sigaction'

Replace inline with static inline to be compatible with both gcc 4 and 5.

Found and test with configure:
SELECTED_OPTIMIZATION="-O0  -fno-omit-frame-pointer -g -pipe"

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ace-inline-with-static-inline-for-gcc-5.x.patch | 69 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20150420.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch b/meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch
new file mode 100644
index 0000000..0b594dc
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport [From https://github.com/linux-test-project/ltp/commit/40a2457cb8ec42a05a2f96b0810057efdb2a55f5]
+
+gcc 5.x defaults to -std=gnu11 instead of -std=gnu89 which causes
+semantics for inline functions changes.
+
+The standalone 'inline' causes error with gcc 5 such as:
+
+git/testcases/kernel/syscalls/kill/kill10.c:355: undefined reference to `k_sigaction'
+
+Replace inline with static inline to be compatible with both gcc 4 and 5.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ testcases/kernel/controllers/libcontrollers/libcontrollers.c | 2 +-
+ testcases/kernel/controllers/libcontrollers/libcontrollers.h | 2 +-
+ testcases/kernel/syscalls/kill/kill10.c                      | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.c b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
+index b01e1b8..8857bc9 100644
+--- a/testcases/kernel/controllers/libcontrollers/libcontrollers.c
++++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
+@@ -146,7 +146,7 @@ int read_file(char *filepath, int action, unsigned int *value)
+  * Prints error message and returns -1
+  */
+ 
+-inline int error_function(char *msg1, char *msg2)
++static inline int error_function(char *msg1, char *msg2)
+ {
+ 	fprintf(stdout, "ERROR: %s ", msg1);
+ 	fprintf(stdout, "%s\n", msg2);
+diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.h b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
+index 4001555..a1a0dfa 100644
+--- a/testcases/kernel/controllers/libcontrollers/libcontrollers.h
++++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
+@@ -70,7 +70,7 @@ enum{
+ 	GET_TASKS
+ };
+ 
+-inline int error_function(char *msg1, char *msg2);
++static inline int error_function(char *msg1, char *msg2);
+ 
+ unsigned int read_shares_file (char *filepath);
+ 
+diff --git a/testcases/kernel/syscalls/kill/kill10.c b/testcases/kernel/syscalls/kill/kill10.c
+index 982d9da..33dbcd3 100644
+--- a/testcases/kernel/syscalls/kill/kill10.c
++++ b/testcases/kernel/syscalls/kill/kill10.c
+@@ -185,7 +185,7 @@ int child_checklist_total = 0;
+ int checklist_cmp(const void *a, const void *b);
+ void checklist_reset(int bit);
+ 
+-inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa);
++static inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa);
+ 
+ char *TCID = "kill10";
+ int TST_TOTAL = 1;
+@@ -756,7 +756,7 @@ void checklist_reset(int bit)
+ 
+ }
+ 
+-inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa)
++static inline int k_sigaction(int sig, struct sigaction *sa, struct sigaction *osa)
+ {
+ 	int ret;
+ 	if ((ret = sigaction(sig, sa, osa)) == -1) {
+---
+-1.9.1
+-
diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150420.bb
index 108ebf1..ed46b5e 100644
--- a/meta/recipes-extended/ltp/ltp_20150420.bb
+++ b/meta/recipes-extended/ltp/ltp_20150420.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://add-knob-for-numa.patch \
     file://add-knob-for-tirpc.patch \
     file://0001-ltp-vma03-fix-the-alginment-of-page-size.patch \
+    file://0001-replace-inline-with-static-inline-for-gcc-5.x.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.6.0.rc2.10.gf4d9753



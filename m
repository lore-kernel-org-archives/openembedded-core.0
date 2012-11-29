Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Te0V3-00081g-UZ
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 10:33:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAT9JPZ8000266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 01:19:25 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 29 Nov 2012 01:19:24 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2012 17:19:25 +0800
Message-ID: <0a61d188f8bbe8e62bbc4b3b7006dfd4e4bde9c0.1354180595.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1354180595.git.rongqing.li@windriver.com>
References: <cover.1354180595.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] site/common-linux: move ac_cv_o_nonblock_inherited to site/common-linux
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
X-List-Received-Date: Thu, 29 Nov 2012 09:33:45 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

When compiling apr for no-powerpc arch, the flag ac_cv_o_nonblock_inherited
is always set to yes in cross compiling environment. This flag is intended to
think the socket, returned from accept(), inherit file status flags such as
O_NONBLOCK from the listening socket, but socket never inherits file status
from the listening socket on Linux (more information to man accept).

This is Linux-wide behaviour, so move it from meta/site/powerpc32-linux
to site/common-linux.

If ac_cv_o_nonblock_inherited is set to yes on Linux, clients can not access the
same ip address(URL) with Apache web server via http(port 80) and https(port443)
without redirection

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/site/common-linux    |    3 +++
 meta/site/powerpc32-linux |    1 -
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 8a9146e..8b5be68 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -47,3 +47,6 @@ tcl_cv_api_serial=${tcl_cv_api_serial=termios}
 
 # python
 ac_cv_have_long_long_format=yes
+
+# apache
+ac_cv_o_nonblock_inherited=${ac_cv_o_nonblock_inherited=no}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 4550df3..251bffe 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -212,7 +212,6 @@ ac_cv_socklen_t=${ac_cv_socklen_t=yes}
 ac_cv_struct_rlimit=${ac_cv_struct_rlimit=yes}
 ac_cv_negative_eai=${ac_cv_negative_eai=yes}
 apr_cv_gai_addrconfig=${apr_cv_gai_addrconfig=no}
-ac_cv_o_nonblock_inherited=${ac_cv_o_nonblock_inherited=no}
 apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # binutils (libiberty)
-- 
1.7.5.4




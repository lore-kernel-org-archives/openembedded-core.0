Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9658C770CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:25:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9K9Ps3j017331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:25:55 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 20 Oct 2015 02:25:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Oct 2015 02:25:52 -0700
Message-ID: <b6a5e9973afe805490f6aee8967026bc47f2692b.1445333081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1445333081.git.liezhi.yang@windriver.com>
References: <cover.1445333081.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] bitbake-prserv-tool: check file name
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
X-List-Received-Date: Tue, 20 Oct 2015 09:25:56 -0000
Content-Type: text/plain

Fixed:
$ bitbake-prserv-tool import /tmp/1
  File "/path/to/lib/bb/parse/__init__.py", line 114, in handle(fn='/tmp/1', data=<bb.data_smart.DataSmart object at 0x2369bd0>, include=True):
                     return h['handle'](fn, data, include)
    >    raise ParseError("not a BitBake file", fn)

ParseError: ParseError in /tmp/1: not a BitBake file

But 1.conf works well, its help also shows "<file.conf>", so check the
filename and print proper error message.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/bitbake-prserv-tool |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index 28c2416..dcfd7f2 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -86,6 +86,15 @@ do_migrate_localcount ()
 
 [ $# -eq 0 ] && help  && exit 1
 
+case $2 in
+*.conf)
+    ;;
+*)
+    echo ERROR: $2 must end with .conf!
+    exit 1
+    ;;
+esac
+
 case $1 in
 export)
     do_export $2
-- 
1.7.9.5



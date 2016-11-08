Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 22BD271A04
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 14:50:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 08 Nov 2016 06:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,462,1473145200"; d="scan'208";a="1056869897"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.8.222])
	by orsmga001.jf.intel.com with ESMTP; 08 Nov 2016 06:50:10 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 14:49:56 +0000
Message-Id: <dbce9d3db8013c56d7c814fc9757c62beb2df04d.1478615920.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478615920.git.joshua.g.lock@intel.com>
References: <cover.1478615920.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1478615920.git.joshua.g.lock@intel.com>
References: <cover.1478615920.git.joshua.g.lock@intel.com>
Subject: [PATCH v2 4/4] lib/oe/lsb: attempt to ensure consistent distro id regardless of source
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
X-List-Received-Date: Tue, 08 Nov 2016 14:50:10 -0000

The LSB Distributor ID and os-release NAME differ for most of the
distributions tested by the Yocto Project (CentOS, Debian, Fedora,
openSUSE and Ubuntu) however for all but openSUSE the os-release ID
matches the LSB Distributor ID when both are lowered before
comparison.

Therefore, in order to improve the consistency of identification of
a distribution, switch to using the os-release ID and converting
the ID value to lowercase.

Table showing comparison of LSB Distributor ID to os-release fields NAME
and ID for current Yocto Project supported host distributions:

Distribution | Version | Distributor ID   | NAME             | ID       |
-------------------------------------------------------------------------
CentOS       | 7       | CentOS           | CentOS Linux     | centos   |
Debian       | 8       | Debian           | Debian GNU/Linux | debian   |
Fedora       | 23      | Fedora           | Fedora           | fedora   |
Fedora       | 24      | Fedora           | Fedora           | fedora   |
openSUSE     | 13.2    | openSUSE project | openSUSE         | opensuse |
openSUSE     | 42.1    | SUSE LINUX       | openSUSE Leap    | opensuse |
Ubuntu       | 14.04   | Ubuntu           | Ubuntu           | ubuntu   |
Ubuntu       | 16.04   | Ubuntu           | Ubuntu           | ubuntu   |

[YOCTO #10591]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/lsb.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 8018c7b..5a795a1 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -10,7 +10,7 @@ def release_dict_osr():
                 key, val = line.rstrip().split('=', 1)
             except ValueError:
                 continue
-            if key == 'NAME':
+            if key == 'ID':
                 data['DISTRIB_ID'] = val.strip('"')
             if key == 'VERSION_ID':
                 data['DISTRIB_RELEASE'] = val.strip('"')
@@ -107,7 +107,7 @@ def distro_identifier(adjust_hook=None):
     distro_id = re.sub(r'\W', '', distro_id)
 
     if release:
-        id_str = '{0}-{1}'.format(distro_id, release)
+        id_str = '{0}-{1}'.format(distro_id.lower(), release)
     else:
         id_str = distro_id
     return id_str.replace(' ','-').replace('/','-')
-- 
2.7.4



Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9706FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:06:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Feb 2016 01:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,464,1449561600"; d="scan'208";a="905861191"
Received: from kgbrenna-mobl2.ger.corp.intel.com (HELO [10.252.31.197])
	([10.252.31.197])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2016 01:06:36 -0800
User-Agent: Microsoft-MacOutlook/0.0.0.150701
Date: Thu, 18 Feb 2016 11:06:35 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <453EA230-565B-4A9D-AE34-8C03F93540F1@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v5 2/3] gpg_sign: detached_sign: add signature
	type support
References: <cover.1455721437.git.adrian.ratiu@ni.com>
	<fcda0a599c84ea377d1a8da2568cdb49b021232a.1455721437.git.adrian.ratiu@ni.com>
In-Reply-To: <fcda0a599c84ea377d1a8da2568cdb49b021232a.1455721437.git.adrian.ratiu@ni.com>
Mime-version: 1.0
Subject: Re: [PATCH v5 2/3] gpg_sign: detached_sign: add signature type support
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
X-List-Received-Date: Thu, 18 Feb 2016 09:06:37 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 17/02/16 17:41, "Ioan-Adrian Ratiu" <openembedded-core-bounces@lists.openembedded.org on behalf of adrian.ratiu@ni.com> wrote:


>Add support for multiple types of signatures (binary or ascii)
>in export_pubkey(). There is no change in behaviour for the function,
>the previous implicit default is the new parameter "armor" default.
>
>Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>---
> meta/lib/oe/gpg_sign.py | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
>index 138499b..14888c0 100644
>--- a/meta/lib/oe/gpg_sign.py
>+++ b/meta/lib/oe/gpg_sign.py
>@@ -13,12 +13,14 @@ class LocalSigner(object):
>         self.gpg_path = d.getVar('GPG_PATH', True)
>         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
> 
>-    def export_pubkey(self, output_file, keyid):
>+    def export_pubkey(self, output_file, keyid, armor=True):
>         """Export GPG public key to a file"""
>-        cmd = '%s --batch --yes --export --armor -o %s ' % \
>+        cmd = '%s --batch --yes --export -o %s ' % \
>                 (self.gpg_bin, output_file)
>         if self.gpg_path:
>             cmd += "--homedir %s " % self.gpg_path
>+        if armor:
>+            cmd += "--armor "
>         cmd += keyid
>         status, output = oe.utils.getstatusoutput(cmd)
>         if status:

Just change "detached_sign" in the commit subject to "export_pubkey"



Thanks,
 Markus





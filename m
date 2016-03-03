Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4492F605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 09:32:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2016 01:32:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,531,1449561600"; d="scan'208";a="58989602"
Received: from mbelgabr-mobl2.ger.corp.intel.com (HELO [10.252.44.191])
	([10.252.44.191])
	by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2016 01:32:15 -0800
User-Agent: Microsoft-MacOutlook/0.0.0.160212
Date: Thu, 03 Mar 2016 11:32:15 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <EB969D5E-213C-4287-94B1-046E1C6C2BAE@linux.intel.com>
Thread-Topic: [OE-core][PATCH v7 2/5] gpg_sign: detach_sign: fix gpg > 2.1
	STDIN file descriptor
References: <cover.1456929539.git.adrian.ratiu@ni.com>
	<a52fff5bc361cff7b3866dc5ed10333d50ab1bb5.1456929539.git.adrian.ratiu@ni.com>
In-Reply-To: <a52fff5bc361cff7b3866dc5ed10333d50ab1bb5.1456929539.git.adrian.ratiu@ni.com>
Mime-version: 1.0
Subject: Re: [PATCH v7 2/5] gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
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
X-List-Received-Date: Thu, 03 Mar 2016 09:32:17 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit






On 02/03/16 16:47, "Ioan-Adrian Ratiu" <adrian.ratiu@ni.com> wrote:

>Starting from v2.1 passing passwords directly to gpg does not work
>anymore [1], instead a loopback interface must be used otherwise
>gpg >2.1 will error out with:
>"gpg: signing failed: Inappropriate ioctl for device"
>
>gpg <2.1 does not work with the new --pinentry-mode arg and gives an
>invalid option error, so we detect what is the running version of gpg
>and pass it accordingly.
>
>[1] https://wiki.archlinux.org/index.php/GnuPG#Unattended_passphrase
>
>Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>---
> meta/lib/oe/gpg_sign.py | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
>index 1406f17..5d9ad49 100644
>--- a/meta/lib/oe/gpg_sign.py
>+++ b/meta/lib/oe/gpg_sign.py
>@@ -67,6 +67,13 @@ class LocalSigner(object):
>         if armor:
>             cmd += ['--armor']
> 
>+        #gpg > 2.1 supports password pipes only through the loopback interface
>+        #gpg < 2.1 errors out if given unknown parameters
>+        dots = self.get_gpg_version().split('.')
>+        assert len(dots) >= 2
>+        if int(dots[0]) >= 2 and int(dots[1]) >= 1:
>+            cmd += ['--pinentry-mode', 'loopback']
>+
>         cmd += [input_file]
> 
>         try:
>@@ -92,6 +99,15 @@ class LocalSigner(object):
>             raise Exception("Failed to sign '%s'" % input_file)

Another nitpick: missing a line feed here(?)

Thanks,
  Markus


> 
> 
>+    def get_gpg_version(self):
>+        """Return the gpg version"""
>+        import subprocess
>+        try:
>+            return subprocess.check_output((self.gpg_bin, "--version")).split()[2]
>+        except subprocess.CalledProcessError as e:
>+            raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
>+
>+
>     def verify(self, sig_file):
>         """Verify signature"""
>         cmd = self.gpg_bin + " --verify "
>-- 
>2.7.1
>



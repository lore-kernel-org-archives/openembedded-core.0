Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7A156731F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:09:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 18 Feb 2016 01:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,464,1449561600"; d="scan'208";a="905862605"
Received: from kgbrenna-mobl2.ger.corp.intel.com (HELO [10.252.31.197])
	([10.252.31.197])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2016 01:09:22 -0800
User-Agent: Microsoft-MacOutlook/0.0.0.150701
Date: Thu, 18 Feb 2016 11:09:22 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <AD5034C9-EA71-487C-A54B-0244403409D6@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v5 3/3] package_manager: sign IPK package feeds
References: <cover.1455721437.git.adrian.ratiu@ni.com>
	<fc3da90179939d1bc898d5c32b4a375f69faf97c.1455721437.git.adrian.ratiu@ni.com>
In-Reply-To: <fc3da90179939d1bc898d5c32b4a375f69faf97c.1455721437.git.adrian.ratiu@ni.com>
Mime-version: 1.0
Subject: Re: [PATCH v5 3/3] package_manager: sign IPK package feeds
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
X-List-Received-Date: Thu, 18 Feb 2016 09:09:25 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 17/02/16 17:41, "Ioan-Adrian Ratiu" <openembedded-core-bounces@lists.openembedded.org on behalf of adrian.ratiu@ni.com> wrote:


>Create gpg signed ipk package feeds using the gpg backend if configured.
>
>Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>---
> meta/classes/sign_package_feed.bbclass | 10 +++++++++-
> meta/lib/oe/package_manager.py         | 17 +++++++++++++++--
> 2 files changed, 24 insertions(+), 3 deletions(-)
>
>diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
>index 63ca02f..2b0548a 100644
>--- a/meta/classes/sign_package_feed.bbclass
>+++ b/meta/classes/sign_package_feed.bbclass
>@@ -10,6 +10,10 @@
> #           Optional variable for specifying the backend to use for signing.
> #           Currently the only available option is 'local', i.e. local signing
> #           on the build host.
>+# PACKAGE_FEED_GPG_SIGNATURE_TYPE
>+#           Optional variable for specifying the type of gpg signature, can be:
>+#               1. Ascii armored (ASC), default if not set
>+#               2. Binary (BIN)

I'd add a note that PACKAGE_FEED_GPG_SIGNATURE_TYPE is only supported for ipk feeds. This setting is ignored for RPM feeds and afaiu only .asc signatures are supported in rpm-md repositories.


Thanks,
  Markus





> # GPG_BIN
> #           Optional variable for specifying the gpg binary/wrapper to use for
> #           signing.
>@@ -20,7 +24,7 @@ inherit sanity
> 
> PACKAGE_FEED_SIGN = '1'
> PACKAGE_FEED_GPG_BACKEND ?= 'local'
>-
>+PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
> 
> python () {
>     # Check sanity of configuration
>@@ -28,6 +32,10 @@ python () {
>         if not d.getVar(var, True):
>             raise_sanity_error("You need to define %s in the config" % var, d)
> 
>+    sigtype = d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE", True)
>+    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
>+        raise_sanity_error("Bad value for PACKAGE_FEED_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
>+
>     # Set expected location of the public key
>     d.setVar('PACKAGE_FEED_GPG_PUBKEY',
>              os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
>diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
>index b30a4da..606ba24 100644
>--- a/meta/lib/oe/package_manager.py
>+++ b/meta/lib/oe/package_manager.py
>@@ -163,11 +163,16 @@ class OpkgIndexer(Indexer):
>                      "MULTILIB_ARCHS"]
> 
>         opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
>+        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
>+        else:
>+            signer = None
> 
>         if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
>             open(os.path.join(self.deploy_dir, "Packages"), "w").close()
> 
>         index_cmds = []
>+        index_sign_files = []
>         for arch_var in arch_vars:
>             archs = self.d.getVar(arch_var, True)
>             if archs is None:
>@@ -186,6 +191,8 @@ class OpkgIndexer(Indexer):
>                 index_cmds.append('%s -r %s -p %s -m %s' %
>                                   (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
> 
>+                index_sign_files.append(pkgs_file)
>+
>         if len(index_cmds) == 0:
>             bb.note("There are no packages in %s!" % self.deploy_dir)
>             return
>@@ -193,9 +200,15 @@ class OpkgIndexer(Indexer):
>         result = oe.utils.multiprocess_exec(index_cmds, create_index)
>         if result:
>             bb.fatal('%s' % ('\n'.join(result)))
>-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>-            raise NotImplementedError('Package feed signing not implementd for ipk')
> 
>+        if signer:
>+            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True)
>+            is_ascii_sig = (feed_sig_type.upper() != "BIN")
>+            for f in index_sign_files:
>+                signer.detach_sign(f,
>+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
>+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
>+                                   armor=is_ascii_sig)
> 
> 
> class DpkgIndexer(Indexer):





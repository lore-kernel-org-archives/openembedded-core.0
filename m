Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 404637251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:34:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0MEYrjm029230
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 06:34:53 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 22 Jan 2015 06:34:52 -0800
Message-ID: <54C10A8C.9060607@windriver.com>
Date: Thu, 22 Jan 2015 08:34:52 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1421904693-115916-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1421904693-115916-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH v2] python-smartpm: Fix attemptonly builds when file conflicts occur
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
X-List-Received-Date: Thu, 22 Jan 2015 14:34:58 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/21/15 11:31 PM, Mark Hatle wrote:
> [YOCTO #7299]
> 
> When file conflicts occur, the RPM transaction aborts.  Instead of
> simply accepting the failure, we now identify, capture, and remove
> the offending package(s) from the transaction and retry.

Please hold off on this.  I typo'd something else in the actual code right
before sending it.  (This is what I get sending it late at night when I'm half
asleep...)

v3 coming soon.

--Mark

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../python/python-smartpm/smart-attempt.patch      | 97 +++++++++++++++-------
>  1 file changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> index 45f7947..648114a 100644
> --- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> +++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> @@ -9,40 +9,24 @@ failures (usually conflicts).
>  
>  This option only works for the install operation.
>  
> +If a complementary install fails, an actual error occurred, one that
> +we can't ignore without losing the entire attempted transaction.  Keep
> +this as an error so that we can catch these cases in the futre.
> +
>  Upstream-Status: Pending
>  
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -
> -For complementary and 'attemptonly' package processing, we should
> -make sure the warn rather than error reported.
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   smart.py                  |  5 +++-
>   smart/commands/install.py |  5 ++++
>   smart/transaction.py      | 65 +++++++++++++++++++++++++++++++++++------------
>   3 files changed, 58 insertions(+), 17 deletions(-)
>  
> -diff --git a/smart.py b/smart.py
> -index c5c7a02..7e7fd34 100755
> ---- a/smart.py
> -+++ b/smart.py
> -@@ -179,7 +179,10 @@ def main(argv):
> -         if opts and opts.log_level == "debug":
> -             import traceback
> -             traceback.print_exc()
> --        if iface.object:
> -+        if iface.object and sysconf.has("attempt-install", soft=True):
> -+            iface.warning(unicode(e))
> -+            exitcode = 0
> -+        elif iface.object:
> -             iface.error(unicode(e))
> -         else:
> -             sys.stderr.write(_("error: %s\n") % e)
> -diff --git a/smart/commands/install.py b/smart/commands/install.py
> -index 590222c..6ef9682 100644
> ---- a/smart/commands/install.py
> -+++ b/smart/commands/install.py
> +Index: smart-1.4.1/smart/commands/install.py
> +===================================================================
> +--- smart-1.4.1.orig/smart/commands/install.py
> ++++ smart-1.4.1/smart/commands/install.py
>  @@ -50,6 +50,8 @@ def option_parser():
>       parser = OptionParser(usage=USAGE,
>                             description=DESCRIPTION,
> @@ -62,10 +46,10 @@ index 590222c..6ef9682 100644
>       if opts.explain:
>           sysconf.set("explain-changesets", True, soft=True)
>   
> -diff --git a/smart/transaction.py b/smart/transaction.py
> -index 5730a42..e3e61c6 100644
> ---- a/smart/transaction.py
> -+++ b/smart/transaction.py
> +Index: smart-1.4.1/smart/transaction.py
> +===================================================================
> +--- smart-1.4.1.orig/smart/transaction.py
> ++++ smart-1.4.1/smart/transaction.py
>  @@ -555,6 +555,8 @@ class Transaction(object):
>           changeset.set(pkg, INSTALL)
>           isinst = changeset.installed
> @@ -183,6 +167,57 @@ index 5730a42..e3e61c6 100644
>                   elif op is REMOVE:
>                       self._remove(pkg, changeset, locked, pending)
>                   elif op is UPGRADE:
> --- 
> -1.9.1
> -
> +Index: smart-1.4.1/smart/backends/rpm/pm.py
> +===================================================================
> +--- smart-1.4.1.orig/smart/backends/rpm/pm.py
> ++++ smart-1.4.1/smart/backends/rpm/pm.py
> +@@ -243,15 +253,48 @@ class RPMPackageManager(PackageManager):
> +         cb = RPMCallback(prog, upgradednames)
> +         cb.grabOutput(True)
> +         probs = None
> ++        retry = 0
> +         try:
> +             probs = ts.run(cb, None)
> +         finally:
> +             del getTS.ts
> +             cb.grabOutput(False)
> ++            if probs and sysconf.has("attempt-install", soft=True):
> ++                def remove_conflict(pkgNEVR):
> ++                    for key in changeset.keys():
> ++                        if pkgNEVR == str(key):
> ++                            del changeset[key]
> ++                            del pkgpaths[key]
> ++                            iface.warning("Removing %s due to file %s conflicting with %s" % (pkgNEVR, fname, altNEVR))
> ++                            break
> ++
> ++                retry = 1
> ++                for prob in probs:
> ++                    if prob[1][0] == rpm.RPMPROB_NEW_FILE_CONFLICT:
> ++                        msg = prob[0].split()
> ++                        fname = msg[1]
> ++                        pkgNEVR = msg[7]
> ++                        altNEVR = msg[9]
> ++                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
> ++                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
> ++                        remove_conflict(pkgNEVR)
> ++                    elif prob[1][0] == rpm.RPMPROB_FILE_CONFLICT:
> ++                        msg = prob[0].split()
> ++                        fname = msg[1]
> ++                        pkgNEVR = msg[5]
> ++                        altNEVR = msg[11]
> ++                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
> ++                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
> ++                        remove_conflict(pkgNEVR)
> ++                    else:
> ++                        retry = 0
> ++
> +             prog.setDone()
> +-            if probs:
> ++            if probs and (!retry):
> +                 raise Error, "\n".join([x[0] for x in probs])
> +             prog.stop()
> ++            if retry and len(changeset):
> ++                self.commit(changeset, pkgpaths)
> + 
> + class RPMCallback:
> +     def __init__(self, prog, upgradednames):
> 



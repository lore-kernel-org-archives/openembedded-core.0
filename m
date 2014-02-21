Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C07676F1BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 07:28:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1L7SVhH012654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 23:28:31 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 20 Feb 2014 23:28:30 -0800
Message-ID: <53070015.5090405@windriver.com>
Date: Fri, 21 Feb 2014 15:28:21 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1392963956.git.hongxu.jia@windriver.com>
	<6054018911213afc476711fd9e9f8a08cd5f33ea.1392963956.git.hongxu.jia@windriver.com>
In-Reply-To: <6054018911213afc476711fd9e9f8a08cd5f33ea.1392963956.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/5] manifest.py: add create_full for OpkgManifest class
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
X-List-Received-Date: Fri, 21 Feb 2014 07:28:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/21/2014 02:38 PM, Hongxu Jia wrote:
> The function create_full creates the manifest after the package in
> initial manifest has been dummy installed. It lists all *to be
> installed* packages. There is no real installation, just a test.
>
> [YOCTO #1894]
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/lib/oe/manifest.py | 57 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
> index a4bc04b..60c788e 100644
> --- a/meta/lib/oe/manifest.py
> +++ b/meta/lib/oe/manifest.py
> @@ -1,6 +1,8 @@
>   from abc import ABCMeta, abstractmethod
> +from oe.package_manager import *

The import  oe.package_manager line is redundant, we should remove it.

I will update this git branch to remove it, not send another patch.

//Hongxu

>   import os
>   import re
> +import bb
>   
>   
>   class Manifest(object):
> @@ -69,6 +71,7 @@ class Manifest(object):
>   
>           self.initial_manifest = os.path.join(self.manifest_dir, "%s_initial_manifest" % manifest_type)
>           self.final_manifest = os.path.join(self.manifest_dir, "%s_final_manifest" % manifest_type)
> +        self.full_manifest = os.path.join(self.manifest_dir, "%s_full_manifest" % manifest_type)
>   
>           # packages in the following vars will be split in 'must install' and
>           # 'multilib'
> @@ -128,6 +131,15 @@ class Manifest(object):
>           pass
>   
>       """
> +    This creates the manifest after the package in initial manifest has been
> +    dummy installed. It lists all *to be installed* packages. There is no real
> +    installation, just a test.
> +    """
> +    @abstractmethod
> +    def create_full(self, pm):
> +        pass
> +
> +    """
>       The following function parses an initial manifest and returns a dictionary
>       object with the must install, attempt only, multilib and language packages.
>       """
> @@ -158,6 +170,22 @@ class Manifest(object):
>   
>           return pkgs
>   
> +    '''
> +    This following function parses a full manifest and return a list
> +    object with packages.
> +    '''
> +    def parse_full_manifest(self):
> +        installed_pkgs = list()
> +        if not os.path.exists(self.full_manifest):
> +            bb.note('full manifest not exist')
> +            return installed_pkgs
> +
> +        with open(self.full_manifest, 'r') as manifest:
> +            for pkg in manifest.read().split('\n'):
> +                installed_pkgs.append(pkg.strip())
> +
> +        return installed_pkgs
> +
>   
>   class RpmManifest(Manifest):
>       """
> @@ -202,10 +230,12 @@ class RpmManifest(Manifest):
>                   for pkg in pkgs[pkg_type].split():
>                       manifest.write("%s,%s\n" % (pkg_type, pkg))
>   
> -
>       def create_final(self):
>           pass
>   
> +    def create_full(self, pm):
> +        pass
> +
>   
>   class OpkgManifest(Manifest):
>       """
> @@ -253,6 +283,28 @@ class OpkgManifest(Manifest):
>       def create_final(self):
>           pass
>   
> +    def create_full(self, pm):
> +        if not os.path.exists(self.initial_manifest):
> +            self.create_initial()
> +
> +        initial_manifest = self.parse_initial_manifest()
> +        pkgs_to_install = list()
> +        for pkg_type in initial_manifest:
> +            pkgs_to_install += initial_manifest[pkg_type]
> +        if len(pkgs_to_install) == 0:
> +            return
> +
> +        output = pm.dummy_install(pkgs_to_install)
> +
> +        with open(self.full_manifest, 'w+') as manifest:
> +            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
> +            for line in set(output.split('\n')):
> +                m = pkg_re.match(line)
> +                if m:
> +                    manifest.write(m.group(1) + '\n')
> +
> +        return
> +
>   
>   class DpkgManifest(Manifest):
>       def create_initial(self):
> @@ -272,6 +324,9 @@ class DpkgManifest(Manifest):
>       def create_final(self):
>           pass
>   
> +    def create_full(self, pm):
> +        pass
> +
>   
>   def create_manifest(d, final_manifest=False, manifest_dir=None,
>                       manifest_type=Manifest.MANIFEST_TYPE_IMAGE):



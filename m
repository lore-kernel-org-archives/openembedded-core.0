Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE11C77289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:16:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD9GrRt028399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:16:53 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 13 Nov 2015 01:16:52 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1447379573.git.kai.kang@windriver.com>
	<34b5e01814824faf1ed39a94229a4a3da6462d54.1447379573.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5645AA86.4020308@windriver.com>
Date: Fri, 13 Nov 2015 17:16:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <34b5e01814824faf1ed39a94229a4a3da6462d54.1447379573.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/1] classextend.py: update filter to support multiple multilib items
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
X-List-Received-Date: Fri, 13 Nov 2015 09:16:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年11月13日 10:32, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> If it is set with two or more mutliblib items, such as:
>
> MULTILIBS = "multilib:lib32 multilib:lib64"
>
> it expands some virtual providers wrongly:
>
> | ERROR: Nothing PROVIDES 'virtual/lib32-lib64-libc'.
>
> Update the filter that do not extend variables which already have
> one of mulitlib prefixes.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/lib/oe/classextend.py | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py


It is better to be fixed in toolchain-scripts.bbclass where call the 
fucs of class ClassExtender.
So ignore this one please. I'll send another patch to fix it.

--Kai

> index 5107ecd..6a6affb 100644
> --- a/meta/lib/oe/classextend.py
> +++ b/meta/lib/oe/classextend.py
> @@ -15,10 +15,10 @@ class ClassExtender(object):
>               name = name.replace("-" + self.extname, "")
>           if name.startswith("virtual/"):
>               subs = name.split("/", 1)[1]
> -            if not subs.startswith(self.extname):
> +            if not self.check_prefix(subs):
>                   return "virtual/" + self.extname + "-" + subs
>               return name
> -        if not name.startswith(self.extname):
> +        if not self.check_prefix(name):
>               return self.extname + "-" + name
>           return name
>   
> @@ -57,13 +57,6 @@ class ClassExtender(object):
>           if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('cross-canadian' in dep) or ('-crosssdk-' in dep):
>               return dep
>           else:
> -            # Do not extend for that already have multilib prefix
> -            var = self.d.getVar("MULTILIB_VARIANTS", True)
> -            if var:
> -                var = var.split()
> -                for v in var:
> -                    if dep.startswith(v):
> -                        return dep
>               return self.extend_name(dep)
>   
>       def map_depends_variable(self, varname, suffix = ""):
> @@ -108,6 +101,16 @@ class ClassExtender(object):
>               for subs in variables:
>                   self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
>   
> +    def check_prefix(self, name):
> +        ml_prefixes = (self.d.getVar("MULTILIB_VARIANTS", True) or "").split()
> +        if self.extname in ml_prefixes:
> +            for var in ml_prefixes:
> +                if name.startswith(var):
> +                    return True
> +            return False
> +        else:
> +            return name.startswith(self.extname)
> +
>   class NativesdkClassExtender(ClassExtender):
>       def map_depends(self, dep):
>           if dep.startswith(self.extname):


-- 
Regards,
Neil | Kai Kang



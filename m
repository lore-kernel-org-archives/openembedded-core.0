Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QqLwN-0007yb-Ga
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 11:16:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2011 02:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,336,1309762800"; d="scan'208";a="36846685"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.176])
	([10.238.154.176])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2011 02:11:38 -0700
Message-ID: <4E3FA84A.5030600@intel.com>
Date: Mon, 08 Aug 2011 17:11:38 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
	<a6ffbc82edee2699f74d9d49676ab8f37acd8658.1312540193.git.lianhao.lu@intel.com>
In-Reply-To: <a6ffbc82edee2699f74d9d49676ab8f37acd8658.1312540193.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 5/6] ghostscript: Fixed the incorrect DEPENDS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2011 09:16:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-8-5 18:37, Lianhao Lu wrote:
> [YOCTO #1337]
> Using ghostscript-native instead of ${PN}-native in DEPENDS to correct
> the invalid DEPENDS in multilib cases.
>
> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> ---
>   .../ghostscript/ghostscript_9.02.bb                |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
> index 28c6c9e..2e46734 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
>
>   PR = "r4"
>
> -DEPENDS = "${PN}-native tiff jpeg fontconfig cups"
> +DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
>   DEPENDS_virtclass-native = ""
>
>   SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.bz2"

This looks a generic issue to me. i.e. when the dependency ends with 
"-native", we should make sure it won't has multilib prefix. so the 
following patch will be more generic. or at least, we should document 
somewhere that "${PN}-native" dependency is not right.

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6e1669f..c73e5f9 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -43,7 +43,11 @@ python __anonymous () {
          newdeps = []
          for dep in deps:
              if dep.endswith(("-native", "-native-runtime")):
-                newdeps.append(dep)
+                if dep.startswith(variant):
+                    # remove the leading MLPREFIX
+                    newdeps.append(dep[len(variant)+1:])
+                else:
+                    newdeps.append(dep)
              else:
                  newdeps.append(extend_name(dep))
          d.setVar(varname, " ".join(newdeps))

comment? if it is Ok, I will submit a patch.

Regards
Ke



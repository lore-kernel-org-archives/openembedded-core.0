Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8491365D69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 10:06:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2014 03:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,499,1400050800"; d="scan'208";a="530361543"
Received: from tlankage-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by orsmga001.jf.intel.com with ESMTP; 18 Jun 2014 03:06:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: jackie.huang@windriver.com
Date: Wed, 18 Jun 2014 11:06:24 +0100
Message-ID: <2587665.1JRAUNKIMA@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.7-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1403084491-1614-2-git-send-email-jackie.huang@windriver.com>
References: <1403084491-1614-1-git-send-email-jackie.huang@windriver.com>
	<1403084491-1614-2-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] qt4-4.8.6: fix CVE-2014-0190
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
X-List-Received-Date: Wed, 18 Jun 2014 10:06:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jackie,

On Wednesday 18 June 2014 05:41:31 jackie.huang@windriver.com wrote:
> From: yzhu1 <yanjun.zhu@windriver.com>
> 
> The GIF decoder in QtGui in Qt before 5.3 allows remote attackers
> to cause a denial of service (NULL pointer dereference) via
> invalid width and height values in a GIF image.
> Per: http://cwe.mitre.org/data/definitions/476.html
> 
> CWE-476: NULL Pointer Dereference
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0190
> Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  1 +
>  .../qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch    | 31
> ++++++++++++++++++++++ 2 files changed, 32 insertions(+)
>  create mode 100644
> meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch
> 
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc
> b/meta/recipes-qt/qt4/qt4-4.8.6.inc index ae6692b..9db77c9 100644
> --- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
> +++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
> @@ -24,6 +24,7 @@ SRC_URI =
> "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
> file://0028-Don-t-crash-on-broken-GIF-images.patch \
>             file://g++.conf \
>             file://linux.conf \
> +           file://qt4-4.8.6-fix-CVE-2014-0190.patch \
>             "
> 
>  SRC_URI[md5sum] = "2edbe4d6c2eff33ef91732602f3518eb"
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch
> b/meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch new file
> mode 100644
> index 0000000..b8baea8
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch
> @@ -0,0 +1,31 @@
> +Upstream-status: Pending
> +Don't crash on broken GIF images
> +
> +Broken GIF images could set invalid width and height
> +values inside the image, leading to Qt creating a null
> +QImage for it. In that case we need to abort decoding
> +the image and return an error.
> +
> +Initial patch by Rich Moore.
> +
> +Task-number: QTBUG-38367
> +Change-Id: Id82a4036f478bd6e49c402d6598f57e7e5bb5e1e
> +Security-advisory: CVE-2014-0190
> +Reviewed-by: Richard J. Moore <rich@kde.org>
> +
> +--- a/src/gui/image/qgifhandler.cpp
> ++++ b/src/gui/image/qgifhandler.cpp
> +@@ -359,6 +359,13 @@ int QGIFFormat::decode(QImage *image, co
> +                     memset(bits, 0, image->byteCount());
> +                 }
> +
> ++                // Check if the previous attempt to create the image
> failed. If it ++                // did then the image is broken and we
> should give up. ++                if (image->isNull()) {
> ++                    state = Error;
> ++                    return -1;
> ++                }
> ++
> +                 disposePrevious(image);
> +                 disposed = false;
> +

This upstream patch is already being applied within the recipe - see 
0028-Don-t-crash-on-broken-GIF-images.patch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


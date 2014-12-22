Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A726972801
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 13:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMDxLAo008919; Mon, 22 Dec 2014 13:59:21 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OB1K-cV1CEiI; Mon, 22 Dec 2014 13:59:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMDx7dp008913
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2014 13:59:19 GMT
Message-ID: <1419256784.13316.76.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Awais Belal <awais_belal@mentor.com>
Date: Mon, 22 Dec 2014 13:59:44 +0000
In-Reply-To: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
References: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer1.0-* use gitsm style SRC_URI for git recipes
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
X-List-Received-Date: Mon, 22 Dec 2014 14:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-12-22 at 18:53 +0500, Awais Belal wrote:
> All gstreamer components when fetched through git have a git
> submodule type repo rather than a main repo style. This
> will make builds fail when there's no network connection
> while the source is already downloaded.
> We fix this by explicitly using the gitsm styled SRC_URI for
> these submodules.

The gitsm fetcher is not safe from a source archiver perspective so I'm
reluctant to take this change, it changes an explicit error into one
with much more subtle problems.

When the gitsm fetcher merged, I had concerns about it and did not want
to see it used in OE-Core and I continue to have those concerns.

Someone needs to step up and actually fix the fetcher before we can do
anything like this.

I am a little concerned how the git repos are automatically enabling
submodules, I thought submodules had to be explicitly used?

Cheers,

Richard

> 
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  .../gstreamer/gstreamer1.0-libav_git.bb            |    2 +-
>  .../gstreamer/gstreamer1.0-omx_git.bb              |    2 +-
>  .../gstreamer/gstreamer1.0-plugins.inc             |    2 +-
>  .../gstreamer/gstreamer1.0_git.bb                  |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> index bf1b87e..376a7c4 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
>                      file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
>  
> -SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
> +SRC_URI = "gitsm://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
>  S = "${WORKDIR}/git"
>  
>  SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
> index 931a7fc..df7c58c 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
>                      file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
>  
>  SRC_URI = " \
> -    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master \
> +    gitsm://anongit.freedesktop.org/gstreamer/gst-omx;branch=master \
>      file://0001-omx-fixed-type-error-in-printf-call.patch \    
>      "
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> index 687aa2f..d857a40 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> @@ -43,7 +43,7 @@ def get_gst_srcuri(d):
>      branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
>  
>      if pv == "git":
> -        s = "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
> +        s = "gitsm://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
>      else:
>          s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
>      return s
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> index cb00d31..a8d3731 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> @@ -5,7 +5,7 @@ include gstreamer1.0.inc
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>                      file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
>  
> -SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
> +SRC_URI = "gitsm://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
>  S = "${WORKDIR}/git"
>  
>  SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
> -- 
> 1.7.9.5
> 




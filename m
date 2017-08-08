Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 738587197E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:58:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v78FwBJG020322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Aug 2017 08:58:11 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 8 Aug 2017 08:58:11 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
	<7ef3f08bdec1e383464085347222b59894526872.1502206031.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <4ae3a694-c172-c4e7-8cf9-97f6cd8507cd@windriver.com>
Date: Tue, 8 Aug 2017 10:58:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <7ef3f08bdec1e383464085347222b59894526872.1502206031.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 4/4] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Tue, 08 Aug 2017 15:58:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/8/17 10:30 AM, Alexander Kanavin wrote:
> It has not been ported to openssl 1.1 (and there's nothing in upstream git),
> but it's possible to use nettle or gcrypt intead.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index e964fef3f20..7427772a45f 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -40,9 +40,7 @@ PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
>  PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
>  PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
>  PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
> -# ensure OpenSSL is used for HLS AES description instead of nettle
> -# (OpenSSL is a shared dependency with dtls)
> -PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
> +PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=nettle,--disable-hls,nettle"

Can we somehow make openssl(10) or nettle a choice when compiling?

I ask because I've worked on a few systems where people seem to want one
encryption engine for as much of the system as possible (usually openssl).
While gstreamer has not been a problem in such systems, I could see it being
something that would need to be considered.

Otherwise no concerns with the rest of the patch set.

>  PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
>  PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
>  PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
> 



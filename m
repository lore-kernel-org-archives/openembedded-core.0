Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnEDd-0000EI-5P
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 20:25:01 +0200
Received: by iyj12 with SMTP id 12so5742794iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 11:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=RFUDfknKFbd3fQhG7f/vSSau6YoU3rKMY7TuuSbZSds=;
	b=p5nMOBErARbSnjoH1OVwSnfLPZfCT+ev9J8J89zivgSqyqd0kOcHu2nUZnAobjWh+e
	N8lmtkajE4AI/vMCjp+2DCPXZa5FZFrRVR2NMwTyIZVELP0oSOF/6cAwfZbeDKM2gj+w
	IaIzv4nkWapMXtJgkgmLM8MlYo6yacEDJtC6E=
Received: by 10.142.177.11 with SMTP id z11mr1688555wfe.54.1312050042066;
	Sat, 30 Jul 2011 11:20:42 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v17sm1965368wfd.5.2011.07.30.11.20.40
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 11:20:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 11:20:39 -0700
Message-ID: <2070961.C8JsuWrOh5@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <d5e06516ed6656364b8127740700d1403b72d567.1311758282.git.kai.kang@windriver.com>
References: <cover.1311758282.git.kai.kang@windriver.com>
	<d5e06516ed6656364b8127740700d1403b72d567.1311758282.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] ghostscript: fix parallel build issue
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
X-List-Received-Date: Sat, 30 Jul 2011 18:25:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 27, 2011 05:34:45 PM Kang Kai wrote:
> From: Kang Kai <kai.kang@windriver.com>
> 
> ghostscript fails some time on autobuilder, it seems a parallel build issue.
> Add patch to fix it.
> 
> Fixes [Yocto #1202]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../ghostscript-9.02-parallel-make.patch           |   17 +++++++++++++++++
> .../ghostscript/ghostscript_9.02.bb                |    3 ++-
>  2 files changed, 19 insertions(+), 1 deletions(-)
>  create mode 100644
> meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-mak
> e.patch
> 
> diff --git
> a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
> ake.patch
> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
> ake.patch new file mode 100644
> index 0000000..76d1676
> --- /dev/null
> +++
> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
> ake.patch @@ -0,0 +1,17 @@
> +When parallel make it will fail with multi copy, see
> +http://bugzilla.pokylinux.org/show_bug.cgi?id=1202
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +--- ghostscript-9.02/base/unixhead.mak.orig	2011-07-27 17:06:17.749456100
> +0800 ++++ ghostscript-9.02/base/unixhead.mak	2011-07-27 17:06:37.449456100
> +0800 +@@ -54,7 +54,7 @@
> +
> + # Define generic commands.
> +
> +-CP_=cp
> ++CP_=cp -f

It means it will first delete the target if it exists. Did you check if this 
is correct behavior ?

-- 
Khem Raj



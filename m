Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB7177022
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 12:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9CCsWMx001433; Mon, 12 Oct 2015 13:54:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id glFocQB45ZW0; Mon, 12 Oct 2015 13:54:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9CCsG9B001427
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Oct 2015 13:54:29 +0100
Message-ID: <1444654455.3844.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wenzong.fan@windriver.com
Date: Mon, 12 Oct 2015 13:54:15 +0100
In-Reply-To: <1444642535-196919-1-git-send-email-wenzong.fan@windriver.com>
References: <1444642535-196919-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
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
X-List-Received-Date: Mon, 12 Oct 2015 12:54:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-10-12 at 05:35 -0400, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> "bzip2 -t FILE" returns 2 if FILE exists, but is not a valid bzip2 file.
> "bzip2 -qt FILE" returns 0 when this happens, although it does print out
> an error message as is does so.
> 
> This has been fix by Debian, just port changes from Debian patch file
> "20-legacy.patch":
> 
> * Fixed "bunzip2 -qt returns 0 for corrupt archives" (Closes: #279025).
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  ...bunzip2-qt-returns-0-for-corrupt-archives.patch | 49 ++++++++++++++++++++++
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
> 
> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
> new file mode 100644
> index 0000000..63d705d
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
> @@ -0,0 +1,49 @@
> +From 8068659388127e8e63f2d2297ba2348c72b20705 Mon Sep 17 00:00:00 2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Mon, 12 Oct 2015 03:19:51 -0400
> +Subject: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
> +
> +"bzip2 -t FILE" returns 2 if FILE exists, but is not a valid bzip2 file.
> +"bzip2 -qt FILE" returns 0 when this happens, although it does print out
> +an error message as is does so.
> +
> +This has been fix by Debian, just port changes from Debian patch file
> +"20-legacy.patch":
> +
> +* Fixed "bunzip2 -qt returns 0 for corrupt archives" (Closes: #279025).
> +
> +Upstream-Status: Backport [Debian]
> +

What is the upstream position on this issue? That they won't fix it? I'm
not sure Backport is right for a debian patch since debian is not the
bzip2 upstream.

Cheers,

Richard



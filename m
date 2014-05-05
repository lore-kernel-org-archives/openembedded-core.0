Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1D0265F0E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 08:13:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s458DNSa020887; Mon, 5 May 2014 09:13:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vvOxP7TejVgn; Mon,  5 May 2014 09:13:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s458DH14020884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 5 May 2014 09:13:19 +0100
Message-ID: <1399277591.12731.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Stanacar <sstncr@gmail.com>
Date: Mon, 05 May 2014 09:13:11 +0100
In-Reply-To: <1399225274-10139-1-git-send-email-sstncr@gmail.com>
References: <1399225274-10139-1-git-send-email-sstncr@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/cleanup-workdir: fix after binutils-cross name change
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
X-List-Received-Date: Mon, 05 May 2014 08:13:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-05-04 at 20:41 +0300, Stefan Stanacar wrote:
> Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
> ---
>  scripts/cleanup-workdir | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
> index 25fef97..cffac59 100755
> --- a/scripts/cleanup-workdir
> +++ b/scripts/cleanup-workdir
> @@ -49,9 +49,10 @@ def run_command(cmd):
>  
>  def get_cur_arch_dirs(workdir, arch_dirs):
>      pattern = workdir + '/(.*?)/'
> -
> +    tunearch = run_command("bitbake -e | grep ^TUNE_ARCH=")
> +    tunearch = tunearch.split('"')[1]
>      # select thest 5 packages to get the dirs of current arch
> -    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk', 'nativesdk-autoconf']
> +    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk-' + tunearch, 'nativesdk-autoconf']
>  
>      for pkg in pkgs:
>          cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="

I pushed a fix for this before I saw the patch. FWIW for crosssdk we
need to use SDK_ARCH though.

Cheers,

Richard



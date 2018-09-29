Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 96C266011C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:42:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCgRek026773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:42:28 +0100
Message-ID: <5c661c4cb3eb647f21b0b6fa3d9b50fa609bb84e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2018 13:42:26 +0100
In-Reply-To: <2a442ec9c52896065e9d87e1cf1b58eb22534176.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<2a442ec9c52896065e9d87e1cf1b58eb22534176.1538199671.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 06/10] libcheck: avoid multilib install file conflict
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
X-List-Received-Date: Sat, 29 Sep 2018 12:42:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It has one line different which is a comment in check_stdint.h
> between libcheck multilib packages. And then causes install file
> conflict when install libcheck and lib32-libcheck at same time.
> 
> Remove the comment line from check_stdint.h to fix the issue.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-support/libcheck/libcheck_0.12.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> index e646d43968..9969e27054 100644
> --- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> +++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> @@ -16,6 +16,11 @@ inherit autotools pkgconfig texinfo
>  
>  CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
>  
> +do_install_append_class-target () {
> +    # remove the only one line comment which causes multilib install
> file conflict
> +    sed -i '/^\/\*/ d' ${D}${includedir}/check_stdint.h
> +}

Please do this with a patch, not a sed expression.

The sed expressions are a maintenance nightmare since we don't know
if/when the header may change, or if/when this expression stops
working.

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0EEF060232
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TKHpEu030388; Mon, 29 Feb 2016 20:17:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cQ001UojSDSz; Mon, 29 Feb 2016 20:17:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TKHlno030385
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Feb 2016 20:17:48 GMT
Message-ID: <1456777067.11498.180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 20:17:47 +0000
In-Reply-To: <1456757580-31669-1-git-send-email-adrian.ratiu@ni.com>
References: <1456757580-31669-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Mon, 29 Feb 2016 20:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-29 at 16:53 +0200, Ioan-Adrian Ratiu wrote:
> The apache2 package is missing key pieces of pthread support (notably
> pthread_kill) on x86_64 platforms. Fix this by setting cached
> variable
> apr_cv_pthreads_cflags=-pthread which will trickle down into apache2
> as
> well. powerpc32-linux currently sets this option.
> 
> Suggested-by: Jacob Champion <jacob.champion@ni.com>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/site/x86_64-linux | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index 573a907..5b37211 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -104,6 +104,7 @@
> nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
>  nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
>  
>  #apr
> +apr_cv_pthreads_cflags=${apr_cv_pthreads_cflags=-pthread}
>  apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}

Autobuilder doesn't look happy after this change:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
ds/662/steps/BuildImages_1/logs/stdio

This was the only change to apr in there so its looking like the most
likely suspect...

Cheers,

Richard


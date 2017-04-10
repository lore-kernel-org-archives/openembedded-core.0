Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8750571A82
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 17:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3AH1StT018872; 
	Mon, 10 Apr 2017 18:01:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2kK1kk9U4-_w; Mon, 10 Apr 2017 18:01:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3AGp5Ri016355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 10 Apr 2017 17:51:06 +0100
Message-ID: <1491843065.783.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 17:51:05 +0100
In-Reply-To: <20170410155928.7461-1-alexander.kanavin@linux.intel.com>
References: <20170410155928.7461-1-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: fix the reference to native perl in ptests
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
X-List-Received-Date: Mon, 10 Apr 2017 17:01:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-04-10 at 18:59 +0300, Alexander Kanavin wrote:
> This was causing a couple of ptest failures.
> 
> [YOCTO #10840]
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> b/meta/recipes-connectivity/openssl/openssl.inc
> index 481a4445605..fcaf2318085 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -205,6 +205,10 @@ do_install () {
>  
>  do_install_ptest () {
>  	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
> +
> +        # Replace the path to native perl with the path to target
> perl
> +        sed -i 's,^PERL=.*,PERL=/usr/bin/perl,'
> ${D}${PTEST_PATH}/Makefile
> +

I think this would need to be ${bindir}/perl?

Cheers,

Richard



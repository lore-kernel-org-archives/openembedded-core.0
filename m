Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 205D57814B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 15:56:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w29FunLX022565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 9 Mar 2018 15:56:52 GMT
Message-ID: <1520611008.10851.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 09 Mar 2018 07:56:48 -0800
In-Reply-To: <20180309110049.10725-2-raj.khem@gmail.com>
References: <20180309110049.10725-1-raj.khem@gmail.com>
	<20180309110049.10725-2-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/3] liburcu: Explicitly add pthread options to cflags
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
X-List-Received-Date: Fri, 09 Mar 2018 15:56:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-09 at 03:00 -0800, Khem Raj wrote:
> Some architectures e.g. riscv gcc does not add -D_REENTRANT
> when enabling pthreads. Help it here by adding these options
> while gcc gets fixed
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/liburcu/liburcu_0.10.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
> b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
> index 0c8cd3571a..a73890af90 100644
> --- a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
> +++ b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
> @@ -15,3 +15,5 @@ SRC_URI[sha256sum] =
> "9c09220be4435dc27fcd22d291707b94b97f159e0c442fbcd60c168f8f
>  
>  S = "${WORKDIR}/userspace-rcu-${PV}"
>  inherit autotools
> +
> +CPPFLAGS  += "-pthread -D_REENTRANT"

Should we use a riscv override here so that we have some idea why we're
doing this and show its not needed for other arches?

Cheers,

Richard


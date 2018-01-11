Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1F41760806
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 10:30:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0BATLC1008077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 Jan 2018 10:29:22 GMT
Message-ID: <1515666561.29722.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 10:29:21 +0000
In-Reply-To: <20180111040858.22280-1-clopez@igalia.com>
References: <20180111040858.22280-1-clopez@igalia.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] tune-i686: Add new tune for better support of 686-class CPUs.
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
X-List-Received-Date: Thu, 11 Jan 2018 10:30:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-11 at 05:08 +0100, Carlos Alberto Lopez Perez wrote:
> There isn't currently any tune available for i686 x86 optimizations.
> The tune for i586 doesn't enable i686 specific optimizations, and the
> one for core2 enables things that won't work on a i686 CPU (like
> SSE3).
> 
> This patch also changes the default tune for the qemux86 machine from
> i586 to i686. This should cause no issue, as "runqemu qemux86"
> already
> defaults to run with "-cpu pentium2".
> 
> The tune for core2 now inherits from this one, which allows to remove
> the override on the X86ARCH32 definition.
> 
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
> ---
>  meta/conf/machine/include/tune-core2.inc |  7 ++-----
>  meta/conf/machine/include/tune-i686.inc  | 25
> +++++++++++++++++++++++++
>  meta/conf/machine/qemux86.conf           |  2 +-
>  3 files changed, 28 insertions(+), 6 deletions(-)
>  create mode 100644 meta/conf/machine/include/tune-i686.inc

Please don't do multiple things in a single commit like this.

The qemux86 default tune change isn't as simple as it might first
appear as it changes the output artefacts which may or may not mean
changes to the testing infrastructure (I'd hope not but I also know the
reality).

Adding the tune itself should be more straightforward.

We do need to keep track of the comment "Set x86 target arch to i686,
so that glibc enables SSE optimised memcpy, etc." as i586 verses i686
does make a significant difference to the glibc config.

Cheers,

Richard


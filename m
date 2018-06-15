Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1459074E1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:16:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5F9G41R010919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 15 Jun 2018 10:16:05 +0100
Message-ID: <e09e191ff3db590e5d31e5de5528966121904225.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com, armccurdy@gmail.com
Date: Fri, 15 Jun 2018 10:16:04 +0100
In-Reply-To: <1529053289-2632-1-git-send-email-mingli.yu@windriver.com>
References: <1529053289-2632-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2] ltp: set -fomit-frame-pointer explicitly for x86-64
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
X-List-Received-Date: Fri, 15 Jun 2018 09:16:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-15 at 17:01 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> When build ltp with -fno-omit-frame-pointer on
> x86-64, it will trigger below error:
> > cve-2015-3290.c: In function 'child_thread':
> > cve-2015-3290.c:416:1: error: bp cannot be used in asm here
> 
> And there is also some comment as below in the source
> file ltp/20180515-r0/git/testcases/cve/cve-2015-3290.c
> * Build with -O2.  Don't use -fno-omit-frame-pointer.
> 
> So explicitly set -fomit-frame-pointer on x86-64 for
> compiler to fix the above build error.
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-extended/ltp/ltp_20180515.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb
> b/meta/recipes-extended/ltp/ltp_20180515.bb
> index b07c1b9..7fd8565 100644
> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
> @@ -19,6 +19,11 @@ LIC_FILES_CHKSUM = "\
>  DEPENDS = "attr libaio libcap acl openssl zip-native"
>  DEPENDS_append_libc-musl = " fts "
>  EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
> +
> +# set -fomit-frame-pointer to handle cases where optimisation is set
> to -O0 or frame
> +# pointers have been enabled by -fno-omit-frame-pointer earlier in
> CFLAGS, etc.
> +CFLAGS_append_x86-64 = " -fomit-frame-pointer"
> +
>  CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
>  SRCREV = "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"

Can you extend the comment to include:

"since ltp contains x86-64 assembler which uses the frame-pointer
register"

so that the comment doesn't just say what you're doing but why its
necessary only for x86-64

Cheers,

Richard




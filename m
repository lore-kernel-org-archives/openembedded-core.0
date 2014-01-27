Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8946C765
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 12:15:46 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id BDCC5227D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 13:15:46 +0100 (CET)
Message-ID: <52E64E70.1070907@pseudoterminal.org>
Date: Mon, 27 Jan 2014 13:17:52 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
In-Reply-To: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
Subject: Re: [PATCH] db: Fix libtool linking against local libstdc++.so
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
X-List-Received-Date: Mon, 27 Jan 2014 12:15:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-01-25 05:14, Tyler Hall wrote:
> Building the C++ bindings in a484b35b818768487ff27cf06b8c5d4e128126af
> introduced this error on systems with /usr/lib/libstdc++.so present:
>
>      /usr/lib/libstdc++.so: file not recognized: File format not recognized
>
> The shipped libtool is sysroot aware, so pass --with-sysroot so it will
> extract the sysroot from the compiler.
>
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> ---
>   meta/recipes-support/db/db_5.3.21.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
> index 8ec8870..caf6890 100644
> --- a/meta/recipes-support/db/db_5.3.21.bb
> +++ b/meta/recipes-support/db/db_5.3.21.bb
> @@ -63,7 +63,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
>   # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
>   DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
>   
> -EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx"
> +EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
>   
>   # Override the MUTEX setting here, the POSIX library is
>   # the default - "POSIX/pthreads/library".

Works fine for me, thanks.


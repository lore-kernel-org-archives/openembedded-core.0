Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 603AD6CBB4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 15:57:30 +0000 (UTC)
Received: (qmail 3575 invoked by uid 1003); 26 Jan 2014 15:57:30 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.41.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	26 Jan 2014 15:57:30 -0000
Message-ID: <52E53069.4050508@balister.org>
Date: Sun, 26 Jan 2014 10:57:29 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Tyler Hall <tylerwhall@gmail.com>
References: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
In-Reply-To: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
X-Enigmail-Version: 1.6
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 26 Jan 2014 15:57:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/24/2014 11:14 PM, Tyler Hall wrote:
> Building the C++ bindings in a484b35b818768487ff27cf06b8c5d4e128126af
> introduced this error on systems with /usr/lib/libstdc++.so present:
> 
>     /usr/lib/libstdc++.so: file not recognized: File format not recognized
> 
> The shipped libtool is sysroot aware, so pass --with-sysroot so it will
> extract the sysroot from the compiler.
> 
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>

Tested-by: Philip Balister <philip@balister.org>

It didn't seem to break anything on my build. (Which worked already)
Packaging looks OK still.

> ---
>  meta/recipes-support/db/db_5.3.21.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
> index 8ec8870..caf6890 100644
> --- a/meta/recipes-support/db/db_5.3.21.bb
> +++ b/meta/recipes-support/db/db_5.3.21.bb
> @@ -63,7 +63,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
>  # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
>  DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
>  
> -EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx"
> +EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
>  
>  # Override the MUTEX setting here, the POSIX library is
>  # the default - "POSIX/pthreads/library".
> 


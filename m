Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBO9J-0001Eh-Cl for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 11:24:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OAFjoU005071
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 10:15:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01784-07 for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 10:15:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OAFZA9005065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 10:15:36 GMT
Message-ID: <1332584138.9740.505.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 24 Mar 2012 10:15:38 +0000
In-Reply-To: <3050966a33b84230c8787d4782cd9c2c80f0a5a6.1332565237.git.nitin.a.kamble@intel.com>
References: <cover.1332565237.git.nitin.a.kamble@intel.com>
	<3050966a33b84230c8787d4782cd9c2c80f0a5a6.1332565237.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [patch v2 1/1] bitbake.conf: fix rpath for sdk executables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Mar 2012 10:24:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 22:02 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This makes the libraries located in places like this findable:
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib
> 
> Which avoids linking sdk executables with host libraries like this:
> 
> $ ldd /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
>         linux-vdso.so.1 =>  (0x00007fffb7fff000)
>         libreadline.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libreadline.so.6 (0x00007fbfb5511000)
>         libdl.so.2 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libdl.so.2 (0x00007fbfb530c000)
>         libncurses.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libncurses.so.5 (0x00007fbfb50e9000)
>         libtinfo.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libtinfo.so.5 (0x00007fbfb4ec2000)
>         libz.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libz.so.1 (0x00007fbfb4cac000)
>         libm.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libm.so.6 (0x00007fbfb4a2a000)
>         libpthread.so.0 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libpthread.so.0 (0x00007fbfb480d000)
>         libutil.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libutil.so.1 (0x00007fbfb4609000)
>         libexpat.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libexpat.so.1 (0x00007fbfb43e0000)
>         libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libc.so.6 (0x00007fbfb4059000)
>         /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x0000003f05000000)
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/conf/bitbake.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 824ef04..50f0308 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -480,7 +480,9 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
>  
>  BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
>                      -Wl,-rpath-link,${STAGING_LIBDIR} \
> +                    -Wl,-rpath-link,${STAGING_LIBDIR}/.. \
>                      -Wl,-rpath,${libdir} -Wl,-O1 \
> +                    -Wl,-rpath,${libdir}/.. -Wl,-O1 \
>                      -L${STAGING_DIR_HOST}${base_libdir} \
>                      -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
>                      -Wl,-rpath,${base_libdir} -Wl,-O1"

From the description above it took me a long time to realise what you're
referring to. The problem you're solving is specific to
cross-canadian.bbclass which changes libdir to include a suffix.

Please append your two entries to this variable within
cross-canadian.bbclass and then this makes a lot more sense! If you
don't it will lead to strange RPATHs in parts of the system.

Technically this change shouldn't be necessary since we'd use our own
dynamic loader within the SDK and it knows about the paths apart from
the one with the suffix. We likely could therefore remove some of this
but now isn't the time for that! If you used a cross-ldd for our SDK
toolchain, you'd should see something different to the above.

Cheers,

Richard






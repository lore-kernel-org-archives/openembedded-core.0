Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2BA7F976
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:21:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s1so16226258wro.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=vz2gak79uvXz8ft7IdH2i0cB5gQp3iz09t8zs3zKVJU=;
	b=N0x03TvXEhbg/GDMEfwKw0gPHXTPScCmQ4Go6VZbd7wXOA8P7vTj/RwaYiK0qqDmJ8
	M3sTp2dxUVr0riPYLXQMN/dRr28k+LmTXvnzCb8Pl2up88gD9kDS40CYf2orIz299ZlO
	irQzr7UIRyMuFogoeGQgjXaDs7GTnXys3BEYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vz2gak79uvXz8ft7IdH2i0cB5gQp3iz09t8zs3zKVJU=;
	b=IGSsQQ1so2Xe1pKvS1ytvKDf8Uo9w3qTM1hqYfPcogXpuPrFfshs1tzCSe8/nrGQss
	I1wHd3fA28iDSzvZMqM4KhzZNdh48ndybVtw+UdoJ6pHBg7L+zjny1/85gXbadRe7dOd
	qKJdvXIRddao5OG8XcplhiCgpDN9Qzqwx7oqcb6Z8DzsbmIZA43vWNN1vSA62sYX2voX
	dFHFqrpkAt/VwPY4Wop8Hn+JWiW1mX9+GOaoUNU7ZpNLqzYxqxcXWzlUM2MjPDSUu8DZ
	v7ikHl+e0e69v93tMCNiPeHlVwQbOzDsoY0mKyLHU6q15fI84+oFteCB4c6braHJLRvZ
	BWaA==
X-Gm-Message-State: APjAAAU0qPq2xKmhQyeAsV3gewWUtTmCu/ITEue7jb7yjltTCrj7xyBh
	/ZpMM9Gqj0fHtrdRZ/P/6uEjNgZifPA=
X-Google-Smtp-Source: APXvYqyFP8lDla8dVS1Um0Z8+R3Hng+En5MPe/RjzJGgjRkBSGvOQXru+RbNL2nNj79+3mqocao9tA==
X-Received: by 2002:adf:f192:: with SMTP id h18mr2798569wro.148.1571905278772; 
	Thu, 24 Oct 2019 01:21:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10sm18106023wrn.46.2019.10.24.01.21.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 01:21:18 -0700 (PDT)
Message-ID: <600949430430d26d2c62d0e5c99868b2752978a0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nick Owens <nick.owens@eero.com>, openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 09:21:17 +0100
In-Reply-To: <20191023175939.14612-2-nick.owens@eero.com>
References: <20191022235935.19461-1-nick.owens@eero.com>
	<20191023175939.14612-1-nick.owens@eero.com>
	<20191023175939.14612-2-nick.owens@eero.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] distutils: pass along parallel make flags to setup.py build
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
X-List-Received-Date: Thu, 24 Oct 2019 08:21:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-23 at 10:59 -0700, Nick Owens wrote:
> parallel builds for native code in python modules was added about 5
> years ago. distutils understands '-j N', so just pass along
> the right argument to setup.py build.
> 
> Signed-off-by: Nick Owens <nick.owens@eero.com>
> ---
>  meta/classes/distutils.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/distutils.bbclass
> b/meta/classes/distutils.bbclass
> index b5c9c2fbbd..ea479f552e 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -23,7 +23,7 @@ distutils_do_compile() {
>           NO_FETCH_BUILD=1 \
>           STAGING_INCDIR=${STAGING_INCDIR} \
>           STAGING_LIBDIR=${STAGING_LIBDIR} \
> -         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py build ${DISTUTILS_BUILD_ARGS} || \
> +         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py build ${@oe.utils.parallel_make_argument(d, "-j %d")}
> ${DISTUTILS_BUILD_ARGS} || \
>           bbfatal_log "'${PYTHON_PN} setup.py build
> ${DISTUTILS_BUILD_ARGS}' execution failed."
>  }

Fails on the autobuilder in testing (step 3b):

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/1164

ERROR: python-setuptools-native-41.4.0-r0 do_compile: 'python setup.py build ' execution failed.
ERROR: python-setuptools-native-41.4.0-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035' failed with exit code 1:
usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
   or: setup.py --help [cmd1 cmd2 ...]
   or: setup.py --help-commands
   or: setup.py cmd --help

error: option -j not recognized
WARNING: /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1 exit 1 from 'exit 1'

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/log.do_compile.5035
Log data follows:
| DEBUG: Executing shell function do_compile
| usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
|    or: setup.py --help [cmd1 cmd2 ...]
|    or: setup.py --help-commands
|    or: setup.py cmd --help
| 
| error: option -j not recognized
| ERROR: 'python setup.py build ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1 exit 1 from 'exit 1'
| ERROR: Execution of '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035' failed with exit code 1:
| usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
|    or: setup.py --help [cmd1 cmd2 ...]
|    or: setup.py --help-commands
|    or: setup.py cmd --help
| 
| error: option -j not recognized
| WARNING: /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1 exit 1 from 'exit 1'
| 
NOTE: recipe python-setuptools-native-41.4.0-r0: task do_compile: Failed
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/qa-extras/build/meta/recipes-devtools/python/python-setuptools_41.4.0.bb:do_compile) failed with exit code '1'

Also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1164
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1166
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1163

Cheers,

Richard




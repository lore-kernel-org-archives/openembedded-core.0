Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05DF0796E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 06:04:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9O64he1002135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 24 Oct 2018 07:04:45 +0100
Message-ID: <46d200d7ef4c6399ccc99801674fb203916555c6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2018 07:04:42 +0100
In-Reply-To: <1540351835-16861-1-git-send-email-changqing.li@windriver.com>
References: <1540351835-16861-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] openssl: fix occasionally install fail for parallel build
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
X-List-Received-Date: Wed, 24 Oct 2018 06:04:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-24 at 11:30 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> when do parallel build, like run "make install -j 48", openssl will
> do_install
> failed with below error:
> mv: cannot stat 'openssl/1.1.1-
> r0/image/usr/lib/libcrypto.so.1.1.new': No such file or directory
> Makefile:318: recipe for target 'install_dev' failed
> 
> problem caused by target install_dev and target install_runtime, both
> installed
> libcrypto.so.1.1, result in log:
> *** Installing development files
> ...
> install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> link /var/tmp/foo/lib/libcrypto.so ->
> /var/tmp/foo/lib/libcrypto.so.1.1
> ...
> *** Installing runtime files
> install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> 
> command in install_dev and install_runtime will have parallel
> competition.
> 
> have create an issue to upstream:
> https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
> 
> but upstream won't support this condition, so use this fix as a
> workaround to fix the problem.

This means that:

a) Upstream don't support parallel make install
b) Reject patches fixing any bugs in parallel make install

This means the Upstream-Status should be rejected with the link above,
not pending. It also means we may need to think about not using
parallel install although since its working, its tempting to carry
patches and keep using it if it works.

It may be worth pointing out to upstream that it is mostly working for
us? I am a little worried they know something we don't about problems
this could run into.

Cheers,

Richard



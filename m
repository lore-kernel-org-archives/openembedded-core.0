Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAC071951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 22:42:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3JMg0xg025013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 19 Apr 2017 23:42:01 +0100
Message-ID: <1492641720.19076.73.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 23:42:00 +0100
In-Reply-To: <1492640262-18359-1-git-send-email-sgw@linux.intel.com>
References: <1492640262-18359-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 19 Apr 2017 23:42:02 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] sstate: Ensure PACKAGE_EXTRA_ARCHS are part of SSTATE_ARCHS
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
X-List-Received-Date: Wed, 19 Apr 2017 22:42:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-19 at 15:17 -0700, Saul Wold wrote:
> Since BSPs also define package archs that are included in
> PACKAGE_EXTRA_ARCHS
> we should also enure they are accounted for in SSTATE_ARCH.
> 
> This helps with the license manifest issue in some cases.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/sstate.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/sstate.bbclass
> b/meta/classes/sstate.bbclass
> index e50a385..614c3a0 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -45,6 +45,7 @@ SSTATE_ARCHS = " \
>      ${SDK_ARCH}_${PACKAGE_ARCH} \
>      allarch \
>      ${PACKAGE_ARCH} \
> +    ${PACKAGE_EXTRA_ARCHS} \
>      ${MACHINE}"
>  
>  SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"

You really need to explain more about the problem this is solving. I'm
nervous of this change as it has the potential to complicate
multimachine builds and hide real issues.

For example, currently if you build an armv5 and an armv7 machine, the
files will be left alone for both. After this change, building the
armv7 machine will cause the armv5 files to be removed as they are not
"reachable" from the v7 build but are listed as an extra package arch.
At that point we may as well go though all index files and remove
anything which isn't reachable by the current configured machine.

It actually gets worse with multiconfig as with this change building an
armv7 and armv5 machine would fail.

If you're solving a package feed issue, the answer might be to limit
the package feeds only to currently builable package architectures. I'm
not sure what license issue you're addressing here though so I can't
really help give pointers on what to do here...

Cheers,

Richard




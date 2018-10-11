Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 34ED579AED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 09:34:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9B9YUXO020334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 11 Oct 2018 10:34:32 +0100
Message-ID: <ad0c4f9df33f9dfbece0d5e178779388c1b6d61c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Olof Johansson <olof.johansson@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 10:34:30 +0100
In-Reply-To: <20181010153528.9110-1-olofjn@axis.com>
References: <20181010153528.9110-1-olofjn@axis.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] devtool-source.bbclass: Only create each patch branch once
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
X-List-Received-Date: Thu, 11 Oct 2018 09:34:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-10 at 17:35 +0200, Olof Johansson wrote:
> For conditonally applied patches based on SRC_URI overrides, the
> devtool-source class would try to create a new branch for each
> override
> assignment as a postfunc to do_patch, but if the same override was
> used
> multiple times, it would try to create the same branch multiple
> times,
> causing errors like
> 
> > Exception: bb.process.ExecutionError: Execution of
> 
> \   'git checkout f0f0f0f0f0ff0f0f0f0f0f0f0f0f0f0f0ff0f0f0 -b
> devtool-override-foo'
> \   failed with exit code 128:
> > fatal: A branch named 'devtool-override-foo' already exists.
> 
> This change makes sure that the devtool-source bbclass will only
> create
> one branch per override.
> 
> Change-Id: I8adca0b54179793ca92478ad5b3b1b6e0448e26b
> Signed-off-by: Olof Johansson <olofjn@axis.com>
> ---
>  meta/classes/devtool-source.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

This breaks the oe-selftest devtool tests:

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/46751/raw

oe-selftest -r devtool

should reproduce.

Cheers,

Richard



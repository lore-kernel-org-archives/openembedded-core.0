Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHX1r-00077c-1j for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 10:01:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p447xEuS028462
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 May 2011 08:59:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28326-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2011 08:59:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p447xAbh028456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 May 2011 08:59:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1304440834-4253-1-git-send-email-michael.lippautz@gmail.com>
References: <1304440834-4253-1-git-send-email-michael.lippautz@gmail.com>
Date: Wed, 04 May 2011 08:59:06 +0100
Message-ID: <1304495946.21461.153.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv2] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Wed, 04 May 2011 08:01:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-03 at 18:40 +0200, Michael Lippautz wrote:
> This patch fixes compilation/linking of python third-party extensions, i.e.
> Extensions that ship with C code.
> 
> Problem:
> Python uses distutils(-native) to compile third-party extensions. distutils
> uses its own sysconfig module to get the options for compiling and linking.
> Since third-party extensions have to be linked against this libpython it
> important that -L points into staging. This is not the case because
> distutils.sysconfig uses a special Makefile that is shipped with python
> determine the paths. The Makefile is the same that would be used on the
> target to build third-party extensions. It therefore points into /usr/lib
> instead of staging.
> 
> Solution:
> Stage a modified version of the Makefile where the paths (incdir, libdir) have
> been replaced by ones that point into staging.
> 
> Side-problem:
> The recipe actually should not stage files itself in do_compile, but rather
> handle everything that needs to be staged in do_install. This is currently not
> possible because python compiles itself using distutils-native. Distutils on
> the other hand does only allow to add a path, but not to substitute it,
> requiring a staged Makefile and libpython.so before the actual python
> compilation is triggered.
> 
> The second step to solve this would be to either patch distutils, or split
> python into python-initial and python. The -initial part could create the
> Makefile and the library, while the main part focuses on the target.
> 
> For further references see:
>  http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/001752.html
> 
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/python/python_2.6.6.bb |   41 +++++++++++++++++---------
>  1 files changed, 27 insertions(+), 14 deletions(-)

Merged to master, thanks.

Richard




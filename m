Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sozha-0008Kh-25 for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 18:23:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BGCXMQ010241
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:12:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10154-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:12:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BGCRHp010234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:12:28 +0100
Message-ID: <1342023149.11939.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 17:12:29 +0100
In-Reply-To: <22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 16:23:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 11:00 -0500, Peter Seebach wrote:
> In the usual case, the computed path used for debugedit to fix
> up path references for the target filesystem is correct. However,
> prebuilt binary components, such as prebuilt toolchains, can
> have debug paths that do not reflect paths within the local
> build directory. Providing an override lets us continue to use
> the standard debugedit logic in package.bbclass.
> 
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/classes/package.bbclass |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index e6856cd..1a8c7f8 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -191,6 +191,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
>      debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
>      workdir = d.getVar("WORKDIR", True)
>      workparentdir = os.path.dirname(workdir)
> +    overridedir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or ""
>      sourcefile = d.expand("${WORKDIR}/debugsources.list")

I think I at least would find this slightly less confusing as:

workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or os.path.dirname(workdir)

Cheers,

Richard




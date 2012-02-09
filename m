Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RvReG-000751-12 for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 11:54:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q19AkccS012869
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2012 10:46:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12762-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2012 10:46:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q19AkREn012863
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2012 10:46:31 GMT
Message-ID: <1328784395.7875.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 09 Feb 2012 10:46:35 +0000
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCE533D@SHSMSX102.ccr.corp.intel.com>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FCE533D@SHSMSX102.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: do_patch signature confliction for gcc family recipes
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
X-List-Received-Date: Thu, 09 Feb 2012 10:54:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-09 at 06:22 +0000, Lu, Lianhao wrote:
> Hi guys,
> 
> I just found that the gcc-runtime-nativesdk has different task signature for task do_patch, comparing to that of gcc-cross-initial. This would cause a do_patch failure if we use OEBasicHash as the BB_SIGNATURE_HANDLER. By comparing their sigdata files, it turns out that the difference comes from the dependency to the variable PN in do_patch(See the following output of diffsigs). It is not designed, because all gcc family recipes share the same source therefore should have the same signature for all do_patch tasks.
> 
> $ bitbake-diffsigs i586-poky-linux/gcc-cross-initial-4.6.2+svnr181430-r22.do_patch.sigdata.c7458123b61e7799d85c0f7b5c2c42f5 x86_64-nativesdk-pokysdk-linux/gcc-runtime-nativesdk-4.6.2+svnr181430-r22.do_patch.sigdata.c6fd9cc8796537680198a31c39a5efb7 
> 
> basehash changed from 49509723413c15e414b91b1e0074c169 to 026f47cf7b6f9bc6358b8727a14feacd
> List of dependencies for variable PN changed from set(['FILE']) to set([])
> changed items: set(['FILE'])
> Variable PN value changed from {@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'} to gcc-runtime-nativesdk
> Task dependency hash changed from 1cad915227dbbe6a9d2e5f85c9a4748f to 2526a771c7e3d733fccbff32c70328cc (for gcc-cross-initial_4.6.bb.do_unpack and quilt-native_0.51.bb.do_populate_sysroot)
> Task dependency hash changed from 2526a771c7e3d733fccbff32c70328cc to 214e4a3f054da63cb266af4394ccb9a5 (for quilt-native_0.51.bb.do_populate_sysroot and virtual:nativesdkgcc-runtime_4.6.bb.do_headerfix)
> Task dependency hash changed from 214e4a3f054da63cb266af4394ccb9a5 to 1cad915227dbbe6a9d2e5f85c9a4748f (for gcc-cross-initial_4.6.bb.do_headerfix and virtual:nativesdkgcc-runtime_4.6.bb.do_unpack)
> 
> I'm wondering if it is a correct way to fix this issue by excluding the PN from do_patch dependency:
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gc
> index e89a7c0..57668f9 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -109,3 +109,4 @@ do_headerfix[vardepvalue] = "PATH"
>  # We need to ensure that for the shared work directory, the do_patch singatures
>  # The real WORKDIR location isn't a dependency for the shared workdir.
>  src_patches[vardepsexclude] = "WORKDIR"
> +should_apply[vardepsexclude] = "PN"

I think this is the correct fix in this case and I'll take such a patch.

Cheers,

Richard




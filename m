Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 275DA6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:41:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0F9f6oZ020620; Wed, 15 Jan 2014 09:41:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HrKXzjkrE97g; Wed, 15 Jan 2014 09:41:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0F9f1uK020601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 15 Jan 2014 09:41:04 GMT
Message-ID: <1389778855.14987.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 15 Jan 2014 09:40:55 +0000
In-Reply-To: <5b2e657a4ee50d238838edc474b12590d7d61a28.1389769700.git.liezhi.yang@windriver.com>
References: <cover.1389769700.git.liezhi.yang@windriver.com>
	<5b2e657a4ee50d238838edc474b12590d7d61a28.1389769700.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: remove previous version's stamp
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
X-List-Received-Date: Wed, 15 Jan 2014 09:41:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-15 at 15:09 +0800, Robert Yang wrote:
> There is a potential problem if we don't remove the previous version's
> stamp, for example:
> 
> The depend chain is:
> libtool-native -> autoconf-native -> m4-native
> We have two m4-native: 1.4.9 and 1.4.7
> 
> 1) Clean all of them to make a fresh build so that we can reproduce the
>    problem
> $ bitbake m4-native autoconf-native libtool-native -ccleansstate
> 
> 2) Build libtool-native so that the m4-native_1.4.17 will be built
> $ bitbake libtool-native
> 
> 3) Set PREFERRED_VERSION_m4-native = "1.4.9" and build again
> $ bitbake libtool-native
> 
> 4) Set PREFERRED_VERSION_m4-native = "1.4.17" and build again
> $ bitbake libtool-native -ccleansstate && bitbake libtool-native
> 
> Then the build will fail:
> [snip]
> | m4: unrecognized option '--gnu'
> | Try `m4 --help' for more information.
> | autom4te: m4 failed with exit status: 1
> [snip]
> 
> The is because when we change m4-native to 1.4.17 and build
> libtool-native again:
> 5) libtool-native depends on autoconf-native, and autoconf-native's
>    version isn't change, so it can remove the current stamp and mirror
>    the sstate (the one depends on m4-native_1.4.9) from the SSTATE_DIR
>    correctly.
> 
> 6) The mirrored autoconf-native depends on m4-native_1.4.17's
>    do_populate_sysroot, and the stamp is already there (which is made
>    by step 2), so it would do nothing, but this is incorrect, since
>    the one that really in the sysroot is m4-native_1.4.9, then the
>    error happens.
> 
> Remove previous version's stamp in sstate_clean() will fix the problem.
> 
> [YOCTO #5422]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/sstate.bbclass | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 35c3f85..8802d79 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -331,6 +331,8 @@ def sstate_clean_manifest(manifest, d):
>  
>  def sstate_clean(ss, d):
>      import oe.path
> +    import glob
> +    import re
>  
>      d2 = d.createCopy()
>      extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
> @@ -350,15 +352,14 @@ def sstate_clean(ss, d):
>          for lock in locks:
>              bb.utils.unlockfile(lock)
>  
> -    stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
> -    oe.path.remove(stfile)
> -    oe.path.remove(stfile + "_setscene")
> -    if extrainf:
> -        oe.path.remove(stfile + ".*" + extrainf)
> -        oe.path.remove(stfile + "_setscene" + ".*" + extrainf)
> -    else:
> -        oe.path.remove(stfile + ".*")
> -        oe.path.remove(stfile + "_setscene" + ".*")
> +    stamp_dir = os.path.dirname(d.getVar("STAMP", True))
> +    # Remove the current and previous stamps, but keep the sigdata
> +    wildcard_stfile = "%s/*.do_%s*" % (stamp_dir, ss['task'])
> +    re_stfile_sigdata = "%s/.*\.do_%s\.sigdata\.*" % (stamp_dir, ss['task'])
> +    for stfile in glob.glob(wildcard_stfile):
> +        # Keep the sigdata
> +        if not re.match(re_stfile_sigdata, stfile):
> +            oe.path.remove(stfile)
>  

You can't do this, the extrainf data *is* important since for tasks
which are machine specific, you must not trample on another machine's
stamp files.

Please use STAMPCLEAN here instead of STAMP, setup an appropriate glob
or two glob expressions based on that, search for it, then iterate the
result and only delete anything that doesn't have sigdata in it.

Cheers,

Richard



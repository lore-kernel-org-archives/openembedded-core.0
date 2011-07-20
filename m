Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjeNO-0004Z5-Ea
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:32:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 14:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,237,1309762800"; d="scan'208";a="30035747"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 14:28:10 -0700
Message-ID: <4E27486A.7090401@linux.intel.com>
Date: Wed, 20 Jul 2011 14:28:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311141365.6973.7.camel@localhost.localdomain>
In-Reply-To: <1311141365.6973.7.camel@localhost.localdomain>
Subject: Re: [patch]for different default python version
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
X-List-Received-Date: Wed, 20 Jul 2011 21:32:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


NiQingliang,

A minor nit regarding the subject of this patch, there are some basic 
formatting that is used in oe-core, this information can be found at
http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines

Key thing is to include the name of the file (or functionality group) 
you are patching along with a good summary in the subject such as:

oe-init-build-env: Find and use python2 as default python

You also need to include a Signed-off-by: in your commit message.

I still need to test this further with a machine with and with out 
python2 / python3.

Also this did not apply cleanly, please rebase.

Thanks for your efforts on this patch.

Sau!


On 07/19/2011 10:56 PM, NiQingliang wrote:
> most Linux distribution use python 2.x as the default as bitbake
> expected, but some use python 3.x as the default (like archlinux), so
> this patch come.
>
> if the default python is 2.x, it will do nothing.
> or it will search the python 2.x in /usr/bin and /bin.
> if find it out, then make a soft link in the build dir, and add the
> build dir into the env var PATH.
>
> diff --git a/oe-init-build-env b/oe-init-build-env
> index 77332a7..acf4e96 100755
> --- a/oe-init-build-env
> +++ b/oe-init-build-env
> @@ -39,6 +39,34 @@ else
>      $OEROOT/scripts/oe-setup-builddir
>      unset OEROOT
>      unset BBPATH
> +
> +   # find the python 2.x, if the default python is not.
> +   # NOTE:
> +   #    the 'python -V' need redirect to stdout
> +   #    once we can ensure every distribution has 'python2' (currently,
> except
> +   #    ubuntu), we should change bitbake's shebang to '/usr/bin/env
> python2',
> +   #    and remove this patch.
> +   # precondition:
> +   #    $BUILDDIR is not NULL, but I doubt when it will be NULL.
> +   #    user have not made the file $BUILDDIR/python by himself.
> +   if [ -z "`/usr/bin/env python -V 2>&1|grep '^Python 2\.'`" ]; then
> +      PYTHON2_BIN=""
> +      for PY_BIN in `find /{usr/,}bin -regex '.*/python\(\|2\|2\.[0-9]*
> \)'`; do
> +         if [ -n "`$PY_BIN -V 2>&1|grep '^Python 2\.'`" ]; then
> +            PYTHON2_BIN=$PY_BIN
> +            break
> +         fi
> +      done
> +      if [ -n "$PYTHON2_BIN" ]; then
> +         ln -sf $PY_BIN $BUILDDIR/python
> +         export PATH="$BUILDDIR:$PATH"
> +         echo "NOTE: poky will use '$PY_BIN' to execute python code."
Probably should not mention poky here, should be bitbake or ...

> +      else
> +         echo "ERROR: unable to find Python 2.x, BitBake requires
> Python 2.6 or 2.7."
> +      fi
> +      unset PYTHON2_BIN
> +   fi
> +
>      [ -n "$BUILDDIR" ]&&  cd $BUILDDIR
>   fi
>
>



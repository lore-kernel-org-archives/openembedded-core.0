Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkI6D-0006pw-JY
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:57:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jul 2011 08:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,248,1309762800"; d="scan'208";a="30376226"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2011 08:53:03 -0700
Message-ID: <4E299CDF.10500@linux.intel.com>
Date: Fri, 22 Jul 2011 08:53:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: NiQingliang <niqingliang@insigma.com.cn>
References: <1311141365.6973.7.camel@localhost.localdomain>	
	<4E27486A.7090401@linux.intel.com>
	<1311229602.13861.17.camel@localhost.localdomain>
In-Reply-To: <1311229602.13861.17.camel@localhost.localdomain>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [patch]oe-init-build-env: Find and use python2 as default python
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
X-List-Received-Date: Fri, 22 Jul 2011 15:57:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 11:26 PM, NiQingliang wrote:
> thanks your guide, I have read the link, but it looks like only show the
> rule with result without generating process. my mean is how to generate
> one patch.
> setp 1 ... step 2 ... step3 ...

Ni (sorry about getting your name wrong last time)

Everyone's work flow is different, I am not sure what your currently is, 
but using git format-patch and git send-email would be the best method 
to send a patch that can then be consumed by git am.

Please resend this as I still had trouble with the merge.

Thanks
	Sau!

>
> so after made other patch mail as reference, I got that (`git diff -p
> --stat` after a new clean clone) (and sorry for that if still mistake):
>
> oe-init-build-env: Find and use python2 as default python
>
> most Linux distribution use python 2.x as the default as bitbake
> expected, but some use python 3.x as the default (like archlinux).
>
> if the default python is 2.x, it will do nothing. or it will search it
> in /usr/bin and /bin. if found, then make a soft link in the build dir,
> and add the build dir into the env var PATH.
>
> Signed-off-by: Ni Qingliang<niqingliang@insigma.com.cn>
> ---
>   oe-init-build-env |   28 ++++++++++++++++++++++++++++
>   1 files changed, 28 insertions(+), 0 deletions(-)
>
> diff --git a/oe-init-build-env b/oe-init-build-env
> index 77332a7..a11a4c4 100755
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
> +         echo "NOTE: BitBake will use '$PY_BIN' to execute python
> code."
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
> On Thu, 2011-07-21 at 05:28 +0800, Saul Wold wrote:
>> oe-init-build-env: Find and use python2 as default python



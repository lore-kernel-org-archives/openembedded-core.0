Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADFA777A2C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 10:55:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2017 03:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,411,1498546800"; d="scan'208";a="892924432"
Received: from cshikang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.237])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2017 03:55:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 22 Aug 2017 22:55:53 +1200
Message-ID: <2904894.l3jg57PGWo@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <00ad9ee0ea4e4de1773220dfca8792819701092f.1503364879.git.liezhi.yang@windriver.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
	<00ad9ee0ea4e4de1773220dfca8792819701092f.1503364879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 6/9] core/target/ssh.py: replace decode errors
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
X-List-Received-Date: Tue, 22 Aug 2017 10:55:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 22 August 2017 1:23:10 PM NZST Robert Yang wrote:
> There might be wild strings when read from target (especially when
> reading ptest results), replace the errors to avoid breaking the test.
> 
> Fixed: (Not always happen)
> $ bitbake core-image-sato -ctestimage
> [snip]
>     status, output = self.target.run('ptest-runner', 0)
>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 84, in run
>     status, output = self._run(sshCmd, processTimeout, True)
>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 55, in _run
>     status, output = SSHCall(command, self.logger, timeout)
>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 258, in SSHCall
>     run()
>   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 236, in run
>     output = process.communicate()[0].decode("utf-8")
> UnicodeDecodeError: 'utf-8' codec can't decode byte 0xc3 in position 4906: invalid continuation byte
> 
> [YOCTO #11547]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oeqa/core/target/ssh.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index b80939c..a2eafcd 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -211,7 +211,7 @@ def SSHCall(command, logger, timeout=None, **opts):
>                              process.stdout.close()
>                              eof = True
>                          else:
> -                            data = data.decode("utf-8")
> +                            data = data.decode("utf-8", errors='replace')
>                              output += data
>                              logger.debug('Partial data from SSH call: %s' % data)

Since we're dealing with partial data here, shouldn't we be using a
reader object? e.g.:

  http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=bfd8c35c3f917e3806c8dfe36c98c70fbccbb3c9

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


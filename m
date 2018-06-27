Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 59DFF6FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 12:52:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5RCqGhL006321
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 27 Jun 2018 13:52:17 +0100
Message-ID: <99ecf8bdd0075ba8dd826f0d0fcb1dfdf4228142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2018 13:52:16 +0100
In-Reply-To: <dc42596e94fa1548971c5e4fe703eea79d5f2dfb.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
	<dc42596e94fa1548971c5e4fe703eea79d5f2dfb.1529604086.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/6] oe.scriptutils.run_editor: ditch the error-prone argument quoting
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
X-List-Received-Date: Wed, 27 Jun 2018 12:52:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-22 at 02:07 +0500, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Rather than trying to construct a string by quoting the files in an
> error-prone way, parse $EDITOR to pass a list to subprocess rather
> than
> a string.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  scripts/lib/scriptutils.py | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> index 85b1c949bf5..470f76995f0 100644
> --- a/scripts/lib/scriptutils.py
> +++ b/scripts/lib/scriptutils.py
> @@ -214,15 +215,14 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir,
> logger, preserve_tmp=False, mirr
>  
>  def run_editor(fn, logger=None):
>      if isinstance(fn, str):
> -        params = '"%s"' % fn
> +        files = [fn]
>      else:
> -        params = ''
> -        for fnitem in fn:
> -            params += ' "%s"' % fnitem
> +        files = fn
>  
>      editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
>      try:
> -        return subprocess.check_call('%s %s' % (editor, params), shell=True)
> +        print(shlex.split(editor) + files)
> +        return subprocess.check_call(shlex.split(editor) + files)
>      except subprocess.CalledProcessError as exc:
>          logger.error("Execution of '%s' failed: %s" % (editor, exc))
>          return 1

I'm guessing you didn't mean to leave the print() above in?

If the print is there, it breaks:

"oe-selftest -r devtool.DevtoolTests.test_devtool_add"

I can comment it out...

Cheers,

Richard




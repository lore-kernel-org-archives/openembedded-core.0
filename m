Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECAF739A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 18:33:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2015 11:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,390,1422950400"; d="scan'208";a="664442670"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.24.97])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2015 11:33:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 18:33:09 +0000
Message-ID: <1586927.DOV2yj0OdG@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1425982249-17652-2-git-send-email-patrick.ohly@intel.com>
References: <1425982249-17652-1-git-send-email-patrick.ohly@intel.com>
	<1425982249-17652-2-git-send-email-patrick.ohly@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] combo-layer: runcmd() with separate output
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
X-List-Received-Date: Thu, 12 Mar 2015 18:33:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 March 2015 11:10:48 Patrick Ohly wrote:
> Allow the caller to specify a separate output stream. stderr is always
> a temporary file opened by runcmd(), so read from that to capture
> output for error reporting *and* the return value.
> 
> The reasoning for the latter is a) that this preserves the traditional
> behavior when out=None and b) if the caller wants the content of
> stdout, it can read from the stream itself, which is not possible for
> the temporary stderr.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  scripts/combo-layer | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 5f10e83..fb3fb50 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -149,23 +149,27 @@ class Configuration(object):
>              logger.error("ERROR: patchutils package is missing, please
> install it (e.g. # apt-get install patchutils)") sys.exit(1)
> 
> -def runcmd(cmd,destdir=None,printerr=True):
> +def runcmd(cmd,destdir=None,printerr=True,out=None):
>      """
>          execute command, raise CalledProcessError if fail
>          return output if succeed
>      """
>      logger.debug("run cmd '%s' in %s" % (cmd, os.getcwd() if destdir is
> None else destdir)) -    out = os.tmpfile()
> +    if not out:
> +        out = os.tmpfile()
> +        err = out
> +    else:
> +        err = os.tmpfile()
>      try:
> -        subprocess.check_call(cmd, stdout=out, stderr=out, cwd=destdir,
> shell=True) +        subprocess.check_call(cmd, stdout=out, stderr=err,
> cwd=destdir, shell=isinstance(cmd, str)) except
> subprocess.CalledProcessError,e:
> -        out.seek(0)
> +        err.seek(0)
>          if printerr:
> -            logger.error("%s" % out.read())
> +            logger.error("%s" % err.read())
>          raise e
> 
> -    out.seek(0)
> -    output = out.read()
> +    err.seek(0)
> +    output = err.read()
>      logger.debug("output: %s" % output )
>      return output

I'm fine with this change, but FYI unfortunately we have a number of copies of 
this function floating around. We'll probably end up having to do a refactoring 
of these at some point soon.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


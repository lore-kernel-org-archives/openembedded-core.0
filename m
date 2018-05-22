Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DEB2D74886
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:36:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4MCarvg008357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 May 2018 13:36:54 +0100
Message-ID: <1526992613.8937.155.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:36:53 +0100
In-Reply-To: <20180522122553.29109-1-git@andred.net>
References: <20180522122553.29109-1-git@andred.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Tue, 22 May 2018 12:36:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-22 at 13:25 +0100, André Draszik wrote:
> diff --git a/meta/classes/sstate.bbclass
> b/meta/classes/sstate.bbclass
> index 1a95f8f2b9..e5b86ad705 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -897,6 +897,7 @@ def setscene_depvalid(task, taskdependees,
> notneeded, d, log=None):
>      # task is included in taskdependees too
>      # Return - False - We need this dependency
>      #        - True - We can skip this dependency
> +    import re
>  
>      def logit(msg, log):
>          if log is not None:
> @@ -957,6 +958,18 @@ def setscene_depvalid(task, taskdependees,
> notneeded, d, log=None):
>              # Nothing need depend on libc-initial/gcc-cross-initial
>              if "-initial" in taskdependees[task][0]:
>                  continue
> +            # Allow excluding certain recursive dependencies. If a
> recipe needs it should add a
> +            # specific dependency itself, rather than relying on one
> of its dependees to pull
> +            # them in.
> +            # See also http://lists.openembedded.org/pipermail/opene
> mbedded-core/2018-January/146324.html
> +            not_needed = False
> +            for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or
> "").split():
> +                if re.match(excl.split('->', 1)[0],
> taskdependees[dep][0]):
> +                    if re.match(excl.split('->', 1)[1],
> taskdependees[task][0]):
> +                        not_needed = True
> +                        break
> +            if not_needed:
> +                continue
>              # For meta-extsdk-toolchain we want all sysroot
> dependencies
>              if taskdependees[dep][0] == 'meta-extsdk-toolchain':
>                  return False

Have you looked at the performance impact of this change? It looks like
it will be compiling the regexp each time inside a tight loop which
gets called once per task dependency which will show up significantly
on the performance chart.

We already have a "*" syntax used in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
and I'd rather use that syntax here to avoid the use of re if we can
help it. Could you see if that is possible please? That would also keep
the syntax compatible.

Cheers,

Richard



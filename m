Return-Path: <andre.draszik@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0A72D744F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:35:18 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id o16so15387716pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uzKEd5fju3UT9E4awdtWN+6cN2qtEx2vODoPeINp/pE=;
	b=GcDsLZgQdOPsz1wLFyd3NIgdkVQnsNro0DJrwWKmb9Ye/x2IHIZZTEIT79pjcmlfzG
	rf1TfzP/J4J0RlUVca5XO1Tc4qO68C3Ct+ml8KJzlfJ1tsjLZolz8gFzE7hCT+UWwjup
	vDAcWVROu+9xxuj9zWeSUGk1P8B5qGl9Yy/mQOffERps3UbgxhPpZc/SzCEVxa0ZTPv0
	M3frQva3olLf7ycmlWI9k9/1mKfEfI5Jv1nEIkr/bNPBT/WUiyIutMyoMhsNguH2xgw9
	nL4xRa5B4bs4jaEzrwGvyIYk+qdfBCiVaP/F62wsD+Zg/SkLDIKlaxujSW8qYDzmLUTT
	ROzQ==
X-Gm-Message-State: ALQs6tApOrXWUzIuAabEonLvoIHP9vySvpVf+QIhdkEfjf7t0PQQC6bt
	ACgla7OZ/0YdKvm0MbcWtBraX/4P
X-Google-Smtp-Source: AIpwx4/XP4W+R6Nvlqk3w1Du4I1A8OSf+yHO04jJBXc1qeFwBXAh661l/3v13DkUuew2NsT2iiW0jQ==
X-Received: by 2002:a17:902:aa90:: with SMTP id
	d16-v6mr29408064plr.189.1524666919641; 
	Wed, 25 Apr 2018 07:35:19 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b3sm32551813pff.11.2018.04.25.07.35.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:35:18 -0700 (PDT)
Message-ID: <1524666914.1929.20.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 15:35:14 +0100
In-Reply-To: <20180425141223.6392-1-git@andred.net>
References: <20180425141223.6392-1-git@andred.net>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH][RFC] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Wed, 25 Apr 2018 14:35:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I realise that this is basically working around the fact that -native
recipes don't get any RDEPENDS treatment AFAICS, except that RDEPENDS ==
DEPENDS, which is what I want to avoid, at least in certain cases...

I guess if computing proper RDEPENDS for -native recipes was easy, it would
have been done already?


Cheers,
Andre'


On Wed, 2018-04-25 at 15:12 +0100, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Currently, a dependency on any -native recipe will pull in
> all dependencies of that -native recipe in the recipe
> sysroot. This behaviour might not always be wanted, e.g.
> when that -native recipe depends on build-tools that are
> not relevant for the current recipe.
> 
> This change adds a SSTATE_EXCLUDEDEPS_SYSROOT variable,
> which will be evaluated for such recursive dependencies to
> be excluded. The idea is similar to
>    http://lists.openembedded.org/pipermail/openembedded-core/2018-January/
> 146324.html
> except that the list is not hard-coded anymore.
> 
> SSTATE_EXCLUDEDEPS_SYSROOT is evaluated as two regular
> expressions of recipe and dependency to ignore, e.g. in
> the above flex-native / bison-native use-case, one would
> specify
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT = ".*->(flex|bison)-native"
> 
> in layer.conf.
> 
> The existing special handling of "-initial" as well as
> "base-passwd" and "shadow-sysroot" could also be
> streamlined:
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT += "\
>         .*->.*-initial.* \
>         .*(base-passwd|shadow-sysroot)->.* \
>     "
> 
> Another anticipated user is meta-java, where certain newer
> JDKs can only be bootstrapped (built) using older JDKs,
> but it doesn't make much sense to copy all those older
> JDKs and their own build tools (ant, etc.) into the
> sysroot of recipes wanting to be built using the newer JDK
> (only), e.g.:
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT += "\
>         openjdk-8-native->(ant-native|attr-native|coreutils-
> native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-
> native|unzip-native) \
>     "
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  meta/classes/sstate.bbclass | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 68089421f5..62e784e497 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -901,6 +901,7 @@ def setscene_depvalid(task, taskdependees, notneeded,
> d, log=None):
>      # task is included in taskdependees too
>      # Return - False - We need this dependency
>      #        - True - We can skip this dependency
> +    import re
>  
>      def logit(msg, log):
>          if log is not None:
> @@ -961,6 +962,18 @@ def setscene_depvalid(task, taskdependees, notneeded,
> d, log=None):
>              # Nothing need depend on libc-initial/gcc-cross-initial
>              if "-initial" in taskdependees[task][0]:
>                  continue
> +            # Allow excluding certain recursive dependencies. If a recipe
> needs it should add a
> +            # specific dependency itself, rather than relying on one of
> its dependees to pull
> +            # them in.
> +            # See also http://lists.openembedded.org/pipermail/openembedd
> ed-core/2018-January/146324.html
> +            not_needed = False
> +            for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or
> "").split():
> +                if re.match(excl.split('->', 1)[0],
> taskdependees[dep][0]):
> +                    if re.match(excl.split('->', 1)[1],
> taskdependees[task][0]):
> +                        not_needed = True
> +                        break
> +            if not_needed:
> +                continue
>              # For meta-extsdk-toolchain we want all sysroot dependencies
>              if taskdependees[dep][0] == 'meta-extsdk-toolchain':
>                  return False


Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SyjVv-0000Hp-KA
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 15:07:59 +0200
Received: by qcad10 with SMTP id d10so2266393qca.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7mvLS20RIA8WEZhfmB2y5o62NgwBDp8gTbPfDSevWOA=;
	b=d/I8DVhZn+/dzbYTemOE936+qzMJO12BNR3fcAAGNKILgmYW8pasDMw8dEiHAHkAFk
	24vWiaj+4Vt85ZqAIi0QsIDWsoay1gFxwBVr8FZ46zJtYKHmpmA4Wruu/QepXZbPT1+V
	zzhZ7OWqhXdcyn2O+nSVkJKoTrqgLP8gVdCDBTX+v1zAXPSKm+AsqrmEv+mFP4u3I6o9
	UOWlnRSyqATc8/VKynzn9Z0ZFw+VIOD7wPOAvibnr6+jlsgNrhO4z/6+vb/N5Y2DeYxS
	UZV6jw9Fl9CIO61rBXI2rvjhoI7y4HGZlGkm3Y2T8IpXur+78lpjO8jayukTdasjBpwI
	3Y2A==
MIME-Version: 1.0
Received: by 10.224.185.70 with SMTP id cn6mr23627256qab.16.1344344173512;
	Tue, 07 Aug 2012 05:56:13 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 7 Aug 2012 05:56:13 -0700 (PDT)
In-Reply-To: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
Date: Tue, 7 Aug 2012 08:56:13 -0400
Message-ID: <CADkTA4O8uTpJfjNL0bVw1+oJ2JrwWg++M4v5FK5pumN-npsNMw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <darren.hart@intel.com>
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 13:07:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Adding Richard.

Richard: did this patch not fix the problem for you ? .. it fixes it here, and
should replace the patch that you made earlier today .. this may have slipped
through the cracks.

I've never seen the perf slang failure, so I'm hesitant to take this
patch, apply
it and drop yours.

Is there anyway that someone seeing this problem can test this patch ?

Cheers,

Bruce

On Fri, Aug 3, 2012 at 11:43 AM, Liang Li <liang.li@windriver.com> wrote:
> Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
> provide slang.h rather than hardcoded host dir in perf's Makefile.
>
> Pass WERROR=0 to perf's Makefile to avoid warnings being treated
> as errors. Warnings are not fatal, and while they will be fixed in the
> future, there's no need for them to break the build.
>
> Signed-off-by: Liang Li <liang.li@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> index 505c7b8..537e926 100644
> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
>             ${MLPREFIX}binutils \
>             ${TUI_DEPENDS} \
>             ${SCRIPTING_DEPENDS} \
> +           slang \
>            "
>
>  SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
> @@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
>                 AR="${AR}" \
>                 prefix=/usr \
>                 NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
> +               WERROR=0 \
> +               EXTRA_CFLAGS=-I${STAGING_INCDIR} \
>                 '
>
>  do_compile() {
> --
> 1.7.12.rc0.22.gcdd159b
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



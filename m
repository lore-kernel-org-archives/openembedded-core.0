Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D45F56FE3B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 08:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s828SPcJ026139; Tue, 2 Sep 2014 09:28:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TRK79yMvdgR1; Tue,  2 Sep 2014 09:28:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s828SNkB026135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 2 Sep 2014 09:28:24 +0100
Message-ID: <1409646504.29296.268.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 02 Sep 2014 09:28:24 +0100
In-Reply-To: <cf27f471a5feb7deaaa24694028d7b4dc34fea02.1407836032.git.liezhi.yang@windriver.com>
References: <cover.1407836032.git.liezhi.yang@windriver.com>
	<cf27f471a5feb7deaaa24694028d7b4dc34fea02.1407836032.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perf.bb: fix multilib build
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
X-List-Received-Date: Tue, 02 Sep 2014 08:28:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-08-12 at 04:10 -0700, Robert Yang wrote:
> Fixed:
> $ bitbake perf lib32-perf
> ERROR: QA Issue: lib32-perf: Files/directories were installed but not shipped
>   /usr/lib64
>   /usr/lib64/traceevent
>   /usr/lib64/traceevent/plugins
>   /usr/lib64/traceevent/plugins/plugin_function.so
>   /usr/lib64/traceevent/plugins/plugin_scsi.so
>   /usr/lib64/traceevent/plugins/plugin_hrtimer.so
>   /usr/lib64/traceevent/plugins/plugin_kmem.so
>   /usr/lib64/traceevent/plugins/plugin_jbd2.so
>   /usr/lib64/traceevent/plugins/plugin_xen.so
>   /usr/lib64/traceevent/plugins/plugin_mac80211.so
>   /usr/lib64/traceevent/plugins/plugin_cfg80211.so
>   /usr/lib64/traceevent/plugins/plugin_sched_switch.so
>   /usr/lib64/traceevent/plugins/plugin_kvm.so [installed-vs-shipped]
> 
> The perf.do_configure edits kernel's
> ${STAGING_KERNEL_DIR}/tools/perf/config/Makefile, there would be
> problems since kernel doesn't have multilib, and the build result is
> undetermined.
> 
> Previously, the sed command changed libdir to /usr/lib64 (or 32) in the
> Makefile, so the build result was different if we build perf (64) first
> or lib32-perf first.
> 
> Use the weak assignment "libdir ?=" to instead of "libdir =" will fix
> the problem since the multilib builds are in different processes, and
> they won't affect each other any more.
> 
> The sed command will match both $(prefix)/$(lib) and $(prefix)/lib since
> the Makefile may has been modified before this patch.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index bfd210c..ebfedb9 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -121,10 +121,12 @@ do_configure_prepend () {
>      # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
>      # build, with a 64 bit multilib, the arch won't match and the detection of a 
>      # 64 bit build (and library) are not exected. To ensure that libraries are
> -    # installed to the correct location, we can make the substitution in the 
> -    # config/Makefile. For non multilib builds, this has no impact.
> +    # installed to the correct location, we can use the weak assignment in the
> +    # config/Makefile.
>      if [ -e "${S}/tools/perf/config/Makefile" ]; then
> -        sed -i 's,libdir = $(prefix)/$(lib),libdir = $(prefix)/${baselib},' ${S}/tools/perf/config/Makefile
> +        # Match $(prefix)/$(lib) and $(prefix)/lib
> +        sed -i 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
> +            ${S}/tools/perf/config/Makefile
>      fi
>      # We need to ensure the --sysroot option in CC is preserved
>      if [ -e "${S}/tools/perf/Makefile.perf" ]; then

What happens if both lib32-perf and lib64-perf are being built at the
same time?

${S} is shared here so we should not be making changes to it. Your patch
doesn't make things worse I guess but there is still a horribly big race
here :(

Cheers,

Richard





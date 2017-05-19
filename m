Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5976C72F62
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 16:56:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4JGukI6016320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 09:56:46 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.22.48) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Fri, 19 May 2017 09:56:45 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 May 2017 12:56:44 -0400
Message-ID: <1760789.I9hucpA9AH@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.8.0-51-generic; KDE/5.26.0; x86_64; ; )
In-Reply-To: <1494363097-28532-1-git-send-email-mark.asselstine@windriver.com>
References: <1494363097-28532-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][resend][PATCH] sysstat: fixup pkg_postinst to allow SYSTEMD_AUTO_ENABLE to work
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
X-List-Received-Date: Fri, 19 May 2017 16:56:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, May 9, 2017 4:51:37 PM EDT Mark Asselstine wrote:
> The logic added to the pkg_postinst in commit 6bf82c26f953 has the
> side effect of rendering SYSTEMD_AUTO_ENABLE ineffective. The systemd
> service will not be configured as 'enabled' either offline(do_rootfs)
> or during first boot. Since the volatiles, as used, in the
> pkg_postinst are unused with systemd we can simply skip the
> pkg_postinst when not using sysvinit.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---

Is there a reason this change is again sitting without any comments or being 
merged. The recipe as-is is broken in a way that might frustrate people and I 
am attempting to aliviate this frustration with this change.

Mark

>  meta/recipes-extended/sysstat/sysstat.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc
> b/meta/recipes-extended/sysstat/sysstat.inc index bb5629d..fce2804 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -42,7 +42,9 @@ do_install() {
>  	sed -i -e 's#@LIBDIR@#${libdir}#g'
> ${D}${systemd_unitdir}/system/sysstat.service }
> 
> -pkg_postinst_${PN} () {
> +OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',
> ':sysvinit', '', d)}" +
> +pkg_postinst_${PN}_sysvinit () {
>          if [ -n "$D" ]; then
>                  exit 0
>          fi





